package com.dongtech.data;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import java.util.List;
import lombok.Data;

/** @auther: jiangtao @Date: 2020/02/25/15:07 */
@Data
public class PartyData {

  /**
   * code : 0 msg : count : 21 data :
   * [{"id":1,"roleId":1,"roleName":"管理员","comments":"系统管理员","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03","picture":"/assets/images/person_head.jpg"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":2,"picture":"/assets/images/login_bg.jpg","roleId":2,"roleName":"普通用户","comments":"系统普通用户","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29
   * 16:38:03"},{"id":3,"picture":"/assets/images/person_head.jpg","roleId":3,"roleName":"游客","comments":"系统游客","isDelete":0,"createTime":"2019/03/29
   * 16:38:03","updateTime":"2019/03/29 16:38:03"}]
   */
  private int code;

  private String msg;
  private int count;
  private List<DataBean> data;

  @Data
  public static class DataBean {

    /**
     * id : 1 roleId : 1 roleName : 管理员 comments : 系统管理员 isDelete : 0 createTime : 2019/03/29
     * 16:38:03 updateTime : 2019/03/29 16:38:03 picture : /assets/images/person_head.jpg
     */
    @JsonSerialize(using = ToStringSerializer.class)
    private long id;

    private String name;
    private String branchName;
    private int age;
    private String sex;
    private String stageName;
    private String picture;
    private String nodeName;
    private String nextTime;
    private int nodeId;
    private int examine;
    private String state = "待处理";
  }
}
