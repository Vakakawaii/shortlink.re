package org.vakakawaii.shortlink.admin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.dto.req.GroupSaveReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.GroupInfoRespDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoRespDTO;
import org.vakakawaii.shortlink.admin.service.GroupService;

import java.util.List;

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

    @GetMapping("/api/short_link/v1/group/info/list")
    public Result<List<GroupInfoRespDTO>> listGroup(){
        List<GroupInfoRespDTO> groupInfoRespDTOList = groupService.listGroup();
        return Results.success(groupInfoRespDTOList);
    }


}
