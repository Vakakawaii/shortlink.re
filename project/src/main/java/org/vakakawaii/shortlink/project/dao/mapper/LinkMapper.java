package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;

@Mapper
public interface LinkMapper extends BaseMapper<LinkDO> {

    @Update("update t_link " +
            "set " +
            "total_pv = total_pv + #{pv}, " +
            "total_uv = total_uv + #{uv}, " +
            "total_uip = total_uip + #{uip} " +
            "where full_short_url = #{fullShortUrl} " +
            "and gid = #{gid} ")
    void autoIncrement(
            @Param("fullShortUrl") String fullShortUrl,
            @Param("gid") String gid,
            @Param("pv") int pv,
            @Param("uv") int uv,
            @Param("uip") int uip);
}
