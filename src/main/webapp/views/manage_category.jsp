<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/2
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
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

    <title>后台管理主页</title>

    <%@include file="../css-common.jsp" %>
    <%@include file="../js-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <style>
        .updateCatg {
        }

        .delCatg {
        }
    </style>
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
                    <li><a href="../index.jsp">前台展示页</a></li>
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

            <div class="row"><%-- id="modalBody3"--%>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- pre-scrollable -->
                        <div class="panel-body scroll_content">
                            <div class="ibox">
                                <div class="ibox-content">
                                    <form id="addForm" method="get" action="category/add" class="col-lg-4 pull-left">
                                        <div class="input-group">
                                            <input type="text" class="form-control col-lg-2"
                                                   name="catgName" placeholder="请输入新类别">
                                            <div id="addCatg" class="input-group-btn">
                                                <button type="submit" class="btn btn-outline btn-primary">新增类别
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <table class="table table-hover" style="table-layout:fixed">
                                <colgroup>
                                    <col class="col-lg-4">
                                    <col class="col-lg-4">
                                    <col class="col-lg-2">
                                    <col class="col-lg-2">
                                </colgroup>

                                <thead>
                                <tr>
                                    <th style="width:30%;">类别</th>
                                    <th style="width:30%;">日期</th>
                                    <th style="width:20%;">文章数</th>
                                    <th style="width:20%;">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="category" items="${categoryList}" varStatus="status">
                                    <tr>
                                        <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"
                                            value="${category.catgName}">${category.catgName}</td>
                                        <td class="">
                                            <fmt:formatDate value='${category.catgTime}'
                                                            pattern='yyyy-MM-dd HH:mm:ss'/>
                                        </td>
                                        <td class="">Mark</td>
                                        <td class="">
                                            <button class="btn btn-success btn-outline btn-xs updateCatg" type="button"
                                                    value="${category.catgId}">
                                                编辑
                                            </button>
                                            <button class="btn btn-danger btn-outline btn-xs delCatg"
                                                    type="button" value="${category.catgId}">删除
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="panel-heading panel-default ">
                            <!-- 分页链拉 -->
                            <div>
                                <div>
                                    <c:if test="${not empty categoryPage}">
                                        <ul class="pagination">
                                            <li><a href="category/query?pageNo=1">«</a></li>
                                            <c:if test="${categoryPage.pageNo gt 3}">
                                                <li><a href="javascript:void(0)">....</a></li>
                                            </c:if>
                                            <c:if test="${categoryPage.pageNo-2 ge 1}">
                                                <li>
                                                    <a href="category/query?pageNo=${categoryPage.pageNo-2}">${categoryPage.pageNo-2}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${categoryPage.pageNo-1 ge 1}">
                                                <li>
                                                    <a href="category/query?pageNo=${categoryPage.pageNo-1}">${categoryPage.pageNo-1}</a>
                                                </li>
                                            </c:if>
                                            <li class="active"><a
                                                    href="category/query?pageNo=${categoryPage.pageNo}">${categoryPage.pageNo}</a>
                                            </li>
                                            <c:if test="${categoryPage.pageNo+1 le categoryPage.totalPage}">
                                                <li>
                                                    <a href="category/query?pageNo=${categoryPage.pageNo+1}">${categoryPage.pageNo+1}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${categoryPage.pageNo+2 le categoryPage.totalPage}">
                                                <li>
                                                    <a href="category/query?pageNo=${categoryPage.pageNo+2}">${categoryPage.pageNo+2}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${categoryPage.pageNo+2 lt categoryPage.totalPage}">
                                                <li><a href="javascript:void(0)">....</a></li>
                                            </c:if>
                                            <li><a href="category/query?pageNo=${categoryPage.totalPage}">»</a>
                                            </li>
                                        </ul>
                                    </c:if>
                                </div>
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
<!-- Toastr script -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    function success(msg) {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "progressBar": false,
            "preventDuplicates": true,
            "positionClass": "toast-bottom-center",
            "showDuration": "1500",
            "hideDuration": "1500",
            "timeOut": "1500",
            "extendedTimeOut": "1500",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        if ($('#addBehaviorOnToastClick').prop(
                'checked')) {
            toastr.options.onclick = function () {
                alert('You can perform some custom action after a toast goes away');
            };
        }
        toastr.info(msg);
    }

    function update(cur, id) {
        console.info("我 来了");
        console.info($(cur).parent().parent());
        var firstTD = $(cur).parent().parent();
        var name = $(cur).prev().val();
        var json = {catgName: name, catgId: id};
        console.info(json);
        $.ajax({
            url: "category/modify",
            type: "post",
            data: json,
            success: function (result) {
                console.info(result);
                if (result == "success") {
                    console.info(firstTD);
                    firstTD.text(name);
                    success("保存成功！");
                }
            },
            error: function () {
            }
        });
    }

    function cancel(cur, catgName) {
        //$(cur).parent().remove();
        console.info(catgName);
        $(cur).parent().parent().text(catgName);
    }

    $(document).ready(function () {
        $(".updateCatg").click(function () {
            //console.info($(this).parent());//td

            var firstTD = $(this).parent().prev().prev().prev();
            var catgName = firstTD.attr("value");//解决第二次问题
            console.info(typeof (catgName));
            var catgId = $(this).attr("value");
            console.info(catgId + "==" + catgName);
            console.info(firstTD.html("<div><input type='text'value='" + catgName + "'>" +
                "<input type='button' value='保存' onclick='update(this," + catgId + ")'/>" +
                "<input type='button' value='取消' onclick='cancel(this,\"" + catgName + "\" )'/></div>"));
            //console.info(firstTD.html("<div><input type='text'value='" + catgName + "'>" +
            //   "<input type='button' value='保存' onclick='update(this," + catgId + ")'/>" +
            //  "<input type='button' value='取消' onclick='cancel(this,\""+catgName+"\" )'/></div>"));
        })
        $(".delCatg").click(function () {
            var cur = $(this);
            swal({
                title: "你确定要删除吗？",
                text: "",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#ED5565",//DD6B55
                confirmButtonText: "是的，删除它！",
                cancelButtonText: "不，取消！",
                allowOutsideClick: true,
                closeOnConfirm: true,
                closeOnCancel: true
            }, function (isConfirm) {
                if (isConfirm) {
                    //swal("删除!", "你的虚构文件已被删除.", "success");
                    var curTr = $(cur).parent().prev().prev().prev().parent();
                    var id = $(cur).attr("value");
                    var json = {catgId: id};
                    $.ajax({
                        url: "category/del",
                        type: "post",
                        data: json,
                        success: function (result) {
                            console.info(result);
                            if (result == "success") {
                                //swal("删除!", "改类别已被删除.", "success");
                                console.info(curTr);
                                curTr.remove();
                                success("删除成功！");
                            }
                        },
                        error: function () {
                        }
                    });
                } else {
                    //swal("取消", "该类别未删除！:):):)", "error");
                }
            });


        })

        $("#addCatg").click(function () {
            success();
        })
    });
</script>
</body>
</html>
