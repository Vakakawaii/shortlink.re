package org.vakakawaii.shortlink.admin.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.remote.LinkRemoteService;
import org.vakakawaii.shortlink.admin.remote.dto.req.BinDeleteReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.req.BinPageReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.req.BinSaveReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.BinPageRespDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.admin.service.BinService;

@RestController
@RequiredArgsConstructor
public class BinController {

    LinkRemoteService linkRemoteService = new LinkRemoteService() {
    };

    private final BinService binService;

    @PostMapping("/api/short_link/admin/v1/bin/save")
    public Result<Void> saveBin(@RequestBody BinSaveReqDTO binSaveReqDTO){
        return  linkRemoteService.saveBin(binSaveReqDTO);
    }


    @GetMapping("/api/short_link/admin/v1/bin/page")
    public Result<IPage<BinPageRespDTO>> pageLink(BinPageReqDTO binPageReqDTO){
        return binService.pageBin(binPageReqDTO);
    }

    @PostMapping("/api/short_link/admin/v1/bin/recover")
    public Result<Void> recoverBin(@RequestBody BinSaveReqDTO binSaveReqDTO){
        return  linkRemoteService.recoverBin(binSaveReqDTO);
    }

    @PostMapping("/api/short_link/admin/v1/bin/delete")
    public Result<Void> delBin(@RequestBody BinDeleteReqDTO binDeleteReqDTO){
        return linkRemoteService.delBin(binDeleteReqDTO);
    }
}
