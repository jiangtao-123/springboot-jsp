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
<form class="layui-form model-form" id="modelUserForm">


    <div class="layui-form-item">
        <label class="layui-form-label layui-form-required">党组织名称:</label>
        <div class="layui-input-block">
            <input name="ndName" placeholder="请输党组织名称" class="layui-input"
                   lay-verType="tips" required/>
            <input type="hidden" id="pid" name="pid"/>
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
    var pid = admin.getLayerData('#modelUserForm').id;
    $("#pid").val(pid);

    // 监听提交
    form.on('submit(submit-psw)', function (data) {
      $.post("/main/saveNode", data.field, function (tt) {
        // alert(tt.res)
        if (tt.res) {
          layer.msg(tt.msg, {icon: 1, time: 1500}, function () {
            admin.putLayerData('id', tt.id, '#modelUserForm');//赋值；
            admin.closeDialog('#addNode');
          });
        } else {
          layer.msg(tt.data.msg, function () {

          });

        }
      });
      return false;
    });

  });
</script>