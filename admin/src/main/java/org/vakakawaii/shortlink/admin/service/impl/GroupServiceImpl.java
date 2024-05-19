package org.vakakawaii.shortlink.admin.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.Objects;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.admin.common.biz.user.UserContext;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.dao.entity.GroupDO;
import org.vakakawaii.shortlink.admin.dao.mapper.GroupMapper;
import org.vakakawaii.shortlink.admin.dto.req.GroupSortReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.GroupUpdateReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.GroupInfoRespDTO;
import org.vakakawaii.shortlink.admin.remote.LinkRemoteService;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.admin.service.GroupService;

import java.util.List;
import java.util.Optional;

/**
 * 分组接口实现层
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class GroupServiceImpl extends ServiceImpl<GroupMapper, GroupDO> implements GroupService {

    // TODO 后续重构为 Spring cloud Feign 调用

    LinkRemoteService linkRemoteService = new LinkRemoteService() {
    };

    @Override
    public void saveGroup(String name){
        // 查是否全局唯一
        // 生成全局唯一GID
        String gid;
        do {
            // 生成6位gid
            gid = RandomUtil.randomString(6);
        }while (hasGid(gid));

        GroupDO groupDO = GroupDO.builder()
                .gid(gid)
                .name(name)
                .username(UserContext.getUsername())
                .sortOrder(0)
                .build();
        baseMapper.insert(groupDO);

    }

    @Override
    public List<GroupInfoRespDTO> listGroup() {

        LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getUsername, UserContext.getUsername())
                .eq(GroupDO::getDelFlag, 0)
                .orderByDesc(GroupDO::getSortOrder,GroupDO::getUpdateTime);
        List<GroupDO> groupDOList = baseMapper.selectList(queryWrapper);

        List<GroupInfoRespDTO> groupInfoRespDTOList = BeanUtil
                .copyToList(groupDOList, GroupInfoRespDTO.class);

//        查询每组连接数，返回列表
        Result<List<LinkCountQueryRespDTO>> listResult = linkRemoteService
                .listCountLinkByGroupID(groupDOList.stream().map(GroupDO::getGid).toList());

        groupInfoRespDTOList.forEach(each -> {
            Optional<LinkCountQueryRespDTO> first = listResult.getData().stream()
                    .filter(item -> Objects.equal(item.getGid(),each.getGid()))
                    .findFirst();
            first.ifPresent(item -> each.setLinkCount(first.get().getCount()));
        });

        return groupInfoRespDTOList;
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

    @Override
    public void deleteGroup(String gid) {
        LambdaUpdateWrapper<GroupDO> updateWrapper = Wrappers.lambdaUpdate(GroupDO.class)
                .eq(GroupDO::getGid, gid)
                .eq(GroupDO::getUsername, UserContext.getUsername())
                .eq(GroupDO::getDelFlag, 0);

        GroupDO groupDO = new GroupDO();
        groupDO.setDelFlag(1);
        baseMapper.update(groupDO,updateWrapper);
    }

    @Override
    public void sortGroup(List<GroupSortReqDTO> groupSortReqDTOS) {
        groupSortReqDTOS.forEach(each ->{
            GroupDO groupDO = GroupDO.builder()
                    .sortOrder(each.getSortOrder())
                    .build();
            LambdaUpdateWrapper<GroupDO> updateWrapper = Wrappers.lambdaUpdate(GroupDO.class)
                    .eq(GroupDO::getUsername, UserContext.getUsername())
                    .eq(GroupDO::getGid, each.getGid())
                    .eq(GroupDO::getDelFlag, 0);
            baseMapper.update(groupDO,updateWrapper);
        });
    }

    private boolean hasGid(String gid){
        LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getGid, gid)
                .eq(GroupDO::getUsername, UserContext.getUsername());
        GroupDO hasGroupFlag = baseMapper.selectOne(queryWrapper);
        return hasGroupFlag != null;
    }


}
