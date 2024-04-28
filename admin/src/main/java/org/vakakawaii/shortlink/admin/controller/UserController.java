package org.vakakawaii.shortlink.admin.controller;

import cn.hutool.core.bean.BeanUtil;
import jakarta.websocket.server.PathParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.dto.req.UserRegisterReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoDesenseRespDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoRespDTO;
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
    @GetMapping("/api/short_link/v1/user/info/{username}")
    public Result<UserInfoRespDTO> getUserByUsername(@PathVariable("username")String username){
        return Results.success(userService.getUserByUsername(username));
    }

    /**
     * @param username 用户名
     * @return 查询用户信息（脱敏）
     */
    @GetMapping("/api/short_link/v1/user/info_desense/{username}")
    public Result<UserInfoDesenseRespDTO> getUserByUsernameDesensitization(@PathVariable("username")String username){
        return Results.success(BeanUtil.toBean(
                userService.getUserByUsername(username), UserInfoDesenseRespDTO.class));
    }

    /**
     * 查询是否用户名存在
     * @param username 用户名
     * @return Result<Boolean>
     */
    @GetMapping("/api/short_link/v1/user/is_username_exist")
    public Result<Boolean> isUserNameExist(@PathParam("username")String username){
        return Results.success(userService.isUserNameExist(username));
    }

    /**
     * 用户信息注册
     * @param userRegisterReqDTO 请求参数
     * @return NULL 结果
     */
    @PostMapping("/api/short_link/v1/user/register")
    public Result<Void> register(@RequestBody UserRegisterReqDTO userRegisterReqDTO){
        userService.register(userRegisterReqDTO);
        return Results.success();
    }
}

