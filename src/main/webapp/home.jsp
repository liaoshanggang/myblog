<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/21
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <base href="${rootpath}">
    <%@include file="css-common.jsp" %>
    <%@include file="js-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <title>前台主页</title>
    <style type="text/css">
        /*.ibox-content img {*/
        /*max-width: 200px;*/
        /*height: auto;*/
        /*cursor: pointer;*/
        /*border: 1px double #cccccc;*/
        /*padding: 3px;*/
        /*zoom: expression( function(elm)*/
        /*{     if (elm.width>200)*/
        /*{  var oldVW = elm.width; elm.width=200;*/
        /*elm.height = elm.height*(200 /oldVW);*/
        /*}         elm.style.zoom = '1';*/
        /*}*/
        /*(this));*/
        /*}*/
        .ibox-content img {
            max-width: 100%;
            max-height: 100%;
            cursor: pointer;
            display: none;
        }

        .title {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        /*必须设置宽度*//*溢出隐藏*//*以省略号...显示*//*强制不换行*/
        .shadow {
            box-shadow: 0px 0px 15px #888888;
        }

        /*overflow:hidden;
        text-overflow: ellipsis;*/
        .briefInfo {
            max-width: 100%;
            border-top: #E6E6E6 1px solid;
            border-bottom: #E6E6E6 1px solid;
            padding: 10px;
            /*white-space: pre-wrap;*/
            word-wrap: break-word;
            /*height: 5em;*/
            /*margin: 1em;*/
            /*overflow:hidden;*/
        }

        /* overflow: hidden;
         text-overflow: ellipsis;
         display: -webkit-box;
         -webkit-line-clamp: 10; !*!/这儿的数字代表的就是你所需要实现效果的第N行*!
     -webkit-box-orient: vertical;*/
        .briefInfo pre {
            max-width: 100%;
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        .briefInfo .p2 {
            line-height: 1.5em;
            max-width: 100%;
        }

        .expandMore {
            cursor: pointer;
        }
    </style>
    <script>
        $(function () {
            var logUser = "<%=session.getAttribute("logUser")%>";
            //console.info(logUser+"类型"+typeof(logUser));
            if(logUser=="null"){
            }else{
                $("#tab-4").children().children().empty().append("<a class='btn-link'><h3>欢迎来到我的博客！</h3><a>");
            }

            $.get("article/selectHot", function (data) {
                var showHot = $("#showHot");
                $.each(data, function (i, item) {
                    //console.info(item.artiId+"=="+item.artiTitle);
                    var option = $( "<li class=\"title list-group-item\" style=\"padding-left:25px\"><a href=\"article/queryById/"+item.artiId+" /detail\"\n" +
                        "  class=\"btn-link\">"+item.artiTitle+"</a></li>");
                    showHot.append(option);
                });
            }, "json");

            $(".ibox").hover(
                function () {
                    $(this).addClass("shadow");
                },
                function () {
                    $(this).removeClass("shadow");
                }
            );


            // $(".briefInfo").each(function (i) {
            //     //var divH = $(this).height();
            //     var $p = $(".p2", $(this)).eq(0);
            //     var href = $p.parent().prev().prev().find("a").attr("href");
            //$(this).find("p");
            //console.info($p+"========="+divH);
            // $p.html($p.text().substring(1, 150).replace(/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/, "...") + "" +
            //     "<a href=\"" + href + "\" class=\"\">查看更多>></a>");
            //var len = $p.text().substring(1,200).length;
            //console.info("="+$p.text());
            // while ($p.text().substring(1).length > len) {
            //     $p.text($p.text().replace(/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/, "..."));
            //     console.info($p.outerHeight()+"=========/n"+$p.text()+"/n");
            // }
            // while ($p.outerHeight() > divH) {
            //     $p.text($p.text().replace(/(\s)*([a-zA-Z0-9]+|\W)(\.\.\.)?$/, "..."));
            //     //console.info($p.outerHeight()+"=========/n"+$p.text()+"/n");
            // }
            // });
        })

    </script>
</head>


<body class="canvas-menu"onresize="fixed()">

<div id="wrapper">
    <!-- 左边导航栏开始 -->
    <%--<%@include file="../left_nav.jsp" %>--%>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg" style="padding: 0px;">
        <!-- 头部开始 -->
        <%@include file="head.jsp" %>
        <!-- 头部结束 -->

        <!-- ===================主要内容开始=================== -->
        <div class="row">
            <div class="container" style="padding: 0px 0px 40px 0px;">
                <div class="wrapper wrapper-content animated fadeInUp" style="padding: 0px;">

                    <%--博客栏开始--%>
                    <div class="col-md-9">
                        <!-- 博客列表开始 -->
                        <c:forEach var="article" items="${articleList}" varStatus="status">
                            <div class="ibox">
                                <div class="ibox-content">
                                    <!-- <h2 style="overflow: hidden"> -->
                                    <h1 class="title" title="${article.artiTitle }">
                                        <a href="article/queryById/${article.artiId }/detail"
                                           class="btn-link">${article.artiTitle }</a>
                                    </h1>
                                    <div class="small m-b-xs">
                                        <strong>${article.category.catgName }</strong> <span class="text-muted"><i
                                            class="fa fa-clock-o"></i> <fmt:formatDate value='${article.artiTime}'
                                                                                       pattern='yyyy-MM-dd HH:mm:ss'/></span>
                                    </div>
                                    <div class="briefInfo">
                                        <div class="p2"><%--${fn:substring(article.artiContent, 1, 6000)}--%> ${article.artiContent }
                                            <a href="article/queryById/${article.artiId }/detail"
                                               class="">...更多>></a>
                                        </div>
                                    </div>
                                    <div class="row">
                                            <%--<div class="col-md-6">
                                            </div>--%>
                                        <div class="col-md-12">
                                            <span class="small pull-right ">
                                            <i class="fa fa-comments-o"> </i> ${article.artiComtNumber } 评论
                                            <i class="fa fa-eye"> </i> ${article.artiPageView } 浏览</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- 博客列表结束 -->
                        </c:forEach>
                        <!-- 链接开始 -->
                        <div class="ibox">
                            <div class="ibox-content">
                                <c:if test="${not empty artiPage}">
                                    <ul class="pagination">
                                        <li><a href="showHome/showHome?pageNo=1">«</a></li>
                                        <c:if test="${artiPage.pageNo gt 3}">
                                            <li><a href="javascript:void(0)">....</a></li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo-2 ge 1}">
                                            <li><a href="showHome/showHome?pageNo=${artiPage.pageNo-2}">${artiPage.pageNo-2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo-1 ge 1}">
                                            <li><a href="showHome/showHome?pageNo=${artiPage.pageNo-1}">${artiPage.pageNo-1}</a>
                                            </li>
                                        </c:if>
                                        <li class="active"><a
                                                href="showHome/showHome?pageNo=${artiPage.pageNo}">${artiPage.pageNo}</a>
                                        </li>
                                        <c:if test="${artiPage.pageNo+1 le artiPage.totalPage}">
                                            <li><a href="showHome/showHome?pageNo=${artiPage.pageNo+1}">${artiPage.pageNo+1}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo+2 le artiPage.totalPage}">
                                            <li><a href="showHome/showHome?pageNo=${artiPage.pageNo+2}">${artiPage.pageNo+2}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${artiPage.pageNo+2 lt artiPage.totalPage}">
                                            <li><a href="javascript:void(0)">....</a></li>
                                        </c:if>
                                        <li><a href="showHome/showHome?pageNo=${artiPage.totalPage}">»</a>
                                        </li>
                                    </ul>
                                </c:if>
                            </div>
                        </div>
                        <!-- 链接结束 -->
                    </div>
                    <%--博客栏结束--%>
                    <div class="col-md-3" style="padding-left:0px;">
                        <div class="ibox">
                            <div class="tabs-container">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#tab-3" aria-expanded="true">
                                        <h3 class="font-bold">网站信息</h3></a></li>
                                    <li class=""><a data-toggle="tab" href="#tab-4" aria-expanded="false">
                                        <h3 class="font-bold">会员中心</h3></a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div id="tab-3" class="tab-pane active">
                                        <div class="panel-body" style="padding: 0px;">
                                            <ul>
                                                <li>网站名称：LSG's Blog</li>
                                                <li>博客系统：<a href="//github.com/liaoshanggang" target="_blank"
                                                            style="font-style: italic;">
                                                    <i class="fa fa-github" style="font-size:24px"></i>LSG's Blog</a></li>
                                                <li>交流反馈：
                                                    <a target="_blank"
                                                       href="//shang.qq.com/wpa/qunwpa?idkey=a2db8d0fa1aa7f91fabf149d9f868efa1811e0a6839851220a9c2b2ecaf0bce7">
                                                        <img border="0" src="//pub.idqqimg.com/wpa/images/group.png"
                                                             alt="笔记博客 ~ 交流反馈" title="笔记博客 ~ 交流反馈"></a></li>
                                                <li>前端UI：<a href="//www.bootcss.com/" target="_blank">Bootstrap</a></li>
                                                <li>后端架构：<a href="//spring.io/projects"
                                                            target="_blank">Sping、Mybatis等</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="tab-4" class="tab-pane">
                                        <div class="panel-body" style="padding: 10px;">
                                            <p class="text-center">
                                            <a href="javascript:void(0);alert('很抱歉，未实现QQ第三方登录！');" class="btn btn-white btn-md">
                                                <i class="fa fa-qq"></i> 网站用户 </a>
                                            <a href="login.jsp" class="btn btn-white btn-md">
                                                <i class="fa fa-user-o"></i> 网站管理</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="ibox">
                            <div class="ibox-content">
                                <h3 class="font-bold no-margins">搜一下
                                    <span class="pull-right">
                                        <a href="showHome/search" target="_blank" class="btn-link">
                                            <i><strong>前往</strong> <i class="fa fa-angle-double-right"></i></i>
                                        </a>
                                    </span></h3>
                            </div>
                            <div class="ibox-content"style="padding: 5px;">
                                <div class="search-form">
                                    <form action="showHome/showHome" method="get">
                                        <div class="input-group">
                                            <input type="text" placeholder="键入Enter键以搜索" name="keyWords" class="btn btn-facebook btn-outline form-control input-md">
                                            <div class="input-group-btn">
                                                <button class="btn btn-success btn-facebook btn-outline" type="submit"> 搜索 </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="ibox">
                            <div class="ibox-content">
                                <h3 class="font-bold no-margins">热门文章</h3>
                            </div>
                            <div class="ibox-content no-padding" style="display: block;">
                                <ul class="list-group" id="showHot">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===================主要内容结束=================== -->
        <!-- 底部 -->
        <%@include file="bottom.html" %>
    </div>
</div>
</body>

</html>

