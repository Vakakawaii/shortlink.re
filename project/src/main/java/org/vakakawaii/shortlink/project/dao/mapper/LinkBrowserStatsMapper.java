package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.vakakawaii.shortlink.project.dao.entity.LinkBrowserStatsDo;

@Mapper
public interface LinkBrowserStatsMapper extends BaseMapper<LinkBrowserStatsDo> {


    @Insert("INSERT INTO t_link_browser_stats (" +
            "full_short_url, gid, date, cnt, browser, create_time, update_time, del_flag)" +
            " VALUES(#{linkBrowserStats.fullShortUrl}, #{linkBrowserStats.gid}, #{linkBrowserStats.date}, " +
            "#{linkBrowserStats.cnt}, " +
            "#{linkBrowserStats.browser}, " +
            "NOW(), NOW(), 0) " +
            "ON DUPLICATE KEY " +
            "UPDATE " +
            "cnt = #{linkBrowserStats.cnt} + cnt")
    void linkBrowserStats(@Param("linkBrowserStats") LinkBrowserStatsDo linkBrowserStatsDo);
}
