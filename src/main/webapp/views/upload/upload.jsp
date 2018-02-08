<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/8
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${rootpath}">
    <title>测试springmvc中上传的实现</title>
</head>
<body>
<h1>file/testFileUpload</h1>
<form action="file/testFileUpload"
      method="POST" enctype="multipart/form-data">
    文件: <input type="file" name="file"/>
    描述: <input type="text" name="desc"/>
    <input type="submit" value="Submit"/>
</form>
<h1>file/upload</h1>
<form action="file/upload"  method="post" enctype="multipart/form-data">
    文件: <input type="file" name="file" />
    <input type="submit" value="Submit"/>
</form>
<h1>file/upload1</h1>
<form action="file/upload1"  method="post" enctype="multipart/form-data">
    文件: <input type="file" name="file" />
    <input type="submit" value="Submit"/>
</form>
<h1>file/upload2</h1>
<form action="file/upload2"  method="post" enctype="multipart/form-data">
    文件: <input type="file" name="file" />
    <input type="submit" value="Submit"/>
</form>
<a href="file/download?filename=1">下载文件</a>

<h1>
    <%--前台jsp页面调用:<img src="<%=contextPath%>${image.imagesUrl}">,例如:--%>

    <img src='file/showPicture?picPath=/blog/1.jpg'/>

    数据库保存图片的URL为/website/showPicture?picPath=/images/upload/image/20160608/1465355183063.png

</h1>
</body>
</html>
