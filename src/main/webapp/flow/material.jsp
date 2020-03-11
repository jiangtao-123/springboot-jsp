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
        <li class="layui-this">志愿书</li>
        <li>入党申请书</li>
        <li>政治审查材料</li>
        <li>转正申请书</li>
        <li>培训教育考察资料</li>
    </ul>
    <div class="layui-tab-content bg-white">
        <div class="layui-tab-item layui-show">
            <form id="modelUserForm" lay-filter="modelUserForm" class="layui-form ">
                <div class="layui-fluid">

                    <div class="layui-form-item text-right">
                        <%--<button class="layui-btn layui-btn-primary" type="button"--%>
                        <%--ew-event="closePageDialog">取消--%>
                        <%--</button>--%>
                        <div class="layui-card">
                            <!--<div class="layui-card-header">确定入党积极分子公示:</div>-->
                            <div class="layui-card-body">


                                <div class="layui-form-item layui-form-text">

                                    <div class="layui-input-block1">
                                        <!--                                    <textarea name="desc" placeholder="请输入" class="layui-textarea" lay-verify="required" required rows="10"></textarea>-->
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-form-required">入党志愿书</label>
                                            <div class="layui-input-block" id="zysImge">
                                                <%--<img src="" width="100" height="100"/>--%>
                                            </div>

                                        </div>
                                        <div class="layui-inline">
                                            <label class="layui-form-label layui-form-required">发展对象谈话记录表</label>
                                            <div class="layui-input-block">
                                                <textarea id="demoEditor"
                                                          name="demoEditor"></textarea>
                                            </div>
                                        </div>


                                    </div>
                                </div>

                            </div>
                        </div>
                        <button class="layui-btn " id="print1" lay-filter="print1"
                                lay-submit>
                            打印
                        </button>
                        <input type="hidden" id="issubmit" value=""/>
                        <%--<button id="savePartymain" class="layui-btn"--%>
                        <%--lay-filter="savePartymain"--%>
                        <%--lay-submit>保存--%>
                        <%--</button>--%>
                    </div>
                </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-form-item text-right">
                <div style="float:left">

                    <div class="layui-card-body">


                        <div class="layui-input-block1">
                            <div class="layui-inline">
                                <label class="layui-form-label layui-form-required">入党申请书</label>
                                <div class="layui-input-block" id="sqsImge"></div>
                            </div>
                        </div>
                        <div class="layui-input-block1">
                            <div>
                            </div>
                        </div>

                    </div>
                    <%--<input type="hidden" id="subImage" value=""/>--%>
                    <button class="layui-btn " lay-filter="print2" id="print2"
                            lay-submit>打印
                        <%--<button id="saveImage" class="layui-btn" lay-filter="add"--%>
                        <%--lay-submit>保存--%>
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-form-item text-right">
                <div style="float:left">

                    <div class="layui-card-body">


                        <div class="layui-form-item layui-form-text">

                            <div class="layui-input-block1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-form-required">政治审查表</label>
                                    <div class="layui-input-block" id="scbImge">
                                        <%--<img src="" width="100" height="100"/>--%>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-form-required">政审外调函</label>
                                    <div class="layui-input-block">
                                                <textarea id="demoEditor1"
                                                          name="demoEditor1"></textarea>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-form-required">政治审查情况报告</label>
                                    <div class="layui-input-block">
                                                <textarea id="demoEditor2"
                                                          name="demoEditor2"></textarea>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <%--<input type="hidden" id="subImage" value=""/>--%>
                        <button class="layui-btn " lay-filter="print3" id="print3"
                                lay-submit>打印
                        </button>

                        <%--<button id="saveImage" class="layui-btn" lay-filter="add"--%>
                        <%--lay-submit>保存--%>
                        <%--</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-form-item text-right">
                <div style="float:left">

                    <div class="layui-card-body">


                        <div class="layui-form-item layui-form-text">

                            <div class="layui-input-block1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-form-required">转正申请书</label>
                                    <div class="layui-input-block" id="zzImge">
                                        <%--<img src="" width="100" height="100"/>--%>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <%--<input type="hidden" id="subImage" value=""/>--%>
                    <button class="layui-btn" lay-filter="print4" id="print4"
                            lay-submit>打印
                        <%--<button id="saveImage" class="layui-btn" lay-filter="add"--%>
                        <%--lay-submit>保存--%>
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-form-item text-right">
                <div style="float:left">

                    <div class="layui-card-body">


                        <div class="layui-form-item layui-form-text">

                            <div class="layui-input-block1">
                                <div class="layui-inline">
                                    <label class="layui-form-label layui-form-required">培训合格结业证书</label>
                                    <textarea id="demoEditor3"
                                              name="demoEditor3"></textarea>
                                    <%--<img src="" width="100" height="100"/>--%>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <input type="hidden" id="subImage" value=""/>
                <button class="layui-btn" lay-filter="print5" id="print5"
                        lay-submit>打印
                    <%--<button id="saveImage" class="layui-btn" lay-filter="add"--%>
                    <%--lay-submit>保存--%>
                </button>
            </div>
        </div>
    </div>
    <button class="layui-btn layui-btn-primary " type="button"
            ew-event="closePageDialog">
        取消
    </button>
    </form>

</div>


<!-- js部分 -->
<%--<script type="text/javascript" src="../../assets/libs/layui/layui.js"></script>--%>
<%--<script type="text/javascript" src="../../assets/js/common.js?v=316"></script>--%>
<%--<script type="text/javascript" src="../../assets/libs/tinymce/tinymce.min.js"></script>--%>
<script>
  layui.use(['layer', 'form', 'printer', 'admin', 'laydate', 'upload', 'element'],
      function () {
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
        //初始化富文本编辑框
        inittinymce('demoEditor');
        inittinymce('demoEditor1');
        inittinymce('demoEditor2');
        inittinymce('demoEditor3');

        function inittinymce(id) {
          tinymce.init({
            selector: '#' + id,
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

        }

        function getImage(obj) {
          var html = "";
          for (var i in obj) {
            // alert(obj[i])
            html += "<img src='" + obj[i]
                + "' width='100' height='100' onclick='see(this)' />";
          }
          // alert(html)
          return html;

        }

        // function see(obj) {
        //   alert(obj.width)
        // }

        $.post("/flow/getgdInfo", {id: id, nodeId: nodeId}, function (data) {
          tinymce.get('demoEditor').setContent(data.rdzyjlb);
          tinymce.get('demoEditor1').setContent(data.zswdh);
          tinymce.get('demoEditor2').setContent(data.zzscqk);
          $("#zysImge").html(getImage(data.zysImge));
          $("#sqsImge").html(getImage(data.sqsImge))
          $("#scbImge").html(getImage(data.scbImge));
          //alert(setImage(data.zzImge))
          $("#zzImge").html(getImage(data.zzImge));
          tinymce.get('demoEditor3').setContent(data.hgImge);

        });
        form.on('submit(print1)', function (data) {
          //  alert(JSON.stringify(data.field))
          var ct = tinymce.get('demoEditor').getContent() + $("#zysImge").html();
          printer.printHtml({
            html: ct
          });
          // return false;

          return false;

        });
        form.on('submit(print2)', function (data) {
          //  alert(JSON.stringify(data.field))
          // alert("打印入党志愿书");
          var ct = $("#sqsImge").html();
          printer.printHtml({
            html: ct
          });
          // return false;

          return false;

        });
        form.on('submit(print3)', function (data) {
          //  alert(JSON.stringify(data.field))
          // alert("打印入党志愿书");
          var ct = $("#scbImge").html() + tinymce.get('demoEditor1').getContent()
              + tinymce.get('demoEditor2').getContent();
          printer.printHtml({
            html: ct
          });
          // return false;

          return false;

        });
        form.on('submit(print4)', function (data) {
          //  alert(JSON.stringify(data.field))
          // alert("打印入党志愿书");
          var ct = $("#zzImge").html();
          printer.printHtml({
            html: ct
          });
          // return false;

          return false;

        });
        form.on('submit(print5)', function (data) {
          //  alert(JSON.stringify(data.field))
          // alert("打印入党志愿书");
          var ct = tinymce.get('demoEditor3').getContent();
          printer.printHtml({
            html: ct
          });
          // return false;

          return false;

        });
        return false;

      })
  ;


</script>

