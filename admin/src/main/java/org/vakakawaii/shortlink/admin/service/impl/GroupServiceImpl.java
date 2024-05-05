package org.vakakawaii.shortlink.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.admin.common.biz.user.UserContext;
import org.vakakawaii.shortlink.admin.dao.entity.GroupDO;
import org.vakakawaii.shortlink.admin.dao.mapper.GroupMapper;
import org.vakakawaii.shortlink.admin.dto.req.GroupUpdateReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.GroupInfoRespDTO;
import org.vakakawaii.shortlink.admin.service.GroupService;

import java.util.List;

/**
 * 分组接口实现层
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class GroupServiceImpl extends ServiceImpl<GroupMapper, GroupDO> implements GroupService {

    @Override
    public void saveGroup(String name){
        // 查是否全局唯一
        // 生成全局唯一GID
        String gid;
        do {
            // 生成6位gid
            gid = RandomUtil.randomString(6);
        }while (hasGid(gid));

        GroupDO groupDO = GroupDO.builder().gid(gid).name(name).sortOrder(0).build();
        baseMapper.insert(groupDO);

    }

    @Override
    public List<GroupInfoRespDTO> listGroup() {

        LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getUsername, UserContext.getUsername())
                .orderByDesc(GroupDO::getUpdateTime);

        List<GroupDO> groupDOList = baseMapper.selectList(queryWrapper);
        return BeanUtil.copyToList(groupDOList, GroupInfoRespDTO.class);
    }

    @Override
    public void updateGroup(GroupUpdateReqDTO groupUpdateReqDTO) {
        LambdaUpdateWrapper<GroupDO> updateWrapper = Wrappers.lambdaUpdate(GroupDO.class)
                .eq(GroupDO::getGid, groupUpdateReqDTO.getGid())
                .eq(GroupDO::getUsername, UserContext.getUsername())
                .eq(GroupDO::getDelFlag, 0);

        GroupDO groupDO = new GroupDO();
        groupDO.setName(groupUpdateReqDTO.getName());
        baseMapper.update(groupDO,updateWrapper);
    }

    private boolean hasGid(String gid){
        LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getGid, gid)
                .eq(GroupDO::getUsername, UserContext.getUsername());
        GroupDO hasGroupFlag = baseMapper.selectOne(queryWrapper);
        return hasGroupFlag != null;
    }


}
