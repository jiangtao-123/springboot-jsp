package com.dongtech.bs.entity;

import java.util.List;
import lombok.Data;

/** @auther: jiangtao @Date: 2020/02/27/17:05 */
@Data
public class BranchTree {
  // 主键
  private long id;
  // 父节点
  //  private long pid;
  // 组织名称
  private String title;
  // 组织代码
  //  private String braCode;
  // 子组织；
  private List<BranchTree> children;
}
