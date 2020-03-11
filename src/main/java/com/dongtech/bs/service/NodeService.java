package com.dongtech.bs.service;

import com.dongtech.bs.entity.Node;
import com.dongtech.data.NodeVo;
import java.util.List;
import java.util.Map;

/** @auther: jiangtao @Date: 2020/02/24/14:29 */
public interface NodeService {
  Map<String, Node> getNodeInfo();

  Node getByNodeId(String nodeId);

  List<NodeVo> getnodeInfo(String id, String nodeId) throws Exception;
}
