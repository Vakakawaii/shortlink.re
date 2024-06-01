package org.vakakawaii.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dao.mapper.LinkMapper;
import org.vakakawaii.shortlink.project.dto.req.BinPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.BinSaveReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;
import org.vakakawaii.shortlink.project.service.BinService;

import java.util.concurrent.TimeUnit;

import static org.vakakawaii.shortlink.project.common.constant.RedisKeyConstant.GOTO_SHORT_LINK_KEY;

@Service
@RequiredArgsConstructor
public class BinServiceImpl extends ServiceImpl<LinkMapper, LinkDO> implements BinService {

    private final StringRedisTemplate stringRedisTemplate;

    @Override
    public void saveBin(BinSaveReqDTO binSaveReqDTO) {
        LambdaUpdateWrapper<LinkDO> updateWrapper = Wrappers.lambdaUpdate(LinkDO.class)
                .eq(LinkDO::getGid, binSaveReqDTO.getGid())
                .eq(LinkDO::getFullShortUrl, binSaveReqDTO.getFullShortUrl())
                .eq(LinkDO::getEnableStatus, 0)
                .eq(LinkDO::getDelFlag, 0);

        LinkDO linkDO = LinkDO.builder()
                .enableStatus(1)
                .build();

        baseMapper.update(linkDO,updateWrapper);

        // 删除缓存
        stringRedisTemplate.delete(String.format(GOTO_SHORT_LINK_KEY,binSaveReqDTO.getFullShortUrl()));
    }

    @Override
    public IPage<LinkPageRespDTO> pageBin(BinPageReqDTO binPageReqDTO) {
        LambdaQueryWrapper<LinkDO> queryWrapper = Wrappers.lambdaQuery(LinkDO.class)
                .in(LinkDO::getGid, binPageReqDTO.getGids())
                .eq(LinkDO::getEnableStatus, 1)
                .eq(LinkDO::getDelFlag, 0)
                .orderByDesc(LinkDO::getUpdateTime);
        IPage<LinkDO> page = baseMapper.selectPage(binPageReqDTO, queryWrapper);
        return page.convert(each -> BeanUtil.toBean(each, LinkPageRespDTO.class));
    }

}
