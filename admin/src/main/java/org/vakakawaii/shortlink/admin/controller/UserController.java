package org.vakakawaii.shortlink.admin.controller;

import cn.hutool.core.bean.BeanUtil;
import jakarta.websocket.server.PathParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.dto.resp.UserDesenseRespDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserRespDTO;
import org.vakakawaii.shortlink.admin.service.UserService;

/**
 * 用户管理控制层
 */
@RequiredArgsConstructor
@RestController
public class UserController {

    private final UserService userService;

    /**
     * @param username 用户名
     * @return 查询用户信息
     */
    @GetMapping("/api/shortlink/v1/user/{username}")
    public Result<UserRespDTO> getUserByUsername(@PathVariable("username")String username){
        return Results.success(userService.getUserByUsername(username));
    }

    /**
     * @param username 用户名
     * @return 查询用户信息（脱敏）
     */
    @GetMapping("/api/shortlink/v1/user/desense/{username}")
    public Result<UserDesenseRespDTO> getUserByUsernameDesensitization(@PathVariable("username")String username){
        return Results.success(BeanUtil.toBean(
                userService.getUserByUsername(username), UserDesenseRespDTO.class));
    }

    @GetMapping("/api/shortlink/v1/user/hasusername")
    public Result<Boolean> hasUserName(@PathParam("username")String username){
        return Results.success(userService.hasUserName(username));
    }
}
