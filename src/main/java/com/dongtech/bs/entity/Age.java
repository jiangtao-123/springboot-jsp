package com.dongtech.bs.entity;

import lombok.Data;

/** @auther: jiangtao @Date: 2020/02/27/15:53 */
@Data
public class Age {
  private int maxAge;
  private int minAge;
  private String name;

  //  public static void main(String[] args) {
  //    System.out.println(new Age().getMaxAge());
  //  }
}
