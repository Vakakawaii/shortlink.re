package org.vakakawaii.shortlink.admin.controller;


import jakarta.websocket.server.PathParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.remote.LinkRemoteService;


@RestController
public class UrlTitleController {

    // TODO 后续重构为 Spring cloud Feign 调用

    LinkRemoteService linkRemoteService = new LinkRemoteService() {
    };


    /**
     * 获取网页标题
     * @param url
     */
    @GetMapping("/api/short_link/admin/v1/title")
    public Result<String> getTitleByUrl(@PathParam("url") String url){
        return linkRemoteService.getTitleByUrl(url);
    }
}
