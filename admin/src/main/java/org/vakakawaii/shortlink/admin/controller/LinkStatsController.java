package org.vakakawaii.shortlink.admin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.remote.LinkRemoteService;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkGroupStatsAccessRecordReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkGroupStatsReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkStatsAccessRecordReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkStatsReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkStatsAccessRecordRespDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkStatsRespDTO;

@RequiredArgsConstructor
@RestController
public class LinkStatsController {

    // TODO 后续重构为 Spring cloud Feign 调用

    LinkRemoteService linkRemoteService = new LinkRemoteService() {
    };

    @GetMapping("/api/short_link/admin/v1/stats/one")
    public Result<LinkStatsRespDTO> oneLinkStats(LinkStatsReqDTO linkStatsReqDTO){
        return linkRemoteService.oneLinkStats(linkStatsReqDTO);
    }

    @GetMapping("/api/short_link/admin/v1/stats/one/log")
    public Result<IPage<LinkStatsAccessRecordRespDTO>> logLinkAccess(LinkStatsAccessRecordReqDTO linkStatsAccessRecordReqDTO){
        return linkRemoteService.logLinkAccess(linkStatsAccessRecordReqDTO);
    }

    /**
     * 访问分组短链接指定时间内监控数据
     */
    @GetMapping("/api/short_link/admin/v1/stats/group")
    public Result<LinkStatsRespDTO> groupLinkStats(LinkGroupStatsReqDTO linkGroupStatsReqDTO) {
        return linkRemoteService.groupLinkStats(linkGroupStatsReqDTO);
    }

    /**
     * 访问分组短链接指定时间内访问记录监控数据
     */
    @GetMapping("/api/short_link/admin/v1/stats/group/log")
    public Result<IPage<LinkStatsAccessRecordRespDTO>> groupLogLinkAccess(LinkGroupStatsAccessRecordReqDTO linkGroupStatsAccessRecordReqDTO) {
        return linkRemoteService.groupLogLinkAccess(linkGroupStatsAccessRecordReqDTO);
    }



}
