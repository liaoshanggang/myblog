<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${rootpath}">

    <%@include file="../css-common.jsp" %>
    <link href="css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <%@include file="../js-common.jsp" %>
    <title>后台管理主页</title>
    <script type="text/javascript">
        $(function () {
            var markupStr = 'hello world';
            $('.summernote').summernote('code', markupStr);

            $.get("article/loadCategory", function (data) {
                var select = $("#category");
                /* console.info(data); */
                var opt = $("<option></option>").attr("value", "").html("--请选择类别--");
                select.append(opt);
                $.each(data, function (i, item) {
                    //console.info(item.catgId+"=="+item.catgName);
                    var option = $("<option></option>").attr("value", item.catgId)
                        .html(item.catgName);
                    select.append(option);
                });
            }, "json");
            /* $('.summernote').each(function() {
                var $this = $(this);
                var placeholder = $this.attr("placeholder") || '';
                $this.summernote({
                    lang : 'zh-CN',
                    placeholder : placeholder,
                    tabsize : 2,
                    height : 300, // set editor height
                    minHeight : null, // set minimum height of editor
                    maxHeight : null, // set maximum height of editor
                });	 */
        })
    </script>
</head>
<body class="">

<div id="wrapper">
    <%-- <jsp:include page="left_nav.html" flush="true"/> --%>
    <!-- 左边导航栏开始 -->
    <%@include file="../left_nav.jsp" %>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部开始 -->
        <%@include file="../top_nav.jsp" %>
        <!-- 头部结束 -->
        <!-- 链接开始 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>主标题</h2>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">前台展示页</a></li>
                    <li class="active"><strong>本页</strong></li>
                </ol>
            </div>
            <div class="col-sm-8">
                <div class="title-action">
                    <a href="" class="btn btn-primary">行动区</a>
                </div>
            </div>
        </div>
        <!-- 链接结束 -->

        <!-- ===================主要内容开始=================== -->
        <div class="wrapper wrapper-content">

            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading panel-primary ">写博客</div>

                        <div class="panel-body">
                            <!-- pre-scrollable -->
                            <div class="col-lg-2 ">
                                <select class="form-control" id="category" name="catgId">
                                    <!-- <option selected="selected">请选择类别</option> -->
                                </select>
                            </div>
                            <div class="col-lg-10 ">
                                <input id="artiTitle" type="text" class="form-control" placeholder="请输入文章标题"
                                       name="artiTitle">
                            </div>
                            <div class="col-lg-12">
                                <div class="summernote"></div>
                            </div>

                            <div class="col-lg-8 ">
                                <button
                                        class="col-lg-2 btn btn-outline btn-primary publishBlog"
                                        type="submit">发表博客
                                </button>
                                <a href="article/query">
                                    <button class="col-lg-2 btn btn-outline btn-danger"
                                            type="submit">返回
                                    </button>
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content"></div>

                    </div>
                </div>
            </div>

        </div>
        <!-- ===================主要内容结束=================== -->

        <!-- 底部 -->
        <%@include file="../bottom.html" %>
    </div>
</div>

<!-- SUMMERNOTE -->
<script src="js/plugins/summernote/summernote.min.js"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(document).ready(function () {
        window.onbeforeunload = function () {
            return "您的文章尚未保存！";
        }
        $('.summernote').summernote({
            placeholder: "请对项目进行详细的描述，使更多的人了解你的",
            tabsize: 2,
            height: 300, // set editor height
            minHeight: null, // set minimum height of editor
            maxHeight: null, // set maximum height of editor
            focus: true
        });
        /* $('.summernote').summernote('focus');
        // @param {String} color
        $('.summernote').summernote('backColor', 'red');
        // @param {String} color
        $('.summernote').summernote('foreColor', 'blue'); */
        var markupStr1 = $('.summernote').summernote('code');
        console.info(markupStr1 + "222222222222");
        var markupStr = 'hello world';
        $('.summernote').summernote('code', markupStr);
    });

    $('.publishBlog').click(function () {
        var sHTML = $('.summernote').code();
        var category = $("#category option:selected").val();
        var title = $("#artiTitle").val();
        //console.info(sHTML+"00000000"+category+""+title);
        var json = {artiContent: sHTML, artiCatgId: category, artiTitle: title};
        //alert($("#category option:selected").val());//方法一：获取select标签选中的option中的value的值。
        //alert($("#category").find("option:selected").val());//方法二：获取select标签选中的option中的value的值。
        $.ajax({
            url: "article/save",
            type: "post",
            data: json,
            success: function (result) {
                console.info(result);
                if (result == "success") {
                    swal({
                        title: "发表成功",
                        text: "",
                        type: "success",
                        allowOutsideClick: true
                    });
                }
                //location = location;
            },
            error: function () {
            }
        });
    });
</script>
</body>
</html>