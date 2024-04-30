package org.vakakawaii.shortlink.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.vakakawaii.shortlink.admin.dao.entity.UserDO;
import org.vakakawaii.shortlink.admin.dto.req.UserLoginReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.UserRegisterReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.UserUpdateReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoRespDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserLoginRespDTO;

/**
 * 用户接口层
 */
public interface UserService extends IService<UserDO> {

    /**
     * 根据用户名查询用户信息
     * @param username 用户名
     * @return 用户返回实体
     */
    UserInfoRespDTO getUserByUsername(String username);

    /**
     * 查询是否该用户存在
     * @param username 用户名
     * @return 存在返回1, 不存在返回0
     */
    Boolean isUserNameExist(String username);

    /**
     * 注册
     * @param userRegisterReqDTO
     */
    void register(UserRegisterReqDTO userRegisterReqDTO);

    /**
     * 更新
     * @param userUpdateReqDTO
     */
    void updateUser(UserUpdateReqDTO userUpdateReqDTO);

    /**
     * 登录
     * @param UserLoginReqDTO
     */
    UserLoginRespDTO login(UserLoginReqDTO userLoginReqDTO);

    /**
     * 检查是否登录
     * @param token
     * @return 存在返回1，不存在返回0
     */
    Boolean loginCheck(String token, String username);

    /**
     * 登出
     * @param token
     * @param username
     */
    void logout(String token, String username);
}
