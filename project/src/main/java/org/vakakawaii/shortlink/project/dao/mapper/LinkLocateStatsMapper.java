package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.vakakawaii.shortlink.project.dao.entity.LinkLocateStatsDO;
import org.vakakawaii.shortlink.project.dto.req.LinkGroupStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;

import java.util.List;

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

    /**
     * 根据短链接获取指定日期内地区监控数据
     */
    @Select("SELECT " +
            "    tlls.province, " +
            "    SUM(tlls.cnt) AS cnt " +
            "FROM " +
            "    t_link tl INNER JOIN " +
            "    t_link_locate_stats tlls ON tl.full_short_url = tlls.full_short_url " +
            "WHERE " +
            "    tlls.full_short_url = #{param.fullShortUrl} " +
            "    AND tl.gid = #{param.gid} " +
            "    AND tl.del_flag = '0' " +
            "    AND tl.enable_status = #{param.enableStatus} " +
            "    AND tlls.date BETWEEN #{param.startDate} and #{param.endDate} " +
            "GROUP BY " +
            "    tlls.full_short_url, tl.gid, tlls.province;")
    List<LinkLocateStatsDO> listLocateByLink(@Param("param")LinkStatsReqDTO linkStatsReqDTO);

    /**
     * 根据分组获取指定日期内地区监控数据
     */
    @Select("SELECT " +
            "    tlls.province, " +
            "    SUM(tlls.cnt) AS cnt " +
            "FROM " +
            "    t_link tl INNER JOIN " +
            "    t_link_locate_stats tlls ON tl.full_short_url = tlls.full_short_url " +
            "WHERE " +
            "    tl.gid = #{param.gid} " +
            "    AND tl.del_flag = '0' " +
            "    AND tl.enable_status = '0' " +
            "    AND tlls.date BETWEEN #{param.startDate} and #{param.endDate} " +
            "GROUP BY " +
            "    tl.gid, tlls.province;")
    List<LinkLocateStatsDO> listLocateByGroup(@Param("param")LinkGroupStatsReqDTO linkGroupStatsReqDTO);
}
