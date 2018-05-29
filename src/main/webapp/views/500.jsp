<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/29
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html><head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${rootpath}">
    <title>500 Error</title>

    <%@include file="../css-common.jsp" %>
    <%@include file="../js-common.jsp" %>
    <style>
        .theme-config{
            display: none;
        }
    </style>
</head>

<body class="gray-bg">


<div class="middle-box text-center animated fadeInDown">
    <h1>500</h1>
    <h3 class="font-bold">${message}</h3>

    <div class="error-desc">
        服务器遇到意外的情况，不允许它完成请求。我们很抱歉。<br>
        您可以返回主页面： <br><a href="index.jsp" class="btn btn-primary m-t">返回主页</a>
    </div>
</div>
</body></html>
