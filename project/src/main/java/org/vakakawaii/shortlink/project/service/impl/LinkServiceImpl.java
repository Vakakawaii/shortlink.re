package org.vakakawaii.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBloomFilter;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.project.common.convention.exception.ClientException;
import org.vakakawaii.shortlink.project.common.convention.exception.ServiceException;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dao.mapper.LinkMapper;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.project.service.LinkService;
import org.vakakawaii.shortlink.project.toolkit.HashUtil;

import java.util.List;


@Service
@Slf4j
@RequiredArgsConstructor
public class LinkServiceImpl extends ServiceImpl<LinkMapper, LinkDO> implements LinkService {

    private final RBloomFilter<String> linkUriCreateCachePenetrationBloomFilter;

    @Override
    public LinkCreateRespDTO createLink(LinkCreateReqDTO linkCreateReqDTO) {
        String suffix = generateSuffix(linkCreateReqDTO);
        String fullShortUrl = linkCreateReqDTO.getDomain() + "/" + suffix;

        LinkDO linkDO = BeanUtil.toBean(linkCreateReqDTO, LinkDO.class);
        linkDO.setFullShortUrl(fullShortUrl);
        linkDO.setShortUri(suffix);
        linkDO.setEnableStatus(0);

        try {
            baseMapper.insert(linkDO);
        } catch (DuplicateKeyException ex){
            // 数据库已有数据
            // 第一种，短连接确实真实存在缓存，存在判不存在，插入数据库失败，这时候就要查询
            // 第二种，短连接不一定存在于缓存，判断不存在（缓存丢失，多线程）
            // 1.布隆过滤器判断不存在，就一定不存在，这个不会误判；判断存在，实际有可能不存在，这个会误判。
            // 2.generateSuffix若正常返回shortUri，一定是不存在缓存里的(如果重复10次就抛异常了)。
            // 然而domain + shortUri有可能在数据库里(出了数据库、缓存不一致bug)，
            // 因此数据库里有必要引入唯一索引，这个是兜底机制。所以createShortLink里面try, catch其实就是加个保险
            // 由于布隆过滤器没满时候，出现冲突概率小，因此允许查询
            LambdaQueryWrapper<LinkDO> queryWrapper = Wrappers.lambdaQuery(LinkDO.class)
                    .eq(LinkDO::getFullShortUrl, linkDO.getFullShortUrl());
            LinkDO hashLinkDO = baseMapper.selectOne(queryWrapper);
            if(hashLinkDO == null){
                log.warn("短连接: {} 重复入库", fullShortUrl);
                throw new ServiceException("短连接生成重复");
            }
        }
        linkUriCreateCachePenetrationBloomFilter.add(fullShortUrl);
        return LinkCreateRespDTO.builder()
                .gid(linkDO.getGid())
                .fullShortUrl(linkDO.getFullShortUrl())
                .shortUri(linkDO.getShortUri())
                .build();
    }

    @Override
    public IPage<LinkPageRespDTO> pageLink(LinkPageReqDTO linkPageReqDTO) {
        LambdaQueryWrapper<LinkDO> queryWrapper = Wrappers.lambdaQuery(LinkDO.class)
                .eq(LinkDO::getGid, linkPageReqDTO.getGid())
                .eq(LinkDO::getEnableStatus,0)
                .eq(LinkDO::getDelFlag,0)
                .orderByDesc(LinkDO::getCreateTime);
        IPage<LinkDO> page = baseMapper.selectPage(linkPageReqDTO,queryWrapper);
        return page.convert(each -> BeanUtil.toBean(each,LinkPageRespDTO.class));
    }

    private String generateSuffix(LinkCreateReqDTO linkCreateReqDTO) {
        int customGenerateCount = 0;
        String shortUri;
        while (true) {
            if (customGenerateCount > 10) {
                throw new ServiceException("短连接频繁生成，请稍后再试");
            }
            String originUrl = linkCreateReqDTO.getOriginUrl();
            originUrl += System.currentTimeMillis();
            shortUri = HashUtil.hashToBase62(originUrl);
            // 查询布隆过滤器，没有重复就跳出循环
            if (!linkUriCreateCachePenetrationBloomFilter
                    .contains(linkCreateReqDTO.getDomain() + "/" + shortUri)) {
                break;
            }
            customGenerateCount++;
        }
        return shortUri;
    }
}
