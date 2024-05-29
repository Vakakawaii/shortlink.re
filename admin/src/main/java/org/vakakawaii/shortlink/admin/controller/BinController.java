package org.vakakawaii.shortlink.admin.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.remote.LinkRemoteService;
import org.vakakawaii.shortlink.admin.remote.dto.req.BinSaveReqDTO;

@RestController
public class BinController {

    LinkRemoteService linkRemoteService = new LinkRemoteService() {
    };


    @PostMapping("/api/short_link/admin/v1/bin/save")
    public Result<Void> saveBin(@RequestBody BinSaveReqDTO binSaveReqDTO){
        return  linkRemoteService.saveBin(binSaveReqDTO);
    }


}
