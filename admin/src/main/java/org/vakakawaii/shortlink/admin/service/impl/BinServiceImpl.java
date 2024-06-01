package org.vakakawaii.shortlink.admin.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.admin.common.biz.user.UserContext;
import org.vakakawaii.shortlink.admin.common.convention.exception.ClientException;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.dao.entity.GroupDO;
import org.vakakawaii.shortlink.admin.dao.mapper.GroupMapper;
import org.vakakawaii.shortlink.admin.remote.LinkRemoteService;
import org.vakakawaii.shortlink.admin.remote.dto.req.BinPageReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.BinPageRespDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.admin.service.BinService;

import java.util.List;

/**
 * 分组接口实现层
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BinServiceImpl implements BinService {

    // TODO 后续重构为 Spring cloud Feign 调用

    LinkRemoteService linkRemoteService = new LinkRemoteService() {
    };

    private final GroupMapper groupMapper;

    @Override
    public Result<IPage<BinPageRespDTO>> pageBin(BinPageReqDTO binPageReqDTO) {
        LambdaQueryWrapper<GroupDO> queryWrapper = Wrappers.lambdaQuery(GroupDO.class)
                .eq(GroupDO::getUsername, UserContext.getUsername())
                .eq(GroupDO::getDelFlag, 0);
        List<GroupDO> groupDOList = groupMapper.selectList(queryWrapper);
        if (CollUtil.isEmpty(groupDOList)){
            throw new ClientException("用户无分组信息");
        }
        binPageReqDTO.setGids(groupDOList.stream().map(GroupDO::getGid).toList());
        return linkRemoteService.pageBin(binPageReqDTO);
    }
}





















