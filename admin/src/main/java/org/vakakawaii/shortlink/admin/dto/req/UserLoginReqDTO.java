package org.vakakawaii.shortlink.admin.dto.req;

import lombok.Data;

/**
 * 用户注册请求实体参数
 */
@Data
public class UserLoginReqDTO {


    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

}
