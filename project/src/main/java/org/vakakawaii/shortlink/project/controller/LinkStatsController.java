package org.vakakawaii.shortlink.project.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.dto.req.LinkGroupStatsAccessRecordReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkGroupStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsAccessRecordReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkStatsAccessRecordRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkStatsRespDTO;
import org.vakakawaii.shortlink.project.service.LinkStatsService;

@RequiredArgsConstructor
@RestController
public class LinkStatsController {

    private final LinkStatsService linkStatsService;

    @GetMapping("/api/short_link/v1/stats/one")
    public Result<LinkStatsRespDTO> oneLinkStats(LinkStatsReqDTO linkStatsReqDTO){
        return Results.success(linkStatsService.oneLinkStats(linkStatsReqDTO));
    }

    @GetMapping("/api/short_link/v1/stats/one/log")
    public Result<IPage<LinkStatsAccessRecordRespDTO>> logLinkAccess(LinkStatsAccessRecordReqDTO linkStatsAccessRecordReqDTO){
        return Results.success(linkStatsService.logLinkAccess(linkStatsAccessRecordReqDTO));
    }

    /**
     * 访问分组短链接指定时间内监控数据
     */
    @GetMapping("/api/short_link/v1/stats/group")
    public Result<LinkStatsRespDTO> groupLinkStats(LinkGroupStatsReqDTO linkGroupStatsReqDTO) {
        return Results.success(linkStatsService.groupLinkStats(linkGroupStatsReqDTO));
    }

    /**
     * 访问分组短链接指定时间内访问记录监控数据
     */
    @GetMapping("/api/short_link/v1/stats/group/log")
    public Result<IPage<LinkStatsAccessRecordRespDTO>> groupLogLinkAccess(LinkGroupStatsAccessRecordReqDTO linkGroupStatsAccessRecordReqDTO) {
        return Results.success(linkStatsService.groupLogLinkAccess(linkGroupStatsAccessRecordReqDTO));
    }



}
