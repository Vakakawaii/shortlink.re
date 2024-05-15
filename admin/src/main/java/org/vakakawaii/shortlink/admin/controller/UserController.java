package org.vakakawaii.shortlink.admin.controller;

import cn.hutool.core.bean.BeanUtil;
import jakarta.websocket.server.PathParam;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.dto.req.UserLoginReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.UserRegisterReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.UserUpdateReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoDesenseRespDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoRespDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserLoginRespDTO;
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
    @GetMapping("/api/short_link/admin/v1/user/info/{username}")
    public Result<UserInfoRespDTO> getUserByUsername(@PathVariable("username")String username){
        return Results.success(userService.getUserByUsername(username));
    }

    /**
     * @param username 用户名
     * @return 查询用户信息（脱敏）
     */
    @GetMapping("/api/short_link/admin/v1/user/info_desense/{username}")
    public Result<UserInfoDesenseRespDTO> getUserByUsernameDesensitization(@PathVariable("username")String username){
        return Results.success(BeanUtil.toBean(
                userService.getUserByUsername(username), UserInfoDesenseRespDTO.class));
    }

    /**
     * 查询是否用户名存在
     * @param username 用户名
     * @return Result<Boolean>
     */
    @GetMapping("/api/short_link/admin/v1/user/is_username_exist")
    public Result<Boolean> isUserNameExist(@PathParam("username")String username){
        return Results.success(userService.isUserNameExist(username));
    }

    /**
     * 用户信息注册
     * @param userRegisterReqDTO 请求参数
     * @return NULL 结果
     */
    @PostMapping("/api/short_link/admin/v1/user/register")
    public Result<Void> register(@RequestBody UserRegisterReqDTO userRegisterReqDTO){
        userService.register(userRegisterReqDTO);
        return Results.success();
    }

    /**
     * 更新用户参数
     * @param userUpdateReqDTO 请求参数
     * @return 结果
     */
    @PutMapping("/api/short_link/admin/v1/user/update")
    public Result<Void> updateUser(@RequestBody UserUpdateReqDTO userUpdateReqDTO){
        userService.updateUser(userUpdateReqDTO);
        return Results.success();
    }

    /**
     * 登录
     * @param userLoginReqDTO 请求参数
     * @return 结果
     */
    @PostMapping("/api/short_link/admin/v1/user/login")
    public Result<UserLoginRespDTO> login(@RequestBody UserLoginReqDTO userLoginReqDTO){
        UserLoginRespDTO userLoginRespDTO = userService.login(userLoginReqDTO);
        return Results.success(userLoginRespDTO);
    }

    /**
     * 检查是否登录
     * @param token
     * @param username
     * @return 存在返回1，不存在返回0
     */
    @GetMapping("/api/short_link/admin/v1/user/login_check")
    public Result<Boolean> loginCheck(
            @RequestParam("token") String token,
            @RequestParam("username") String username){
        return Results.success(userService.loginCheck(token,username));

    }

    /**
     * 登出
     * @param token
     * @param username
     */
    @DeleteMapping("/api/short_link/admin/v1/user/logout")
    public Result<Void> logout(
            @RequestParam("token") String token,
            @RequestParam("username") String username){
        userService.logout(token,username);
        return Results.success();
    }
}

