package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.vakakawaii.shortlink.project.dao.entity.LinkBrowserStatsDO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface LinkBrowserStatsMapper extends BaseMapper<LinkBrowserStatsDO> {


    @Insert("INSERT INTO t_link_browser_stats (" +
            "full_short_url, gid, date, cnt, browser, create_time, update_time, del_flag)" +
            " VALUES(#{linkBrowserStats.fullShortUrl}, #{linkBrowserStats.gid}, #{linkBrowserStats.date}, " +
            "#{linkBrowserStats.cnt}, " +
            "#{linkBrowserStats.browser}, " +
            "NOW(), NOW(), 0) " +
            "ON DUPLICATE KEY " +
            "UPDATE " +
            "cnt = #{linkBrowserStats.cnt} + cnt")
    void linkBrowserStats(@Param("linkBrowserStats") LinkBrowserStatsDO linkBrowserStatsDo);

    /**
     * 根据短链接获取指定日期内浏览器监控数据
     */
    @Select("SELECT " +
            "    tlbs.browser, " +
            "    SUM(tlbs.cnt) AS count " +
            "FROM " +
            "    t_link tl INNER JOIN " +
            "    t_link_browser_stats tlbs ON tl.full_short_url = tlbs.full_short_url " +
            "WHERE " +
            "    tlbs.full_short_url = #{param.fullShortUrl} " +
            "    AND tl.gid = #{param.gid} " +
            "    AND tl.del_flag = '0' " +
            "    AND tl.enable_status = #{param.enableStatus} " +
            "    AND tlbs.date BETWEEN #{param.startDate} and #{param.endDate} " +
            "GROUP BY " +
            "    tlbs.full_short_url, tl.gid, tlbs.browser;")
    List<HashMap<String, Object>> listBrowserStatsByLink(@Param("param")LinkStatsReqDTO linkStatsReqDTO);
}
