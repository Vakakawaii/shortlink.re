package org.vakakawaii.shortlink.admin.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.admin.dto.resp.UserRespDTO;
import org.vakakawaii.shortlink.admin.service.UserService;

/**
 * 用户管理控制层
 */
@RequiredArgsConstructor
@RestController
public class UserController {

    private final UserService userService;

    @GetMapping("/api/shortlink/v1/user/{username}")
    public UserRespDTO getUserByUsername(@PathVariable("username")String username){
        return userService.getUserByUsername(username);
    }



}
