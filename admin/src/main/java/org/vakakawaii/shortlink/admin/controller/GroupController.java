package org.vakakawaii.shortlink.admin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.admin.service.GroupService;

/**
 * 分组管理控制层
 */
@RequiredArgsConstructor
@RestController
public class GroupController {

    private final GroupService groupService;


}
