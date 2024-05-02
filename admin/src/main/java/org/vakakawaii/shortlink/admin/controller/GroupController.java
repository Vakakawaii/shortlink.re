package org.vakakawaii.shortlink.admin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.dto.req.GroupSaveReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoRespDTO;
import org.vakakawaii.shortlink.admin.service.GroupService;

/**
 * 分组管理控制层
 */
@RequiredArgsConstructor
@RestController
public class GroupController {

    private final GroupService groupService;

    @PostMapping("/api/short_link/v1/group/save")
    public Result<Void> saveGroup(@RequestBody GroupSaveReqDTO groupSaveReqDTO){
        groupService.saveGroup(groupSaveReqDTO.getName());
        return Results.success();
    }


}
