package com.dongtech.bs.mapper;

import com.dongtech.bs.entity.Node;
import com.dongtech.bs.entity.Recorrd;
import com.dongtech.data.NodeVo;
import com.dongtech.utils.DB;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;

/** @auther: jiangtao @Date: 2020/02/24/14:22 */
@Component
public class NodeMapper {
  public List<Node> getNodeList() {
    String sql =
        "select id ,node_info as nodeInfo,node_describe as nodeDescribe,time  from node_info order by id";
    List<Node> list = null;
    try {
      list = DB.Populate(DB.selectBysql(sql), Node.class);
      DB.release();
    } catch (Exception e) {
      list = null;
      e.printStackTrace();
    }
    return list;
  }

  public Node getByNodeId(String nodeId) {
    String sql = "select * from node_info where id=" + nodeId;
    Node node = null;
    try {
      List<Node> list = DB.Populate(DB.selectBysql(sql), Node.class);
      DB.release();
      if (null != list) {
        node = list.get(0);
      }
      return node;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }

  public List<NodeVo> getnodeInfo(String id, String nodeId) throws Exception {
    List<NodeVo> list1 = new ArrayList<>();
    String sql =
        "select id ,node_info as nodeInfo,node_describe as nodeDescribe,time  from node_info where id!=0 and id!=27 order by id";
    List<Node> list = DB.Populate(DB.selectBysql(sql), Node.class);
    DB.release();
    if (null != list && list.size() > 0) {
      for (Node n : list) {
        NodeVo nodeVo = new NodeVo();
        nodeVo.setNodeId(n.getId() + "");
        nodeVo.setNodeName(n.getNodeInfo());
        // 查询已经审批过的审批意见；
        if (n.getId() <= Integer.parseInt(nodeId)) {
          String s =
              "select  result,time from approval_record where applicant_id='"
                  + id
                  + "' and node_info_id='"
                  + nodeId
                  + "' order by time desc limit 1";
          List<Recorrd> list2 = DB.Populate(DB.selectBysql(s), Recorrd.class);
          if (null != list2 && list2.size() > 0) {
            nodeVo.setOption(("1".equals(list2.get(0).getResult()) ? "审批通过" : "审批不通过"));
            nodeVo.setTime(list2.get(0).getTime());
          }
        }
        list1.add(nodeVo);
      }
    }
    return list1;
  }
}
