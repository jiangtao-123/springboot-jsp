package com.dongtech.bs.controller;

import com.dongtech.bs.service.BranchService;
import com.dongtech.bs.service.PartyServer;
import com.dongtech.data.MyChartsData;
import com.dongtech.syslog.SystemControllerLog;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** @auther: jiangtao @Date: 2020/02/20/12:53 */
@Controller
@Slf4j
@RequestMapping("statistics")
public class StatisticsContrller {
  @Autowired private PartyServer partyServer;
  @Autowired private BranchService branchService;

  @RequestMapping("/toStatistics")
  @SystemControllerLog(description = "跳转统计分析页面")
  public String toStatistics(HttpServletRequest request) {
    // 查询发展党员数；
    request.setAttribute("evelopmentCount", partyServer.selectPartyByNodeid(25, false));
    // 查询已经归档的党员；
    request.setAttribute("fileCount", partyServer.selectPartyByNodeid(25, true));

    // 查询党支部数量；
    request.setAttribute("branchList", branchService.getbranchList().size());
    return "statistics/statisticsMain";
  }

  @RequestMapping("getData")
  @SystemControllerLog(description = "获取统计页面图表数据")
  @ResponseBody
  public Map<String, Object> getData() {
    Map<String, Object> map = new HashMap<>();
    // Integer[] myCharts3Data = new Integer[] {15, 14, 13, 13, 13, 14, 15};
    MyChartsData myChartsData = partyServer.getmyChartsData(true);
    map.put("myCharts3Data", myChartsData.getMyCharts3Data());
    map.put("myCharts3Year", myChartsData.getMyCharts3Year());
    map.put("myCharts2Data", myChartsData.getMyCharts2Data());
    map.put("myCharts2Stage", myChartsData.getMyCharts2Stage());
    map.put("myCharts1Age", myChartsData.getMyCharts1Age());
    map.put("myCharts1Area", myChartsData.getMyCharts1Area());
    map.put("myCharts4Data", myChartsData.getMyCharts4Data());
    map.put("myCharts4Num", myChartsData.getMyCharts4Num());

    return map;
  }
}
