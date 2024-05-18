package org.vakakawaii.shortlink.admin.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.remote.LinkRemoteService;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkPageRespDTO;

import java.util.List;


@RestController
public class LinkController {

    // TODO 后续重构为 Spring cloud Feign 调用

    LinkRemoteService linkRemoteService = new LinkRemoteService() {
    };

    @PostMapping("/api/short_link/project/v1/link/create")
    public Result<LinkCreateRespDTO> createLink(@RequestBody LinkCreateReqDTO linkCreateReqDTO) {
        return linkRemoteService.createLink(linkCreateReqDTO);
    }

    @GetMapping("/api/short_link/project/v1/link/page")
    public Result<IPage<LinkPageRespDTO>> pageLink(LinkPageReqDTO linkPageReqDTO) {
        return linkRemoteService.pageLink(linkPageReqDTO);
    }

    /**
     * 查询短连接分组内数量
     * @return gid + count -> list
     */
    @GetMapping("/api/short_link/project/v1/link/count")
    public Result<List<LinkCountQueryRespDTO>> listCountLinkByGroupID(@RequestParam("gids") List<String> gids){
        return linkRemoteService.listCountLinkByGroupID(gids);
    }

}
