package com.dongtech.bs.controller;

import com.dongtech.bs.service.SysLogService;
import com.dongtech.data.LogData;
import com.dongtech.syslog.SystemControllerLog;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** @auther: jiangtao @Date: 2020/02/20/13:14 */
@Controller
@Slf4j
@RequestMapping("log")
public class LogContrller {
  @Autowired private SysLogService sysLogService;

  @RequestMapping("/toLogMain")
  @SystemControllerLog(description = "跳转日志统计主页")
  public String toLogMain() {
    return "log/logMain";
  }

  @RequestMapping("/toseeLog")
  @SystemControllerLog(description = "跳转日志详情主页")
  public String toseeLog() {
    return "log/seeLog";
  }

  @RequestMapping("/getLogData")
  @SystemControllerLog(description = "获取日志数据")
  @ResponseBody
  public LogData getLogData(
      HttpServletRequest request, String page, String limit, String startTime, String endTime) {
    LogData logData = new LogData();
    // 查询数据；
    sysLogService.getLogData(logData, page, limit, startTime, endTime);
    return logData;
  }
}
