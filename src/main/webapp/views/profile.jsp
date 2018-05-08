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

    <title>修改个人资料</title>

    <%@include file="../css-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <%@include file="../js-common.jsp" %>
    <style>
        .shadow {
            box-shadow: 0px 0px 15px #888888;
        }

        .vertical-timeline-content h3 {
            font-size: 18px;
            font-weight: 500;
            color: #333;
        }

        .vertical-timeline-content {
            padding: 0px;
        }

        .vertical-timeline-icon {
            top: -5px;
            left: 5px;
            width: 30px;
            height: 30px;
            border: 3px solid #6abd81;
        }

        #vertical-timeline::before {
            height: 97%;
        }

        /*.nav-tabs a{
            padding: 15px;
        }*/
    </style>
</head>


<body class="canvas-menu">

<div id="wrapper">
    <!-- 左边导航栏开始 -->
    <%--<%@include file="../left_nav.jsp" %>--%>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg">
        <!-- 头部开始 -->
        <%@include file="../head.jsp" %>
        <!-- ===================主要内容开始=================== -->
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1" style="padding: 0px 0px 40px 0px;">
                <div class="wrapper wrapper-content animated fadeInUp" style="padding: 0px;">
                    <div class="ibox shadow">
                        <div class="tabs-container">
                            <ul class="nav nav-tabs"><%--list-style:none;float:left;--%>
                                <li class="active"><a data-toggle="tab" href="#about_blog"
                                                      style="padding: 10px 0px 10px 2px;">
                                    <i class="fa fa-book"></i>关于「博客系统」</a></li>
                                <li class=""><a data-toggle="tab" href="#about_me" style="padding: 10px 0px 10px 2px;">
                                    <i class="fa fa-user"></i>关于「我」</a></li>
                                <li class=""><a data-toggle="tab" href="#about_sys" style="padding: 10px 0px 10px 2px;">
                                    <i class="fa fa-info-circle"></i>关于「网站」</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="about_blog" class="tab-pane active">
                                    <div class="panel-body">
                                        <div id="vertical-timeline" class="vertical-container"><%--dark-timeline    --%>
                                            <div class="vertical-timeline-block">
                                                <div class="vertical-timeline-icon white-bg">
                                                </div>
                                                <div class="vertical-timeline-content">
                                                    <a class="btn-link"><h2 class="">
                                                        <span class="vertical-date">2018年X月X日</span>
                                                        （使用<em>Spring Boot</em>的未来第一版），<em>v2.0</em>
                                                    </h2></a>
                                                    <p><i class="fa fa-asterisk"></i>
                                                        由spring转向Spring Boot，相关配置升级优化，模板引擎由jsp转向Thymeleaf。</p>
                                                    <p><i class="fa fa-asterisk"></i>
                                                        系统进行优化，简化了许多配置</p>
                                                    <p><i class="fa fa-asterisk"></i>
                                                        系统进行大改进，前后端完全分离</p>
                                                </div>
                                            </div>
                                            <div class="vertical-timeline-block">
                                                <div class="vertical-timeline-icon white-bg">
                                                </div>
                                                <div class="vertical-timeline-content">
                                                    <a class="btn-link"><h2 class="">
                                                        <span class="vertical-date">2018年2月15日</span>
                                                        （使用<em>Spring</em>的第一版），<em>v1.0</em>
                                                    </h2></a>
                                                    <p><i class="fa fa-asterisk"></i>
                                                        优化了很多页面</p>
                                                    <p><i class="fa fa-asterisk"></i>
                                                        增加了许多功能，评论，各种管理等，后台管理基本实现</p>
                                                    <p><i class="fa fa-asterisk"></i>
                                                        后端改用了inspinia admin，一套非常优秀后台管理模板</p>
                                                </div>
                                            </div>
                                            <div class="vertical-timeline-block">
                                                <div class="vertical-timeline-icon white-bg">
                                                </div>
                                                <div class="vertical-timeline-content">
                                                    <a class="btn-link"><h2 class="">
                                                        <span class="vertical-date">2017年12月Y日</span>
                                                        （已经不记得具体日期了）<em>beta</em>
                                                    </h2></a>
                                                    <p>朦胧了写一个自己的博客站的想法。 这年（应该是年末前半个月左右），诞生了第一版本。</p>
                                                    <p>
                                                        <i class="fa fa-asterisk"></i>
                                                        这个版本页面比较简陋，页面都是自己设计的，数据结构也简单。功能就仅仅文章浏览、发布等些许功能。
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="vertical-timeline-block">
                                                <div class="vertical-timeline-icon white-bg">
                                                </div>
                                                <div class="vertical-timeline-content">
                                                    <a class="btn-link"><h2 class="">
                                                        起始点(我都找不到我，你也找不到我:)^V^(:)
                                                    </h2></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="about_me" class="tab-pane">
                                    <div class="panel-body">
                                        <ul>
                                            <li>90后程序员，主研方向：Java、微前端、Node。</li>
                                            <li>current：Java开发工程师</li>
                                            <li>GitHub：https://github.com/liaoshanggang</li>
                                        </ul>
                                        <b style="font-style: italic;">个人博客（PersonalBlog）：</b><%--<p>​</p>不能放ul吗？--%>
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;是我最近打造的一款Java博客系统（后续将会出Note版本），包含博客、笔记系统以文件分享。</p>
                                        <p>&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;目前兼容人类正在使用的全部浏览器（IE6/7除外、IE8/9/10不太友好）。</p>
                                        <p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;响应式布局、支持全设备访问（后端个别界面应功能要求不是响应式）。</p>
                                        <p>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;目前最新版本 v1.0（其余版本见说明），欢迎尝鲜。<br></p>
                                        <p>&nbsp; &nbsp; &nbsp; &nbsp;欢迎下载尝鲜，有意见或者建议欢迎提出；QQ群：
                                            <a target="_blank"
                                               href="//shang.qq.com/wpa/qunwpa?idkey=a2db8d0fa1aa7f91fabf149d9f868efa1811e0a6839851220a9c2b2ecaf0bce7">
                                                <img src="//pub.idqqimg.com/wpa/images/group.png" alt="笔记博客 ~ 交流反馈"
                                                     title="笔记博客 ~ 交流反馈" border="0">
                                            </a>&nbsp;<br>
                                        </p>
                                        <p><br></p>
                                    </div>
                                </div>
                                <div id="about_sys" class="tab-pane">
                                    <div class="panel-body">
                                        <div class="">
                                            <p>服务器提供商：阿里云</p>
                                            <p>服务器配置：CPU：1GHz，Memory：1G，Max Bandwidth：20Mbps，OS：CentOS 6.4&nbsp;</p>
                                            <p><br></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ===================主要内容结束=================== -->
            <!-- 底部 -->
            <%@include file="../bottom.html" %>
            <!-- Toastr script -->
            <script src="js/plugins/toastr/toastr.min.js"></script>
            <!-- Peity -->
            <script src="js/plugins/peity/jquery.peity.min.js"></script>
        </div>
    </div>
</div>
<script>

</script>
</body>

</html>
