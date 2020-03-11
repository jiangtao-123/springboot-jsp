package com.dongtech.bs.controller;

import com.dongtech.syslog.SystemControllerLog;
import com.dongtech.utils.ExcelUtil.ExcelUtil;
import com.dongtech.utils.R;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/** @auther: jiangtao @Date: 2020/01/03/13:09 */
@RestController
@RequestMapping("/excel")
public class ExcelContrller {
  @ApiOperation(value = "Excel文件导入")
  @PostMapping("/saveFile")
  @SystemControllerLog(description = "导入")
  public R addGoodsImg(
      @ApiParam(value = "excel上传", required = true) MultipartFile file,
      @ApiParam(value = "关联数据id", required = false)
          @RequestParam(required = false, value = "dataId")
          String dataId,
      @ApiParam(value = "数据类型", required = false)
          @RequestParam(required = false, value = "dataType")
          String dataType) {
    List<List<String>> lists = null;
    try {
      ExcelUtil excelUtil = new ExcelUtil(file.getInputStream(), file.getOriginalFilename());
      lists = excelUtil.read();
    } catch (Exception e) {
      e.printStackTrace();
    }
    System.out.println(lists.size() + ">>>>>>>>>>");
    return R.ok().put("data", lists);
  }

  @ApiOperation(value = "excel导出")
  @GetMapping("/exportFile")
  public R exportFile(HttpServletResponse response, HttpServletRequest request) {
    ExcelUtil excelUtil = new ExcelUtil();
    List<List<String>> rowData = new ArrayList<>();
    List<String> heads = new ArrayList<>();
    heads.add("头一");
    heads.add("头二");
    heads.add("头三");
    rowData.add(heads);
    for (int i = 0; i < 10; i++) {
      List<String> a = new ArrayList<>();
      a.add("123");
      a.add("456");
      a.add("789");
      rowData.add(a);
    }
    try {
      excelUtil.createSheet();
      excelUtil.setSheetName(0, "数据");
      excelUtil.write(rowData);
      excelUtil.exportResponse(response, "数据导出");

    } catch (Exception e) {
      e.printStackTrace();
    }
    return R.ok();
  }
}
