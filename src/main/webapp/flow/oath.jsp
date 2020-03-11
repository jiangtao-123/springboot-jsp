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
        <li class="layui-this">入党宣誓相关视频</li>
    </ul>
    <div class="layui-tab-content bg-white">
        <form id="modelUserForm" lay-filter="modelUserForm" class="layui-form ">
            <div class="layui-tab-item layui-show">
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>视频上传</legend>
                </fieldset>

                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test2">文件选择</button>
                    <button type="button" class="layui-btn layui-btn-disabled"
                            id="uploadListAction">确认上传
                    </button>
                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                        预览视频：
                        <div class="layui-upload-list" id="demo2"></div>

                    </blockquote>
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
      layui.use(['layer', 'form', 'printer', 'admin', 'upload', 'upload', 'Player'], function () {
        var $ = layui.jquery;
        var Player = layui.Player;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        var upload = layui.upload;
        var admin = layui.admin;
        var printer = layui.printer;
        var element = layui.element;
        var upload = layui.upload; //得到 upload 对象
        var id = admin.getLayerData('#modelUserForm').id;
        var nodeId = admin.getLayerData('#modelUserForm').nodeId;
        //上传视频
        upload.render({
          elem: '#test2'
          , url: '/file/saveFile' //改成您自己的上传接口
          , multiple: true,
          auto: false //选择文件后不自动上传
          , bindAction: '#uploadListAction'
          , data: {
            dataId: id,
            nodeId: nodeId,//新增人员信息节点为0；
            type: 1
          }, accept: 'video' //允许上传的文件类型
          , choose: function (obj) {
            var files = obj.pushFile();
            obj.preview(function (index, file, result) {
              $("#uploadListAction").removeClass("layui-btn-disabled");

              $('#demo2').append('<div ><span></br><a id="' + "deleteImage" + index
                  + '" style="cursor:pointer;">删除视频</a><div id="' + "video" + index
                  + '"></div></span></div>'
              )
              ;
              seeImage(result, index);
              $("#photoImg" + index).click(function () {
                seeImage(this.src, index);
              });
              $("#deleteImage" + index).click(function () {
                // $("#uploadListAction").attr("disabled", true);
                // $("#uploadListAction").addClass("layui-btn-disabled");
                delete files[index];
                $(this).parent().remove();
                // $.post("/party/deleteVideo", {id: id, nodeId: nodeId, type: 2}, function (data) {
                //   if (data) {
                //     layer.msg("删除成功", {icon: 1, time: 1500});
                //   }
                // });

              });
            });
          },
          done: function (res) {
            layer.msg("上传成功", {icon: 1, time: 1500});
          }
        });
        form.on('submit(pass)', function (data) {
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

        function seeImage(src, index) {
          var player = new Player({
            id: "video" + index,
            url: src,  // 视频地址
            // poster: "https://imgcache.qq.com/open_proj/proj_qcloud_v2/gateway/solution/general-video/css/img/scene/1.png",  // 封面
            // fluid: true,  // 宽度100%
            width: 200,
            height: 200,
            playbackRate: [0.5, 1, 1.5, 2],  // 开启倍速播放
            pip: true,  // 开启画中画
            lang: 'zh-cn'
          });
        }
      })
      ;


    </script>

