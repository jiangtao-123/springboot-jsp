<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dongtech.bs.entity.BsAttachment" %>
<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
    List<BsAttachment> list = (List<BsAttachment>) request.getAttribute("images");
%>


<!-- 注意这里不需要写`<html><body>`这些东西，它是一个html片段，不是完整的html页面 -->
<form id="modelUserForm" lay-filter="modelUserForm" class="layui-form ">
    <div class="layui-fluid">
        <div class="layui-card">
            <div class="layui-inline">
                <label class="layui-form-label layui-form-required">入党介绍人</label>
                <div class="layui-input-block">
                    <input name="introducerId" id="introducerId" type="hidden" value=""/>
                    <input name="introducerName" id="introducerName" type="text" placeholder="请输入姓名"
                           class="layui-input"
                           lay-verType="tips" lay-verify="required" required/>
                </div>
            </div>
        </div>
        <div class="layui-form-item text-right">
            <%--<button class="layui-btn" lay-filter="noPass" lay-submit>审批不通过--%>
            <%--</button>--%>
            <button class="layui-btn" lay-filter="pass" lay-submit>审批通过
            </button>
            <button class="layui-btn layui-btn-primary " type="button"
                    ew-event="closePageDialog">
                取消
            </button>
        </div>

    </div>


</form>

<script>

  layui.use(['layer', 'form', 'admin', 'laydate', 'upload'], function () {
    var $ = layui.jquery;
    // var layer = layui.layer;
    var form = layui.form;
    // var laydate = layui.laydate;
    // var upload = layui.upload;
    var admin = layui.admin;
    var id = admin.getLayerData('#modelUserForm').id;
    var nodeId = admin.getLayerData('#modelUserForm').nodeId;
    form.on('submit(pass)', function (data) {
      $.post("/flow/submitFlowAndSaveintroducer",
          {id: id, nodeId: nodeId, option: true, introducerName: $("#introducerName").val()},
          function (data) {
            if (data.res) {
              layer.msg(data.msg, {icon: 1, time: 1500});
            } else {
              layer.msg(data.msg, {icon: 2, time: 1500});
            }

          });
      // return false;
    });
    form.on('submit(noPass)', function (data) {
      $.post("/flow/submitFlow", {id: id, nodeId: nodeId, option: false}, function (data) {
        if (data.res) {
          layer.msg(data.msg, {icon: 1, time: 1500});
        } else {
          layer.msg(data.msg, {icon: 2, time: 1500});
        }

      });

    });
  });

  function seeImage(obj) {
    showpicture(obj.id)
  }
</script>