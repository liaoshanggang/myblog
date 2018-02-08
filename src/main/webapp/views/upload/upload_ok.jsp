<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/8
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${rootpath}">
</head>
<body>
<%--新加类库重新部署--%>
<h1>上传成功！</h1>
<h1>原文件名：${uploadFile.getOriginalFilename()}</h1>
<h1>大小${uploadFile.getSize()}</h1>
<img src="blog/${uploadFileName}">

</body>
</html>