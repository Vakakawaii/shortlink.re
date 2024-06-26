package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.vakakawaii.shortlink.project.dao.entity.LinkDeviceStatsDO;
import org.vakakawaii.shortlink.project.dto.req.LinkGroupStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;

import java.util.List;

@Mapper
public interface LinkDeviceStatsMapper extends BaseMapper<LinkDeviceStatsDO> {


    @Insert("INSERT INTO t_link_device_stats (" +
            "full_short_url, gid, date, cnt, device, create_time, update_time, del_flag)" +
            " VALUES(#{linkDeviceStats.fullShortUrl}, #{linkDeviceStats.gid}, #{linkDeviceStats.date}, " +
            "#{linkDeviceStats.cnt}, " +
            "#{linkDeviceStats.device}, " +
            "NOW(), NOW(), 0) " +
            "ON DUPLICATE KEY " +
            "UPDATE " +
            "cnt = #{linkDeviceStats.cnt} + cnt")
    void linkDeviceStats(@Param("linkDeviceStats") LinkDeviceStatsDO linkDeviceStatsDO);

    /**
     * 根据短链接获取指定日期内访问设备监控数据
     */
    @Select("SELECT " +
            "    tlds.device, " +
            "    SUM(tlds.cnt) AS cnt " +
            "FROM " +
            "    t_link tl INNER JOIN " +
            "    t_link_device_stats tlds ON tl.full_short_url = tlds.full_short_url " +
            "WHERE " +
            "    tlds.full_short_url = #{param.fullShortUrl} " +
            "    AND tl.gid = #{param.gid} " +
            "    AND tl.del_flag = '0' " +
            "    AND tl.enable_status = #{param.enableStatus} " +
            "    AND tlds.date BETWEEN #{param.startDate} and #{param.endDate} " +
            "GROUP BY " +
            "    tlds.full_short_url, tl.gid, tlds.device;")
    List<LinkDeviceStatsDO> listDeviceStatsByLink(@Param("param")LinkStatsReqDTO linkStatsReqDTO);


    /**
     * 根据分组获取指定日期内访问设备监控数据
     */
    @Select("SELECT " +
            "    tlds.device, " +
            "    SUM(tlds.cnt) AS cnt " +
            "FROM " +
            "    t_link tl INNER JOIN " +
            "    t_link_device_stats tlds ON tl.full_short_url = tlds.full_short_url " +
            "WHERE " +
            "    tl.gid = #{param.gid} " +
            "    AND tl.del_flag = '0' " +
            "    AND tl.enable_status = '0' " +
            "    AND tlds.date BETWEEN #{param.startDate} and #{param.endDate} " +
            "GROUP BY " +
            "    tl.gid, tlds.device;")
    List<LinkDeviceStatsDO> listDeviceStatsByGroup(@Param("param")LinkGroupStatsReqDTO linkGroupStatsReqDTO);
}
