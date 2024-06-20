package org.vakakawaii.shortlink.project.dao.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.vakakawaii.shortlink.project.common.database.BaseDO;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName("t_link")
public class LinkDO extends BaseDO {

    /**
     * id
     */
    private Long id;

    /**
     * 分组标识
     */
    private String gid;

    /**
     * 域名
     */
    private String domain;

    /**
     * 短链接
     */
    private String shortUri;

    /**
     * 完整短链接
     */
    private String fullShortUrl;

    /**
     * 原始链接
     */
    private String originUrl;

    /**
     * 点击量
     */
    private Integer clickNum;

    /**
     * 启用标识 0:启用 1:未启用
     */
    private Integer enableStatus;

    /**
     * 创建类型 0:接口创建 1:控制台创建
     */
    private Integer createdType;

    /**
     * 有效期类型 0:永久有效 1:自定义
     */
    private Integer validDateType;

    /**
     * 有效期
     */
    private Date validDate;

    /**
     * 描述
     */
    @TableField("`describe`")
    private String describe;

    /**
     *  图标
     */
     private String favicon;

    /**
     * 历史uv
     */
    private Integer totalUv;

    /**
     * 历史pv
     */
    private Integer totalPv;

    /**
     * 历史uip
     */
    private Integer totalUip;

}
