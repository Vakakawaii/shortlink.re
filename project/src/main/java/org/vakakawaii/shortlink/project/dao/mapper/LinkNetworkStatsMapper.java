package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.vakakawaii.shortlink.project.dao.entity.LinkNetworkStatsDO;

@Mapper
public interface LinkNetworkStatsMapper extends BaseMapper<LinkNetworkStatsDO> {


    @Insert("INSERT INTO t_link_network_stats (" +
            "full_short_url, gid, date, cnt, network, create_time, update_time, del_flag)" +
            " VALUES(#{linkNetworkStats.fullShortUrl}, #{linkNetworkStats.gid}, #{linkNetworkStats.date}, " +
            "#{linkNetworkStats.cnt}, " +
            "#{linkNetworkStats.network}, " +
            "NOW(), NOW(), 0) " +
            "ON DUPLICATE KEY " +
            "UPDATE " +
            "cnt = #{linkNetworkStats.cnt} + cnt")
    void linkNetworkStats(@Param("linkNetworkStats") LinkNetworkStatsDO linkNetworkStatsDO);
}
