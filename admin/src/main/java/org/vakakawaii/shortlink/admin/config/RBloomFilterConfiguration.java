package org.vakakawaii.shortlink.admin.config;

import org.redisson.api.RBloomFilter;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 布隆过滤器配置
 */
@Configuration
public class RBloomFilterConfiguration {

    /**
     * 防止用户注册查询数据库的布隆过滤器
     */
    @Bean
    public RBloomFilter<String> userRegisterCachePenetrationBloomFilter(RedissonClient redissonClient) {
        RBloomFilter<String> cachePenetrationBloomFilter = redissonClient.getBloomFilter(
                "userRegisterCachePenetrationBloomFilter");
//        设置用户数和容错率
//        在线估算网址
//        https://krisives.github.io/bloom-calculator/
        cachePenetrationBloomFilter.tryInit(10000000L, 0.001);
        return cachePenetrationBloomFilter;
    }
}