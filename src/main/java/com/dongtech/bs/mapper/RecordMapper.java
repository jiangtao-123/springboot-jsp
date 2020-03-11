package com.dongtech.bs.mapper;

import com.dongtech.utils.DB;
import com.dongtech.utils.DateUtil;
import org.springframework.stereotype.Component;

/** @auther: jiangtao @Date: 2020/03/03/11:00 */
@Component
public class RecordMapper {

  public void saveRecord(String id, String nodeId, boolean option) {
    try {
      String sql =
          " insert into approval_record(applicant_id,node_info_id,result,time) values("
              + id
              + ","
              + nodeId
              + ","
              + (true == option ? 1 : 2)
              + ",'"
              + DateUtil.getCurrentTime()
              + "')";
      DB.executeUpdate(sql);
      DB.release();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
