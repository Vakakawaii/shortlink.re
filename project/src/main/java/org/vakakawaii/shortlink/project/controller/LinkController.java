package org.vakakawaii.shortlink.project.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.service.LinkService;

@RequiredArgsConstructor
@RestController
public class LinkController {

    public final LinkService linkService;

    @PostMapping("/api/short_link/project/v1/link/create")
    public Result<LinkCreateRespDTO> createLink(@RequestBody LinkCreateReqDTO linkCreateReqDTO){
        LinkCreateRespDTO link = linkService.createLink(linkCreateReqDTO);
        return Results.success(link);
    }


}
