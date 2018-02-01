<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/1
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%--<link href="css/plugins/summernote/summernote.css" rel="stylesheet">
<link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">--%>



<!-- Toastr script -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
    $(function () {
        /*var markupStr = 'hello world';
        $('.summernote').summernote('code', markupStr);*/

        $.get("article/loadCategory", function (data) {
            var select = $("#category2");
            /* console.info(data); */
            var opt = $("<option></option>").attr("value", "").html("--请选择类别--");
            select.append(opt);
            $.each(data, function (i, item) {
                console.info(item.catgId + "==" + item.catgName);
                var option = $("<option></option>").attr("value", item.catgId)
                    .html(item.catgName);
                select.append(option);
            });
        }, "json");
    })

    $(function() {
        var getMessage = function() {
            var msg = '保存成功！保存成功！保存成功！';
            return msg;
        };

        $('#showtoast')
            .click(
                function() {
                    var shortCutFunction = 'success';
                    var msg = $('#message').val();//
                    toastr.options = {
                        "closeButton" : false,
                        "debug" : false,
                        "progressBar" : true,
                        "preventDuplicates" : true,
                        "positionClass" : "toast-bottom-center",
                        "showDuration" : "400",
                        "hideDuration" : "1000",
                        "timeOut" : "2000",
                        "extendedTimeOut" : "1000",
                        "showEasing" : "swing",
                        "hideEasing" : "linear",
                        "showMethod" : "fadeIn",
                        "hideMethod" : "fadeOut"
                    }
                    if ($('#addBehaviorOnToastClick').prop(
                            'checked')) {
                        toastr.options.onclick = function() {
                            alert('You can perform some custom action after a toast goes away');
                        };
                    }
                    if (!msg) {
                        msg = getMessage();
                    }
                    toastr.success(msg);
                    toastr[shortCutFunction](msg);

                });
    })

    $('.publishBlog').click(function() {
        var sHTML = $('.summernote').code();
        var category = $("#category option:selected").val();
        var title = $("#artiTitle").val();
        //console.info(sHTML+"00000000"+category+""+title);
        var json = {artiContent:sHTML,artiCatgId:category,artiTitle:title};
        //alert($("#category option:selected").val());//方法一：获取select标签选中的option中的value的值。
        //alert($("#category").find("option:selected").val());//方法二：获取select标签选中的option中的value的值。
        $.ajax({
            url: "article/save",
            type: "post",
            data: json,
            success: function(result) {
                console.info(result);
                if(result == "success"){
                    swal({
                        title : "发表成功",
                        text : "",
                        type : "success",
                        allowOutsideClick : true
                    });
                }
                //location = location;
            },
            error: function() {

            }
        });


    });

    $('.leave').click(function() {
        swal({
            title : "你确定离开吗？",
            text : "你将无法恢复这个虚构的文件！",
            type : "warning",
            showCancelButton : true,
            confirmButtonColor : "#ED5565",//DD6B55
            confirmButtonText : "是的，删除它！",
            cancelButtonText : "不，取消！",
            allowOutsideClick : true,
            closeOnConfirm : false,
            closeOnCancel : false
        }, function(isConfirm) {
            if (isConfirm) {
                swal("删除!", "你的虚构文件已被删除.", "success");
            } else {
                swal("取消", "你的虚构文件是安全的:):):)", "error");
            }
        });
    });
</script>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading panel-primary ">写博客</div>

            <div class="panel-body">
                <!-- pre-scrollable -->
                <div class="col-lg-2 ">
                    <select class="form-control" id="category2" name="catgId">
                    </select>
                </div>
                <div class="col-lg-10 ">
                    <%-- <c:forEach var="category" items="${artiCategory }" varStatus="status">

                    ${category.catgId }
                    </c:forEach> --%>
                    <%-- <input type="text" name="catgId" value="${catgId }"/> --%>
                    <input id="artiTitle" value="${article1.artiTitle }" type="text" class="form-control" placeholder="请输入文章标题" name="artiTitle">
                </div>
               <%-- <div class="col-lg-12">
                    <div class="summernote"></div>
                </div>--%>

                <div class="col-lg-8 ">
                    <button
                            class="col-lg-2 btn btn-outline btn-primary publishBlog"
                            type="submit">发表博客</button>
                    <button type="button"
                            class="col-lg-2 btn btn-outline btn-primary" id="showtoast">保存</button>
                    <button class="col-lg-2 btn btn-outline btn-danger leave"
                            type="submit">离开</button>
                </div>
            </div>

        </div>
    </div>
</div>


<%--
<!-- SUMMERNOTE -->
<script src="js/plugins/summernote/summernote.min.js"></script>

<script>
    $(document).ready(function() {

        $('.summernote').summernote({
            placeholder:"请对项目进行详细的描述，使更多的人了解你的",
            tabsize : 2,
            height : 300, // set editor height
            minHeight : null, // set minimum height of editor
            maxHeight : null, // set maximum height of editor
            focus: true
        });
        /* $('.summernote').summernote('focus');
        // @param {String} color
        $('.summernote').summernote('backColor', 'red');

        // @param {String} color
        $('.summernote').summernote('foreColor', 'blue'); */
        var markupStr1 = $('.summernote').summernote('code');
        console.info(markupStr1+"222222222222");
        /* 			$('.summernote').summernote('editor.insertText', 'hello world'); */
        var markupStr = 'hello world';
        $('.summernote').summernote('code', markupStr);
    });

    $(function() {
        var getMessage = function() {
            var msg = '保存成功！保存成功！保存成功！';
            return msg;
        };

        $('#showtoast')
            .click(
                function() {
                    var shortCutFunction = 'success';
                    var msg = $('#message').val();//
                    toastr.options = {
                        "closeButton" : false,
                        "debug" : false,
                        "progressBar" : true,
                        "preventDuplicates" : true,
                        "positionClass" : "toast-bottom-center",
                        "showDuration" : "400",
                        "hideDuration" : "1000",
                        "timeOut" : "2000",
                        "extendedTimeOut" : "1000",
                        "showEasing" : "swing",
                        "hideEasing" : "linear",
                        "showMethod" : "fadeIn",
                        "hideMethod" : "fadeOut"
                    }
                    if ($('#addBehaviorOnToastClick').prop(
                            'checked')) {
                        toastr.options.onclick = function() {
                            alert('You can perform some custom action after a toast goes away');
                        };
                    }
                    if (!msg) {
                        msg = getMessage();
                    }
                    toastr.success(msg);
                    toastr[shortCutFunction](msg);

                });
    })

    $('.publishBlog').click(function() {
        var sHTML = $('.summernote').code();
        var category = $("#category option:selected").val();
        var title = $("#artiTitle").val();
        //console.info(sHTML+"00000000"+category+""+title);
        var json = {artiContent:sHTML,artiCatgId:category,artiTitle:title};
        //alert($("#category option:selected").val());//方法一：获取select标签选中的option中的value的值。
        //alert($("#category").find("option:selected").val());//方法二：获取select标签选中的option中的value的值。
        $.ajax({
            url: "article/save",
            type: "post",
            data: json,
            success: function(result) {
                console.info(result);
                if(result == "success"){
                    swal({
                        title : "发表成功",
                        text : "",
                        type : "success",
                        allowOutsideClick : true
                    });
                }
                //location = location;
            },
            error: function() {

            }
        });


    });

    $('.leave').click(function() {
        swal({
            title : "你确定离开吗？",
            text : "你将无法恢复这个虚构的文件！",
            type : "warning",
            showCancelButton : true,
            confirmButtonColor : "#ED5565",//DD6B55
            confirmButtonText : "是的，删除它！",
            cancelButtonText : "不，取消！",
            allowOutsideClick : true,
            closeOnConfirm : false,
            closeOnCancel : false
        }, function(isConfirm) {
            if (isConfirm) {
                swal("删除!", "你的虚构文件已被删除.", "success");
            } else {
                swal("取消", "你的虚构文件是安全的:):):)", "error");
            }
        });
    });
</script>
--%>
