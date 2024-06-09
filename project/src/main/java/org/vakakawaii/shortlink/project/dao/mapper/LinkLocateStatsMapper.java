package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.vakakawaii.shortlink.project.dao.entity.LinkLocateStatsDO;

@Mapper
public interface LinkLocateStatsMapper extends BaseMapper<LinkLocateStatsDO> {


    @Insert("INSERT INTO t_link_locate_stats (" +
            "full_short_url, gid, date, cnt, province, city, adcode, country, create_time, update_time, del_flag)" +
            " VALUES(#{linkLocateStats.fullShortUrl}, #{linkLocateStats.gid}, #{linkLocateStats.date}, " +
            "#{linkLocateStats.cnt}, " +
            "#{linkLocateStats.province}, #{linkLocateStats.city},  #{linkLocateStats.adcode}," +
            " #{linkLocateStats.country}, " +
            "NOW(), NOW(), 0) " +
            "ON DUPLICATE KEY " +
            "UPDATE " +
            "cnt = #{linkLocateStats.cnt} + cnt")
    void linkLocateStats(@Param("linkLocateStats") LinkLocateStatsDO linkLocateStatsDO);
}
