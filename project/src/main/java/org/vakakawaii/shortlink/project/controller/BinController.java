package org.vakakawaii.shortlink.project.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.common.convention.result.Results;
import org.vakakawaii.shortlink.project.dto.req.BinSaveReqDTO;
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


}
