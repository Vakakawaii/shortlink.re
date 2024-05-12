package org.vakakawaii.shortlink.project.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;

@Mapper
public interface LinkMapper extends BaseMapper<LinkDO> {}
