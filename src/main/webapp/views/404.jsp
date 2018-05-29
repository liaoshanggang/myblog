<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/29
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${rootpath}">
    <title>404 Error</title>

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
    <h1>404</h1>
    <h3 class="font-bold">找不到网页</h3>

    <div class="error-desc">
        对不起，您正在寻找的页面已被找到。尝试检查网址是否存在错误，然后点击浏览器上的刷新按钮或返回主页面。
        <br><a href="index.jsp" class="btn btn-primary m-t">返回主页</a>
    </div>
</div>

</body>

</html>

