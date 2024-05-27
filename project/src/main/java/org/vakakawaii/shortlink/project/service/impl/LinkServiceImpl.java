package org.vakakawaii.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.Objects;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.vakakawaii.shortlink.project.common.convention.exception.ClientException;
import org.vakakawaii.shortlink.project.common.convention.exception.ServiceException;
import org.vakakawaii.shortlink.project.common.enums.VailDateTypeEnum;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dao.entity.LinkGotoDO;
import org.vakakawaii.shortlink.project.dao.mapper.LinkGotoMapper;
import org.vakakawaii.shortlink.project.dao.mapper.LinkMapper;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkUpdateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.project.service.LinkService;
import org.vakakawaii.shortlink.project.toolkit.HashUtil;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import static org.vakakawaii.shortlink.project.common.constant.RedisKeyConstant.*;


@Service
@Slf4j
@RequiredArgsConstructor
public class LinkServiceImpl extends ServiceImpl<LinkMapper, LinkDO> implements LinkService {

    private final RBloomFilter<String> linkUriCreateCachePenetrationBloomFilter;
    private final LinkGotoMapper linkGotoMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final RedissonClient redissonClient;

    @SneakyThrows
    @Override
    public void restoreUrl(String shortUri, ServletRequest request, ServletResponse response) {

        String domain = request.getServerName();
        String fullShortUrl = domain + "/" + shortUri;

        // 对于一个链接访问
        // 首先，如果 ”goto“ 缓存 存在，跳。
        String originalLink = stringRedisTemplate.opsForValue()
                .get(String.format(GOTO_SHORT_LINK_KEY, fullShortUrl));
        if (StrUtil.isNotBlank(originalLink)){
            ((HttpServletResponse) response).sendRedirect(originalLink);
            return;
        }

        // 如果 ”goto“ 缓存 不存在，”链接创建的记录“ 布隆过滤器-缓存 认定不存在，退出
        boolean contains = linkUriCreateCachePenetrationBloomFilter.contains(fullShortUrl);
        if (!contains){
            return;
        }

        // 如果 ”goto不存在已确定“ 缓存 存在("-")，退出
        String gotoIsNullShortLink = stringRedisTemplate.opsForValue()
                .get(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl));
        if (StrUtil.isNotBlank(gotoIsNullShortLink)){
            return;
        }

        // 分布式锁 查数据库 “goto”
        RLock lock = redissonClient.getLock(String.format(LOCK_GOTO_SHORT_LINK_KEY,fullShortUrl));
        lock.lock();
        try {
            originalLink = stringRedisTemplate.opsForValue()
                    .get(String.format(GOTO_SHORT_LINK_KEY, fullShortUrl));
            if (StrUtil.isNotBlank(originalLink)){
                ((HttpServletResponse) response).sendRedirect(originalLink);
                return;
            }
            LambdaQueryWrapper<LinkGotoDO> gotoQueryWrapper = Wrappers.lambdaQuery(LinkGotoDO.class)
                    .eq(LinkGotoDO::getFullShortUrl, fullShortUrl);
            LinkGotoDO linkGotoDO = linkGotoMapper.selectOne(gotoQueryWrapper);
            if (linkGotoDO == null){
                // todo 严谨来说此处需要风控
                stringRedisTemplate.opsForValue()
                        .set(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl),"-",
                                30, TimeUnit.MINUTES);
                return;
            }

            LambdaQueryWrapper<LinkDO> queryWrapper = Wrappers.lambdaQuery(LinkDO.class)
                    .eq(LinkDO::getGid, linkGotoDO.getGid())
                    .eq(LinkDO::getFullShortUrl,fullShortUrl)
                    .eq(LinkDO::getEnableStatus, 0)
                    .eq(LinkDO::getDelFlag, 0);

            LinkDO linkDO = baseMapper.selectOne(queryWrapper);
            if (linkDO != null){
                stringRedisTemplate.opsForValue()
                        .set(String.format(GOTO_SHORT_LINK_KEY,fullShortUrl),linkDO.getOriginUrl());
                ((HttpServletResponse) response).sendRedirect(linkDO.getOriginUrl());
            }
        } finally {
            lock.unlock();
        }
    }

    // todo 修改连接的groupID同时，把goto表里的也修改
    @Override
    public LinkCreateRespDTO createLink(LinkCreateReqDTO linkCreateReqDTO) {
        String suffix = generateSuffix(linkCreateReqDTO);
        String fullShortUrl = linkCreateReqDTO.getDomain() + "/" + suffix;

        LinkDO linkDO = BeanUtil.toBean(linkCreateReqDTO, LinkDO.class);
        linkDO.setFullShortUrl(fullShortUrl);
        linkDO.setShortUri(suffix);
        linkDO.setEnableStatus(0);

        LinkGotoDO linkGotoDO = LinkGotoDO.builder()
                .fullShortUrl(fullShortUrl)
                .gid(linkCreateReqDTO.getGid())
                .build();

        try {
            baseMapper.insert(linkDO);
            linkGotoMapper.insert(linkGotoDO);
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

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateLink(LinkUpdateReqDTO linkUpdateReqDTO) {
        // 因为是用gid分表的，所以要查询gid，不仅是查全局唯一的全链
        LambdaQueryWrapper<LinkDO> queryWrapper = Wrappers.lambdaQuery(LinkDO.class)
                .eq(LinkDO::getGid, linkUpdateReqDTO.getOriginGid())
                .eq(LinkDO::getFullShortUrl, linkUpdateReqDTO.getFullShortUrl())
                .eq(LinkDO::getEnableStatus, 0)
                .eq(LinkDO::getDelFlag, 0);
        LinkDO hasLinkDO = baseMapper.selectOne(queryWrapper);
        if (hasLinkDO == null) {throw new ClientException("短连接记录不存在");}

        LinkDO linkDO = LinkDO.builder()
                // 先不更改，因为涉及缓存
                .domain(hasLinkDO.getDomain())
                .shortUri(hasLinkDO.getShortUri())
                .clickNum(hasLinkDO.getClickNum())
                // TODO 图标会导致变慢
                .favicon(hasLinkDO.getFavicon())
                .createdType(hasLinkDO.getCreatedType())
                // 可以修改
                .originUrl(linkUpdateReqDTO.getOriginUrl())
                .gid(linkUpdateReqDTO.getGid())
                .describe(linkUpdateReqDTO.getDescribe())
                .validDate(linkUpdateReqDTO.getValidDate())
                .validDateType(linkUpdateReqDTO.getValidDateType())
                .build();

        // gid相同则在一个表内更新
        if (Objects.equal(linkUpdateReqDTO.getOriginGid(),linkUpdateReqDTO.getGid())) {
            LambdaUpdateWrapper<LinkDO> updateWrapper = Wrappers.lambdaUpdate(LinkDO.class)
                    .eq(LinkDO::getFullShortUrl, linkUpdateReqDTO.getFullShortUrl())
                    .eq(LinkDO::getGid, linkUpdateReqDTO.getGid())
                    .eq(LinkDO::getDelFlag, 0)
                    .eq(LinkDO::getEnableStatus, 0)
                    .set(Objects.equal(linkUpdateReqDTO.getValidDateType(), VailDateTypeEnum.PERMANENT.getType()),
                            LinkDO::getValidDate, null);
            baseMapper.update(linkDO,updateWrapper);
        } else {
//            否则先删除，再增加
            LambdaUpdateWrapper<LinkDO> updateWrapper = Wrappers.lambdaUpdate(LinkDO.class)
                    .eq(LinkDO::getFullShortUrl, linkUpdateReqDTO.getFullShortUrl())
                    .eq(LinkDO::getGid, hasLinkDO.getGid())
                    .eq(LinkDO::getDelFlag, 0)
                    .eq(LinkDO::getEnableStatus, 0);
            baseMapper.delete(updateWrapper);
            baseMapper.insert(linkDO);
        }

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

    @Override
    public List<LinkCountQueryRespDTO> listCountLinkByGroupID(List<String> gids) {
        QueryWrapper<LinkDO> queryWrapper = Wrappers.query(new LinkDO())
                .select("gid as gid,count(*) as count")
                .in("gid", gids)
                .eq("enable_status", 0)
                .groupBy("gid");
        List<Map<String, Object>> list = baseMapper.selectMaps(queryWrapper);
        return BeanUtil.copyToList(list,LinkCountQueryRespDTO.class);
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
