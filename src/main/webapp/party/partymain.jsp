<%@ page import="com.dongtech.bs.entity.Stage" %>
<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
    List<Stage> stageList = (List<Stage>) request.getAttribute("stageList");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>党员管理</title>
    <link rel="stylesheet" href="/assets/libs/layui/css/layui.css"/>
    <link rel="stylesheet" href="/assets/module/admin.css?v=316"/>
    <!--[if lt IE 9]>
    <script src="/assets/libs/jquery/jquery-3.2.1.min.js"></script>
    <script src="/assets/libs/IE9/html5shiv.min.js"></script>
    <script src="/assets/libs/IE9/respond.min.js"></script>

    <![endif]-->
    <script src="/camsdk/js/globeVar.js"></script>
    <script src="/camsdk/js/mainH5.js"></script>
    <script src="/camsdk/js/WebSocket.js"></script>
    <script type="text/javascript" src="/assets/libs/tinymce/tinymce.min.js"></script>
    <!--页面逻辑-->
    <script src="/camsdk/js/SingleCamera.js"></script>
    <style>
        .layui-table-cell {
            height: auto;
        }

        /*自动高度, 图片才能显示*/
        /*此页面需要单独配置css 勿删*/
        .layui-form-label {
            width: 100px;
        }

        .layui-input-block {
            margin-left: 130px;
        }

        .layui-upload-img {
            width: 92px;
            height: 92px;
            margin: 0 10px 10px 0;
        }

    </style>
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
                        <label class="layui-form-label w-auto">姓名：</label>
                        <div class="layui-input-inline mr0">
                            <input name="name" class="layui-input" type="text"
                                   placeholder="输入姓名"/>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label w-auto">申请阶段：</label>
                        <div class="layui-input-inline mr0">
                            <select name="stageId">
                                <option value="">全部</option>
                                <%
                                    if (null != stageList) {
                                        for (Stage s : stageList) { %>}
                                <option value="<%=s.getId()%>"><%=s.getName()%>
                                </option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <button class="layui-btn icon-btn" lay-filter="formSubSearchRole"
                                lay-submit>
                            <i class="layui-icon">&#xe615;</i>搜索
                        </button>
                    </div>
                    <div class="layui-inline pull-right">
                        <button id="btnAddDy" class="layui-btn icon-btn"><i class="layui-icon">&#xe654;</i>添加
                        </button>
                    </div>
                </div>
            </div>

            <table id="tableRole" lay-filter="tableRole"></table>
        </div>
    </div>
</div>

<!-- 表格操作列 -->
<script type="text/html" id="tableBarRole">
    <a class="layui-btn layui-btn-default layui-btn-xs" lay-event="Handle">办理</a>
    <a class="layui-btn layui-btn-default layui-btn-xs" lay-event="see">查看</a>
    <a class="layui-btn layui-btn-default layui-btn-xs" lay-event="edit">编辑</a>
    </br>
    <a class="layui-btn layui-btn-default layui-btn-xs" lay-event="delete">删除</a>
    <a class="layui-btn layui-btn-default layui-btn-xs" lay-event="track">流程跟踪</a>

    <!--<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>-->
    <!--<a class="layui-btn layui-btn-xs" lay-event="auth">权限分配</a>-->
</script>


<!-- js部分 -->
<script type="text/javascript" src="/assets/libs/layui/layui.js"></script>
<script type="text/javascript" src="/assets/js/common.js?v=316"></script>
<script>
  function see(url) {
    //var admin = layui.admin;
    layer = layui.layer
    // layer.msg('<img src="' + url.src
    //     + '" style="width: 10000px;max-height: 100%;max-width: 100%" />')
    $ = layui.jquery
    var imgSrc = $(url).attr('src')
        , width = $(url).width()
        , height = $(url).height()
        , scaleWH = width / height
        , bigH = $(window).height() - 60
        , bigW = scaleWH * bigH
    if (bigW > 1000) {
      bigW = 1000
      bigH = bigW / scaleWH
    }
    layer.open({
      type: 1
      , title: false
      , closeBtn: 1
      , skin: 'layui-layer-nobg'
      , shadeClose: true
      , area: [bigW + 'px', bigH + 'px']
      , content: '<img src="' + imgSrc + '" width="' + bigW + '" height="' + bigH + '"/>'
      , scrollbar: true
    })

  }

  layui.use(['layer', 'form', 'table', 'util', 'admin', 'zTree',], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var util = layui.util;
    var admin = layui.admin;

    // 渲染表格
    var insTb = table.render({
          elem: '#tableRole',
          url: '/party/getPartyList',
          page: true,
          cellMinWidth: 20,
          cols: [[
            {type: 'numbers'},
            // {field: 'roleName', sort: true, title: '照片'},
            {field: 'id', title: 'id', hide: true, width: 120},
            {field: 'nodeId', title: 'nodeId', hide: true},
            {field: 'examine', title: 'examine', hide: true},
            {
              field: 'picture', title: '照片', width: 60, templet: function (d) {
                return "<img src='" + d.picture + "'width='30px'onclick='see(this)'>";
              }
            },
            {
              field: 'name', sort:
                  true, title:
                  '姓名'
            }
            ,
            {
              field: 'branchName', sort:
                  true, title:
                  '所属支部'
            }
            ,
            {
              field: 'age', sort:
                  true, title:
                  '年龄', minWidth:
                  50
            }
            ,
            {
              field: 'sex', sort:
                  true, title:
                  '性别', minWidth:
                  50
            }
            ,
            {
              field: 'stageName', sort:
                  true, title:
                  '所属阶段',
              minWidth:
                  120
            }
            ,
            {
              field: 'nodeName', sort:
                  true, title:
                  '当前待办', minWidth:
                  120
            }
            ,
            {
              field: 'nextTime', sort:
                  true,
              // templet:

              // function (d) {
              //   return util.toDateString(d.createTime);
              // }

              // ,
              title: '下阶段时间'
            }
            ,//时间戳转字符
            {
              align: 'center', toolbar:
                  '#tableBarRole', title:
                  '操作', minWidth:
                  200
            }
          ]]
        })
    ;

    // 添加
    $('#btnAddDy').click(function () {
      showEditModel();
    });

    // 搜索
    form.on('submit(formSubSearchRole)', function (data) {
      //  alert(JSON.stringify(data.field))
      insTb.reload({where: data.field}, 'data');
    });

    // 工具条点击事件
    table.on('tool(tableRole)', function (obj) {

          var data = obj.data;
          var layEvent = obj.event;
          if (layEvent === 'edit') { // 修改
            EditModel(data);
          }
          if (layEvent == "track") {//流程跟踪页面
            var layIndex = admin.open({
              // type: 2,
              id: "pertyWindow",
              title: "流程跟踪",
              // content: 'dyAdd.html',
              // url: 'dyAdd.html',
              url:
                  '/flow/toTrack',
              // area:['60%','auto'],
              area:
                  '740px',
              data:
                  {
                    id: data.id,
                    nodeId: data.nodeId
                  }
              ,       // 使用data参数传值给弹窗页面

              success: function (layero, dIndex) {
                form.render();
                // 弹窗超出范围不出现滚动条
                // $(layero).children('.layui-layer-content').css('overflow', 'visible');

              }
              ,
              end: function () {
                // if (admin.getLayerData(layIndex, 'formOk')) {  // 判断表单操作成功标识
                //  alert(1)
                insTb.reload();  // 成功刷新表格
                // }
              }
            });

          }
          if (layEvent == "delete") {
            layer.confirm('您确定要删除这条数据吗？', {
              btn: ['确定', '取消'] //按钮
            }, function () {
              layer.closeAll('dialog');
              $.post("/party/deleteById", {id: data.id}, function (data) {
                if (data) {
                  layer.msg("删除成功", {icon: 1, time: 1500}, function () {
                    insTb.reload();
                  });

                } else {
                  layer.msg("删除失败", {icon: 2, time: 1500}, function () {
                    // insTb.reload();
                  });
                }
              });
            });
          }
          if (layEvent == "Handle") {
            // alert("办理");
            // alert(data.id)
            // alert(data.nodeId)
            if (data.nodeId == "28" || data.nodeId == 28) {
              layer.msg("流程已经正常审批结束", {icon: 2, time: 1500}, function () {
              });

              return;
            }
            if (data.examine == "2" || data.examine == 2) {
              layer.msg("入党申请书未通过，流程结束", {icon: 2, time: 1500}, function () {
              });

              return;
            }
            var layIndex = admin.open({
                  // type: 2,
                  id: "addWindow",
                  title: data.nodeName,
                  // content: '<textarea id="demoEditor2"></textarea>',
                  // content: 'dyAdd.html',
                  // url: 'dyAdd.html',
                  url:
                  '/flow/tohandleFlowPage?id=' + data.id + '&nodeId=' + (data.nodeId == 28 ? 27
                      : data.nodeId),
                  // area:['60%','auto'],
                  area:
                      '740px',
                  data:
                      {
                        id: data.id,
                        nodeId: data.nodeId
                      }
                  ,       // 使用data参数传值给弹窗页面

                  success: function (layero, dIndex) {
                    form.render();
                    // tinymce.init({
                    //   selector: '#demoEditor2'
                    // });
                    // 弹窗超出范围不出现滚动条
                    // $(layero).children('.layui-layer-content').css('overflow', 'visible');

                  }
                  ,
                  end: function () {

                    // if (admin.getLayerData(layIndex, 'formOk')) {  // 判断表单操作成功标识

                    // $.post("/party/closeExe");

                    insTb.reload();  // 成功刷新表格
                    tinymce.get('demoEditor').destroy(false);
                    tinymce.get('demoEditor2').destroy(false);
                    tinymce.get('demoEditor1').destroy(false);
                    tinymce.get('demoEditor3').destroy(false);
                    // }
                  }
                })
            ;
          }
          if (layEvent == "see") {
            //   alert("查看");

            seeData(data);
          }
          /*else if (layEvent === 'del') { // 删除
                         doDel(obj);
                     } else if (layEvent === 'auth') {  // 权限管理
                         showPermModel(data.roleId);
                     }*/
        }
    );

//查看数据
    function seeData(data) {
      // alert(data.id);
      // alert(JSON.stringify(data));
      var layIndex = admin.open({
            // type: 2,
            id: "seeWindow",
            title: '查看党员',
            // content: 'dyAdd.html',
            // url: 'dyAdd.html',
            url:
                '/party/toSeeParty',
            // area:['60%','auto'],
            area:
                '740px',
            data:
                {
                  user: data
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
                // alert(1)
                insTb.reload();  // 成功刷新表格
              }
            }
          })
      ;
    }

//显示编辑窗口
    function EditModel(mRole) {
      //alert(6666);
      if (mRole.nodeId == "28" || mRole.nodeId == 28) {
        layer.msg("流程已经正常审批结束", {icon: 2, time: 1500}, function () {
        });
        return;
      }
      var layIndex = admin.open({
            // type: 2,
            id: "editWindow",
            title: ('修改') + '党员',
            // content: 'dyAdd.html',
            // url: 'dyAdd.html',
            url:
                '/party/toEditParty',
            // area:['60%','auto'],
            area:
                '740px',
            data:
                {
                  user: mRole
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
                // alert(1)
                insTb.reload();  // 成功刷新表格
              }
            }
          })
      ;
    }

    // 显示  添加 url弹窗
    function showEditModel(mRole) {
      // if (mRole) {
      //
      //   alert(JSON.stringify(mRole));
      //   alert(mRole.id);//获取id;
      // }

      var layIndex = admin.open({
            // type: 2,
            id: "addWindow",
            title: ('添加') + '党员',
            // content: 'dyAdd.html',
            // url: 'dyAdd.html',
            url:
                '/party/toAddParty',
            // area:['60%','auto'],
            area:
                '740px',
            data:
                {
                  user: mRole
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
                // alert(1)
                insTb.reload();  // 成功刷新表格
              }
            }
          })
      ;

    }

  })
  ;
</script>

</body>
</html>