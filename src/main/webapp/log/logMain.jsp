<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>日志管理</title>
    <link rel="stylesheet" href="/assets/libs/layui/css/layui.css"/>
    <link rel="stylesheet" href="/assets/module/admin.css?v=316"/>
    <script src="/assets/libs/jquery/jquery-3.2.1.min.js"></script>
    <script src="/assets/libs/IE9/html5shiv.min.js"></script>
    <script src="/assets/libs/IE9/respond.min.js"></script>
    <%--<script src="/assets/laydate/laydate.js"/>--%>
</head>
<body>
<!-- 页面加载loading -->
<div class="page-loading">
    <div class="ball-loader">
        <span></span><span></span><span></span><span></span>
    </div>
</div>

<!-- 正文开始 -->
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body">
            <div class="layui-form toolbar">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label w-auto">开始时间：</label>
                        <div class="layui-input-inline mr0">

                            <input name="startTime" class="layui-input" type="text"
                                   id="startTime"
                                   placeholder="输入开始时间"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label w-auto">结束时间：</label>
                        <div class="layui-input-inline mr0">

                            <input name="endTime" class="layui-input" type="text" id="endTime"
                                   placeholder="输入结束时间"/>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <button class="layui-btn icon-btn" lay-filter="formSubSearchRole"
                                lay-submit>
                            <i class="layui-icon">&#xe615;</i>搜索
                        </button>
                    </div>

                </div>
            </div>

            <table id="tableLog" lay-filter="tableLog"></table>
        </div>
    </div>
</div>

<!-- 表格操作列 -->
<script type="text/html" id="tableBarLog">
    <a class="layui-btn layui-btn-default layui-btn-xs" lay-event="edit">查看</a>
    <!--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>-->
    <!--<a class="layui-btn layui-btn-xs" lay-event="auth">权限分配</a>-->
</script>


<!-- js部分 -->
<script type="text/javascript" src="/assets/libs/layui/layui.js"></script>
<script type="text/javascript" src="/assets/js/common.js?v=316"></script>
<script>
  layui.use(['layer', 'form', 'table', 'util', 'admin', 'zTree', 'laydate'], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var util = layui.util;
    var admin = layui.admin;
    var laydate = layui.laydate;
    // laydate.render({
    //   elem: '#startTime', //指定元素
    //   type: 'datetime'
    // });
    // laydate.render({
    //   elem: '#endTime', //指定元素
    //   type: 'datetime'
    // });
    //开始时间id="start",结束时间id="end";
    var start = {
      elem: '#startTime',
      type: 'datetime',
      min: '2000-09-10',
      max: '2333-09-20',
      show: true,
      closeStop: '#startTime'

    };
    var end = {
      elem: '#endTime',
      type: 'datetime',
      min: '2000-09-10',
      max: '2333-09-20',
      show: true,
      closeStop: '#endTime'
    };
    lay('#startTime').on('click', function (e) {
      if ($('#endTime').val() != null && $('#endTime').val() != undefined && $('#endTime').val()
          != '') {
        start.max = $('#endTime').val();
      }
      laydate.render(start);
    });
    lay('#endTime').on('click', function (e) {
      if ($('#startTime').val() != null && $('#startTime').val() != undefined && $(
          '#startTime').val() != '') {
        end.min = $('#startTime').val();
      }
      laydate.render(end);
    });

    // 渲染表格
    var insTb = table.render({
      elem: '#tableLog',
      url: '/log/getLogData',
      page: true,
      cellMinWidth: 100,
      cols: [[
        {type: 'numbers'},
        {field: 'system', sort: true, title: '系统来源'},
        {
          field: 'user', sort: true, title: '用户名称', templet: function (d) {
            var t = "未登录";
            if ("null" != d.user) {
              t = d.user;
            }
            // alert(t)
            return t;
          }
        },
        {field: 'methodpath', sort: true, title: '操作代码'},
        {field: 'description', sort: true, title: '操作名称'},
        {
          field: 'cratetime', sort: true, templet: function (d) {
            return util.toDateString(d.cratetime);
          }, title: '操作时间'
        },//时间戳转字符
        {field: 'state', sort: true, title: '操作状态'},
        {field: 'description', sort: true, title: '操作说明'},

        {align: 'operation', toolbar: '#tableBarLog', title: '操作', minWidth: 80}
      ]]
    });

    // 搜索
    form.on('submit(formSubSearchRole)', function (data) {
      insTb.reload({where: data.field}, 'data');
    });

    // 工具条点击事件
    table.on('tool(tableLog)', function (obj) {
      //alert("查看")
      var data = obj.data;
      var layEvent = obj.event;
      if (layEvent === 'edit') { // 修改
        showEditModel(data);
      }
      /*else if (layEvent === 'del') { // 删除
                     doDel(obj);
                 } else if (layEvent === 'auth') {  // 权限管理
                     showPermModel(data.roleId);
                 }*/
    });

// 显示  添加/编辑 url弹窗
    function showEditModel(mRole) {
      // alert(JSON.stringify(mRole));
      // alert(mRole.cratetime);//获取id;
      var layIndex = admin.open({
            // type: 2,
            id: "pertyWindow",
            title: '查看日志详情',
            // content: 'dyAdd.html',
            // url: 'dyAdd.html',
            url: "/log/toseeLog",

            // area:['60%','auto'],
            area:
                '740px',
            data:
                {
                  log: mRole
                }
            ,       // 使用data参数传值给弹窗页面

            success: function (layero, dIndex) {
              form.render();
              // 弹窗超出范围不出现滚动条
              // $(layero).children('.layui-layer-content').css('overflow', 'visible');

            }
            ,
            end: function () {
              if (admin.getLayerData(layIndex, 'formOk')) {  // 判断表单操作成功标识
                alert(1)
                insTb.reload();  // 成功刷新表格
              }
            }
          })
      ;

    }
  });
</script>

</body>
</html>