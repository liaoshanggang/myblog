<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/21
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <base href="${rootpath}">
    <%@include file="css-common.jsp" %>
    <%@include file="js-common.jsp" %>
    <title>前台主页</title>
    <style type="text/css">
        .ibox-content img {
            max-width: 200px;
            height: auto;
            cursor: pointer;
            border: 1px double #cccccc;
            padding: 3px;
            zoom: expression( function(elm)
	       {     if (elm.width>200)
	               {  var oldVW = elm.width; elm.width=200;
	                   elm.height = elm.height*(200 /oldVW);
	                }         elm.style.zoom = '1';
	      }
	(this));
        }

        #title {
            width: 98%; /*必须设置宽度*/
            overflow: hidden; /*溢出隐藏*/
            text-overflow: ellipsis; /*以省略号...显示*/
            white-space: nowrap; /*强制不换行*/
        }
    </style>

</head>


<body class="canvas-menu">

<div id="wrapper">
    <!-- 左边导航栏开始 -->
    <%--<%@include file="../left_nav.jsp" %>--%>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部开始 -->
        <%@include file="head.jsp" %>
        <!-- 头部结束 -->

        <!-- ===================主要内容开始=================== -->
        <div class="row">
            <div class="container">
                <div class="wrapper wrapper-content animated fadeInUp" style="padding-top: 0px;">

                    <%--博客栏开始--%>
                    <div class="col-md-9">
                        <!-- 博客列表开始 -->
                        <c:forEach var="article" items="${articleList}" varStatus="status">
                            <div class="ibox">
                                <div class="ibox-content">
                                    <!-- <h2 style="overflow: hidden"> -->
                                    <h1 id="title">
                                        <a href="article/queryById/${article.artiId }/detail"
                                           class="btn-link">${article.artiTitle }</a>
                                    </h1>
                                    <div class="small m-b-xs">
                                        <strong>${article.category.catgName }</strong> <span class="text-muted"><i
                                            class="fa fa-clock-o"></i> <fmt:formatDate value='${article.artiTime}'
                                                                                       pattern='yyyy-MM-dd HH:mm:ss'/></span>
                                    </div>
                                    <div>
                                        <p>${article.artiContent }</p>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <h5>Tags:</h5>
                                            <button class="btn btn-primary btn-xs" type="button">Model</button>
                                            <button class="btn btn-white btn-xs" type="button">Publishing</button>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="small text-right">
                                                <h5>Stats:</h5>
                                                <div>
                                                    <i class="fa fa-comments-o"> </i> ${article.artiComtNumber }
                                                    comments
                                                </div>
                                                <i class="fa fa-eye"> </i> ${article.artiPageView } views
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 博客列表结束 -->
                        </c:forEach>
                        <!-- 链接开始 -->
                        <div class="ibox">
                            <div class="ibox-content">
                                <c:if test="${not empty artiPage}">
                                    <ul class="pagination">
                                        <li><a href="showHome?pageNo=1">«</a></li>
                                        <c:if test="${artiPage.pageNo gt 3}">
                                            <li><a href="javascript:void(0)">....</a></li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo-2 ge 1}">
                                            <li><a href="showHome?pageNo=${artiPage.pageNo-2}">${artiPage.pageNo-2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo-1 ge 1}">
                                            <li><a href="showHome?pageNo=${artiPage.pageNo-1}">${artiPage.pageNo-1}</a>
                                            </li>
                                        </c:if>
                                        <li class="active"><a
                                                href="showHome?pageNo=${artiPage.pageNo}">${artiPage.pageNo}</a>
                                        </li>
                                        <c:if test="${artiPage.pageNo+1 le artiPage.totalPage}">
                                            <li><a href="showHome?pageNo=${artiPage.pageNo+1}">${artiPage.pageNo+1}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo+2 le artiPage.totalPage}">
                                            <li><a href="showHome?pageNo=${artiPage.pageNo+2}">${artiPage.pageNo+2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo+2 lt artiPage.totalPage}">
                                            <li><a href="javascript:void(0)">....</a></li>
                                        </c:if>
                                        <li><a href="showHome?pageNo=${artiPage.totalPage}">»</a>
                                        </li>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                        <!-- 链接结束 -->
                    </div>
                    <%--博客栏结束--%>
                    <div class="col-md-3">
                        <div class="panel">
                            <div class="panel-heading">
                                <h1>
                                    <i class="fa fa-info-circle"></i><%--<a
                                href="views/templet.jsp">后台管理主页</a>--%>
                                </h1>
                            </div>
                            <div class="panel-body">
                                <p>Lorem存有悲坐阿梅德，consectetur
                                    adipiscing ELIT。前庭是租赁。
                                    最新的足球教练池，并设置毕业分类宣传。
                                </p>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- ===================主要内容结束=================== -->
        <!-- 底部 -->
        <%@include file="bottom.html" %>
    </div>
</div>
</body>

</html>

