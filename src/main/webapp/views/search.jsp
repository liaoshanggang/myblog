<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/28
  Time: 14:35
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

    <title>修改个人资料</title>

    <%@include file="../css-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <%@include file="../js-common.jsp" %>
    <style>
    </style>
</head>


<body class="canvas-menu">

<div id="wrapper">
    <!-- 左边导航栏开始 -->
    <%--<%@include file="../left_nav.jsp" %>--%>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部开始 -->
        <%@include file="../head.jsp" %>
        <!-- 头部结束 -->
        <%--<!-- 头部开始 -->
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
        <!-- 链接结束 -->--%>

        <!-- ===================主要内容开始=================== -->
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1" style="padding: 0px 0px 40px 0px;">
                <div class="wrapper wrapper-content animated fadeInUp" style="padding: 0px;">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <c:if test="${not empty artiPage}">
                            <h2>本次为你找到${artiPage.getTotalRow()}个搜索结果匹配：<span class="text-navy">${artiPage.keyWords}</span>
                            </h2>
                            </c:if>
                            <%--<small>请求时间（0.23秒</small>--%>

                            <div class="search-form">
                                <form action="showHome/search" method="get">
                                    <div class="input-group">
                                        <input type="text" placeholder="键入Enter键以搜索" name="keyWords" class="form-control input-lg">
                                        <div class="input-group-btn">
                                            <button class="btn btn-lg btn-primary" type="submit">
                                                搜索</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <c:forEach var="article" items="${articleList}" varStatus="status">
                            <div class="hr-line-dashed"></div>
                            <div class="search-result">
                                <h2 class="" title="${article.artiTitle }">
                                    <a href="article/queryById/${article.artiId }/detail"
                                       class="">${article.artiTitle }</a></h2>
                                <a href="" class="btn-link">
                                    <strong>${article.category.catgName }</strong>
                                    <span class="text-muted"><i class="fa fa-clock-o"></i>
                                        <fmt:formatDate value='${article.artiTime}' pattern='yyyy-MM-dd HH:mm:ss'/>
                                    </span>
                                    <span class="text-muted">
                                            <i class="fa fa-comments-o"> </i> ${article.artiComtNumber } 评论
                                            <i class="fa fa-eye"> </i> ${article.artiPageView } 浏览
                                    </span>
                                </a>
                                <p>${article.artiContent }
                                </p>
                            </div>
                            </c:forEach>
                            <div class="hr-line-dashed"></div>
                            <div class="text-center link">
                                <c:if test="${not empty artiPage}">
                                    <ul class="pager pagination pagination-lg">
                                        <li><a href="showHome/search?pageNo=1">首页</a></li>
                                        <c:if test="${artiPage.pageNo gt 1 &&  artiPage.pageNo le artiPage.totalPage}">
                                            <li><a href="showHome/search?pageNo=${artiPage.pageNo-1}">«上一页</a></li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo gt 3}">
                                            <li><a href="javascript:void(0)">....</a></li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo-2 ge 1}">
                                            <li><a href="showHome/search?pageNo=${artiPage.pageNo-2}">${artiPage.pageNo-2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo-1 ge 1}">
                                            <li><a href="showHome/search?pageNo=${artiPage.pageNo-1}">${artiPage.pageNo-1}</a>
                                            </li>
                                        </c:if>
                                        <li class="active"><a
                                                href="showHome/search?pageNo=${artiPage.pageNo}">${artiPage.pageNo}</a>
                                        </li>
                                        <c:if test="${artiPage.pageNo+1 le artiPage.totalPage}">
                                            <li><a href="showHome/search?pageNo=${artiPage.pageNo+1}">${artiPage.pageNo+1}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo+2 le artiPage.totalPage}">
                                            <li><a href="showHome/search?pageNo=${artiPage.pageNo+2}">${artiPage.pageNo+2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo+2 lt artiPage.totalPage}">
                                            <li><a href="javascript:void(0)">....</a></li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo ge 1 && artiPage.pageNo lt artiPage.totalPage }">
                                            <li><a href="showHome/search?pageNo=${artiPage.pageNo+1}">下一页»</a></li>
                                        </c:if>
                                        <li><a href="showHome/search?pageNo=${artiPage.totalPage}">尾页</a>
                                        </li>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===================主要内容结束=================== -->
        <!-- 底部 -->
        <%@include file="../bottom.html" %>
        <!-- Toastr script -->
        <script src="js/plugins/toastr/toastr.min.js"></script>
    </div>
</div>
<script>
</script>
</body>

</html>

