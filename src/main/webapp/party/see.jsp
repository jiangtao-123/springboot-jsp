<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.dongtech.bs.entity.Branch" %>
<%@ page import="com.dongtech.bs.entity.Nation" %>
<%@ page import="com.dongtech.bs.entity.Node" %>
<%@ page import="com.dongtech.bs.entity.Stage" %>
<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
    Map<String, Node> nodeMap = (Map<String, Node>) request.getAttribute("nodeInfo");
    // Stage stage = (Stage) request.getAttribute("stage");
    List<Branch> branchList = (List<Branch>) request.getAttribute("branch");
    List<Nation> nationList = (List<Nation>) request.getAttribute("nation");
    List<Stage> stageList = (List<Stage>) request.getAttribute("stageList");
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
                            <input name="name" disabled
                                   type="text" placeholder="请输入姓名"
                                   class="layui-input"
                                   lay-verType="tips" lay-verify="required" required/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">性别</label>
                        <div class="layui-input-inline">
                            <input type="radio" name="sex" disabled value="1" title="男" checked>
                            <input type="radio" name="sex" disabled value="2" title="女">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">出生年月</label>
                        <div class="layui-input-block">
                            <input type="text" disabled name="birthday" id="birthday"
                                   placeholder="请选择"
                                   class=" layui-input date-icon" autocomplete="off"
                                   lay-verType="tips" lay-verify="required"
                                   required/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">民族</label>
                        <div class="layui-input-block">
                            <select lay-search disabled name="nation" lay-verType="tips"
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
                            <select disabled name="education" lay-verType="tips"
                                    lay-verify="required"
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
                            <input disabled name="phone" type="text" placeholder="手机号"
                                   class="layui-input " lay-verType="tips"
                                   lay-verify="phone"/>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">申请入党时间</label>
                        <div class="layui-input-block">
                            <input disabled type="text" name="joinTime" id="joinTime"
                                   placeholder="请选择"
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
                            <select disabled lay-search name="branchId" lay-verType="tips"
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
                                <%
                                    if (null != stageList) {
                                        for (Stage s : stageList) {
                                %>
                                <option value="<%=s.getId()%>"><%=s.getName()%>
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
                        <label class="layui-form-label layui-form-required">当前待办</label>
                        <div class="layui-input-block">
                            <select disabled="disabled" name="nodeId" lay-verType="tips"
                                    lay-verify="required"
                                    required>
                                <%for (Map.Entry<String, Node> entry : nodeMap.entrySet()) { %>
                                <option value="<%=entry.getValue().getId()%>"><%=entry.getValue()
                                        .getNodeInfo()%>
                                </option>
                                <%--<option value="1">上传入党申请书</option>--%>
                                <%}%>
                            </select>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label layui-form-required">下阶段时间</label>
                        <div class="layui-input-block">
                            <input type="text" disabled name="nextTime" id="nextTime"
                                   placeholder="请选择"
                                   class=" layui-input date-icon" autocomplete="off"
                                   lay-verType="tips" lay-verify="required"
                                   required/>
                        </div>
                    </div>
                </div>
                <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                    <legend>头像显示</legend>
                </fieldset>

                <div class="layui-upload">

                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                        预览图：
                        <div class="layui-upload-list" id="demo2">
                            <img src="" id="showPhone" class="layui-upload-img">
                        </div>
                    </blockquote>
                </div>


            </div>
        </div>
        <div class="layui-form-item text-right">
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
    //  admin.getLayerData('#modelUserForm').user

    $.post("/party/getPartyById", {id: admin.getLayerData('#modelUserForm').user.id},
        function (mUser) {
          // alert(mUser.nodeId)
          form.val('modelUserForm', mUser);
          $("#showPhone").attr("src", mUser.picture);
          $("#showPhone").click(function () {

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
        });

    // admin.getLayerData('#modelUserForm').user;  // 列表页面传递的数据，#modelUserForm这个只要写弹窗内任意一个元素的id即可
    // 回显数据
    // alert(mUser.id);
    //
    // alert(JSON.stringify(mUser))
    // form.val('modelUserForm', mUser);

  });


</script>