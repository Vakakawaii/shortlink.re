package org.vakakawaii.shortlink.admin.dao.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.vakakawaii.shortlink.admin.common.database.BaseDO;


/**
 * 短连接分组实体
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
@TableName("t_group")
public class GroupDO extends BaseDO {

    /**
     * id
     */
    private Long id;

    /**
     * 分组标识
     */
    private String gid;

    /**
     * 分组名称
     */
    private String name;

    /**
     * 创建分组用户名
     */
    private String username;

    /**
     * 排序
     */
    private Integer sortOrder;

}
