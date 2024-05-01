package org.vakakawaii.shortlink.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.admin.dao.entity.GroupDO;
import org.vakakawaii.shortlink.admin.dao.mapper.GroupMapper;
import org.vakakawaii.shortlink.admin.service.GroupService;

/**
 * 分组接口实现层
 */

@Service
@RequiredArgsConstructor
public class GroupServiceImpl extends ServiceImpl<GroupMapper, GroupDO> implements GroupService {



}
