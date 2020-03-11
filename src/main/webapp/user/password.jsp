<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
%>
<!-- 修改密码表单 -->
<form class="layui-form model-form">
    <div class="layui-form-item">
        <input name="id" type="hidden" value="<%=userEntity.getId()%>"/>
        <label class="layui-form-label layui-form-required">用户名:</label>
        <div class="layui-input-block">
            <input type="text" name="userName" placeholder="请输入用户名"
                   value="<%=userEntity.getName()%>" class="layui-input"
                   lay-verType="tips" lay-verify="required" required/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label layui-form-required">原始密码:</label>
        <div class="layui-input-block">
            <input type="password" name="oldPsw" placeholder="请输入原始密码" class="layui-input"
                   lay-verType="tips" lay-verify="required|oldpassword" required/>
            <input type="hidden" value="<%=userEntity.getPassWord()%>"
                   name="oldPassword"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label layui-form-required">新密码:</label>
        <div class="layui-input-block">
            <input type="password" name="newPsw" placeholder="请输入新密码" class="layui-input"
                   lay-verType="tips" lay-verify="required|psw" required/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label layui-form-required">确认密码:</label>
        <div class="layui-input-block">
            <input type="password" name="rePsw" placeholder="请再次输入新密码" class="layui-input"
                   lay-verType="tips" lay-verify="required|equalTo" lay-equalTo="input[name=newPsw]"
                   required/>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block text-right">
            <button class="layui-btn layui-btn-primary" type="button" ew-event="closePageDialog">
                取消
            </button>
            <button class="layui-btn" lay-filter="submit-psw" lay-submit>保存</button>
        </div>
    </div>
</form>

<!-- js部分 -->
<script>
  layui.use(['layer', 'form', 'admin', 'formX'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var admin = layui.admin;
    form.verify({
      oldpassword: function (value, item) { //value：表单的值、item：表单的DOM对象
        if (value != $("input[name='oldPassword']").val()) {
          return '原密码不正确';
        }
      }
    });
    // 监听提交
    form.on('submit(submit-psw)', function (data) {
      $.post("/user/updatePassword", data.field, function (tt) {
        if (tt.data.re) {
          layer.msg(tt.data.msg, {icon: 1, time: 1500}, function () {
            admin.closeDialog('#layer-psw');
          });
        } else {
          layer.msg(tt.data.msg, {icon: 2, time: 1500}, function () {

          });

        }
      });
      return false;
    });

  });
</script>