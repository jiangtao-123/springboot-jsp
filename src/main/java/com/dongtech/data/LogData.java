package com.dongtech.data;

import java.util.List;
import lombok.Data;

/** @auther: jiangtao @Date: 2020/02/20/16:15 */
@Data
public class LogData {
  private int code;
  private String msg;
  private int count;
  private List<DataBean> data;

  @Data
  public static class DataBean {
    private long id;
    private String user;
    private String description;
    private String ip;
    private String methodpath;
    private String params;
    private String methodPath;
    private String cratetime;
    private String state;
    private String system;
  }
}
