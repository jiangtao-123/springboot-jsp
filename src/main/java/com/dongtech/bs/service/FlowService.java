package com.dongtech.bs.service;

import com.dongtech.bs.entity.GdInfo;
import com.dongtech.bs.entity.NodeIfo;
import java.util.Map;

/** @auther: jiangtao @Date: 2020/03/02/16:42 */
public interface FlowService {

  Map<String, Object> addapplication(
      String id, String nodeId, String images, boolean isgo, String type);

  Map<String, Object> submitFlow(String id, String nodeId, boolean option);

  Map<String, Object> savePartymain(
      String id, String nodeId, String title, String context, String type);

  Map<String, Object> submitFlowAndSaveintroducer(
      String id, String nodeId, boolean option, String introducerName);

  Map<String, Object> savebranchId(String branchId, String id, String nodeId, boolean option);

  GdInfo getgdInfo(String id, String nodeId);

  NodeIfo getnodeInfo(String id, String nodeId);
}
