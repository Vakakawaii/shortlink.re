package org.vakakawaii.shortlink.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RBloomFilter;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.admin.common.constant.RedisCacheConstant;
import org.vakakawaii.shortlink.admin.common.convention.exception.ClientException;
import org.vakakawaii.shortlink.admin.common.enums.UserErrorCodeEnum;
import org.vakakawaii.shortlink.admin.dao.entity.UserDO;
import org.vakakawaii.shortlink.admin.dao.mapper.UserMapper;
import org.vakakawaii.shortlink.admin.dto.req.UserRegisterReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.UserInfoRespDTO;
import org.vakakawaii.shortlink.admin.service.UserService;

/**
 * 用户接口实现层
 */

@Service
@RequiredArgsConstructor
public class UserServiceImpl extends ServiceImpl<UserMapper, UserDO> implements UserService {

    private final RBloomFilter<String> userRegisterCachePenetrationBloomFilter;
    private final RedissonClient redissonClient;

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
            if (lock.tryLock()){
                // 注册信息添加到数据库
                int inserted = baseMapper.insert(BeanUtil.toBean(userRegisterReqDTO, UserDO.class));
                // 如果数据库添加不成功，抛出异常
                if (inserted < 1){
                    throw new ClientException(UserErrorCodeEnum.USER_SAVE_ERROR);
                }
                // 用户名 添加到布隆过滤器里
                userRegisterCachePenetrationBloomFilter.add(userRegisterReqDTO.getUsername());
                return;
            }
            // 获取失败，说明其他线程占用锁，默认之后会添加成功，用户名会存在
            throw new ClientException(UserErrorCodeEnum.USER_NAME_EXIST);
        } finally {
            lock.unlock();
        }


    }


}
