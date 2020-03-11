<%@ page import="com.dongtech.bs.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
    UserEntity userEntity = (UserEntity) request.getSession().getAttribute("userInfo");
%>
<style>
    /*.step-item{ position: relative; width: 25%; float: left;}*/
    /*.step-item > div{ position: relative; background: #000;}*/
    /*.step-item:after{*/
    /*    position: absolute;*/
    /*    width: 100%; height: 1px;*/
    /*    top: 50%;*/
    /*    content: ' ';*/
    /*    background: red;*/

    /*}*/

    .lay-step {
        font-size: 0;
        /*width: 400px;*/
        margin: 0 auto;
        margin-left: 15%;
        max-width: 100%;
        /*padding-left: 200px;*/
        padding: 0 5%;
        overflow: hidden;
    }

    .step-item {
        display: inline-block;
        /*line-height: 26px;*/
        position: relative;
        font-size: 14px;
        width: 25%;
        margin: 56px 0%;
        float: left;
    }

    .step-item:nth-child(8n+4) {
    }

    .step-item:nth-child(8n+4) .step-item-tail {
        width: 1px;
        height: 160px;
    }

    .step-item:nth-child(8n+4) .step-item-tail i {
        height: 160px;
        border-left: 1px solid #ccc;
    }

    .step-item:nth-child(8n+4) {
    }

    .step-item:nth-child(8n+4) .step-item-tail {
        width: 1px;
        height: 160px;
    }

    .step-item:nth-child(8n+4) .step-item-tail i {
        height: 146px;
        border-top: 0;
    }

    .step-item:nth-child(8n+4) .step-item-tail:after {
        bottom: 0;
        transform: rotate(90deg) !important;
        left: 2px !important;
        top: auto;
    }

    .step-item:nth-child(8n+5) {
    }

    .step-item:nth-child(8n+5) .step-item-tail {
        width: 1px;
        height: 160px;
    }

    .step-item:nth-child(8n+5) .step-item-tail i {
        height: 160px;
        border-left: 0;
    }

    .step-item:nth-child(8n+5) .step-item-tail:after {
        display: none;
    }

    .step-item:nth-child(8n+8) {
    }

    .step-item:nth-child(8n+8) .step-item-tail {
        width: 100%;
        height: 160px;
    }

    .step-item:nth-child(8n+8) .step-item-tail i {
        height: 146px;
        border-left: 1px solid #ccc;
        left: 13px;
    }

    .step-item:nth-child(8n+8) .step-item-tail:after {
        bottom: 0;
        transform: rotate(90deg) !important;
        left: 6px !important;
        top: auto;
    }

    .step-item:nth-child(8n+8) .step-item-tail:before {
        font-family: layui-icon;
        content: '\e623';

        transform: rotate(180deg) !important;

        position: absolute;
        left: 24px;
        top: -11px;
        z-index: 9;
    }

    .step-item:nth-child(8n+5),
    .step-item:nth-child(8n+6),
    .step-item:nth-child(8n+7),
    .step-item:nth-child(8n+8) {
        float: right;
    }

    .step-item:nth-child(8n+5) .step-item-tail:after,
    .step-item:nth-child(8n+6) .step-item-tail:after,
    .step-item:nth-child(8n+7) .step-item-tail:after,
    .step-item:nth-child(8n+8) .step-item-tail:after {
        right: auto;
        left: 8px;
        transform: rotate(180deg);
    }

    .step-item:nth-child(8n+5) .step-item-tail,
    .step-item:nth-child(8n+6) .step-item-tail,
    .step-item:nth-child(8n+7) .step-item-tail,
    .step-item:nth-child(8n+8) .step-item-tail {
        left: auto;
        right: 0;
        padding: 0;
    }

    /*.step-item:nth-child(8n+5) .step-item-tail:before,*/
    /*.step-item:nth-child(8n+6) .step-item-tail:before,*/
    /*.step-item:nth-child(8n+7) .step-item-tail:before,*/
    /*.step-item:nth-child(8n+8) .step-item-tail:before{*/
    /*    font-family: layui-icon;*/
    /*    content:'\e623';*/
    /*    position: absolute; left: 0px;top: -11px;*/
    /*}*/

    .step-item-tail {
        width: 95%;
        padding: 0 10px;
        position: absolute;
        left: 0;
        /*top: 13px;*/
        top: 61px;
        /*z-index: 9;*/
    }

    .step-item-tail:after {
        font-family: layui-icon;
        content: '\e623';
        /*width: 30px;height: 30px;*/

        position: absolute;
        right: 0px;
        top: -12px;

    }

    .step-item-tail i {
        display: inline-block;
        width: 100%;
        height: 0px;
        vertical-align: top;
        /*background: #c2c2c2;*/
        border-top: 1px solid #ccc;
        position: relative;
    }

    .step-item-tail .step-item-tail-done {
        background: #009688;
    }

    .step-item-head {
        position: relative;
        display: inline-block;
        height: 26px;
        width: 26px;
        text-align: center;
        vertical-align: top;
        color: #009688;
        border: 1px solid #009688;
        border-radius: 50%;
        background: #ffffff;
    }

    .step-item-head.step-item-head-active {
        background: #009688;
        color: #ffffff;
        z-index: 10;
    }

    .step-item-main {
        display: block;
        position: relative;
        margin-left: -50%;
        margin-right: 50%;
        padding-left: 26px;
        text-align: center;
    }

    .step-item-main-title {
        font-weight: bolder;
        color: #555555;
    }

    .step-item-main-date {
        /*font-weight: bolder;*/
        color: #555555;
    }

    .step-item-main-desc {
        color: #aaaaaa;
    }

    .lay-step + [carousel-item]:before {
        display: none;
    }

    .lay-step + [carousel-item] > * {
        background-color: transparent;
    }

    @media screen and (max-width: 1060px) {
        .lay-step {
            padding-left: 50px !important;
        }
    }
</style>
<form class="layui-form model-form" id="modelUserForm">
    <div class="layui-fluid" style="width: 80%;">
        <div class="layui-card">
            <!--<div class="layui-card-header">新增入党申请人:</div>-->
            <div class="layui-card-body">
                <!--<div class="steps layui-clear">
                    <div class="step-item step1">
                        <div>
                            <p> <span class="layui-badge">1</span></p>
                            <p>2020-02-02</p>
                            <p>递交入党申请书</p>
                            <p><span class="layui-badge-green">通过</span></p>
                        </div>
                    </div>
                </div>-->
                <div class="lay-step">
                    <!--                    <div class = "step-item" >-->
                    <!--                        <div class = "step-item-main" >-->
                    <!--                            <div class = "step-item-main-date" >2019-02-02</div >-->
                    <!--                            <div class = "step-item-main-date" >填写转账信息</div >-->
                    <!--                        </div >-->
                    <!--                        <div class = "step-item-tail" ><i class = "" ></i ></div >-->
                    <!--                        <div class = "step-item-head step-item-head-active" ><i class = "layui-icon" >1</i ></div >-->
                    <!--                        <div class = "step-item-main" >-->
                    <!--                            <p>2019-02-02</p>-->
                    <!--                            <p>通过</p>-->
                    <!--                        </div >-->
                    <!--                    </div >-->


                </div>
            </div>
        </div>
        <button class="layui-btn layui-btn-primary" type="button"
                ew-event="closePageDialog">取消
        </button>
</form>
<script src="/assets/libs/jquery/jquery-3.2.1.min.js"></script>
<%--<script type="text/javascript" src="../assets/libs/layui/layui.js"></script>--%>
<%--<script type="text/javascript" src="/assets/js/common.js?v=316"></script>--%>

<%--<script type="text/javascript" src="/assets/libs/layui/lay/modules/layer.js"></script>--%>
<script>
  layui.use(['layer', 'form', 'table', 'util', 'admin',], function () {
    var $ = layui.jquery;
    var layer = layui.layer;
    var form = layui.form;
    var table = layui.table;
    var util = layui.util;
    var admin = layui.admin;
    var id = admin.getLayerData('#modelUserForm').id;
    // alert(id)
    var nodeId = admin.getLayerData('#modelUserForm').nodeId - 1;
    $.post('/flow/getnodeInfo', {id: id, nodeId: nodeId}, function (data) {
          // alert(data.nodeVos.length)
          var stepHtml = '';
          var dd = data.nodeVos;
          // alert(data.nodeId)
          for (var i in dd) {
            // alert(dd[i].nodeName)
            // var t = ();
            var cla = "";
            // alert(dd[i].nodeId + ":" + data.nodeId)
            // alert(Number(dd[i].nodeId) <= (Number(data.nodeId) + 1))
            if (Number(dd[i].nodeId) <= (Number(data.nodeId) + 1)) {
              cla = "step-item-head-active";
            }
            // alert(cla)
            stepHtml += '<div class = "step-item" >' +
                '                        <div class = "step-item-main" >' +
                '  '
                +
                '                            <div class = "step-item-main-date" >' + dd[i].nodeName
                + '</div >' +
                '                        </div >' +
                '                        <div class = "step-item-tail" ><i class = "" ></i ></div >'
                +
                '                        <div class = "step-item-head  ' + cla
                + '" ><i class = "layui-icon" >'
                + i + '</i ></div >' +
                '                        <div class = "step-item-main" >' +
                '                            <p><span>' + (dd[i].option == null ? "" : dd[i].option)
                + '</span>' + (dd[i].time == null ? "" : dd[i].time) + '</p>'
                +
                '                        </div >' +
                '                    </div >';
          }
          $('.lay-step').append(stepHtml);
        }
    );
  });
</script>





