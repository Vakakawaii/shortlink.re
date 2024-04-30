package org.vakakawaii.shortlink.admin.common.enums;

import org.vakakawaii.shortlink.admin.common.convention.errorcode.IErrorCode;

public enum UserErrorCodeEnum implements IErrorCode {

    USER_NULL("B000200", "用户记录不存在"),
    USER_EXIST("B000201", "用户记录已存在"),
    USER_NAME_EXIST("B000202", "用户名已存在"),
    USER_SAVE_ERROR("B000203", "用户记录新增失败"),
    USER_HAS_LOGIN_ED("B000204", "用户名已登录"),
    USER_HAS_NOT_LOGIN_ED_OR_NOT_TOKEN("B000205", "用户未登录或用户token不存在");

    private final String code;

    private final String message;

    UserErrorCodeEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public String code() {
        return code;
    }

    @Override
    public String message() {
        return message;
    }

}
