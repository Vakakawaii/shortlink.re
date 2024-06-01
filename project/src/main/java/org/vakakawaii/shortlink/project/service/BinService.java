package org.vakakawaii.shortlink.project.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dto.req.BinDeleteReqDTO;
import org.vakakawaii.shortlink.project.dto.req.BinPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.BinRecoverReqDTO;
import org.vakakawaii.shortlink.project.dto.req.BinSaveReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.BinPageRespDTO;

public interface BinService extends IService<LinkDO> {


    void saveBin(BinSaveReqDTO binSaveReqDTO);

    public IPage<BinPageRespDTO> pageBin(BinPageReqDTO binPageReqDTO);

    void recoverBin(BinRecoverReqDTO binRecoverReqDTO);

    void delBin(BinDeleteReqDTO binDeleteReqDTO);
}
