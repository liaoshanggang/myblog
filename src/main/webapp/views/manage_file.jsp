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

    <title>后台管理主页</title>

    <%@include file="../css-common.jsp" %>
    <%@include file="../js-common.jsp" %>
</head>

<body class="" style="background-color:#20222a">

<div id="wrapper">
    <%-- <jsp:include page="left_nav.html" flush="true"/> --%>
    <!-- 左边导航栏开始 -->
    <%@include file="../left_nav.jsp" %>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部开始 -->
        <%@include file="../top_nav.jsp" %>
        <!-- 头部结束 -->
        <!-- 链接开始 -->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-sm-4">
                <h2>主标题</h2>
                <ol class="breadcrumb">
                    <li><a href="index.jsp">前台展示页</a></li>
                    <li class="active" id="mgr_file"><strong>文件管理</strong></li>
                </ol>
                <ol class="breadcrumb">
                    <li id="path">${path}</li>
                </ol>
            </div>
            <div class="col-sm-8">
                <div class="title-action">
                    <a href="" class="btn btn-primary">行动区</a>
                </div>
            </div>
        </div>
        <!-- 链接结束 -->

        <!-- ===================主要内容开始=================== -->
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-3">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content">
                            <div class="file-manager">
                                <div class="search-form">
                                    <form action="showHome" method="get">
                                        <div class="input-group">
                                            <input type="text" placeholder="键入Enter键以搜索" name="keyWords"
                                                   class="btn btn-facebook btn-outline form-control input-md">
                                            <div class="input-group-btn">
                                                <button class="btn btn-success btn-facebook btn-outline" type="submit">
                                                    搜索
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <button class="btn btn-success btn-outline btn-sm" type="button" value="102">
                                    新建文件夹
                                </button>
                                <button class="btn btn-success btn-outline btn-sm" type="button" value="102">
                                    离线下载
                                </button>
                                <div class="hr-line-dashed"></div>
                                <label title="上传新文件" for="uploadFile" class="btn btn-md btn-success">
                                    <input type="file" id="uploadFile" class="hide">
                                    上传文件
                                </label>
                                <div class="hr-line-dashed"></div>
                                <h5>文件夹</h5>
                                <ul class="folder-list" style="padding: 0">
                                    <li><a href=""><i class="fa fa-folder"></i> 档</a></li>
                                    <li><a href="views/album.jsp"><i class="fa fa-folder"></i> 图片</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 网页</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 插图</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 电影</a></li>
                                    <li><a href=""><i class="fa fa-folder"></i> 图书</a></li>
                                </ul>
                                <%--<h5 class="tag-title">Tags</h5>
                                <ul class="tag-list" style="padding: 0">
                                    <li><a href="">Family</a></li>
                                    <li><a href="">Work</a></li>
                                    <li><a href="">Home</a></li>
                                    <li><a href="">Children</a></li>
                                    <li><a href="">Holidays</a></li>
                                    <li><a href="">Music</a></li>
                                    <li><a href="">Photography</a></li>
                                    <li><a href="">Film</a></li>
                                </ul>--%>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 animated fadeInRight">
                    <div class="row">
                        <div class="col-lg-12" id="files">
                            <c:forEach var="fileInfo" items="${fileInfos}" varStatus="status">
                                    <div class="file-box">
                                        <div class="file">
                                            <span class="corner"></span>
                                            <div class="image">
                                                <a href="#"> <img alt="image" class="img-responsive" src="${fileInfo.fileIconUrl}"> </a>
                                            </div>
                                            <div class="file-name">
                                                <a href="fileInfo/queryByPath?path=${fileInfo.filePath}">
                                                        ${fileInfo.fileName}${fileInfo.fileExt}
                                                    <br/>
                                                    <small><fmt:formatDate value='${fileInfo.fileCreateDate}'
                                                                           pattern='yyyy-MM-dd HH:mm:ss'/></small>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ===================主要内容结束=================== -->

        <!-- 底部 -->
        <%@include file="../bottom.html" %>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('.file-box').each(function () {
            animationHover(this, 'pulse');
        });
    });

    var filefile;
    var $uploadFile = $("#uploadFile");
    if (window.FileReader) {
        $uploadFile.change(function () {
            var fileReader = new FileReader(),
                files = this.files,
                file;

            if (!files.length) {//只要不是0就继续，是0退出
                return;
            }

            file = files[0];
            filefile = files[0];
            //readAsBinaryString
            //readAsDataURL方法会使用base-64进行编码，编码的资料由data字串开始，后面跟随的是MIME type，然后再加上base64字串，逗号之后就是编码过的图像文件的内容。
            fileReader.readAsDataURL(file);//将文件以Data URL形式读入页面
            fileReader.onload = function () {//文件读取成功完成时触发
                console.info("file"+file);
                //console.info(filefile);
                var path = $("#path").text();
                var formData = new FormData();
                formData.append("file", file);
                $.ajax({
                    url: "fileInfo/upload?path="+path,
                    type: "post",
                    data: formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,//如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
                    success: function (result) {
                        console.info(result);
                        var files = $("#files");
                        var obj = JSON.parse(result);
                        console.info(obj.fileIconUrl);
                        var date = new Date(obj.fileCreateDate);
                        var content = "<div class=\"file-box\">\n" +
                            "                                        <div class=\"file\">\n" +
                            "                                            <span class=\"corner\"></span>\n" +
                            "                                            <div class=\"image\">\n" +
                            "                                                <a href=\"#\"> <img alt=\"image\" class=\"img-responsive\" src=\'"+obj.fileIconUrl+"\'> </a>\n" +
                            "                                            </div>\n" +
                            "                                            <div class=\"file-name\">\n" +
                            "                                                <a href=\"fileInfo/queryByPath?path="+obj.filePath+"\">\n" +obj.fileName+obj.fileExt+
                            "                                                    <br/><small>\n"+date.getFullYear()+"-"+date.getMonth()+"-"+date.getDay()+" "+date.getHours()+":"+date.getMinutes()+":"+date.getSeconds()+
                            "                                                </small></a>\n" +
                            "                                            </div>\n" +
                            "                                        </div>\n" +
                            "                                    </div>";
                        //console.info(content);
                        files.append(content);
                    },
                    error: function () {
                        alert("error");
                    }
                });
            };
        });
    } else {
        $inputImage.addClass("hide");
    }

</script>
</body>

</html>