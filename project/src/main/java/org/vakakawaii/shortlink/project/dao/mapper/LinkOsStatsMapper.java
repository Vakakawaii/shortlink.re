package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.vakakawaii.shortlink.project.dao.entity.LinkOsStatsDO;
import org.vakakawaii.shortlink.project.dto.req.LinkGroupStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface LinkOsStatsMapper extends BaseMapper<LinkOsStatsDO> {


    @Insert("INSERT INTO t_link_os_stats (" +
            "full_short_url, gid, date, cnt, os, create_time, update_time, del_flag)" +
            " VALUES(#{linkOsStats.fullShortUrl}, #{linkOsStats.gid}, #{linkOsStats.date}, " +
            "#{linkOsStats.cnt}, " +
            "#{linkOsStats.os}, " +
            "NOW(), NOW(), 0) " +
            "ON DUPLICATE KEY " +
            "UPDATE " +
            "cnt = #{linkOsStats.cnt} + cnt")
    void linkOsStats(@Param("linkOsStats") LinkOsStatsDO linkOsStatsDO);

    /**
     * 根据短链接获取指定日期内操作系统监控数据
     */
    @Select("SELECT " +
            "    tlos.os, " +
            "    SUM(tlos.cnt) AS count " +
            "FROM " +
            "    t_link tl INNER JOIN " +
            "    t_link_os_stats tlos ON tl.full_short_url = tlos.full_short_url " +
            "WHERE " +
            "    tlos.full_short_url = #{param.fullShortUrl} " +
            "    AND tl.gid = #{param.gid} " +
            "    AND tl.del_flag = '0' " +
            "    AND tl.enable_status = #{param.enableStatus} " +
            "    AND tlos.date BETWEEN #{param.startDate} and #{param.endDate} " +
            "GROUP BY " +
            "    tlos.full_short_url, tl.gid, tlos.os;")
    List<HashMap<String, Object>> listOsStatsByLink(@Param("param")LinkStatsReqDTO linkStatsReqDTO);

    /**
     * 根据分组获取指定日期内操作系统监控数据
     */
    @Select("SELECT " +
            "    tlos.os, " +
            "    SUM(tlos.cnt) AS count " +
            "FROM " +
            "    t_link tl INNER JOIN " +
            "    t_link_os_stats tlos ON tl.full_short_url = tlos.full_short_url " +
            "WHERE " +
            "    tl.gid = #{param.gid} " +
            "    AND tl.del_flag = '0' " +
            "    AND tl.enable_status = '0' " +
            "    AND tlos.date BETWEEN #{param.startDate} and #{param.endDate} " +
            "GROUP BY " +
            "    tl.gid, tlos.os;")
    List<HashMap<String, Object>> listOsStatsByGroup(@Param("param")LinkGroupStatsReqDTO linkGroupStatsReqDTO);
}
