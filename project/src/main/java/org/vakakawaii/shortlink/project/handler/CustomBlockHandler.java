package org.vakakawaii.shortlink.project.handler;

import com.alibaba.csp.sentinel.slots.block.BlockException;
import org.vakakawaii.shortlink.project.common.convention.result.Result;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;

/**
 * 自定义流控策略
 */
public class CustomBlockHandler {

    public static Result<LinkCreateRespDTO> createShortLinkBlockHandlerMethod(LinkCreateReqDTO requestParam, BlockException exception) {
        return new Result<LinkCreateRespDTO>().setCode("B100000").setMessage("当前访问网站人数过多，请稍后再试...");
    }
}
