<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<div class="input-group">
    <span class="input-group-addon">用&nbsp;&nbsp;户&nbsp;&nbsp;名</span>
    <input name="userId" value="${user.userId}" style="display: none">
    <input type="text" name="userName" value="${user.userName}" class="form-control" aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">用户昵称</span>
    <input type="text" name="userNickname" value="${user.userNickname}" class="form-control" name="againPwd"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
    <input type="text" name="userEmail" value="${user.userEmail}" class="form-control" aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">手&nbsp;&nbsp;机&nbsp;&nbsp;号</span>
    <input type="text" name="userMobile" value="${user.userMobile}" class="form-control" name="againPwd"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</span>
    <input type="text" name="eduBackground" value="${user.eduBackground}" class="form-control" name="againPwd"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</span>
    <input type="text" name="userProfile" value="${user.userProfile}" class="form-control" name="againPwd"
           aria-describedby="sizing-addon1">
</div>