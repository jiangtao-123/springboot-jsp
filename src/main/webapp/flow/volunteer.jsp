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
    <div style="float:left">

        <div id="video1">
            <img id="video" style="width:506px;height:380px">
        </div>


    </div>
    <div style="margin-left: 20px;">
        <p>

            <input type="hidden" id="saveText" value=""
                   style="margin-left:5px;width: 150px;text-align: left;"/>


            <input id="imageType" value="jpg" type="hidden"/>


            <!--
            <input type = "checkbox" name = "CurCrop" id = "CurCrop" onClick="SetCusCrop(CurCrop)"/>
            手动裁切
            </td>
            -->
        <p>

        <p>
            <button onclick="Capture()" type="button">入党志愿书扫描</button>

        <p>


        <ul id="parentUl"></ul>
        <button id="add" type="button">保存提交</button>
    </div>

    </div>
    </div>
</form>
<script src="/assets/libs/jquery/jquery-3.2.1.min.js"></script>
<%--<script type="text/javascript" src="../assets/libs/layui/layui.js"></script>--%>
<%--<script type="text/javascript" src="/assets/js/common.js?v=316"></script>--%>

<%--<script type="text/javascript" src="/assets/libs/layui/lay/modules/layer.js"></script>--%>
<script>
  layui.use(['admin'], function () {
    var $ = layui.jquery;

    var admin = layui.admin;
    var id = admin.getLayerData('#modelUserForm').id;
    var nodeId = admin.getLayerData('#modelUserForm').nodeId;
    $.post("/file/getFilePath", function (data) {
      $("#saveText").val(data);
    });

    $("#add").click(function (data) {
      // alert(id)
      // alert(nodeId)
      var path = "";
      $("#parentUl").find("img").each(function (index, e) {
        // alert(index + '* ' + e.id);
        path += e.id + "@";
      });
      path = path.substring(0, path.length - 1);
      $.post("/flow/addapplication", {id: id, nodeId: nodeId, images: path, isgo: true, type: 1},
          function (data) {
            if (data.res) {
              layer.msg(data.msg, {icon: 1, time: 1500});
              admin.putLayerData('formOk', true, '#modelUserForm');
              admin.closeDialog("#addWindow")
            } else {
              layer.msg(data.msg, {icon: 2, time: 1500});
            }
          });
    });

  });

  function getBase64(getBase64Image, img) {
    $.post("/file/getBase64Image", {path: getBase64Image}, function (data) {
          img.src = data;
          // $("#" + getBase64Image).attr('src', data)
        }
    )
    ;
  }

  function deleteImage(path) {
    $.post("/file/deleteImage", {path: path},

        function (data) {
          if (data) {
            layer.msg("删除成功", {icon: 1, time: 1500});
          } else {
            layer.msg("删除失败", {icon: 2, time: 1500});
          }
        }
    )
    ;

  }


</script>





