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
    <input type="text" name="userName" disabled value="${user.userName}" class="form-control"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">用户昵称</span>
    <input type="text" name="userNickname" value="${user.userNickname}" class="form-control"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px ;">
    <span class="input-group-addon">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>&nbsp;
    <input type="radio" value="男" name="userSex" <c:if test="${user.userSex eq '男'}"> checked="checked"</c:if>/>男
    <input type="radio" value="女" name="userSex" <c:if test="${user.userSex eq '女'}"> checked="checked"</c:if> />女
</div>
<div class="input-group" style="margin-top: 15px;">
    <span class="input-group-addon">出生日期</span>
    <input type="date" name="userBirthday" value="<fmt:formatDate value='${user.userBirthday }'
                                                                pattern='yyyy-MM-dd' />" class="form-control"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
    <input type="text" name="userEmail" value="${user.userEmail}" class="form-control"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">手&nbsp;&nbsp;机&nbsp;&nbsp;号</span>
    <input type="text" name="userMobile" value="${user.userMobile}" class="form-control"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</span>
    <input type="text" name="userAddress" value="${user.userAddress}" class="form-control"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历</span>
    <input type="text" name="eduBackground" value="${user.eduBackground}" class="form-control"
           aria-describedby="sizing-addon1">
</div>
<div class="input-group" style="margin-top: 15px">
    <span class="input-group-addon">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介</span>
    <textarea name="userProfile" value="${user.userProfile}" class="form-control"
              aria-describedby="sizing-addon1">${user.userProfile}</textarea>
</div>
<script>
$('input').iCheck({
checkboxClass: 'icheckbox_square-green',
radioClass: 'iradio_square-green',
});
</script>