package com.dongtech.bs.entity;

import com.dongtech.data.NodeVo;
import java.util.List;
import lombok.Data;

/** @auther: jiangtao @Date: 2020/03/10/12:57 */
@Data
public class NodeIfo {
  // 用户id
  private String id;
  // 当前节点id
  private String nodeId;
  // 所有节点信息
  private List<NodeVo> nodeVos;
}
