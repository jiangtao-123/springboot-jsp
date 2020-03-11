package com.dongtech.bs.controller;

import com.dongtech.bs.entity.UserEntity;
import com.dongtech.bs.service.UserServer;
import com.dongtech.syslog.SystemControllerLog;
import com.dongtech.utils.R;
import com.dongtech.vo.PasswordVo;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/** @auther: jiangtao @Date: 2020/02/19/14:39 */
@Controller
@Slf4j
@RequestMapping("user")
public class UserContrller {
  @Autowired private UserServer userServer;

  @RequestMapping("/updatePwd")
  @SystemControllerLog(description = "跳转修改密码页面")
  public String updatePwd() {
    return "user/password";
  }

  @RequestMapping("/tosee")
  @SystemControllerLog(description = "跳转查看头像页面")
  public String tosee(HttpServletRequest request, String url) {
    request.setAttribute("url", url);
    return "user/image";
  }

  @RequestMapping("/toMessage")
  @SystemControllerLog(description = "跳转消息页")
  public String toMessage() {
    return "user/message";
  }

  @RequestMapping("/updatePassword")
  @ResponseBody
  @SystemControllerLog(description = "修改密码")
  public R updatePassword(HttpServletRequest request, PasswordVo passwordVo) {
    Map<String, Object> map = new HashMap<>();
    try {
      UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
      userEntity.setName(passwordVo.getUserName());
      userEntity.setPassWord(passwordVo.getNewPsw());
      userServer.updateValue(userEntity);
      map.put("re", true);
      map.put("msg", "操作成功");
    } catch (Exception e) {
      e.printStackTrace();
      map.put("re", false);
      map.put("msg", "操作失败，请联系管理员");
    }
    return R.ok().put("data", map);
  }
}
