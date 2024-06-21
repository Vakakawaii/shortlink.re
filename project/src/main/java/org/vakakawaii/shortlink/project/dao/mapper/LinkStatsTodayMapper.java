package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.vakakawaii.shortlink.project.dao.entity.LinkStatsTodayDO;

@Mapper
public interface LinkStatsTodayMapper extends BaseMapper<LinkStatsTodayDO> {


    @Insert("INSERT INTO t_link_stats_today (" +
            "full_short_url, gid, date, today_pv, today_uv, today_uip, create_time, update_time, del_flag)" +
            " VALUES(#{linkTodayStats.fullShortUrl}, #{linkTodayStats.gid}, #{linkTodayStats.date}," +
            " #{linkTodayStats.todayPv}, #{linkTodayStats.todayUv}, #{linkTodayStats.todayUip}, " +
            "NOW(), NOW(), 0) " +
            "ON DUPLICATE KEY " +
            "UPDATE " +
            "today_pv = #{linkTodayStats.todayPv} + today_pv, today_uv = #{linkTodayStats.todayUv} + today_uv, today_uip = #{linkTodayStats.todayUip} + today_uip;")
    void linkTodayStats(@Param("linkTodayStats")LinkStatsTodayDO linkStatsTodayDO);
}
