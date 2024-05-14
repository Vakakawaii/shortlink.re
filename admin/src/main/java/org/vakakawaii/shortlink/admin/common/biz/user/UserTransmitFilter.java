package org.vakakawaii.shortlink.admin.common.biz.user;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import com.google.common.collect.Lists;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.util.StringUtils;
import org.vakakawaii.shortlink.admin.common.convention.exception.ClientException;
import org.vakakawaii.shortlink.admin.common.enums.UserErrorCodeEnum;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Objects;

import static java.nio.charset.StandardCharsets.UTF_8;

/**
 * 用户信息传输过滤器
 */
@RequiredArgsConstructor
public class UserTransmitFilter implements Filter {

    private final StringRedisTemplate stringRedisTemplate;

    private static final List<String> IGNORE_URI = Lists.newArrayList(
            "/api/short_link/admin/v1/user/register",
            "/api/short_link/admin/v1/user/login",
            "/api/short_link/admin/v1/user/is_username_exist"
    );

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;

        String requestURI = httpServletRequest.getRequestURI();
        if(!IGNORE_URI.contains(requestURI)){
            String userName = httpServletRequest.getHeader("username");
            String token = httpServletRequest.getHeader("token");

            if (StrUtil.isAllNotBlank(userName,token)){
                // TODO 拦截器拦截不到这里
                throw new ClientException(UserErrorCodeEnum.USER_TOKEN_FAIL);
            }
            Object userInfoJsonStr;

            try {
                userInfoJsonStr = stringRedisTemplate.opsForHash().get("login_" + userName, token);
                if(userInfoJsonStr == null){
                    throw new ClientException(UserErrorCodeEnum.USER_TOKEN_FAIL);
                }
            }catch (Exception ex){
                throw new ClientException(UserErrorCodeEnum.USER_TOKEN_FAIL);
            }
            UserInfoDTO userInfoDTO = JSON.parseObject(userInfoJsonStr.toString(), UserInfoDTO.class);
            UserContext.setUser(userInfoDTO);
        }
        try {
            filterChain.doFilter(servletRequest, servletResponse);
        } finally {
            UserContext.removeUser();
        }
    }
}