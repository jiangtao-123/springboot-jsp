package com.dongtech.bs.controller;

import com.dongtech.bs.entity.BranchTree;
import com.dongtech.bs.service.BranchService;
import com.dongtech.bs.service.PartyServer;
import com.dongtech.bs.service.StageService;
import com.dongtech.data.MyChartsData;
import com.dongtech.syslog.SystemControllerLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** @auther: jiangtao @Date: 2020/02/19/14:10 */
@Controller
@Slf4j
@RequestMapping("main")
public class ConsoleContrller {
  @Autowired private PartyServer partyServer;
  @Autowired private BranchService branchService;
  @Autowired private StageService stageService; // 获取所在阶段；

  @RequestMapping("/toConsole")
  @SystemControllerLog(description = "跳转主页面")
  public String toConsole(HttpServletRequest request) {
    // 查询发展党员数；
    request.setAttribute("evelopmentCount", partyServer.selectPartyByNodeid(25, false));
    // 查询已经归档的党员；
    request.setAttribute("fileCount", partyServer.selectPartyByNodeid(25, true));

    // 查询党支部数量；
    request.setAttribute("branchList", branchService.getbranchList().size());

    return "main/console";
  }

  @RequestMapping("evelopment")
  @SystemControllerLog(description = "跳转发展党员页面")
  public String evelopment(HttpServletRequest request) {
    request.setAttribute("stageList", stageService.getList()); // 获取当前阶段列表；
    return "main/evelopmentList";
  }

  @RequestMapping("partyToal")
  @SystemControllerLog(description = "跳转累积发展党员页面")
  public String partyToal(HttpServletRequest request) {
    request.setAttribute("stageList", stageService.getList()); // 获取当前阶段列表；
    return "main/partyToalList";
  }

  @RequestMapping("file")
  @SystemControllerLog(description = "跳转已经归档党员页面")
  public String file(HttpServletRequest request) {
    request.setAttribute("stageList", stageService.getList()); // 获取当前阶段列表；
    return "main/fileList";
  }

  @RequestMapping("tobranch")
  @SystemControllerLog(description = "跳转党支部页面")
  public String tobranch() {
    return "main/branchList";
  }

  @RequestMapping("treeload")
  @SystemControllerLog(description = "获取支部树数据")
  @ResponseBody
  public List<BranchTree> treeload() {
    List<BranchTree> dpet = branchService.getbranchTreeList(); // 查找所有菜单
    BranchTree branchTree = new BranchTree();
    branchTree.setId(0);
    branchTree.setTitle("党组织");
    branchTree.setChildren(dpet);
    // String str = JSON.toJSONString(dpet);
    List<BranchTree> branchTreeList = new ArrayList<>();
    branchTreeList.add(branchTree);
    return branchTreeList;
    // fun(dpet, result);
  }

  @RequestMapping("getData")
  @SystemControllerLog(description = "获取首页图表数据")
  @ResponseBody
  public Map<String, Object> getData() {
    Map<String, Object> map = new HashMap<>();
    // Integer[] myCharts3Data = new Integer[] {15, 14, 13, 13, 13, 14, 15};
    MyChartsData myChartsData = partyServer.getmyChartsData(false);
    map.put("myCharts3Data", myChartsData.getMyCharts3Data());
    map.put("myCharts3Year", myChartsData.getMyCharts3Year());
    map.put("myCharts2Data", myChartsData.getMyCharts2Data());
    map.put("myCharts2Stage", myChartsData.getMyCharts2Stage());
    map.put("myCharts1Age", myChartsData.getMyCharts1Age());
    map.put("myCharts1Area", myChartsData.getMyCharts1Area());

    return map;
  }

  @RequestMapping("addNode")
  @SystemControllerLog(description = "跳转添加支部节点页面")
  public String addNode() {
    return "main/addNode";
  }

  @RequestMapping("saveNode")
  @SystemControllerLog(description = "保存节点")
  @ResponseBody
  public Map<String, Object> saveNode(String ndName, String pid) {
    return branchService.saveNode(ndName, pid);
  }

  @ResponseBody
  @RequestMapping("editNode")
  @SystemControllerLog(description = "修改节点")
  public Map<String, Object> editNode(String id, String ndName) {
    return branchService.editNode(id, ndName);
  }

  @RequestMapping("delNode")
  @ResponseBody
  @SystemControllerLog(description = "删除节点")
  public Map<String, Object> delNode(String id) {
    return branchService.delNode(id);
  }
}
