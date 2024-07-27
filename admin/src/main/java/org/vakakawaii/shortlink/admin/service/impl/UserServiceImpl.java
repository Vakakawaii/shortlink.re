package org.vakakawaii.shortlink.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.UUID;
import com.alibaba.fastjson2.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.BeanUtils;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.admin.common.constant.RedisCacheConstant;
import org.vakakawaii.shortlink.admin.common.convention.exception.ClientException;
import org.vakakawaii.shortlink.admin.common.enums.UserErrorCodeEnum;
import org.vakakawaii.shortlink.admin.dao.entity.UserDO;
import org.vakakawaii.shortlink.admin.dao.mapper.UserMapper;
import org.vakakawaii.shortlink.admin.dto.req.UserLoginReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.UserRegisterReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.UserUpdateReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoRespDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserLoginRespDTO;
import org.vakakawaii.shortlink.admin.service.GroupService;
import org.vakakawaii.shortlink.admin.service.UserService;

import java.util.concurrent.TimeUnit;

/**
 * 用户接口实现层
 */

@Service
@RequiredArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, UserDO> implements UserService {

    private final RBloomFilter<String> userRegisterCachePenetrationBloomFilter;
    private final RedissonClient redissonClient;
    private final StringRedisTemplate stringRedisTemplate;
    private final GroupService groupService;

    @Override
    public UserInfoRespDTO getUserByUsername(String username) {
        // 返回对象为UserDO
        LambdaQueryWrapper<UserDO> queryWrapper = Wrappers.lambdaQuery(UserDO.class)
                .eq(UserDO::getUsername, username);
        UserDO userDO = baseMapper.selectOne(queryWrapper);

//        判断查上来的用户是否为空
        if (userDO == null) {
            throw new ClientException(UserErrorCodeEnum.USER_NULL);
        }

        UserInfoRespDTO result = new UserInfoRespDTO();
        BeanUtils.copyProperties(userDO, result);

        return result;
    }

    @Override
    public Boolean isUserNameExist(String username) {
//        LambdaQueryWrapper<UserDO> queryWrapper = Wrappers.lambdaQuery(UserDO.class)
//                .eq(UserDO::getUsername, username);
//
//        UserDO userDO = baseMapper.selectOne(queryWrapper);
//        return userDO != null;
//      所有的用户名都在注册的时候加入了布隆过滤器的缓存
//      查询存在时，经过布隆过滤器，没有访问mysql，所以不会打印日志
        return userRegisterCachePenetrationBloomFilter.contains(username);
    }

    @Override
    public void register(UserRegisterReqDTO userRegisterReqDTO) {
        if (isUserNameExist(userRegisterReqDTO.getUsername())) {
            throw new ClientException(UserErrorCodeEnum.USER_NAME_EXIST);
        }
        // 初始化分布式锁
        RLock lock = redissonClient.getLock(
                RedisCacheConstant.LOCK_USER_REGISTER_KEY + userRegisterReqDTO.getUsername());

        // 使用分布式锁，防止恶意请求毫秒级触发大量请求去一个未注册的用户名
        try {
            // 尝试获取锁
            if (lock.tryLock()) {
                try {
                    // 注册信息添加到数据库
                    int inserted = baseMapper.insert(BeanUtil.toBean(userRegisterReqDTO, UserDO.class));
                    // 如果数据库添加不成功，抛出异常
                    if (inserted < 1) {
                        throw new ClientException(UserErrorCodeEnum.USER_SAVE_ERROR);
                    }
                } catch (DuplicateKeyException ex){
                    throw new ClientException(UserErrorCodeEnum.USER_EXIST);
                }

                // 用户名 添加到布隆过滤器里
                userRegisterCachePenetrationBloomFilter.add(userRegisterReqDTO.getUsername());
                groupService.saveGroup(userRegisterReqDTO.getUsername(),"默认分组");
                return;
            }
            // 获取失败，说明其他线程占用锁，默认之后会添加成功，用户名会存在
            throw new ClientException(UserErrorCodeEnum.USER_NAME_EXIST);
        } finally {
            lock.unlock();
        }

    }

    @Override
    public void updateUser(UserUpdateReqDTO userUpdateReqDTO) {

        // TODO 验证当前用户名是否是登录用户
        LambdaUpdateWrapper<UserDO> updateWrapper = Wrappers.lambdaUpdate(UserDO.class)
                .eq(UserDO::getUsername, userUpdateReqDTO.getUsername());
        baseMapper.update(BeanUtil.toBean(userUpdateReqDTO, UserDO.class), updateWrapper);
    }

    @Override
    public UserLoginRespDTO login(UserLoginReqDTO userLoginReqDTO) {
        LambdaQueryWrapper<UserDO> queryWrapper = Wrappers.lambdaQuery(UserDO.class)
                .eq(UserDO::getUsername, userLoginReqDTO.getUsername())
                .eq(UserDO::getPassword, userLoginReqDTO.getPassword())
                .eq(UserDO::getDelFlag, 0);
        UserDO userDO = baseMapper.selectOne(queryWrapper);
        if (userDO == null) {
            throw new ClientException(UserErrorCodeEnum.USER_NULL);
        }
        // 检查用户是否已经登录，通过检查 Redis 中是否存在以 "login_" + 用户名 为 key 的记录
        Boolean hasLogin = stringRedisTemplate.hasKey("login_" + userLoginReqDTO.getUsername());
        // 如果用户已经登录（hasLogin 不为 null 且为 true），则抛出客户端异常，提示用户已登录
        if(hasLogin != null && hasLogin){
            throw new ClientException(UserErrorCodeEnum.USER_HAS_LOGIN_ED);
        }
        /**
         * Hash
         * Key: login_username
         * Value:{
         *     Key: token
         *     val: JSON 字符串 （用户登录）
         * }
         */

        // 生成一个随机的 UUID 作为 token
        String uuid = UUID.randomUUID().toString();
        // 将用户登录信息以 JSON 格式存储到 Redis 中的 Hash 结构中，并设置过期时间为 8 小时
        stringRedisTemplate.opsForHash()
                .put("login_"+userLoginReqDTO.getUsername(),uuid,JSON.toJSONString(userDO));
        stringRedisTemplate.expire("login_"+userLoginReqDTO.getUsername(),7L, TimeUnit.HOURS);
        // 返回用户登录成功后的响应对象，其中包含生成的 token
        return new UserLoginRespDTO(uuid);
    }

    @Override
    public Boolean loginCheck(String token, String username) {
        return stringRedisTemplate.opsForHash().get("login_"+username,token) != null;
    }

    @Override
    public void logout(String token, String username) {
        if(loginCheck(token,username)){
            stringRedisTemplate.delete("login_"+username);
            return;
        }
        throw new ClientException(UserErrorCodeEnum.USER_HAS_NOT_LOGIN_ED_OR_NOT_TOKEN);
    }


}
