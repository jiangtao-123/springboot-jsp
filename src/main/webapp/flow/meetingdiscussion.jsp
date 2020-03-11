<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
%>
<!-- 如果用url弹窗,注意这里不需要写`<html><body>`这些东西，它是一个html片段，不是完整的html页面 -->
<script src="/assets/libs/jquery/jquery-3.2.1.min.js"></script>
<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">中共正式党员的请示</li>
        <li>支部大会讨论转为中共正式党员会议记录</li>
        <li>拟转为中共正式党员的公示</li>
    </ul>
    <div class="layui-tab-content bg-white">
        <div class="layui-tab-item layui-show">
            <form id="modelUserForm" lay-filter="modelUserForm" class="layui-form ">
                <div class="layui-fluid">
                    <div class="layui-card">
                        <!--<div class="layui-card-header">确定入党积极分子公示:</div>-->
                        <div class="layui-card-body">


                            <div class="layui-form-item layui-form-text">

                                <div class="layui-input-block1">
                                    <!--                                    <textarea name="desc" placeholder="请输入" class="layui-textarea" lay-verify="required" required rows="10"></textarea>-->
                                    <textarea id="demoEditor" name="demoEditor"></textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item text-right">
                        <%--<button class="layui-btn layui-btn-primary" type="button"--%>
                        <%--ew-event="closePageDialog">取消--%>
                        </button>
                        <button class="layui-btn layui-btn-disabled" lay-filter="print" id="print"
                                lay-submit>
                            打印
                        </button>
                        <input type="hidden" id="issubmit" value=""/>
                        <button id="sbbotton" class="layui-btn" lay-filter="savePartymain"
                                lay-submit>保存
                        </button>
                    </div>
                </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-form-item text-right">
                <div style="float:left">

                    <div id="video1">
                        <img id="video" style="width:506px;height:380px">
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
                            <button onclick="Capture()" type="button">确定入党积极分子会议记录扫描</button>

                        <p>


                        <ul id="parentUl"></ul>

                    </div>
                    <input type="hidden" id="subImage" value=""/>
                    <button id="add" id="saveImage" class="layui-btn" lay-filter="add"
                            lay-submit>保存
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-tab-item ">
            <form id="modelUserForm" lay-filter="modelUserForm" class="layui-form ">
                <div class="layui-fluid">
                    <div class="layui-card">
                        <!--<div class="layui-card-header">确定入党积极分子公示:</div>-->
                        <div class="layui-card-body">


                            <div class="layui-form-item layui-form-text">

                                <div class="layui-input-block1">
                                    <!--                                    <textarea name="desc" placeholder="请输入" class="layui-textarea" lay-verify="required" required rows="10"></textarea>-->
                                    <textarea id="demoEditor2" name="demoEditor2"></textarea>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="layui-form-item text-right">
                        <%--<button class="layui-btn layui-btn-primary" type="button"--%>
                        <%--ew-event="closePageDialog">取消--%>
                        </button>
                        <button class="layui-btn layui-btn-disabled" lay-filter="print2" id="print2"
                                lay-submit>
                            打印
                        </button>
                        <input type="hidden" id="issubmittwo" value=""/>
                        <button id="sbbottontwo" class="layui-btn" lay-filter="savePartymaintwo"
                                lay-submit>保存
                        </button>
                    </div>
                </div>
        </div>
        <button class="layui-btn" type="button"
                lay-filter="pass" lay-submit>审核通过
        </button>
        </form>

    </div>


    <!-- js部分 -->
    <%--<script type="text/javascript" src="../../assets/libs/layui/layui.js"></script>--%>
    <%--<script type="text/javascript" src="../../assets/js/common.js?v=316"></script>--%>
    <%--<script type="text/javascript" src="../../assets/libs/tinymce/tinymce.min.js"></script>--%>
    <script>
      layui.use(['layer', 'form', 'printer', 'admin', 'laydate', 'upload', 'element'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var printer = layui.printer;
        var laydate = layui.laydate;
        var upload = layui.upload;
        var admin = layui.admin;
        var element = layui.element;
        var id = admin.getLayerData('#modelUserForm').id;
        var nodeId = admin.getLayerData('#modelUserForm').nodeId;
        $.post("/file/getFilePath", function (data) {
          $("#saveText").val(data);
        });
        // 渲染富文本编辑器1
        tinymce.init({
          selector: '#demoEditor',
          width: '100 %',
          height: 350,
          language: 'zh_CN',
          // plugins: 'code print preview fullscreen paste searchreplace save autosave link autolink image imagetools media table codesample lists advlist hr charmap emoticons anchor directionality pagebreak quickbars nonbreaking visualblocks visualchars wordcount',
          toolbar: 'fullscreen preview code | undo redo | forecolor backcolor | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | outdent indent | numlist bullist | formatselect fontselect fontsizeselect | link image media emoticons charmap anchor pagebreak codesample | ltr rtl',
          // fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt",
          toolbar_drawer: 'sliding',
          images_upload_url: '../../../json/tinymce_upload_ok.json',
          file_picker_types: 'media',
          file_picker_callback: function (callback, value, meta) {
            layer.msg('演示环境不允许上传', {anim: 6});
          }
        });
        // 渲染富文本编辑器2
        tinymce.init({
          selector: '#demoEditor2',
          width: '100 %',
          height: 350,
          language: 'zh_CN',
          // plugins: 'code print preview fullscreen paste searchreplace save autosave link autolink image imagetools media table codesample lists advlist hr charmap emoticons anchor directionality pagebreak quickbars nonbreaking visualblocks visualchars wordcount',
          toolbar: 'fullscreen preview code | undo redo | forecolor backcolor | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | outdent indent | numlist bullist | formatselect fontselect fontsizeselect | link image media emoticons charmap anchor pagebreak codesample | ltr rtl',
          // fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt",
          toolbar_drawer: 'sliding',
          images_upload_url: '../../../json/tinymce_upload_ok.json',
          file_picker_types: 'media',
          file_picker_callback: function (callback, value, meta) {
            layer.msg('演示环境不允许上传', {anim: 6});
          }
        });
        //获取模板；
        $.post("/flow/getTemplate", {nodeId: nodeId, type: "1,2"},

            function (d) {
              tinyMCE.editors[0].setContent(d.one);
              tinyMCE.editors[1].setContent(d.two);
            }
        )
        ;

        // var mUser = admin.getLayerData('#modelUserForm').user;  // 列表页面传递的数据，#modelUserForm这个只要写弹窗内任意一个元素的id即可
        // 回显数据
        // form.val('modelUserForm', mUser);

        // 表单提交事件
        form.on('submit(savePartymain)', function (data) {
          layer.load(2);
          //   var data = data.field
          // data.push({"123": 456})
          // alert(JSON.stringify(data))
          console.log(tinyMCE.editors[0].getContent())

          // return;
          var url = "/flow/savePartymain";
          $.post(url, {
                title: $("#title").val(), context:
                    tinyMCE.editors[0].getContent(), id: id, nodeId: nodeId, type: 1
              }, function (res) {
                layer.closeAll('loading');
                if (res.res) {
                  $("#sbbotton").attr("disabled", true);
                  $("#sbbotton").addClass("layui-btn-disabled");
                  $("#print").removeClass("layui-btn-disabled");
                  $("#issubmit").val(1);
                  layer.msg(res.msg, {icon: 1});
                  // admin.putLayerData('formOk', true, '#modelUserForm');  // 设置操作成功的标识，#modelUserForm这个只要写弹窗内任意一个元素的id即可
                  // admin.closeDialog('#modelUserForm');  // 关闭页面层弹窗
                  // admin.closeDialog("#addWindow")
                } else {
                  layer.msg(res.msg, {icon: 2});
                }
              }

              ,
              'json'
          )
          ;
          return false;
        });
        form.on('submit(savePartymaintwo)', function (data) {
          layer.load(2);
          //   var data = data.field
          // data.push({"123": 456})
          // alert(JSON.stringify(data))
          // console.log(tinyMCE.editors[0].getContent())

          // return;
          var url = "/flow/savePartymain";
          $.post(url, {
                title: $("#title").val(), context:
                    tinyMCE.editors[1].getContent(), id: id, nodeId: nodeId, type: 2
              }, function (res) {
                layer.closeAll('loading');
                if (res.res) {
                  $("#sbbottontwo").attr("disabled", true);
                  $("#sbbottontwo").addClass("layui-btn-disabled");
                  $("#print2").removeClass("layui-btn-disabled");
                  $("#issubmittwo").val(1);
                  layer.msg(res.msg, {icon: 1});
                  // admin.putLayerData('formOk', true, '#modelUserForm');  // 设置操作成功的标识，#modelUserForm这个只要写弹窗内任意一个元素的id即可
                  // admin.closeDialog('#modelUserForm');  // 关闭页面层弹窗
                  // admin.closeDialog("#addWindow")
                } else {
                  layer.msg(res.msg, {icon: 2});
                }
              }

              ,
              'json'
          )
          ;
          return false;
        });
        form.on('submit(add)', function (data) {
          layer.load(2);
          var path = "";
          $("#parentUl").find("img").each(function (index, e) {
            // alert(index + '* ' + e.id);
            path += e.id + "@";
          });
          path = path.substring(0, path.length - 1);
          $.post("/flow/addapplication",
              {id: id, nodeId: nodeId, images: path, isgo: false, type: 1},
              function (data) {
                if (data.res) {
                  layer.msg(data.msg, {icon: 1, time: 1500});
                  layer.closeAll('loading');
                  $("#add").attr("disabled", true);
                  $("#add").addClass("layui-btn-disabled");
                  $("#subImage").val(1);
                  // admin.putLayerData('formOk', true, '#modelUserForm');
                  // admin.closeDialog("#addWindow")
                } else {
                  layer.msg(data.msg, {icon: 2, time: 1500});
                }
              });

          return false;
        });
        form.on('submit(pass)', function (data) {
              if ($("#issubmit").val() != 1) {
                layer.msg("请打印中共正式党员的请示", {icon: 2});
                return;
              }
              if ($("#subImage").val() != 1) {
                layer.msg("请扫描支部大会接受预备党员会议记录", {icon: 2});
                return;
              }
              if ($("#issubmittwo").val() != 1) {
                layer.msg("请打印拟转为中共正式党员的公示", {icon: 2});
                return;
              }
              layer.load(2);
              $.post("/flow/submitFlow",
                  {
                    id: id, nodeId:
                    nodeId, option:
                        true
                  }
                  ,

                  function (data) {
                    if (data.res) {
                      layer.closeAll('loading');
                      layer.msg(data.msg, {icon: 1, time: 1500});
                      admin.closeDialog("#addWindow");  // 关闭页面层弹窗
                    } else {
                      layer.msg(data.msg, {icon: 2, time: 1500});
                    }
                  });
            }
        )
        ;
        form.on('submit(print)', function (data) {
              var ct = tinyMCE.editors[0].getContent();
              printer.printHtml({
                html: ct
              });
              return false;
            }
        )
        form.on('submit(print2)', function (data) {
              var ct = tinyMCE.editors[1].getContent();
              printer.printHtml({
                html: ct
              });
              return false;
            }
        )

        return false;
      })
      ;

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

