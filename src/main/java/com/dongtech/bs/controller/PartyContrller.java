package com.dongtech.bs.controller;

import com.dongtech.bs.entity.Party;
import com.dongtech.bs.service.BranchService;
import com.dongtech.bs.service.NationService;
import com.dongtech.bs.service.NodeService;
import com.dongtech.bs.service.PartyServer;
import com.dongtech.bs.service.StageService;
import com.dongtech.data.PartyData;
import com.dongtech.syslog.SystemControllerLog;
import com.dongtech.utils.IdService;
import com.dongtech.utils.R;
import com.dongtech.utils.exeUtil;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** @auther: jiangtao @Date: 2020/02/19/17:47 */
@Controller
@Slf4j
@RequestMapping("party")
public class PartyContrller {
  @Autowired private NodeService nodeService;
  @Autowired private IdService idService;
  @Autowired private StageService stageService; // 获取所在阶段；
  @Autowired private BranchService branchService; // 获取党组织机构；
  @Autowired private NationService nationService; // 获取民族列表；
  @Autowired private PartyServer partyServer; // 党员信息操作；

  @RequestMapping("/topartyMain")
  @SystemControllerLog(description = "跳转党员管理页面")
  public String topartMain(HttpServletRequest request) {
    request.setAttribute("stageList", stageService.getList()); // 获取当前阶段列表；
    return "party/partymain";
  }

  @RequestMapping("toAddParty")
  @SystemControllerLog(description = "跳转添加党员信息页面")
  public String toAddParty(HttpServletRequest request) {
    try {
      //  request.setAttribute("nodeInfo", nodeService.getNodeInfo());
      request.setAttribute("dataId", idService.getNextId()); // 获取插入主键；
      request.setAttribute("stage", stageService.getByNodeId("0")); // 获取当前阶段；
      request.setAttribute("branch", branchService.getbranchList()); // 获取支部列表数据；
      request.setAttribute("nation", nationService.getNationList()); // 获取民族信息；
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "party/addParty";
  }

  @RequestMapping("addParty")
  @SystemControllerLog(description = "添加党员信息")
  @ResponseBody
  public R addParty(Party party) {
    Map<String, Object> map = new HashMap<>();
    map = partyServer.addParty(party);
    return R.ok().put("data", map);
  }

  @RequestMapping("editParty")
  @ResponseBody
  @SystemControllerLog(description = "修改党员数据")
  public R editParty(Party party) {
    Map<String, Object> map = new HashMap<>();
    map = partyServer.editParty(party);
    return R.ok().put("data", map);
  }

  @RequestMapping("getPartyList")
  @ResponseBody
  @SystemControllerLog(description = "获取党员列表")
  public PartyData getPartyList(
      HttpServletRequest request,
      String page,
      String limit,
      String name,
      String stageId,
      String type) {
    PartyData partyData = new PartyData();
    partyServer.getPartyList(partyData, page, limit, name, stageId, type);
    return partyData;
  }

  @RequestMapping("toSeeParty")
  @SystemControllerLog(description = "查看党员")
  public String toSeeParty(HttpServletRequest request) {
    // request.setAttribute("dataId", idService.getNextId()); // 获取插入主键；
    request.setAttribute("nodeInfo", nodeService.getNodeInfo());
    request.setAttribute("stageList", stageService.getByNodeList()); // 获取当前阶段；
    request.setAttribute("branch", branchService.getbranchList()); // 获取支部列表数据；
    request.setAttribute("nation", nationService.getNationList()); // 获取民族信息；
    return "party/see";
  }

  @RequestMapping("getPartyById")
  @ResponseBody
  @SystemControllerLog(description = "获取党员信息")
  public Party getPartyById(String id) {
    Party party = partyServer.getPartyById(id);
    return party;
  }

  @RequestMapping("deleteById")
  @SystemControllerLog(description = "删除党员数据")
  @ResponseBody
  public boolean deleteById(String id) {

    boolean re = partyServer.deleteById(id);
    return re;
  }

  @RequestMapping("toEditParty")
  @SystemControllerLog(description = "跳转编辑党员信息页面")
  public String toEditParty(HttpServletRequest request) {
    //    request.setAttribute("dataId", idService.getNextId()); // 获取插入主键；
    request.setAttribute("nodeInfo", nodeService.getNodeInfo());
    request.setAttribute("stageList", stageService.getByNodeList()); // 获取当前阶段；
    request.setAttribute("branch", branchService.getbranchList()); // 获取支部列表数据；
    request.setAttribute("nation", nationService.getNationList()); // 获取民族信息；
    return "party/edit";
  }

  @RequestMapping("deletePhoto")
  @SystemControllerLog(description = "删除头像")
  @ResponseBody
  public boolean deletePhoto(String id) {
    return partyServer.deletePhoto(id);
  }

  @RequestMapping("closeExe")
  @SystemControllerLog(description = "关闭扫描仪进程")
  @ResponseBody
  public boolean closeExe() {
    try {
      exeUtil.closeExe();
      return true;
    } catch (Exception e) {
      return false;
    }
  }

  @RequestMapping("deleteVideo")
  @ResponseBody
  @SystemControllerLog(description = "删除文件")
  public boolean deleteVideo(String id, String nodeId, String type) {
    return partyServer.deleteVideo(id, nodeId, type);
  }
}
