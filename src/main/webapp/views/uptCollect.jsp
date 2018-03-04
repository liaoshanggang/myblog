<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/4
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="input-group">
    <span class="input-group-addon">收藏标题</span>
    <input name="coltId" value="${collect.coltId}" style="display: none">
    <input type="text" name="coltTitle" value="${collect.coltTitle}" class="form-control" aria-describedby="sizing-addon1" required="required">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">收藏链接</span>
    <input type="text" name="linkUrl" value="${collect.linkUrl}" class="form-control"
           aria-describedby="sizing-addon1"  required="required">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">收藏描述</span>
    <input type="text" name="coltDescription" value="${collect.coltDescription}" class="form-control"
           aria-describedby="sizing-addon1" required="required">
</div>