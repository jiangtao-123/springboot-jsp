<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
%>
<form class="layui-form model-form" id="modelUserForm">
    <div class="layui-form-item">
        <div class="textHtml" style="margin-left: 50px">

        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block text-right">
            <button class="layui-btn layui-btn-primary" type="button" ew-event="closePageDialog">
                关闭
            </button>

        </div>
    </div>
</form>
<script>
  layui.use(['admin'], function () {
    var $ = layui.jquery;

    var admin = layui.admin;
    var mUser = admin.getLayerData('#modelUserForm').log;
    $(".textHtml").html(
        " 系统来源：" + mUser.system + "</br>" + "用户名称：" + (mUser.user == "null" ? "未登录" : mUser.user)
        + "</br>操作代码："
        + mUser.methodpath + "</br>操作名称：" + mUser.description + "</br>操作时间：" + mUser.cratetime
        + "</br>操作状态：" + mUser.state + "</br>操作说明：" + mUser.description);

  });


</script>