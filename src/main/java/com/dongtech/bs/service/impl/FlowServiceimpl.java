package com.dongtech.bs.service.impl;

import com.dongtech.bs.entity.GdInfo;
import com.dongtech.bs.entity.NodeIfo;
import com.dongtech.bs.mapper.FlowMapper;
import com.dongtech.bs.service.FlowService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** @auther: jiangtao @Date: 2020/03/02/16:42 */
@Service
public class FlowServiceimpl implements FlowService {
  @Autowired private FlowMapper flowMapper;

  @Override
  public Map<String, Object> addapplication(
      String id, String nodeId, String images, boolean isgo, String type) {
    return flowMapper.addapplication(id, nodeId, images, isgo, type);
  }

  @Override
  public Map<String, Object> submitFlow(String id, String nodeId, boolean option) {
    return flowMapper.submitFlow(id, nodeId, option);
  }

  @Override
  public Map<String, Object> savePartymain(
      String id, String nodeId, String title, String context, String type) {
    return flowMapper.savePartymain(id, nodeId, title, context, type);
  }

  @Override
  public Map<String, Object> submitFlowAndSaveintroducer(
      String id, String nodeId, boolean option, String introducerName) {
    return flowMapper.submitFlowAndSaveintroducer(id, nodeId, option, introducerName);
  }

  @Override
  public Map<String, Object> savebranchId(
      String branchId, String id, String nodeId, boolean option) {
    return flowMapper.savebranchId(branchId, id, nodeId, option);
  }

  @Override
  public GdInfo getgdInfo(String id, String nodeId) {
    return flowMapper.getgdInfo(id, nodeId);
  }

  @Override
  public NodeIfo getnodeInfo(String id, String nodeId) {
    return flowMapper.getnodeInfo(id, nodeId);
  }
}
