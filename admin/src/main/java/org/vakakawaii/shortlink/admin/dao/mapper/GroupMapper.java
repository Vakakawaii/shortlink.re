package org.vakakawaii.shortlink.admin.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.vakakawaii.shortlink.admin.dao.entity.GroupDO;

/**
 * 短连接持久层
 */
@Mapper
public interface GroupMapper extends BaseMapper<GroupDO> {
}
