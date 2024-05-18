package org.vakakawaii.shortlink.project.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.project.service.LinkService;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class LinkController {

    public final LinkService linkService;

    @PostMapping("/api/short_link/project/v1/link/create")
    public Result<LinkCreateRespDTO> createLink(@RequestBody LinkCreateReqDTO linkCreateReqDTO){
        LinkCreateRespDTO link = linkService.createLink(linkCreateReqDTO);
        return Results.success(link);
    }

    @GetMapping("/api/short_link/project/v1/link/page")
    public Result<IPage<LinkPageRespDTO>> pageLink(LinkPageReqDTO linkPageReqDTO){
        return Results.success(linkService.pageLink(linkPageReqDTO));
    }

    /**
     * 查询短连接分组内数量
     * @return gid + count -> list
     */
    @GetMapping("/api/short_link/project/v1/link/count")
    public Result<List<LinkCountQueryRespDTO>> listCountLinkByGroupID(@RequestParam("gids") List<String> gids){
        return Results.success(linkService.listCountLinkByGroupID(gids));
    }



}
