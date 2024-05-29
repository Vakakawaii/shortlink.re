package org.vakakawaii.shortlink.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dto.req.BinSaveReqDTO;

public interface BinService extends IService<LinkDO> {


    void saveBin(BinSaveReqDTO binSaveReqDTO);
}
