package com.dongtech.bs.service.impl;

import com.dongtech.bs.mapper.RecordMapper;
import com.dongtech.bs.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** @auther: jiangtao @Date: 2020/03/03/10:56 */
@Service
public class RecordServiceimpl implements RecordService {
  @Autowired RecordMapper recordMapper;

  @Override
  public void saveRecord(String id, String nodeId, boolean option) {
    recordMapper.saveRecord(id, nodeId, option);
  }
}
