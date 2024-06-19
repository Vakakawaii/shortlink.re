package org.vakakawaii.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.Week;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.Objects;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.vakakawaii.shortlink.project.common.convention.exception.ClientException;
import org.vakakawaii.shortlink.project.common.convention.exception.ServiceException;
import org.vakakawaii.shortlink.project.common.enums.VailDateTypeEnum;
import org.vakakawaii.shortlink.project.dao.entity.*;
import org.vakakawaii.shortlink.project.dao.mapper.*;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkUpdateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.project.service.LinkService;
import org.vakakawaii.shortlink.project.toolkit.HashUtil;
import org.vakakawaii.shortlink.project.toolkit.LinkUtil;

import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

import static org.vakakawaii.shortlink.project.common.constant.LinkConstant.AMAP_REMOTE_URL;
import static org.vakakawaii.shortlink.project.common.constant.RedisKeyConstant.*;


@Service
@Slf4j
@RequiredArgsConstructor
public class LinkServiceImpl extends ServiceImpl<LinkMapper, LinkDO> implements LinkService {

    private final RBloomFilter<String> linkUriCreateCachePenetrationBloomFilter;
    private final LinkGotoMapper linkGotoMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final RedissonClient redissonClient;
    private final LinkAccessStatsMapper linkAccessStatsMapper;
    private final LinkLocateStatsMapper linkLocateStatsMapper;
    private final LinkOsStatsMapper linkOsStatsMapper;
    private final LinkBrowserStatsMapper linkBrowserStatsMapper;
    private final LinkAccessLogsMapper linkAccessLogsMapper;
    private final LinkDeviceStatsMapper linkDeviceStatsMapper;
    private final LinkNetworkStatsMapper linkNetworkStatsMapper;

    @Value("${short-link.stats.locate.amap-key}")
    private String statsLocateAmapKey;

    @SneakyThrows
    @Override
    public void restoreUrl(String shortUri, ServletRequest request, ServletResponse response) {

        String domain = request.getServerName();
        String fullShortUrl = domain + "/" + shortUri;

        // 对于一个链接访问
        // 首先，如果 ”goto“ 缓存 存在，跳。
        String originalLink = stringRedisTemplate.opsForValue()
                .get(String.format(GOTO_SHORT_LINK_KEY, fullShortUrl));
        if (StrUtil.isNotBlank(originalLink)) {
            linkStats(fullShortUrl, null, request, response);
            ((HttpServletResponse) response).sendRedirect(originalLink);
            return;
        }

        // 如果 ”goto“ 缓存 不存在，”链接创建的记录“ 布隆过滤器-缓存 认定不存在，退出
        boolean contains = linkUriCreateCachePenetrationBloomFilter.contains(fullShortUrl);
        if (!contains) {
            ((HttpServletResponse) response).sendRedirect("/page/notfound");
            return;
        }

        // 如果 ”goto不存在已确定“ 缓存 存在("-")，退出
        String gotoIsNullShortLink = stringRedisTemplate.opsForValue()
                .get(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl));
        if (StrUtil.isNotBlank(gotoIsNullShortLink)) {
            ((HttpServletResponse) response).sendRedirect("/page/notfound");
            return;
        }

        // 分布式锁 查数据库 “goto”
        RLock lock = redissonClient.getLock(String.format(LOCK_GOTO_SHORT_LINK_KEY, fullShortUrl));
        lock.lock();
        try {
            originalLink = stringRedisTemplate.opsForValue()
                    .get(String.format(GOTO_SHORT_LINK_KEY, fullShortUrl));
            if (StrUtil.isNotBlank(originalLink)) {
                linkStats(fullShortUrl, null, request, response);
                ((HttpServletResponse) response).sendRedirect(originalLink);
                return;
            }
            LambdaQueryWrapper<LinkGotoDO> gotoQueryWrapper = Wrappers.lambdaQuery(LinkGotoDO.class)
                    .eq(LinkGotoDO::getFullShortUrl, fullShortUrl);
            LinkGotoDO linkGotoDO = linkGotoMapper.selectOne(gotoQueryWrapper);
            if (linkGotoDO == null) {
                // todo 严谨来说此处需要风控
                stringRedisTemplate.opsForValue()
                        .set(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl), "-",
                                30, TimeUnit.MINUTES);
                ((HttpServletResponse) response).sendRedirect("/page/notfound");
                return;
            }

            LambdaQueryWrapper<LinkDO> queryWrapper = Wrappers.lambdaQuery(LinkDO.class)
                    .eq(LinkDO::getGid, linkGotoDO.getGid())
                    .eq(LinkDO::getFullShortUrl, fullShortUrl)
                    .eq(LinkDO::getEnableStatus, 0)
                    .eq(LinkDO::getDelFlag, 0);

            LinkDO linkDO = baseMapper.selectOne(queryWrapper);

            // 添加缓存区分过期短链 和 回收站短链
            if (linkDO == null || (linkDO.getValidDate() != null && linkDO.getValidDate().before(new Date()))) {
                stringRedisTemplate.opsForValue()
                        .set(String.format(GOTO_IS_NULL_SHORT_LINK_KEY, fullShortUrl), "-",
                                30, TimeUnit.MINUTES);
                ((HttpServletResponse) response).sendRedirect("/page/notfound");
                return;
            }
            stringRedisTemplate.opsForValue()
                    .set(String.format(GOTO_SHORT_LINK_KEY, fullShortUrl), linkDO.getOriginUrl(),
                            30, TimeUnit.MINUTES);
            linkStats(fullShortUrl, linkDO.getGid(), request, response);
            ((HttpServletResponse) response).sendRedirect(linkDO.getOriginUrl());
        } finally {
            lock.unlock();
        }
    }

    private void linkStats(String fullShortUrl, String gid, ServletRequest request, ServletResponse response) {

        // 创建一个 AtomicBoolean 类型的变量 uvFirstFlag，初始值为 false，用于标记是否是第一次访问
        AtomicBoolean uvFirstFlag = new AtomicBoolean();

        // 从请求中获取所有的 Cookies
        Cookie[] cookies = ((HttpServletRequest) request).getCookies();

        try {
            AtomicReference<String> uv = new AtomicReference<>();
            // 创建一个 Runnable 对象 addResponseCookieTask，其 run 方法包含生成新 UUID 并添加到响应中的逻辑
            Runnable addResponseCookieTask = () -> {
                // 生成一个新的 UUID 作为 uv
                uv.set(UUID.fastUUID().toString());
                // 创建一个名为 "uv" 的 Cookie，并将其值设为生成的 UUID
                Cookie uvCookie = new Cookie("uv", uv.get());
                // 设置 Cookie 的有效期为 30 天（以秒为单位）
                uvCookie.setMaxAge(30 * 24 * 60 * 60);
                // 设置 Cookie 的路径
                uvCookie.setPath(StrUtil.sub(fullShortUrl, fullShortUrl.indexOf("/"), fullShortUrl.length()));
                // 将该 Cookie 添加到响应中
                ((HttpServletResponse) response).addCookie(uvCookie);
                // 将 uvFirstFlag 设置为 true，表示这是第一次访问
                uvFirstFlag.set(Boolean.TRUE);
                // 将生成的 UUID 添加到 Redis 集合中
                Long added = stringRedisTemplate.opsForSet().add("short-link:stats:uv:" + fullShortUrl, uv.get());
            };

            // 检查请求中的 Cookies 是否为空
            if (ArrayUtil.isNotEmpty(cookies)) {
                // 如果 Cookies 不为空，则进行以下操作
                Arrays.stream(cookies)
                        // 将 Cookies 转换成流，并过滤出名称为 "uv" 的 Cookie
                        .filter(each -> Objects.equal(each.getName(), "uv"))
                        // 找到第一个匹配的 "uv" Cookie
                        .findFirst()
                        // 提取该 Cookie 的值
                        .map(Cookie::getValue)
                        // 如果找到了 "uv" Cookie，则执行 ifPresentOrElse 的第一个参数中的逻辑
                        .ifPresentOrElse(each -> {
                                    uv.set(each);
                                    // 将 Cookie 的值添加到 Redis 集合中
                                    Long uvAdded = stringRedisTemplate
                                            .opsForSet().add("short-link:stats:uv:" + fullShortUrl, each);
                                    // 根据 Redis 操作结果设置 uvFirstFlag
                                    uvFirstFlag.set(uvAdded != null && uvAdded > 0L);
                                },
                                // 如果没有找到 "uv" Cookie，则执行 addResponseCookieTask 逻辑
                                addResponseCookieTask);
            } else {
                // 如果 Cookies 为空，则执行 addResponseCookieTask 逻辑
                addResponseCookieTask.run();
            }

            String remoteAddr = LinkUtil.getRealIp((HttpServletRequest) request);
            Long uipAdded = stringRedisTemplate.opsForSet().add("short-link:stats:uip:" + fullShortUrl, remoteAddr);
            boolean uipFirstFlag = uipAdded != null && uipAdded > 0L;

            if (StrUtil.isBlank(gid)) {
                LambdaQueryWrapper<LinkGotoDO> queryWrapper = Wrappers.lambdaQuery(LinkGotoDO.class)
                        .eq(LinkGotoDO::getFullShortUrl, fullShortUrl);
                LinkGotoDO linkGotoDO = linkGotoMapper.selectOne(queryWrapper);
                gid = linkGotoDO.getGid();
            }

            int hour = DateUtil.hour(new Date(), true);
            Week week = DateUtil.dayOfWeekEnum(new Date());
            int weekValue = week.getValue();
            LinkAccessStatsDO linkAccessStatsDO = LinkAccessStatsDO.builder()
                    .pv(1)
                    .uv(uvFirstFlag.get() ? 1 : 0)
                    .uip(uipFirstFlag ? 1 : 0)
                    .date(new Date())
                    .weekday(weekValue)
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .hour(hour)
                    .build();
            linkAccessStatsMapper.linkAccessStats(linkAccessStatsDO);

            // IP地区统计
            Map<String, Object> locateParamMap = new HashMap<>();
            locateParamMap.put("key", statsLocateAmapKey);
            locateParamMap.put("ip", remoteAddr);
            String locateResultStr = HttpUtil.get(AMAP_REMOTE_URL, locateParamMap);
            JSONObject locateResultObj = JSON.parseObject(locateResultStr);
            String infoCode = locateResultObj.getString("infocode");

            String realProvince = "";
            String realCity = "";

            if (StrUtil.isNotBlank(infoCode) && StrUtil.equals(infoCode, "10000")) {
                String province = locateResultObj.getString("province");
                boolean unknownFlag = StrUtil.equals(province, "[]");
                realProvince = unknownFlag ? "未知" : province;
                realCity = unknownFlag ? "未知" : locateResultObj.getString("city");

                LinkLocateStatsDO linkLocateStatsDO = LinkLocateStatsDO.builder()
                        .fullShortUrl(fullShortUrl)
                        .province(realProvince)
                        .city(realCity)
                        .adcode(unknownFlag ? "未知" : locateResultObj.getString("adcode"))
                        .country("中国")
                        .cnt(1)
                        .gid(gid)
                        .date(new Date())
                        .build();

                linkLocateStatsMapper.linkLocateStats(linkLocateStatsDO);
            }

            // 操作系统统计
            String os = LinkUtil.getOs((HttpServletRequest) request);
            LinkOsStatsDO linkOsStatsDO = LinkOsStatsDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .date(new Date())
                    .cnt(1)
                    .os(os)
                    .build();
            linkOsStatsMapper.linkOsStats(linkOsStatsDO);

            // 浏览器统计
            String browser = LinkUtil.getBrowser((HttpServletRequest) request);
            LinkBrowserStatsDO linkBrowserStatsDo = LinkBrowserStatsDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .date(new Date())
                    .cnt(1)
                    .browser(browser)
                    .build();
            linkBrowserStatsMapper.linkBrowserStats(linkBrowserStatsDo);

            // 访问设备统计
            String device = LinkUtil.getDevice((HttpServletRequest) request);
            LinkDeviceStatsDO linkDeviceStatsDO = LinkDeviceStatsDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .date(new Date())
                    .cnt(1)
                    .device(device)
                    .build();
            linkDeviceStatsMapper.linkDeviceStats(linkDeviceStatsDO);

            // 访问网络统计
            String network = LinkUtil.getNetwork(((HttpServletRequest) request));
            LinkNetworkStatsDO linkNetworkStatsDO = LinkNetworkStatsDO.builder()
                    .network(network)
                    .cnt(1)
                    .gid(gid)
                    .fullShortUrl(fullShortUrl)
                    .date(new Date())
                    .build();
            linkNetworkStatsMapper.linkNetworkStats(linkNetworkStatsDO);

            // 高频IP统计
            LinkAccessLogsDO linkAccessLogsDO = LinkAccessLogsDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .user(uv.get())
                    .browser(browser)
                    .os(os)
                    .locate(StrUtil.join("-","中国",realProvince, realCity))
                    .network(network)
                    .device(device)
                    .ip(remoteAddr)
                    .build();
            linkAccessLogsMapper.linkAccessLogs(linkAccessLogsDO);

        } catch (Throwable ex) {
            log.error("短连接统计时异常!", ex);
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
//        linkDO.setFavicon(getFaviconUrl(linkCreateReqDTO.getOriginUrl()));

        LinkGotoDO linkGotoDO = LinkGotoDO.builder()
                .fullShortUrl(fullShortUrl)
                .gid(linkCreateReqDTO.getGid())
                .build();

        try {
            baseMapper.insert(linkDO);
            linkGotoMapper.insert(linkGotoDO);
        } catch (DuplicateKeyException ex) {
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
            if (hashLinkDO == null) {
                log.warn("短连接: {} 重复入库", fullShortUrl);
                throw new ServiceException("短连接生成重复");
            }
        }
        // 缓存预热
        stringRedisTemplate.opsForValue().set(
                String.format(GOTO_SHORT_LINK_KEY, fullShortUrl), linkCreateReqDTO.getOriginUrl(),
                LinkUtil.getLinkCacheValidTime(linkCreateReqDTO.getValidDate()), TimeUnit.MICROSECONDS);
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
        if (hasLinkDO == null) {
            throw new ClientException("短连接记录不存在");
        }

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
        if (Objects.equal(linkUpdateReqDTO.getOriginGid(), linkUpdateReqDTO.getGid())) {
            LambdaUpdateWrapper<LinkDO> updateWrapper = Wrappers.lambdaUpdate(LinkDO.class)
                    .eq(LinkDO::getFullShortUrl, linkUpdateReqDTO.getFullShortUrl())
                    .eq(LinkDO::getGid, linkUpdateReqDTO.getGid())
                    .eq(LinkDO::getDelFlag, 0)
                    .eq(LinkDO::getEnableStatus, 0)
                    .set(Objects.equal(linkUpdateReqDTO.getValidDateType(), VailDateTypeEnum.PERMANENT.getType()),
                            LinkDO::getValidDate, null);
            baseMapper.update(linkDO, updateWrapper);
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
                .eq(LinkDO::getEnableStatus, 0)
                .eq(LinkDO::getDelFlag, 0)
                .orderByDesc(LinkDO::getCreateTime);
        IPage<LinkDO> page = baseMapper.selectPage(linkPageReqDTO, queryWrapper);
        return page.convert(each -> BeanUtil.toBean(each, LinkPageRespDTO.class));
    }

    @Override
    public List<LinkCountQueryRespDTO> listCountLinkByGroupID(List<String> gids) {
        QueryWrapper<LinkDO> queryWrapper = Wrappers.query(new LinkDO())
                .select("gid as gid,count(*) as count")
                .in("gid", gids)
                .eq("enable_status", 0)
                .groupBy("gid");
        List<Map<String, Object>> list = baseMapper.selectMaps(queryWrapper);
        return BeanUtil.copyToList(list, LinkCountQueryRespDTO.class);
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

    private String getFaviconUrl(String url) {
        try {
            // 连接到指定的URL并获取HTML内容
            Document doc = Jsoup.connect(url).get();
            // 查找HTML中的<link>标签，提取favicon链接
            Elements links = doc.select("link[rel~=icon]");
            if (!links.isEmpty()) {
                // 如果存在带有rel属性值为"icon"的链接，则返回第一个找到的链接
                return links.get(0).attr("href");
            } else {
                // 如果HTML中没有直接指定favicon链接，则尝试在默认位置查找
                return url + "/favicon.ico";
            }
        } catch (Exception ex) {
            throw new ServiceException("网页图标获取失败");
        }
    }
}
