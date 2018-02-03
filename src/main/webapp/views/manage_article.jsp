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
    <script type="text/javascript">
        $(function () {
            $.get("article/loadCategory", function (data) {
                var select = $("#category");
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
    </script>
    <style>
        #title {
            width: 98%; /*必须设置宽度*/
            overflow: hidden; /*溢出隐藏*/
            text-overflow: ellipsis; /*以省略号...显示*/
            white-space: nowrap; /*强制不换行*/
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

            <div class="row"><%-- id="modalBody3"--%>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- pre-scrollable -->
                        <div class="panel-body scroll_content">
                            <div class="ibox">
                                <div class="ibox-content">
                                    <form action="article/query" method="post"
                                          class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">文章类别</label>

                                            <div class="col-sm-2">
                                                <select class="form-control" id="category" name="category.catgId">
                                                </select>
                                            </div>
                                            <label class="col-sm-1 control-label">标题</label>
                                            <div class="col-sm-3">
                                                <input name="artiTitle" type="text" class="form-control"
                                                       placeholder="请输入标题" value="标题">
                                            </div>
                                            <label class="col-sm-1 control-label">内容</label>
                                            <div class="col-sm-3">
                                                <input name="artiContent" type="text" class="form-control"
                                                       placeholder="请输入内容" value="内容">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">创建日期</label>
                                            <div class="col-sm-3"><!-- datetime-local -->
                                                <input name="beginDate" type="date" class="form-control"
                                                       placeholder="2018-01-01">

                                            </div>
                                            <!-- <label class="col-sm-1 control-label">—</label> -->
                                            <div class="col-sm-3">
                                                <input name="endDate" type="date" class="form-control"
                                                       placeholder="2018-01-30">
                                            </div>

                                            <div class="col-sm-1">
                                                <button class="btn btn-primary" type="submit">查询</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <c:forEach var="article" items="${articleList}" varStatus="status">
                                <!-- 博客列表开始 -->
                                <div class="ibox">
                                    <div class="ibox-content">
                                        <h2 id="title">
                                            <a href="article/queryById/${article.artiId }/detail"
                                               class="btn-link">${article.artiTitle } </a>
                                        </h2>
                                        <div class="row">
                                            <div class="col-md-3 small m-b-xs">
                                                <strong>${article.category.catgName }</strong> <span class="text-muted"><i
                                                    class="fa fa-clock-o"></i>
													<fmt:formatDate value='${article.artiTime}'
                                                                    pattern='yyyy-MM-dd HH:mm:ss'/>
													</span>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="small">
                                                    <div>
                                                        <i class="fa fa-comments-o"> </i> ${article.artiComtNumber } 评论
                                                        <i class="fa fa-eye"> </i> ${article.artiPageView }浏览
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                    <%-- <c:set var="tablename" value="${article.artiId}/modify"></c:set>
                                                         ${tablename}--%>
                                                <a href="article/queryById/${article.artiId}/modify">
                                                    <button id="myModel3"
                                                            class="btn btn-success btn-outline btn-xs" type="button">修改
                                                    </button>
                                                        <%-- value="${article.artiId }--%>
                                                </a>
                                                <a href="article/delete?artiId=${article.artiId }">
                                                    <button class="btn btn-danger btn-outline btn-xs" type="button">删除
                                                    </button>
                                                </a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- 博客列表结束 -->
                            </c:forEach>
                        </div>
                        <div class="panel-heading panel-default ">
                            <!-- 分页链拉 -->
                            <div>
                                <div>
                                    <c:if test="${not empty artiPage}">
                                        <ul class="pagination">
                                            <li><a href="article/query?pageNo=1">«</a></li>
                                            <c:if test="${artiPage.pageNo gt 3}">
                                                <li><a href="javascript:void(0)">....</a></li>
                                            </c:if>
                                            <c:if test="${artiPage.pageNo-2 ge 1}">
                                                <li>
                                                    <a href="article/query?pageNo=${artiPage.pageNo-2}">${artiPage.pageNo-2}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${artiPage.pageNo-1 ge 1}">
                                                <li>
                                                    <a href="article/query?pageNo=${artiPage.pageNo-1}">${artiPage.pageNo-1}</a>
                                                </li>
                                            </c:if>
                                            <li class="active"><a
                                                    href="article/query?pageNo=${artiPage.pageNo}">${artiPage.pageNo}</a>
                                            </li>
                                            <c:if test="${artiPage.pageNo+1 le artiPage.totalPage}">
                                                <li>
                                                    <a href="article/query?pageNo=${artiPage.pageNo+1}">${artiPage.pageNo+1}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${artiPage.pageNo+2 le artiPage.totalPage}">
                                                <li>
                                                    <a href="article/query?pageNo=${artiPage.pageNo+2}">${artiPage.pageNo+2}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${artiPage.pageNo+2 lt artiPage.totalPage}">
                                                <li><a href="javascript:void(0)">....</a></li>
                                            </c:if>
                                            <li><a href="article/query?pageNo=${artiPage.totalPage}">»</a>
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
<%--<script type="text/javascript">
    $('#myModel3').on("click", function () {
        var button = $(this); // Button that triggered the modal
        var artiId = button.attr("value");
        $('#modalBody3').load("article/selectArticleById/" + artiId);
    });
</script>--%>
</body>
</html>