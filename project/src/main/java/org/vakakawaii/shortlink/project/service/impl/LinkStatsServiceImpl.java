package org.vakakawaii.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.project.dao.entity.*;
import org.vakakawaii.shortlink.project.dao.mapper.*;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsAccessRecordReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.*;
import org.vakakawaii.shortlink.project.service.LinkStatsService;

import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@Service
@Slf4j
@RequiredArgsConstructor
public class LinkStatsServiceImpl implements LinkStatsService {

    private final LinkAccessStatsMapper linkAccessStatsMapper;
    private final LinkLocateStatsMapper linkLocateStatsMapper;
    private final LinkAccessLogsMapper linkAccessLogsMapper;
    private final LinkBrowserStatsMapper linkBrowserStatsMapper;
    private final LinkOsStatsMapper linkOsStatsMapper;
    private final LinkDeviceStatsMapper linkDeviceStatsMapper;
    private final LinkNetworkStatsMapper linkNetworkStatsMapper;

    @Override
    public LinkStatsRespDTO oneLinkStats(LinkStatsReqDTO linkStatsReqDTO) {

        List<LinkAccessStatsDO> listStatsByShortLink = linkAccessStatsMapper.listAccessStatsByLink(linkStatsReqDTO);
        if (CollUtil.isEmpty(listStatsByShortLink)) {
            return null;
        }
        // 基础访问数据
        LinkAccessStatsDO pvUvUidStatsByShortLink = linkAccessLogsMapper.findPvUvUidStatsByLink(linkStatsReqDTO);
        // 基础访问详情
        List<LinkStatsAccessDailyRespDTO> daily = new ArrayList<>();
        List<String> rangeDates = DateUtil
                .rangeToList(DateUtil.parse(linkStatsReqDTO.getStartDate()), DateUtil.parse(linkStatsReqDTO.getEndDate()), DateField.DAY_OF_MONTH).stream()
                .map(DateUtil::formatDate)
                .toList();
        rangeDates.forEach(each -> listStatsByShortLink.stream()
                .filter(item -> Objects.equals(each, DateUtil.formatDate(item.getDate())))
                .findFirst()
                .ifPresentOrElse(item -> {
                    LinkStatsAccessDailyRespDTO accessDailyRespDTO = LinkStatsAccessDailyRespDTO.builder()
                            .date(each)
                            .pv(item.getPv())
                            .uv(item.getUv())
                            .uip(item.getUip())
                            .build();
                    daily.add(accessDailyRespDTO);
                }, () -> {
                    LinkStatsAccessDailyRespDTO accessDailyRespDTO = LinkStatsAccessDailyRespDTO.builder()
                            .date(each)
                            .pv(0)
                            .uv(0)
                            .uip(0)
                            .build();
                    daily.add(accessDailyRespDTO);
                }));
        // 地区访问详情（仅国内）
        List<LinkStatsLocaleCNRespDTO> locateCnStats = new ArrayList<>();
        List<LinkLocateStatsDO> listedLocaleByShortLink = linkLocateStatsMapper.listLocateByLink(linkStatsReqDTO);
        int localeCnSum = listedLocaleByShortLink.stream()
                .mapToInt(LinkLocateStatsDO::getCnt)
                .sum();
        listedLocaleByShortLink.forEach(each -> {
            double ratio = (double) each.getCnt() / localeCnSum;
            double actualRatio = Math.round(ratio * 100.0) / 100.0;
            LinkStatsLocaleCNRespDTO localeCNRespDTO = LinkStatsLocaleCNRespDTO.builder()
                    .cnt(each.getCnt())
                    .locale(each.getProvince())
                    .ratio(actualRatio)
                    .build();
            locateCnStats.add(localeCNRespDTO);
        });
        // 小时访问详情
        List<Integer> hourStats = new ArrayList<>();
        List<LinkAccessStatsDO> listHourStatsByShortLink = linkAccessStatsMapper.listHourStatsByLink(linkStatsReqDTO);
        for (int i = 0; i < 24; i++) {
            AtomicInteger hour = new AtomicInteger(i);
            int hourCnt = listHourStatsByShortLink.stream()
                    .filter(each -> Objects.equals(each.getHour(), hour.get()))
                    .findFirst()
                    .map(LinkAccessStatsDO::getPv)
                    .orElse(0);
            hourStats.add(hourCnt);
        }
        // 高频访问IP详情
        List<LinkStatsTopIpRespDTO> topIpStats = new ArrayList<>();
        List<HashMap<String, Object>> listTopIpByShortLink = linkAccessLogsMapper.listTopIpByLink(linkStatsReqDTO);
        listTopIpByShortLink.forEach(each -> {
            LinkStatsTopIpRespDTO statsTopIpRespDTO = LinkStatsTopIpRespDTO.builder()
                    .ip(each.get("ip").toString())
                    .cnt(Integer.parseInt(each.get("count").toString()))
                    .build();
            topIpStats.add(statsTopIpRespDTO);
        });
        // 一周访问详情
        List<Integer> weekdayStats = new ArrayList<>();
        List<LinkAccessStatsDO> listWeekdayStatsByShortLink = linkAccessStatsMapper.listWeekdayStatsByLink(linkStatsReqDTO);
        for (int i = 1; i < 8; i++) {
            AtomicInteger weekday = new AtomicInteger(i);
            int weekdayCnt = listWeekdayStatsByShortLink.stream()
                    .filter(each -> Objects.equals(each.getWeekday(), weekday.get()))
                    .findFirst()
                    .map(LinkAccessStatsDO::getPv)
                    .orElse(0);
            weekdayStats.add(weekdayCnt);
        }
        // 浏览器访问详情
        List<LinkStatsBrowserRespDTO> browserStats = new ArrayList<>();
        List<HashMap<String, Object>> listBrowserStatsByShortLink = linkBrowserStatsMapper
                .listBrowserStatsByLink(linkStatsReqDTO);
        int browserSum = listBrowserStatsByShortLink.stream()
                .mapToInt(each -> Integer.parseInt(each.get("count").toString()))
                .sum();
        listBrowserStatsByShortLink.forEach(each -> {
            double ratio = (double) Integer.parseInt(each.get("count").toString()) / browserSum;
            double actualRatio = Math.round(ratio * 100.0) / 100.0;
            LinkStatsBrowserRespDTO browserRespDTO = LinkStatsBrowserRespDTO.builder()
                    .cnt(Integer.parseInt(each.get("count").toString()))
                    .browser(each.get("browser").toString())
                    .ratio(actualRatio)
                    .build();
            browserStats.add(browserRespDTO);
        });
        // 操作系统访问详情
        List<LinkStatsOsRespDTO> osStats = new ArrayList<>();
        List<HashMap<String, Object>> listOsStatsByShortLink = linkOsStatsMapper.listOsStatsByLink(linkStatsReqDTO);
        int osSum = listOsStatsByShortLink.stream()
                .mapToInt(each -> Integer.parseInt(each.get("count").toString()))
                .sum();
        listOsStatsByShortLink.forEach(each -> {
            double ratio = (double) Integer.parseInt(each.get("count").toString()) / osSum;
            double actualRatio = Math.round(ratio * 100.0) / 100.0;
            LinkStatsOsRespDTO osRespDTO = LinkStatsOsRespDTO.builder()
                    .cnt(Integer.parseInt(each.get("count").toString()))
                    .os(each.get("os").toString())
                    .ratio(actualRatio)
                    .build();
            osStats.add(osRespDTO);
        });
        // 访客访问类型详情
        List<LinkStatsUvRespDTO> uvTypeStats = new ArrayList<>();
        HashMap<String, Object> findUvTypeByShortLink = linkAccessLogsMapper.findUvTypeCntByLink(linkStatsReqDTO);
        int oldUserCnt = Integer.parseInt(
                Optional.ofNullable(findUvTypeByShortLink)
                        .map(each -> each.get("oldUserCnt"))
                        .map(Object::toString)
                        .orElse("0")
        );
        int newUserCnt = Integer.parseInt(
                Optional.ofNullable(findUvTypeByShortLink)
                        .map(each -> each.get("newUserCnt"))
                        .map(Object::toString)
                        .orElse("0")
        );
        int uvSum = oldUserCnt + newUserCnt;
        double oldRatio = (double) oldUserCnt / uvSum;
        double actualOldRatio = Math.round(oldRatio * 100.0) / 100.0;
        double newRatio = (double) newUserCnt / uvSum;
        double actualNewRatio = Math.round(newRatio * 100.0) / 100.0;
        LinkStatsUvRespDTO newUvRespDTO = LinkStatsUvRespDTO.builder()
                .uvType("newUser")
                .cnt(newUserCnt)
                .ratio(actualNewRatio)
                .build();
        uvTypeStats.add(newUvRespDTO);
        LinkStatsUvRespDTO oldUvRespDTO = LinkStatsUvRespDTO.builder()
                .uvType("oldUser")
                .cnt(oldUserCnt)
                .ratio(actualOldRatio)
                .build();
        uvTypeStats.add(oldUvRespDTO);
        // 访问设备类型详情
        List<LinkStatsDeviceRespDTO> deviceStats = new ArrayList<>();
        List<LinkDeviceStatsDO> listDeviceStatsByShortLink = linkDeviceStatsMapper.listDeviceStatsByLink(linkStatsReqDTO);
        int deviceSum = listDeviceStatsByShortLink.stream()
                .mapToInt(LinkDeviceStatsDO::getCnt)
                .sum();
        listDeviceStatsByShortLink.forEach(each -> {
            double ratio = (double) each.getCnt() / deviceSum;
            double actualRatio = Math.round(ratio * 100.0) / 100.0;
            LinkStatsDeviceRespDTO deviceRespDTO = LinkStatsDeviceRespDTO.builder()
                    .cnt(each.getCnt())
                    .device(each.getDevice())
                    .ratio(actualRatio)
                    .build();
            deviceStats.add(deviceRespDTO);
        });
        // 访问网络类型详情
        List<LinkStatsNetworkRespDTO> networkStats = new ArrayList<>();
        List<LinkNetworkStatsDO> listNetworkStatsByShortLink = linkNetworkStatsMapper
                .listNetworkStatsByLink(linkStatsReqDTO);
        int networkSum = listNetworkStatsByShortLink.stream()
                .mapToInt(LinkNetworkStatsDO::getCnt)
                .sum();
        listNetworkStatsByShortLink.forEach(each -> {
            double ratio = (double) each.getCnt() / networkSum;
            double actualRatio = Math.round(ratio * 100.0) / 100.0;
            LinkStatsNetworkRespDTO networkRespDTO = LinkStatsNetworkRespDTO.builder()
                    .cnt(each.getCnt())
                    .network(each.getNetwork())
                    .ratio(actualRatio)
                    .build();
            networkStats.add(networkRespDTO);
        });
        return LinkStatsRespDTO.builder()
                .pv(pvUvUidStatsByShortLink.getPv())
                .uv(pvUvUidStatsByShortLink.getUv())
                .uip(pvUvUidStatsByShortLink.getUip())
                .daily(daily)
                .locateCnStats(locateCnStats)
                .hourStats(hourStats)
                .topIpStats(topIpStats)
                .weekdayStats(weekdayStats)
                .browserStats(browserStats)
                .osStats(osStats)
                .uvTypeStats(uvTypeStats)
                .deviceStats(deviceStats)
                .networkStats(networkStats)
                .build();
    }


    @Override
    public IPage<LinkStatsAccessRecordRespDTO> logLinkAccess(LinkStatsAccessRecordReqDTO linkStatsAccessRecordReqDTO) {
        // 创建 LambdaQueryWrapper 对象，用于构建查询条件
        LambdaQueryWrapper<LinkAccessLogsDO> queryWrapper = Wrappers.lambdaQuery(LinkAccessLogsDO.class)
                // 添加条件：匹配 fullShortUrl
                .eq(LinkAccessLogsDO::getFullShortUrl, linkStatsAccessRecordReqDTO.getFullShortUrl())
                // 添加条件：匹配 gid
                .eq(LinkAccessLogsDO::getGid, linkStatsAccessRecordReqDTO.getGid())
                .between(LinkAccessLogsDO::getCreateTime,linkStatsAccessRecordReqDTO.getStartDate(),linkStatsAccessRecordReqDTO.getEndDate())
                // 添加条件：delFlag 为 0（表示未删除的记录）
                .eq(LinkAccessLogsDO::getDelFlag, 0)
                .orderByDesc(LinkAccessLogsDO::getCreateTime);

        // 使用 queryWrapper 进行分页查询
        IPage<LinkAccessLogsDO> linkAccessLogsDOIPage = linkAccessLogsMapper.selectPage(linkStatsAccessRecordReqDTO, queryWrapper);

        // 将 LinkAccessLogsDO 对象转换为 LinkStatsAccessRecordRespDTO 对象
        IPage<LinkStatsAccessRecordRespDTO> result = linkAccessLogsDOIPage.convert(each -> BeanUtil.toBean(each, LinkStatsAccessRecordRespDTO.class));

        // 获取查询结果中的所有用户ID
        List<String> userAccessLogsList = result.getRecords().stream()
                .map(LinkStatsAccessRecordRespDTO::getUser)
                .toList();

        // 根据用户ID列表和请求参数查询用户类型（新访客或老访客）
        List<Map<String, Object>> uvTypeByUsers = linkAccessLogsMapper.selectUvTypeByUsers(
                linkStatsAccessRecordReqDTO.getGid(),
                linkStatsAccessRecordReqDTO.getFullShortUrl(),
                linkStatsAccessRecordReqDTO.getStartDate(),
                linkStatsAccessRecordReqDTO.getEndDate(),
                userAccessLogsList);

        // 为每个结果记录设置用户类型
        result.getRecords().forEach(each -> {
            String uvType = uvTypeByUsers.stream()
                    // 过滤出与当前记录用户ID匹配的记录
                    .filter(item -> Objects.equals(each.getUser(), item.get("user")))
                    // 找到第一个匹配的记录
                    .findFirst()
                    // 获取用户类型，如果没有匹配则默认为"旧访客"
                    .map(item -> item.get("user"))
                    .map(Object::toString)
                    .orElse("旧访客");
            // 设置用户类型
            each.setUvType(uvType);
        });

        return result;
    }
}
















