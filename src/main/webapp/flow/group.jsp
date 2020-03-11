<%@ page import="com.dongtech.bs.entity.Branch" %>
<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
    List<Branch> branchList = (List<Branch>) request.getAttribute("branch");
%>
<!-- 如果用url弹窗,注意这里不需要写`<html><body>`这些东西，它是一个html片段，不是完整的html页面 -->
<script src="/assets/libs/jquery/jquery-3.2.1.min.js"></script>
<div class="layui-tab layui-tab-card">
    <ul class="layui-tab-title">
        <li class="layui-this">编入党支部和党小组</li>
    </ul>
    <div class="layui-tab-content bg-white">
        <form id="modelUserForm" lay-filter="modelUserForm" class="layui-form ">
            <div class="layui-tab-item layui-show">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">请选择支部</label>
                        <div class="layui-input-block">
                            <select lay-search id="branchId" name="branchId" lay-verType="tips"
                                    lay-verify="required"
                                    required>
                                <option value="">请选择或者输入关键字查询</option>
                                <%
                                    if (null != branchList) {
                                        for (Branch b : branchList) {
                                %>
                                <option value="<%=b.getId()%>"><%=b.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
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
        var laydate = layui.laydate;
        var upload = layui.upload;
        var admin = layui.admin;
        var printer = layui.printer;
        var element = layui.element;
        var id = admin.getLayerData('#modelUserForm').id;
        var nodeId = admin.getLayerData('#modelUserForm').nodeId;
        $("#branchId").val('<%=request.getAttribute("branchId")%>');
        $.post("/file/getFilePath", function (data) {
          $("#saveText").val(data);
        });
        // 渲染富文本编辑器1
        // tinymce.init({
        //   selector: '#demoEditor',
        //   width: '100 %',
        //   height: 350,
        //   language: 'zh_CN',
        //   plugins: 'code print preview fullscreen paste searchreplace save autosave link autolink image imagetools media table codesample lists advlist hr charmap emoticons anchor directionality pagebreak quickbars nonbreaking visualblocks visualchars wordcount',
        //   toolbar: 'fullscreen preview code | undo redo | forecolor backcolor | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | outdent indent | numlist bullist | formatselect fontselect fontsizeselect | link image media emoticons charmap anchor pagebreak codesample | ltr rtl',
        //   toolbar_drawer: 'sliding',
        //   images_upload_url: '../../../json/tinymce_upload_ok.json',
        //   file_picker_types: 'media',
        //   file_picker_callback: function (callback, value, meta) {
        //     layer.msg('演示环境不允许上传', {anim: 6});
        //   }
        // });

        // var mUser = admin.getLayerData('#modelUserForm').user;  // 列表页面传递的数据，#modelUserForm这个只要写弹窗内任意一个元素的id即可
        // 回显数据
        // form.val('modelUserForm', mUser);

        $.post("/flow/getTemplate", {nodeId: nodeId, type: "1"},

            function (d) {
              // alert(d.one);
              tinymce.get('demoEditor').setContent(d.one);
              //tinyMCE.editors[0].setContent(d.one);
              // tinyMCE.editors[1].setContent(d.two);
              //  tinymce.get('demoEditor2').setContent(d.two);
            }
        )
        ;

        // 表单提交事件
        form.on('submit(savePartymain)', function (data) {
          // alert(4444)
          layer.load(2);
          //   var data = data.field
          // data.push({"123": 456})
          // alert(JSON.stringify(data))
          // alert(nodeId);
          // alert(tinyMCE.editors[0].getContent())
          // return;
          var url = "/flow/savePartymain";
          $.post(url, {
                context:
                    tinyMCE.editors[0].getContent(), id: id, nodeId: nodeId, type: 1
              }, function (res) {
                layer.closeAll('loading');
                if (res.res) {
                  $("#savePartymain").attr("disabled", true);
                  $("#savePartymain").addClass("layui-btn-disabled");
                  $("#print1").removeClass("layui-btn-disabled");
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
        form.on('submit(add)', function (data) {
          // alert("提交通知单");
          layer.load(2);
          // alert(tinyMCE.editors[1].getContent());
          var url = "/flow/savePartymain";
          $.post(url, {
                context:
                    tinyMCE.editors[1].getContent(), id: id, nodeId: nodeId, type: 2
              }, function (res) {
                layer.closeAll('loading');
                if (res.res) {
                  $("#saveImage").attr("disabled", true);
                  $("#saveImage").addClass("layui-btn-disabled");
                  $("#print2").removeClass("layui-btn-disabled");
                  $("#subImage").val(1);
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

          return false;
        });
        form.on('submit(pass)', function (data) {

              layer.load(2);

              $.post("/flow/savebranchId",
                  {
                    branchId: $("#branchId").val(),
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
                      layer.closeAll('loading');
                      layer.msg(data.msg, {icon: 2, time: 1500});
                    }
                  });
            }
        )
        ;
        form.on('submit(print1)', function (data) {
              var ct = tinyMCE.editors[0].getContent();
              printer.printHtml({
                html: ct
              });
              return false;
            }
        );
        form.on('submit(print2)', function (data) {
              var ct = tinyMCE.editors[1].getContent();
              printer.printHtml({
                html: ct
              });
              return false;
            }
        )
        return false;
      });

      ;


    </script>

