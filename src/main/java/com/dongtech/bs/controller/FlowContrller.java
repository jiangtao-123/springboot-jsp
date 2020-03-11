package com.dongtech.bs.controller;

import com.dongtech.bs.entity.GdInfo;
import com.dongtech.bs.entity.NodeIfo;
import com.dongtech.bs.service.BranchService;
import com.dongtech.bs.service.BsAttachmentService;
import com.dongtech.bs.service.FlowService;
import com.dongtech.bs.service.TemplateService;
import com.dongtech.syslog.SystemControllerLog;
import com.dongtech.utils.exeUtil;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** @auther: jiangtao @Date: 2020/02/21/14:24 */
@Controller
@Slf4j
@RequestMapping("flow")
public class FlowContrller {
  @Autowired private FlowService flowService;
  @Autowired private BsAttachmentService bsAttachmentService;
  @Autowired private TemplateService templateService;
  @Autowired private BranchService branchService;

  @RequestMapping("/toTrack")
  @SystemControllerLog(description = "跳转流程跟踪页面")
  public String toTrack() {
    return "flow/track";
  }

  @RequestMapping("tohandleFlowPage")
  @SystemControllerLog(description = "跳转对应流程节点处理界面")
  public String tohandleFlowPage(HttpServletRequest request, String id, String nodeId) {
    request.setAttribute("id", id);
    request.setAttribute("nodeId", nodeId);
    exeUtil.openExe(); // 打开扫描仪程序；
    return casePage(request, id, nodeId);
  }

  private String casePage(HttpServletRequest request, String id, String nodeId) {
    String url = "";
    switch (nodeId) {
      case "0":
        url = "redirect:/party/toAddParty";
        break;
      case "1":
        // 跳转提交入党申请书处理
        url = "flow/application";
        break;
      case "2":
        // 入党申请书审批
        request.setAttribute(
            "images",
            bsAttachmentService.selectbsAttachmentListBynodeId(
                id, (Integer.parseInt(nodeId) - 1), "1"));
        url = "/flow/approval";
        break;
      case "3":
        // 党组织派人谈话
        url = "/flow/organizationsTalk";
        break;
      case "4":
        // 推荐和确定入党积极分子
        url = "/flow/membership";
        break;
      case "5":
        // 报上级党委备案
        url = "/flow/record";
        break;
      case "6":
        // 指定培养联系人
        url = "/flow/designated";
        break;
      case "7":
        // 培养教育考察
        url = "/flow/training";
        break;
      case "8":
        // 确定发展对象
        url = "/flow/development";
        break;
      case "9":
        // 报上级党委备案
        url = "/flow/superiorReport";
        break;
      case "10":
        // 确定入党介绍人
        url = "/flow/introducer";
        break;
      case "11":
        // 进行政治审查
        url = "/flow/political";
        break;
      case "12":
        // 开展集中培训
        url = "/flow/centralized";
        break;
      case "13":
        // 支委会审查预备党员的接收
        url = "/flow/acceptance";
        break;
      case "14":
        // 报具有审批权限的基层党委预审
        url = "/flow/preliminary";
        break;
      case "15":
        // 填写入党志愿书
        url = "/flow/volunteer";
        break;
      case "16":
        // 党支部大会对发展对象能否入党进行充分讨论
        url = "/flow/discussion";
        break;
      case "17":
        // 党委指派专人进行谈话
        url = "/flow/generalreview";
        break;
      case "18":
        // 党委审批
        url = "/flow/partytalk";
        break;
      case "19":
        // 再上一级单位组织部门备案
        url = "/flow/partyexamination";
        break;
      case "20":
        // 编入党支部和党小组
        request.setAttribute("branch", branchService.getbranchList()); // 获取支部列表数据；
        request.setAttribute("branchId", branchService.selectBypartyId(id));
        url = "/flow/group";
        break;
      case "21":
        // 入党宣誓
        url = "/flow/oath";
        break;
      case "22":
        // 继续教育考察
        url = "/flow/investigation";
        break;
      case "23":
        // 提出转正申请
        url = "/flow/applyconfirmation";
        break;
      case "24":
        // 支部大会讨论
        url = "/flow/meetingdiscussion";
        break;
      case "25":
        // 报上级党委审批
        url = "/flow/committeeapproval";
        break;
      case "26":
        // 材料归档
        url = "/flow/material";
        break;
      default:
        break;
    }
    return url;
  }

  @RequestMapping("addapplication")
  @SystemControllerLog(description = "处理上传扫描件")
  @ResponseBody
  public Map<String, Object> addapplication(
      String id, String nodeId, String images, boolean isgo, String type) {
    return flowService.addapplication(id, nodeId, images, isgo, type);
  }

  @ResponseBody
  @RequestMapping("submitFlow")
  @SystemControllerLog(description = "处理流程审批")
  public Map<String, Object> submitFlow(String id, String nodeId, boolean option) {
    return flowService.submitFlow(id, nodeId, option);
  }

  @ResponseBody
  @RequestMapping("submitFlowAndSaveintroducer")
  @SystemControllerLog(description = "保存入党介绍人")
  public Map<String, Object> submitFlowAndSaveintroducer(
      String id, String nodeId, boolean option, String introducerName) {
    return flowService.submitFlowAndSaveintroducer(id, nodeId, option, introducerName);
  }

  @RequestMapping("savePartymain")
  @ResponseBody
  @SystemControllerLog(description = "保存打印文件")
  public Map<String, Object> savePartymain(
      String id, String nodeId, String title, String context, String type) {
    return flowService.savePartymain(id, nodeId, title, context, type);
  }

  @ResponseBody
  @RequestMapping("savebranchId")
  @SystemControllerLog(description = "选择分配支部")
  public Map<String, Object> savebranchId(
      String branchId, String id, String nodeId, boolean option) {
    return flowService.savebranchId(branchId, id, nodeId, option);
  }

  @RequestMapping("getTemplate")
  @ResponseBody
  @SystemControllerLog(description = "获取模板")
  public Map<String, Object> getTemplate(String nodeId, String type) {
    return templateService.getTemplateBynodeId(nodeId, type);
  }

  @ResponseBody
  @RequestMapping("getgdInfo")
  @SystemControllerLog(description = "获取归档材料")
  public Map<String, Object> getgdInfo(String id, String nodeId) {
    Map<String, Object> map = new HashMap<>();
    GdInfo gdInfo = flowService.getgdInfo(id, nodeId);
    map.put("rdzyjlb", gdInfo.getRdzyjlb());
    map.put("zysImge", gdInfo.getZysImge());
    map.put("sqsImge", gdInfo.getSqsImge());
    map.put("zswdh", gdInfo.getZswdh());
    map.put("zzscqk", gdInfo.getZzscqk());
    map.put("scbImge", gdInfo.getScbImge());
    map.put("zzImge", gdInfo.getZzImge());
    map.put("hgImge", gdInfo.getHgImge());
    return map;
  }

  @RequestMapping("getnodeInfo")
  @ResponseBody
  @SystemControllerLog(description = "获取流程跟踪信息")
  public NodeIfo getnodeInfo(String id, String nodeId) {
    return flowService.getnodeInfo(id, nodeId);
  }
}
