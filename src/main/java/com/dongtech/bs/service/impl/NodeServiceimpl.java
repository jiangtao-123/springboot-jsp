package com.dongtech.bs.service.impl;

import com.dongtech.bs.entity.Node;
import com.dongtech.bs.mapper.NodeMapper;
import com.dongtech.bs.service.NodeService;
import com.dongtech.data.NodeVo;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** @auther: jiangtao @Date: 2020/02/24/14:34 */
@Service
public class NodeServiceimpl implements NodeService {
  @Autowired private NodeMapper nodeMapper;

  @Override
  public Map<String, Node> getNodeInfo() {
    Map<String, Node> map = new HashMap<>();
    List<Node> nodeList = nodeMapper.getNodeList();
    if (null != nodeList) {
      for (Node n : nodeList) {
        map.put(n.getId() + "", n);
      }
    }
    return map;
  }

  @Override
  public Node getByNodeId(String nodeId) {
    return nodeMapper.getByNodeId(nodeId);
  }

  @Override
  public List<NodeVo> getnodeInfo(String id, String nodeId) throws Exception {
    return nodeMapper.getnodeInfo(id, nodeId);
  }
}
