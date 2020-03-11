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
            <%
                if (null != list && list.size() > 0) {
                    for (int i = 0; i < list.size(); i++) {
                        BsAttachment b = list.get(i);
                        if (i % 3 == 0) {
            %>
            </br>
            <%}%>
            <img src="<%=b.getBase64()%>" id="<%=b.getFullUrl()%>" width="200px" height="200px"
                 onclick="seeImage(this)" title="单击放大">
            <%
                    }
                }
            %>
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
      $.post("/flow/submitFlow", {id: id, nodeId: nodeId, option: true}, function (data) {
        if (data.res) {
          layer.msg(data.msg, {icon: 1, time: 1500});
        } else {
          layer.msg(data.msg, {icon: 2, time: 1500});
        }

      });
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