package org.vakakawaii.shortlink.project.controller;


import com.alibaba.csp.sentinel.annotation.SentinelResource;
import com.baomidou.mybatisplus.core.metadata.IPage;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkUpdateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.project.handler.CustomBlockHandler;
import org.vakakawaii.shortlink.project.service.LinkService;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class LinkController {

    private final LinkService linkService;

    @GetMapping("/{short-uri}")
    public void restoreUrl(@PathVariable("short-uri") String shortUri,
                           ServletRequest request, ServletResponse response){
        linkService.restoreUrl(shortUri, request, response);
    }

    @PostMapping("/api/short_link/project/v1/link/create")
    @SentinelResource(
            value = "create_short-link",
            blockHandler = "createShortLinkBlockHandlerMethod",
            blockHandlerClass = CustomBlockHandler.class
    )
    public Result<LinkCreateRespDTO> createLink(@RequestBody LinkCreateReqDTO linkCreateReqDTO){
        LinkCreateRespDTO link = linkService.createLink(linkCreateReqDTO);
        return Results.success(link);
    }

    @PostMapping("/api/short_link/project/v1/link/update")
    public Result<Void> updateLink(@RequestBody LinkUpdateReqDTO linkUpdateReqDTO){
        linkService.updateLink(linkUpdateReqDTO);
        return Results.success();
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
