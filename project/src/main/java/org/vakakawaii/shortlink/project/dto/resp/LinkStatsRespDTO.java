package org.vakakawaii.shortlink.project.dto.resp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LinkStatsRespDTO {
    /**
     * 访问量
     */
    private Integer pv;

    /**
     * 独立访客数
     */
    private Integer uv;

    /**
     * 独立IP数
     */
    private Integer uip;

    /**
     * 基础访问详情
     */
    private List<LinkStatsAccessDailyRespDTO> daily;

    /**
     * 地区访问详情（仅国内）
     */
    private List<LinkStatsLocaleCNRespDTO> locateCnStats;

    /**
     * 小时访问详情
     */
    private List<Integer> hourStats;

    /**
     * 高频访问IP详情
     */
    private List<LinkStatsTopIpRespDTO> topIpStats;

    /**
     * 一周访问详情
     */
    private List<Integer> weekdayStats;

    /**
     * 浏览器访问详情
     */
    private List<LinkStatsBrowserRespDTO> browserStats;

    /**
     * 操作系统访问详情
     */
    private List<LinkStatsOsRespDTO> osStats;

    /**
     * 访客访问类型详情
     */
    private List<LinkStatsUvRespDTO> uvTypeStats;

    /**
     * 访问设备类型详情
     */
    private List<LinkStatsDeviceRespDTO> deviceStats;

    /**
     * 访问网络类型详情
     */
    private List<LinkStatsNetworkRespDTO> networkStats;
}
