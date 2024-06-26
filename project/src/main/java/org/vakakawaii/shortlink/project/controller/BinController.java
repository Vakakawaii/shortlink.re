package org.vakakawaii.shortlink.project.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.dto.req.BinDeleteReqDTO;
import org.vakakawaii.shortlink.project.dto.req.BinPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.BinRecoverReqDTO;
import org.vakakawaii.shortlink.project.dto.req.BinSaveReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.BinPageRespDTO;
import org.vakakawaii.shortlink.project.service.BinService;

@RestController
@RequiredArgsConstructor
public class BinController {

    private final BinService binService;

    @PostMapping("/api/short_link/v1/bin/save")
    public Result<Void> saveBin(@RequestBody BinSaveReqDTO binSaveReqDTO){
        binService.saveBin(binSaveReqDTO);
        return Results.success();
    }


    @GetMapping("/api/short_link/v1/bin/page")
    public Result<IPage<BinPageRespDTO>> pageLink(BinPageReqDTO binPageReqDTO){
        return Results.success(binService.pageBin(binPageReqDTO));
    }

    @PostMapping("/api/short_link/v1/bin/recover")
    public Result<Void> recoverBin(@RequestBody BinRecoverReqDTO binRecoverReqDTO){
        binService.recoverBin(binRecoverReqDTO);
        return Results.success();
    }

    @PostMapping("/api/short_link/v1/bin/delete")
    public Result<Void> delBin(@RequestBody BinDeleteReqDTO binDeleteReqDTO){
        binService.delBin(binDeleteReqDTO);
        return Results.success();
    }
}
