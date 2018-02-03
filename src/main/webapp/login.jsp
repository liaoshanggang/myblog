<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    application.setAttribute("rootpath", basePath);
%>
<!DOCTYPE>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="${rootpath}">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <title>登录</title>
</head>
<body style="background:#f3f3f4">
<h1>路径：${rootpath }</h1>
<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name">IN+</h1>

        </div>
        <h3>欢迎来到我的个人博客系统</h3>
        <form class="m-t" role="form" action="user/login" method="post">
            <div class="form-group">
                <input type="text" value="admin" class="form-control" placeholder="用户名" name="userName" required>
            </div>
            <div class="form-group">
                <input type="password" value="admin" class="form-control" placeholder="密码" name="userPassword" required>
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">登录</button>
            <!-- <a href="stulogin.jsp"><small>学生登录</small></a> -->
            <a class="btn btn-sm btn-white btn-block" href="register.jsp">创建一个新用户</a>
        </form>
        <p class="m-t">
            <small>Inspinia we app framework base on Bootstrap 3 &copy; 2017</small>
        </p>
    </div>
</div>

<script src="js/jquery-2.2.3.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>