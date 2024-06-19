package org.vakakawaii.shortlink.project.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;
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



}
