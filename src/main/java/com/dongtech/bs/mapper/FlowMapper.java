package com.dongtech.bs.mapper;

import com.dongtech.bs.entity.BsAttachment;
import com.dongtech.bs.entity.GdInfo;
import com.dongtech.bs.entity.NodeIfo;
import com.dongtech.bs.service.BsAttachmentService;
import com.dongtech.bs.service.NodeService;
import com.dongtech.bs.service.PartyServer;
import com.dongtech.data.NodeVo;
import com.dongtech.utils.DB;
import com.dongtech.utils.DateUtil;
import com.dongtech.utils.ImageToBase64;
import com.dongtech.utils.htmlUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/** @auther: jiangtao @Date: 2020/03/02/16:43 */
@Component
public class FlowMapper {
  @Autowired private BsAttachmentService bsAttachmentService;
  @Autowired private PartyServer partyServer;
  @Autowired private NodeService nodeService;

  public Map<String, Object> addapplication(
      String id, String nodeId, String images, boolean isgo, String type) {
    Map<String, Object> map = new HashMap<>();
    map.put("res", true);
    map.put("msg", "操作成功");
    try {
      String[] img = images.split("@");
      // 保存附件到附件表；
      // F:\Myeclipse 10\springboot-jsp-master\file\1202221583137844127.jpg
      // 修改党员流程流转信息；
      if (isgo) {
        partyServer.updateParty(id, nodeId, true);
      }
      // 谈话记录存入入党志愿书；
      //      if ("17".equals(nodeId)) {
      //        nodeId = "15";
      //        type = "2";
      //      }
      if (null != img && images.length() > 0) {
        for (String s : img) {
          BsAttachment bsAttachment = new BsAttachment();

          getBsAttachmentInfo(s, bsAttachment, id, nodeId, type);
          bsAttachmentService.saveFile(bsAttachment);
        }
      }

    } catch (Exception e) {
      map.put("res", true);
      map.put("msg", "操作失败");
    }
    return map;
  }

  private void getBsAttachmentInfo(
      String s, BsAttachment bsAttachment, String id, String nodeId, String type) {
    bsAttachment.setFullUrl(s);
    String[] at = s.split("\\\\");
    bsAttachment.setUploadTime(DateUtil.getCurrentTime());
    bsAttachment.setNodeId(nodeId);
    bsAttachment.setApplicantId(id);
    bsAttachment.setUrl(at[at.length - 1]);
    bsAttachment.setFileName(at[at.length - 1]);
    bsAttachment.setType(type == null ? 1 : Integer.parseInt(type));
  }

  public Map<String, Object> submitFlow(String id, String nodeId, boolean option) {
    Map<String, Object> map = new HashMap<>();
    map.put("res", true);
    map.put("msg", "操作成功");
    try {

      partyServer.updateParty(id, nodeId, option);

    } catch (Exception e) {
      e.printStackTrace();
      map.put("res", false);
      map.put("msg", "操作失败");
    }
    return map;
  }

  public Map<String, Object> savePartymain(
      String id, String nodeId, String title, String context, String type) {
    Map<String, Object> map = new HashMap<>();
    map.put("res", true);
    map.put("msg", "操作成功");
    try {
      // 转化为数据库可以保存的字符串；

      context = htmlUtils.getDbstr(context);
      // context = htmlUtils.getStr();
      // StringEscapeUtils.escapeHtml(context);
      // 谈话记录存入入党志愿书；
      if ("17".equals(nodeId)) {
        nodeId = "15";
        type = "1";
      }
      String sql =
          "insert into publicity(node_id,applicant_id,title,content,creat_time,type) values("
              + nodeId
              + ",'"
              + id
              + "','"
              + title
              + "','"
              + context
              + "','"
              + DateUtil.getCurrentTime()
              + "',"
              + type
              + ")";
      DB.executeUpdate(sql);
      DB.release();
    } catch (Exception e) {
      e.printStackTrace();
      map.put("res", false);
      map.put("msg", "操作失败");
    }
    return map;
  }

  public Map<String, Object> submitFlowAndSaveintroducer(
      String id, String nodeId, boolean option, String introducerName) {
    Map<String, Object> map = new HashMap<>();
    map.put("res", true);
    map.put("msg", "操作成功");
    try {

      partyServer.updateParty(id, nodeId, option);
      partyServer.updateIntroducerName(id, introducerName);

    } catch (Exception e) {
      e.printStackTrace();
      map.put("res", false);
      map.put("msg", "操作失败");
    }
    return map;
  }

  public Map<String, Object> savebranchId(
      String branchId, String id, String nodeId, boolean option) {
    Map<String, Object> map = new HashMap<>();
    map.put("res", true);
    map.put("msg", "操作成功");
    try {
      // 提交流程
      partyServer.updateParty(id, nodeId, option);
      // 修改支部；
      partyServer.updatebranchIdById(branchId, id);

    } catch (Exception e) {
      e.printStackTrace();
      map.put("res", false);
      map.put("msg", "操作失败");
    }
    return map;
  }

  public GdInfo getgdInfo(String id, String nodeId) {
    GdInfo gdInfo = new GdInfo();
    String sql = "";
    try {
      // 查询志愿书
      getzys(sql, id, nodeId, gdInfo);
      // 查询入党申请书；
      getsqs(sql, id, nodeId, gdInfo);
      // 查询政治审查材料；
      getzzsc(sql, id, nodeId, gdInfo);
      // 查询转正申请；
      getzzsq(sql, id, nodeId, gdInfo);
      // 查询培训材料；
      gethg(sql, id, nodeId, gdInfo);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return gdInfo;
  }

  private void gethg(String sql, String id, String nodeId, GdInfo gdInfo) throws Exception {
    sql =
        "select content from publicity where applicant_id='"
            + id
            + "' and node_id='"
            + (Integer.parseInt(nodeId) == 26 ? 12 : nodeId)
            + "' and type=1 limit 1";
    gdInfo.setHgImge(htmlUtils.gethtmlstr((String) DB.getOneField(sql)));
    DB.release();
  }

  private void getzzsq(String sql, String id, String nodeId, GdInfo gdInfo) throws Exception {
    sql =
        "select fullUrl from attachment where applicant_id='"
            + id
            + "' and node_id='"
            + (Integer.parseInt(nodeId) == 26 ? 23 : nodeId)
            + "' and type=1";
    List<BsAttachment> list = DB.Populate(DB.selectBysql(sql), BsAttachment.class);
    DB.release();
    List<String> list1 = new ArrayList<>();
    if (null != list) {
      for (BsAttachment b : list) {
        list1.add(ImageToBase64.ImageToBase64(b.getFullUrl()));
      }
    }
    gdInfo.setZzImge(list1);
  }

  private void getzzsc(String sql, String id, String nodeId, GdInfo gdInfo) throws Exception {

    // 查询审查表；
    sql =
        "select fullUrl from attachment where applicant_id='"
            + id
            + "' and node_id='"
            + (Integer.parseInt(nodeId) == 26 ? 11 : nodeId)
            + "' and type=1";
    List<BsAttachment> list = DB.Populate(DB.selectBysql(sql), BsAttachment.class);
    DB.release();
    List<String> list1 = new ArrayList<>();
    if (null != list) {
      for (BsAttachment b : list) {
        list1.add(ImageToBase64.ImageToBase64(b.getFullUrl()));
      }
    }
    gdInfo.setScbImge(list1);
    // 查询外调函
    sql =
        "select content from publicity where applicant_id='"
            + id
            + "' and node_id='"
            + (Integer.parseInt(nodeId) == 26 ? 11 : nodeId)
            + "' and type=1 limit 1";
    gdInfo.setZswdh(htmlUtils.gethtmlstr((String) DB.getOneField(sql)));
    DB.release();
    // 查询政治审查情况报告；
    sql =
        "select content from publicity where applicant_id='"
            + id
            + "' and node_id='"
            + (Integer.parseInt(nodeId) == 26 ? 11 : nodeId)
            + "' and type=2 limit 1";
    gdInfo.setZzscqk(htmlUtils.gethtmlstr((String) DB.getOneField(sql)));
    DB.release();
  }

  private void getsqs(String sql, String id, String nodeId, GdInfo gdInfo) throws Exception {
    sql =
        sql =
            "select fullUrl from attachment where applicant_id='"
                + id
                + "' and node_id='"
                + (Integer.parseInt(nodeId) == 26 ? 1 : nodeId)
                + "'";
    List<BsAttachment> list = DB.Populate(DB.selectBysql(sql), BsAttachment.class);
    DB.release();
    List<String> list1 = new ArrayList<>();
    if (null != list) {
      for (BsAttachment b : list) {
        list1.add(ImageToBase64.ImageToBase64(b.getFullUrl()));
      }
    }
    gdInfo.setSqsImge(list1);
  }

  private void getzys(String sql, String id, String nodeId, GdInfo gdInfo) throws Exception {
    sql =
        "select fullUrl from attachment where applicant_id='"
            + id
            + "' and node_id='"
            + (Integer.parseInt(nodeId) == 26 ? 15 : nodeId)
            + "'";
    List<BsAttachment> list = DB.Populate(DB.selectBysql(sql), BsAttachment.class);
    DB.release();
    List<String> list1 = new ArrayList<>();
    if (null != list) {
      for (BsAttachment b : list) {
        list1.add(ImageToBase64.ImageToBase64(b.getFullUrl()));
      }
    }
    gdInfo.setZysImge(list1);
    sql =
        "select content from publicity where applicant_id='"
            + id
            + "' and node_id='"
            + (Integer.parseInt(nodeId) == 26 ? 15 : nodeId)
            + "' and type=1 limit 1";
    gdInfo.setRdzyjlb(htmlUtils.gethtmlstr((String) DB.getOneField(sql)));
    DB.release();
  }

  public NodeIfo getnodeInfo(String id, String nodeId) {
    NodeIfo nodeIfo = new NodeIfo();
    nodeIfo.setId(id);
    nodeIfo.setNodeId(nodeId);

    // 查询所有流程节点
    try {
      List<NodeVo> list = nodeService.getnodeInfo(id, nodeId);
      nodeIfo.setNodeVos(list);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return nodeIfo;
  }
}
