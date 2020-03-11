<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dongtech.bs.entity.Branch" %>
<%@ page import="com.dongtech.bs.entity.Nation" %>
<%@ page import="com.dongtech.bs.entity.Stage" %>
<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
    // Map<String, Node> nodeMap = (Map<String, Node>) request.getAttribute("nodeInfo");
    Stage stage = (Stage) request.getAttribute("stage");
    List<Branch> branchList = (List<Branch>) request.getAttribute("branch");
    List<Nation> nationList = (List<Nation>) request.getAttribute("nation");
%>


<!-- 注意这里不需要写`<html><body>`这些东西，它是一个html片段，不是完整的html页面 -->
<form id="modelUserForm" lay-filter="modelUserForm" class="layui-form ">
    <div class="layui-fluid">
        <div class="layui-card">
            <!--<div class="layui-card-header">新增入党申请人:</div>-->
            <div class="layui-card-body">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">入党申请人</label>
                        <div class="layui-input-block">
                            <input type="hidden" value="<%=request.getAttribute("dataId")%>"
                                   name="id" id="dataId"/>
                            <input name="name" type="text" placeholder="请输入姓名"
                                   class="layui-input"
                                   lay-verType="tips" lay-verify="required" required/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">性别</label>
                        <div class="layui-input-inline">
                            <input type="radio" name="sex" value="1" title="男" checked>
                            <input type="radio" name="sex" value="2" title="女">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">出生年月</label>
                        <div class="layui-input-block">
                            <input type="text" name="birthday" id="birthday" placeholder="请选择"
                                   class=" layui-input date-icon" autocomplete="off"
                                   lay-verType="tips" lay-verify="required"
                                   required/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">民族</label>
                        <div class="layui-input-block">
                            <select lay-search name="nation" lay-verType="tips"
                                    lay-verify="required" required>
                                <option value="">请选择或者输入关键字查询</option>
                                <%
                                    if (null != nationList) {
                                        for (Nation n : nationList) {
                                %>
                                <option value="<%=n.getId()%>"><%=n.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">文化程度</label>
                        <div class="layui-input-block">
                            <select name="education" lay-verType="tips" lay-verify="required"
                                    required>
                                <option value="">请选择</option>
                                <option value="博士研究生">博士研究生</option>
                                <option value="硕士研究生">硕士研究生</option>
                                <option value="本科">本科</option>
                                <option value="专科">专科</option>
                                <option value="中专">中专</option>
                                <option value="高中">高中</option>
                                <option value="中师">中师</option>
                                <option value="中技">中技</option>
                                <option value="小学">小学</option>

                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">电话</label>
                        <div class="layui-input-block">
                            <input name="phone" type="text" placeholder="手机号"
                                   class="layui-input " lay-verType="tips"
                                   lay-verify="phone"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">申请入党时间</label>
                        <div class="layui-input-block">
                            <input type="text" name="joinTime" id="joinTime" placeholder="请选择"
                                   class=" layui-input date-icon" autocomplete="off"
                                   lay-verType="tips" lay-verify="required"
                                   required/>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">所属支部</label>
                        <div class="layui-input-block">
                            <select lay-search name="branchId" lay-verType="tips"
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

                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">所属阶段</label>
                        <div class="layui-input-block">
                            <select disabled="disabled" name="stageId" lay-verType="tips"
                                    lay-verify="required"
                                    required>

                                <option value="<%=stage.getId()%>"><%=stage.getName()%>
                                </option>

                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">当前待办</label>
                        <div class="layui-input-block">
                            <select disabled="disabled" name="nodeId" lay-verType="tips"
                                    lay-verify="required"
                                    required>

                                <option value="0">新增人员信息</option>
                                <%--<option value="1">上传入党申请书</option>--%>
                            </select>
                        </div>
                    </div>

                    <%--<div class="layui-inline">--%>
                    <%--<label class="layui-form-label layui-form-required">下阶段时间</label>--%>
                    <%--<div class="layui-input-block">--%>
                    <%--<input type="text" name="nextTime" id="nextTime" placeholder="请选择"--%>
                    <%--class=" layui-input date-icon" autocomplete="off"--%>
                    <%--lay-verType="tips" lay-verify="required"--%>
                    <%--required/>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>头像上传</legend>
                </fieldset>

                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="test2">图片选择</button>
                    <button type="button" class="layui-btn layui-btn-disabled"
                            id="uploadListAction">确认上传
                    </button>
                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                        预览图：
                        <div class="layui-upload-list" id="demo2"></div>
                    </blockquote>
                </div>


            </div>
        </div>
        <div class="layui-form-item text-right">
            <button class="layui-btn layui-btn-primary " type="button"
                    ew-event="closePageDialog">
                取消
            </button>
            <button class="layui-btn" lay-filter="modelSubmitUser" lay-submit>提交</button>
        </div>

    </div>


</form>

<script>

  layui.use(['layer', 'form', 'admin', 'laydate', 'upload'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var laydate = layui.laydate;
    var upload = layui.upload;
    var admin = layui.admin;

    lay('.date-icon').each(function () {
      laydate.render({
        elem: this,
        theme: '#3e9cf4',
      })
    });

    //单图片上传

    upload.render({
      elem: '#test2'
      , url: '/file/saveFile' //改成您自己的上传接口
      , multiple: true,
      auto: false //选择文件后不自动上传
      , bindAction: '#uploadListAction'
      , data: {
        dataId: '<%=request.getAttribute("dataId")%>',
        nodeId: 0,//新增人员信息节点为0；
        type: 1
      },
      choose: function (obj) {
        //限制只能添加一张图片

        if (undefined == $("#photoImg").val()) {

          var files = obj.pushFile();
          $("#uploadListAction").attr("disabled", false);
          $("#uploadListAction").removeClass("layui-btn-disabled");
          layer.load();

          obj.preview(function (index, file, result) {
            if (undefined == $("#photoImg").val()) {
              $('#demo2').append('<div><img id="photoImg" src="' + result + '" alt="' + file.name
                  + ' " class="layui-upload-img"  " ></br><a id="deleteImage" style="cursor:pointer;">删除图片</a></div>'
              );
            }
            layer.closeAll('loading');
            var time = null;
            $("#deleteImage").click(function () {
              $("#uploadListAction").attr("disabled", true);
              $("#uploadListAction").addClass("layui-btn-disabled");
              delete files[index];
              $(this).parent().remove();
            });
            $("#photoImg").click(function () {

              var imgSrc = $(this).attr('src')
                  , width = $(this).width()
                  , height = $(this).height()
                  , scaleWH = width / height
                  , bigH = $(window).height() - 60
                  , bigW = scaleWH * bigH
              if (bigW > 1000) {
                bigW = 1000
                bigH = bigW / scaleWH
              }
              layer.open({
                type: 1
                ,
                title: false
                ,
                closeBtn: 1
                ,
                skin: 'layui-layer-nobg'
                ,
                shadeClose: true
                ,
                area: [bigW + 'px', bigH + 'px']
                ,
                content: '<img src="' + imgSrc + '" width="' + bigW + '" height="' + bigH + '"/>'
                ,
                scrollbar: true
              })

              /////////////
            });

          })
        } else {
          layer.msg("只能上传一张照片", {icon: 2, time: 1500});
        }

      }
      // , before: function (obj) {
      //   //   var files = obj.pushFile();
      //   layer.load();
      //   //  预读本地文件示例，不支持ie8
      //   obj.preview(function (index, file, result) {
      //     $('#demo2').append('<img src="' + result + '" alt="' + file.name
      //         + '" class="layui-upload-img">')
      //     //  alert(index)
      //   });
      // }

      , error: function (index, upload) {
        layer.closeAll('loading'); //关闭loading
        alert("上传失败")
      },
      done: function (res) {
        layer.closeAll('loading');
        //上传完毕
        if (res.data.res == "success") {
          layer.msg("上传成功", {icon: 1, time: 1500});
          $("#uploadListAction").attr("disabled", true);
          $("#uploadListAction").addClass("layui-btn-disabled");
          $("#deleteImage").hide();

        } else {
          layer.msg("上传失败请联系统开发者", {icon: 2, time: 1500});
        }
      }
    });

    // var mUser = admin.getLayerData('#modelUserForm').user;  // 列表页面传递的数据，#modelUserForm这个只要写弹窗内任意一个元素的id即可
    // // 回显数据
    // form.val('modelUserForm', mUser);

    // 表单提交事件
    form.on('submit(modelSubmitUser)', function (data) {
      layer.load(2);
      //
      var url = "/party/addParty";
      $.post(url, data.field, function (res) {
        layer.closeAll('loading');
        if (res.data.res == true) {
          layer.msg(res.data.msg, {icon: 1});
          admin.putLayerData('formOk', true, '#modelUserForm');  // 设置操作成功的标识，#modelUserForm这个只要写弹窗内任意一个元素的id即可
          admin.closeDialog('#modelUserForm');  // 关闭页面层弹窗
        } else {

          layer.msg(res.data.msg, {icon: 2});
        }
      }, 'json');
      return false;
    });

  });

  // function delete1(index) {
  //   var $ = layui.jquery;
  //   //alert(files[0])
  //   $(index).remove();
  //   //$(index).parent().remove();
  // }

</script>