package org.vakakawaii.shortlink.project.controller;


import jakarta.websocket.server.PathParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.service.UrlTitleService;

@RestController
@RequiredArgsConstructor
public class UrlTitleController {

    private final UrlTitleService urlTitleService;


    /**
     * 获取网页标题
     * @param url
     */
    @GetMapping("/api/short_link/v1/title")
    public Result<String> getTitleByUrl(@PathParam("url") String url){
        return Results.success(urlTitleService.getTitleByUrl(url));
    }
}
