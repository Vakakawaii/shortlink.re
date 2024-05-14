package org.vakakawaii.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.service.LinkService;
import org.vakakawaii.shortlink.project.toolkit.HashUtil;


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
            // TODO 已经误判的短连接如何处理
            // 第一种，短连接确实真实存在缓存
            // 第二种，短连接不一定存在于缓存
            log.warn("短连接: {} 重复入库", fullShortUrl);
            throw new ServiceException("短连接生成重复");
        }
        linkUriCreateCachePenetrationBloomFilter.add(fullShortUrl);
        return LinkCreateRespDTO.builder()
                .gid(linkDO.getGid())
                .fullShortUrl(linkDO.getFullShortUrl())
                .shortUri(linkDO.getShortUri())
                .build();
    }

    private String generateSuffix(LinkCreateReqDTO linkCreateReqDTO) {
        int customGenerateCount = 0;
        String shortUri;
        while (true) {
            if (customGenerateCount > 10) {
                throw new ServiceException("短连接频繁生成，请稍后再试");
            }
            String originUrl = linkCreateReqDTO.getOriginUrl();
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
