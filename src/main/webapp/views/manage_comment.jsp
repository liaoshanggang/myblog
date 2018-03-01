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
    <script>
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
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">

                <div class="col-lg-12">
                    <div class="tabs-container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a class="b" data-toggle="tab" href="#tab-1"
                                                  aria-expanded="true">我的文章评论</a></li>
                            <li class=""><a class="b" data-toggle="tab" href="#tab-2"
                                            aria-expanded="false">我发表的评论</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                    <!-- 评论 -->
                                    <c:forEach var="comment" items="${commentList2}" varStatus="status">
                                        <div class="col-md-12 social-feed-box">
                                            <div class="social-avatar">
                                                <div class="btn-group pull-right">
                                                    <button class="btn btn-success btn-outline btn-xs "
                                                            type="button">回复
                                                    </button>
                                                    <button class="btn btn-danger btn-outline btn-xs delComment"
                                                            type="button" value="${comment.comtId}">删除
                                                    </button>
                                                </div>
                                                <a href="" class="pull-left"> <img alt="图片"
                                                                                   src="../${comment.blogUsers.userImageUrl}">
                                                </a>
                                                <div class="media-body">
                                                    <a href="#">${comment.blogUsers.userName} </a>
                                                    <small
                                                            class="text-muted">
                                                        <fmt:formatDate value='${comment.comtTime}'
                                                                        pattern='yyyy-MM-dd HH:mm:ss'/> 回复了你的文章
                                                        <a href="article/queryById/${comment.article.artiId}/comment"
                                                           class="btn-link">
                                                                ${comment.article.artiTitle}</a>
                                                    </small>
                                                </div>
                                            </div>
                                            <div class="social-body">
                                                <p>
                                                        ${comment.comtContent}
                                                </p>
                                            </div>
                                        </div>

                                        <c:forEach var="replie" items="${comment.replies}" varStatus="status2">
                                            <div class="col-md-12 social-feed-box">
                                                <div class="social-avatar">
                                                    <div class="btn-group pull-right">
                                                        <button class="btn btn-success btn-outline btn-xs "
                                                                type="button">回复
                                                        </button>
                                                        <button class="btn btn-danger btn-outline btn-xs delReply"
                                                                type="button" value="${replie.replyId}">删除
                                                        </button>
                                                    </div>
                                                    <a href="" class="pull-left"> <img alt="图片"
                                                                                       src="../${replie.bu.userImageUrl}">
                                                    </a>
                                                    <div class="media-body">
                                                        <a href="#">${status2.count }--->>>>${replie.bu.userName} </a>
                                                        <small
                                                                class="text-muted">
                                                            <fmt:formatDate value='${replie.replyTime}'
                                                                            pattern='yyyy-MM-dd HH:mm:ss'/>
                                                            回复了${comment.blogUsers.userName}
                                                            <a href="article/queryById/${comment.article.artiId}/comment"
                                                               class="btn-link">
                                                                文章：${comment.article.artiTitle}</a>
                                                        </small>
                                                    </div>
                                                </div>
                                                <div class="social-body">
                                                    <p>
                                                            ${replie.replyContent}
                                                    </p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- 评论 -->

                                    </c:forEach>
                                    <!-- 分页链拉 -->
                                    <div>
                                        <div>
                                            <c:if test="${not empty commentPage2}">
                                                <ul class="pagination">
                                                    <li><a href="comment/query?pageNo=1">«</a></li>
                                                    <c:if test="${commentPage2.pageNo gt 3}">
                                                        <li><a href="javascript:void(0)">....</a></li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo-2 ge 1}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo-2}">${commentPage2.pageNo-2}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo-1 ge 1}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo-1}">${commentPage2.pageNo-1}</a>
                                                        </li>
                                                    </c:if>
                                                    <li class="active"><a
                                                            href="comment/query?pageNo=${commentPage2.pageNo}">${commentPage2.pageNo}</a>
                                                    </li>
                                                    <c:if test="${commentPage2.pageNo+1 le commentPage2.totalPage}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo+1}">${commentPage2.pageNo+1}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo+2 le commentPage2.totalPage}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo+2}">${commentPage2.pageNo+2}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo+2 lt commentPage2.totalPage}">
                                                        <li><a href="javascript:void(0)">....</a></li>
                                                    </c:if>
                                                    <li><a href="comment/query?pageNo=${commentPage2.totalPage}">»</a>
                                                    </li>
                                                </ul>
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- 分页链拉 -->
                                </div>
                            </div>
                            <div id="tab-2" class="tab-pane">
                                <div class="panel-body">
                                    <!-- 评论 -->
                                    <c:forEach var="comment" items="${commentList2}" varStatus="status">
                                        <c:if test="${comment.blogUsers.userId==1}">
                                            <div class="col-md-12 social-feed-box">
                                                <div class="social-avatar">
                                                    <div class="btn-group pull-right">
                                                            <%--<button class="btn btn-success btn-outline btn-xs "
                                                                    type="button">回复
                                                            </button>--%>
                                                        <button class="btn btn-danger btn-outline btn-xs delComment"
                                                                type="button" value="${comment.comtId}">删除
                                                        </button>
                                                    </div>
                                                    <a href="" class="pull-left"> <img alt="图片"
                                                                                       src="../${comment.blogUsers.userImageUrl}">
                                                    </a>
                                                    <div class="media-body">
                                                        <a href="#">${comment.blogUsers.userName} </a>
                                                        <small
                                                                class="text-muted">
                                                            <fmt:formatDate value='${comment.comtTime}'
                                                                            pattern='yyyy-MM-dd HH:mm:ss'/> 回复了你的文章
                                                            <a href="article/queryById/${comment.article.artiId}/comment"
                                                               class="btn-link">
                                                                    ${comment.article.artiTitle}</a>
                                                        </small>
                                                    </div>
                                                </div>
                                                <div class="social-body">
                                                    <p>
                                                            ${comment.comtContent}
                                                    </p>
                                                </div>
                                            </div>

                                            <c:forEach var="replie" items="${comment.replies}" varStatus="status2">
                                                <c:if test="${replie.bu.userId==1}">
                                                    <div class="col-md-12 social-feed-box">
                                                        <div class="social-avatar">
                                                            <div class="btn-group pull-right">
                                                                    <%--<button class="btn btn-success btn-outline btn-xs "
                                                                            type="button">回复
                                                                    </button>--%>
                                                                <button class="btn btn-danger btn-outline btn-xs delReply"
                                                                        type="button" value="${replie.replyId}">删除
                                                                </button>
                                                            </div>
                                                            <a href="" class="pull-left"> <img alt="图片"
                                                                                               src="../${replie.bu.userImageUrl}">
                                                            </a>
                                                            <div class="media-body">
                                                                <a href="#">${status2.count }--->>>>${replie.bu.userName} </a>
                                                                <small
                                                                        class="text-muted">
                                                                    <fmt:formatDate value='${replie.replyTime}'
                                                                                    pattern='yyyy-MM-dd HH:mm:ss'/>
                                                                    回复了${comment.blogUsers.userName}
                                                                    <a href="article/queryById/${comment.article.artiId}/comment"
                                                                       class="btn-link">
                                                                        文章：${comment.article.artiTitle}</a>
                                                                </small>
                                                            </div>
                                                        </div>
                                                        <div class="social-body">
                                                            <p>
                                                                    ${replie.replyContent}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                            <!-- 评论 -->
                                        </c:if>
                                    </c:forEach>
                                    <!-- 分页链拉 -->
                                    <div>
                                        <div>
                                            <c:if test="${not empty commentPage2}">
                                                <ul class="pagination">
                                                    <li><a href="comment/query?pageNo=1">«</a></li>
                                                    <c:if test="${commentPage2.pageNo gt 3}">
                                                        <li><a href="javascript:void(0)">....</a></li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo-2 ge 1}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo-2}">${commentPage2.pageNo-2}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo-1 ge 1}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo-1}">${commentPage2.pageNo-1}</a>
                                                        </li>
                                                    </c:if>
                                                    <li class="active"><a
                                                            href="comment/query?pageNo=${commentPage2.pageNo}">${commentPage2.pageNo}</a>
                                                    </li>
                                                    <c:if test="${commentPage2.pageNo+1 le commentPage2.totalPage}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo+1}">${commentPage2.pageNo+1}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo+2 le commentPage2.totalPage}">
                                                        <li>
                                                            <a href="comment/query?pageNo=${commentPage2.pageNo+2}">${commentPage2.pageNo+2}</a>
                                                        </li>
                                                    </c:if>
                                                    <c:if test="${commentPage2.pageNo+2 lt commentPage2.totalPage}">
                                                        <li><a href="javascript:void(0)">....</a></li>
                                                    </c:if>
                                                    <li><a href="comment/query?pageNo=${commentPage2.totalPage}">»</a>
                                                    </li>
                                                </ul>
                                            </c:if>
                                        </div>
                                    </div>
                                    <!-- 分页链拉 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-12"></div>
            </div>
        </div>
        <!-- ===================主要内容结束=================== -->

        <!-- 底部 -->
        <%@include file="../bottom.html" %>
    </div>
</div>


<%@include file="../js-common.jsp" %>
<!-- Toastr script -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    window.onload = function () {
        var oDox = $(".tabs-container");
        var aLi = $(".nav-tabs > li");
        var aDiv = $(".tab-content > div");

        for (var i = 0; i < aLi.length; i++) {
            aLi[i].index = i;
            aLi[i].onclick = function () {
                for (var i = 0; i < aLi.length; i++) {
                    aLi[i].className = "";
                    aDiv[i].style.display = "none";
                    setCookie("index", this.index, 1)
                }
                this.className = "active";
                aDiv[this.index].style.display = "block";
            }
        }
        //判断是有cookie值
        if (getCookie("index")) {
            for (var i = 0; i < aLi.length; i++) {
                aLi[i].className = '';
                aDiv[i].style.display = 'none'
            }
            aLi[getCookie('index')].className = 'active';
            aDiv[getCookie('index')].style.display = 'block';
        }

        ///设置cookie
        function setCookie(name, value, iDay) {
            if (iDay) {
                var oDate = new Date();
                oDate.setDate(oDate.getDate() + iDay);
                document.cookie = name + '=' + value + ';path=/;expires=' + oDate;
            } else {
                document.cookie = name + '=' + value + ';path=/';
            }
        };

        //获取cookie
        function getCookie(name) {
            var arr = document.cookie.split("; ");
            for (var i = 0; i < arr.length; i++) {
                var arr1 = arr[i].split("=");
                if (arr1[0] == name) {
                    return arr1[1];
                }

            }

            return "";
        }
    }
</script>
<script>
    var hash = location.hash;
    if (hash) {
        tab(hash.match(/\d+/)[0]);
    }
    $('.b').click(function () {
        tab($(this).index());
    });

    function tab(index) {
        $('.tab-pane').siblings('.tab-pane').hide().end().eq(index).show();
    }

    $(".delReply").click(function () {
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
                var curTr = $(cur).parent().parent().parent();
                var id = $(cur).attr("value");
                var json = {replyId: id};
                $.ajax({
                    url: "reply/del",
                    type: "post",
                    data: json,
                    success: function (result) {
                        //console.info(result);
                        if (result == "success") {
                            //console.info(curTr);
                            curTr.remove();
                            success("删除成功！");
                        }
                    },
                    error: function () {
                    }
                });
            } else {
            }
        });


    })

    $(".delComment").click(function () {
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
                var curTr = $(cur).parent().parent().parent();
                var id = $(cur).attr("value");
                var json = {comtId: id};
                $.ajax({
                    url: "comment/del",
                    type: "post",
                    data: json,
                    success: function (result) {
                        //console.info(result);
                        if (result == "success") {
                            //console.info(curTr);
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
</script>
</body>

</html>