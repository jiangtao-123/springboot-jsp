package com.dongtech.data;

import lombok.Data;

/** @auther: jiangtao @Date: 2020/03/10/13:00 */
@Data
public class NodeVo {
  private String nodeName;
  private String nodeId;
  // 审批时间
  private String time;
  // 审批结果
  private String option;
}
