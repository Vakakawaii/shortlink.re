package org.vakakawaii.shortlink.project.mq.consumer;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.date.Week;
import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.connection.stream.MapRecord;
import org.springframework.data.redis.connection.stream.RecordId;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.stream.StreamListener;
import org.springframework.stereotype.Component;
import org.vakakawaii.shortlink.project.common.convention.exception.ServiceException;
import org.vakakawaii.shortlink.project.dao.entity.*;
import org.vakakawaii.shortlink.project.dao.mapper.*;
import org.vakakawaii.shortlink.project.dto.biz.LinkStatsRecordDTO;
import org.vakakawaii.shortlink.project.mq.idempotent.MessageQueueIdempotentHandler;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static org.vakakawaii.shortlink.project.common.constant.LinkConstant.AMAP_REMOTE_URL;
import static org.vakakawaii.shortlink.project.common.constant.RedisKeyConstant.LOCK_GID_UPDATE_KEY;

/**
 * 短链接监控状态保存消息队列消费者
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class ShortLinkStatsSaveConsumer implements StreamListener<String, MapRecord<String, String, String>> {

    private final LinkMapper linkMapper;
    private final LinkGotoMapper shortLinkGotoMapper;
    private final RedissonClient redissonClient;
    private final LinkAccessStatsMapper linkAccessStatsMapper;
    private final LinkLocateStatsMapper linkLocateStatsMapper;
    private final LinkOsStatsMapper linkOsStatsMapper;
    private final LinkBrowserStatsMapper linkBrowserStatsMapper;
    private final LinkAccessLogsMapper linkAccessLogsMapper;
    private final LinkDeviceStatsMapper linkDeviceStatsMapper;
    private final LinkNetworkStatsMapper linkNetworkStatsMapper;
    private final LinkStatsTodayMapper linkStatsTodayMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final MessageQueueIdempotentHandler messageQueueIdempotentHandler;

    @Value("${short-link.stats.locate.amap-key}")
    private String statsLocateAmapKey;

    @Override
    public void onMessage(MapRecord<String, String, String> message) {
        String stream = message.getStream();
        RecordId id = message.getId();
        if (messageQueueIdempotentHandler.isMessageBeingConsumed(id.toString())) {
            // 判断当前的这个消息流程是否执行完成
            if (messageQueueIdempotentHandler.isAccomplish(id.toString())) {
                return;
            }
            throw new ServiceException("消息未完成流程，需要消息队列重试");
        }
        try {
            Map<String, String> producerMap = message.getValue();
            LinkStatsRecordDTO statsRecord = JSON.parseObject(producerMap.get("statsRecord"), LinkStatsRecordDTO.class);
            actualSaveShortLinkStats(statsRecord);
            stringRedisTemplate.opsForStream().delete(Objects.requireNonNull(stream), id.getValue());
        } catch (Throwable ex) {
            // 某某某情况宕机了
            messageQueueIdempotentHandler.delMessageProcessed(id.toString());
            log.error("记录短链接监控消费异常", ex);
            throw ex;
        }
        messageQueueIdempotentHandler.setAccomplish(id.toString());
    }

    public void actualSaveShortLinkStats(LinkStatsRecordDTO statsRecord) {
        String fullShortUrl = statsRecord.getFullShortUrl();
//        RReadWriteLock readWriteLock = redissonClient.getReadWriteLock(String.format(LOCK_GID_UPDATE_KEY, fullShortUrl));
//        RLock rLock = readWriteLock.readLock();
//        rLock.lock();
        try {
            LambdaQueryWrapper<LinkGotoDO> queryWrapper = Wrappers.lambdaQuery(LinkGotoDO.class)
                    .eq(LinkGotoDO::getFullShortUrl, fullShortUrl);
            LinkGotoDO linkGotoDO = shortLinkGotoMapper.selectOne(queryWrapper);
            String gid = linkGotoDO.getGid();
            Date currentDate = statsRecord.getCurrentDate();
            int hour = DateUtil.hour(currentDate, true);
            Week week = DateUtil.dayOfWeekEnum(currentDate);
            int weekValue = week.getIso8601Value();
            LinkAccessStatsDO linkAccessStatsDO = LinkAccessStatsDO.builder()
                    .pv(1)
                    .uv(statsRecord.getUvFirstFlag() ? 1 : 0)
                    .uip(statsRecord.getUipFirstFlag() ? 1 : 0)
                    .hour(hour)
                    .weekday(weekValue)
                    .fullShortUrl(fullShortUrl)
                    .date(currentDate)
                    .build();
            linkAccessStatsMapper.linkAccessStats(linkAccessStatsDO);

            // IP地区统计
            Map<String, Object> locateParamMap = new HashMap<>();
            locateParamMap.put("key", statsLocateAmapKey);
            locateParamMap.put("ip", statsRecord.getRemoteAddr());
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
            String os = statsRecord.getOs();
            LinkOsStatsDO linkOsStatsDO = LinkOsStatsDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .date(new Date())
                    .cnt(1)
                    .os(os)
                    .build();
            linkOsStatsMapper.linkOsStats(linkOsStatsDO);

            // 浏览器统计
            String browser = statsRecord.getBrowser();
            LinkBrowserStatsDO linkBrowserStatsDo = LinkBrowserStatsDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .date(new Date())
                    .cnt(1)
                    .browser(browser)
                    .build();
            linkBrowserStatsMapper.linkBrowserStats(linkBrowserStatsDo);

            // 访问设备统计
            String device = statsRecord.getDevice();
            LinkDeviceStatsDO linkDeviceStatsDO = LinkDeviceStatsDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .date(new Date())
                    .cnt(1)
                    .device(device)
                    .build();
            linkDeviceStatsMapper.linkDeviceStats(linkDeviceStatsDO);

            // 访问网络统计
            String network = statsRecord.getNetwork();
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
                    .user(statsRecord.getUv())
                    .browser(browser)
                    .os(os)
                    .locate(StrUtil.join("-","中国",realProvince, realCity))
                    .network(network)
                    .device(device)
                    .ip(statsRecord.getRemoteAddr())
                    .build();
            linkAccessLogsMapper.linkAccessLogs(linkAccessLogsDO);

            // Link 单独赋予自增总pv，uv，uip
            linkMapper.autoIncrement(
                    fullShortUrl,gid,
                    1,
                    statsRecord.getUvFirstFlag() ? 1 : 0,
                    statsRecord.getUipFirstFlag() ? 1 : 0);

            // 统计每日pv，uv，uip
            LinkStatsTodayDO linkStatsTodayDO = LinkStatsTodayDO.builder()
                    .fullShortUrl(fullShortUrl)
                    .gid(gid)
                    .todayPv(1)
                    .todayUv(statsRecord.getUvFirstFlag() ? 1 : 0)
                    .todayUip(statsRecord.getUipFirstFlag() ? 1 : 0)
                    .date(new Date())
                    .build();
            linkStatsTodayMapper.linkTodayStats(linkStatsTodayDO);
        } catch (Throwable ex) {
            log.error("短链接访问量统计异常", ex);
        } finally {
//            rLock.unlock();
        }
    }
}
