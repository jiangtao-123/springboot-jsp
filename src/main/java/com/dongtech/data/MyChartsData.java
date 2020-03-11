package com.dongtech.data;

import java.util.Map;
import lombok.Data;

/** @auther: jiangtao @Date: 2020/02/27/14:14 */
@Data
public class MyChartsData {
  private Integer[] myCharts3Data;
  private String[] myCharts3Year;
  private Integer[] myCharts2Data;
  private String[] myCharts2Stage;
  private Map<String, Object> myCharts1Area;
  private Map<String, Object> myCharts1Age;
  private String[] myCharts4Data;
  private Integer[] myCharts4Num;
}
