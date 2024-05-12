package org.vakakawaii.shortlink.admin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.dto.req.GroupSaveReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.GroupSortReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.GroupUpdateReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.GroupInfoRespDTO;
import org.vakakawaii.shortlink.admin.service.GroupService;

import java.util.List;

/**
 * 分组管理控制层
 */
@RequiredArgsConstructor
@RestController
public class GroupController {

    private final GroupService groupService;

    /**
     *保存分组
     */
    @PostMapping("/api/short_link/admin/v1/group/save")
    public Result<Void> saveGroup(@RequestBody GroupSaveReqDTO groupSaveReqDTO){
        groupService.saveGroup(groupSaveReqDTO.getName());
        return Results.success();
    }

    /**
     * 查询分组
     */
    @GetMapping("/api/short_link/admin/v1/group/info/list")
    public Result<List<GroupInfoRespDTO>> listGroup(){
        List<GroupInfoRespDTO> groupInfoRespDTOList = groupService.listGroup();
        return Results.success(groupInfoRespDTOList);
    }

    @PutMapping ("/api/short_link/admin/v1/group/update")
    public Result<Void> updateGroup(@RequestBody GroupUpdateReqDTO groupUpdateReqDTO){
        groupService.updateGroup(groupUpdateReqDTO);
        return Results.success();
    }

    /**
     * 删除分组
     */
    @DeleteMapping("/api/short_link/admin/v1/group/delete")
    public Result<Void> deleteGroup(@RequestParam String gid){
        groupService.deleteGroup(gid);
        return Results.success();
    }

    /**
     * 排序group
     */
    @PostMapping("/api/short_link/admin/v1/group/sort")
    public Result<Void> sortGroup(@RequestBody List<GroupSortReqDTO> groupSortReqDTOS){
        groupService.sortGroup(groupSortReqDTOS);
        return Results.success();
    }

}
