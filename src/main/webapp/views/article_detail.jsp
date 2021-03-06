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
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<meta name="description" content="">
    <meta name="author" content="">--%>
    <base href="${rootpath}">
    <%@include file="../css-common.jsp" %>
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <%@include file="../js-common.jsp" %>
    <!-- Nestable List -->
    <script src="js/plugins/nestable/jquery.nestable.js"></script>
    <title>${article.artiTitle }</title>
    <script>
        window.onbeforeunload = function () {
            var scrollPos;
            if (typeof window.pageYOffset != 'undefined') {
                scrollPos = window.pageYOffset;
            }
            else if (typeof document.compatMode != 'undefined' &&
                document.compatMode != 'BackCompat') {
                scrollPos = document.documentElement.scrollTop;
            }
            else if (typeof document.body != 'undefined') {
                scrollPos = document.body.scrollTop;
            }
            document.cookie = "scrollTop=" + scrollPos; //存储滚动条位置到cookies中

        }
        window.onload = function () {
            if (document.cookie.match(/scrollTop=([^;]+)(;|$)/) != null) {
                var arr = document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
                document.documentElement.scrollTop = parseInt(arr[1]);
                document.body.scrollTop = parseInt(arr[1]);
            }
        }
    </script>
    <style type="text/css">

        .ibox-content img {
            max-width: 100%;
            max-height: 100%;
            cursor: pointer;
        }

        #title {
            width: 98%; /*必须设置宽度*/
            overflow: hidden; /*溢出隐藏*/
            text-overflow: ellipsis; /*以省略号...显示*/
            white-space: nowrap; /*强制不换行*/
        }

        .post-copyright {
            background-color: #f2f2f2;
            font-size: 12px;
            color: #999;
            padding: 6px 15px 5px;
            border-radius: 2px;
            text-align: center;
            margin: 10px 0px;
        }

        .post-copyright a {
            color: #999;
            text-decoration: none;
        }

        .detailInfo {
            max-width: 100%;
            border-top: #E6E6E6 1px solid;
            border-bottom: #E6E6E6 1px solid;
            padding: 20px 0px 5px 0px;
            margin: 20px 0px;
            word-wrap: break-word;
        }

        /*white-space: pre-wrap;*/
        /*height: 5em;*/
        /*margin: 1em;*/
        /*overflow:hidden;*/
        .social-feed-box a {
            href: "javascript:void(0)";
        }

        .post-like {
            margin-top: 45px;
            padding: 10px;
        }

        .post-like a {
            padding: 10px 10px 5px 20px;
            background-color: #eb5745;
            border-radius: 4px;
            color: #FFFFFF;
            text-decoration: none;
            outline: none;
        }
    </style>
</head>


<body class="canvas-menu">

<div id="wrapper">
    <!-- 左边导航栏开始 -->
    <%--<%@include file="../left_nav.jsp" %>--%>
    <!-- 左导航栏结束 -->
    <div id="page-wrapper" class="gray-bg" style="padding: 0px;">
        <!-- 头部开始 -->
        <%@include file="../head.jsp" %>
        <!-- 头部结束 -->

        <!-- ===================主要内容开始=================== -->
        <div class="row">
            <div class="container" style="padding: 0px 0px 40px 0px;">
                <div class="wrapper wrapper-content animated fadeInUp" style="padding: 0px;"><%-- article--%>

                    <%--博客栏开始--%>
                    <div class="col-md-9">
                        <!-- 博客全文开始 -->
                        <div class="ibox">
                            <div class="ibox-content">
                                <div class="text-center" style="width:100%;word-wrap: break-word">
                                    <h1 id=""> ${article.artiTitle }
                                    </h1>
                                    <span class="text-muted pull-center">
                                        <i class="fa fa-clock-o"><fmt:formatDate value='${article.artiTime}'
                                                                                 pattern='yyyy-MM-dd'/></i>
                                        <i class="fa fa-list-alt" style="margin-left: 20px"> ${article.artiCatgId } </i>
                                        <i class="fa fa-comments-o"
                                           style="margin-left: 20px"> ${article.artiComtNumber }评论 </i>
                                        <i class="fa fa-eye" style="margin-left: 20px">${article.artiPageView }浏览 </i>
                                     </span>
                                </div>
                                <!-- <div style="overflow:auto"> -->
                                <div class="detailInfo">${article.artiContent }
                                    <div class="post-copyright">
                                        <p>转载请注明：
                                            <a href="article/queryById/${article.artiId }/detail">一个看起来不像博客的博客</a> »
                                            <a href="article/queryById/${article.artiId }/detail">${article.artiTitle }</a>
                                        </p>
                                    </div>
                                    <div class="small pull-left">
                                        <div class="bdsharebuttonbox">
                                            <span style="float:left;position: relative;top: 5px;">分享到：</span>
                                            <a href="#" class="bds_more" data-cmd="more"></a>
                                            <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                                            <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                                            <a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
                                            <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                                            <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
                                            <a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网">
                                            </a><a href="#" class="bds_copy" data-cmd="copy" title="分享到复制网址"></a>
                                        </div>
                                        <%--<button class="btn btn-xs btn-white"><i
                                                class="fa fa-share" ></i> Share
                                        </button>--%>
                                    </div>
                                    <div class="small pull-right">
                                        <button class="btn btn-white btn-xs" type="button" id="addCollect">
                                            <a><i class="fa fa-bookmark-o"></i>收藏</a>
                                        </button>
                                    </div>
                                    <div class="pull-center text-center post-like">
                                        <a href="javascript:void(0);" class="btn-lg" id="thumbUp">
                                            <i class="fa fa-thumbs-up" style="font-size:30px;"></i>
                                            赞（<span id="thumbUpNum" name="${thumbUpNum}">${thumbUpNum}</span>）
                                        </a>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="social-avatar" style="background-color: #F7F7F7;">
                                        <h3>
                                            <a href="javascript:void(0);">
                                                ${logUser.userName}
                                            </a><span>发表我的评论</span></h3>
                                    </div>
                                    <div class="social-body">
                                        <form action="" method="post" name="a1"
                                              id="commentForm"><%--javascript:void(0);--%>
                                            <input type="hidden" class="form-control" name="comtArtiId"
                                                   value="${article.artiId}"/>
                                            <textarea class="form-control" id="comtContent" name="comtContent"
                                                      placeholder="写点什么..."
                                                      required="required"></textarea>
                                            <button id="addComment" class="form-control btn btn-white"
                                                    style="background-color: #F8F8F8;" name="${commentPage.pageNo}">提交评论
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                网友最新互动 (${commentPage.getTotalRow()})<input class="pull-right btn btn-white"
                                                                            type="button" id="toggle"
                                                                            value="隐藏>>>回复<<<">
                                <hr>
                                <!-- 评论开始 -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <!-- 一条评论开始 -->
                                        <c:forEach var="comment" items="${commentList}" varStatus="status">
                                            <div class="social-feed-box">
                                                <div class="social-avatar">
                                                    <a href="javascript:void(0);" class="pull-left">
                                                        <img alt="评论者头像" class="img-circle"
                                                             src="../${comment.getBlogUsers().getUserImageUrl()}">
                                                    </a>
                                                    <div class="media-body">
                                                        <div class="btn-group pull-right">
                                                                <%--<button class="btn btn-white btn-xs"><i
                                                                        class="fa fa-thumbs-up"></i> 赞
                                                                </button>--%>
                                                            <button class="btn btn-white btn-xs showReplyInput "
                                                                    value="${comment.comtId}"
                                                                    name="${commentPage.pageNo}">
                                                                <i class="fa fa-comments"></i> <span
                                                                    class="showR">回复</span>
                                                            </button>
                                                            <button class="btn btn-danger btn-outline btn-xs delComment"
                                                                    type="button" value="${comment.comtId}">删除
                                                            </button>
                                                        </div>
                                                        <a href="javascript:void(0);">${comment.getBlogUsers().getUserName()}</a>
                                                        <small class="text-muted">
                                                            <fmt:formatDate value='${comment.comtTime}'
                                                                            pattern='yyyy-MM-dd HH:mm:ss'/> 评论：
                                                        </small>
                                                        <p class="">${comment.comtContent}</p>

                                                        <div id="showInput${comment.comtId}" class="show"></div>
                                                            <%--回复开始--%>
                                                        <c:forEach var="reply" items="${comment.replies}"
                                                                   varStatus="status1">
                                                            <div class="social-avatar toggleReply">
                                                                <div class="btn-group pull-right">
                                                                        <%--<button class="btn btn-success btn-outline btn-xs "
                                                                                type="button">回复
                                                                        </button>--%>
                                                                    <button class="btn btn-danger btn-outline btn-xs delReply"
                                                                            type="button" value="${reply.replyId}">删除
                                                                    </button>
                                                                </div>
                                                                <a href="javascript:void(0);" class="pull-left">
                                                                    <img alt="回复者头像" class="img-circle"
                                                                         src="../${reply.getBu().getUserImageUrl()}">
                                                                </a>
                                                                <div class="media-body">
                                                                    <a href="javascript:void(0);">${reply.getBu().getUserName()}</a>
                                                                    <small class="text-muted"><fmt:formatDate
                                                                            value='${reply.replyTime}'
                                                                            pattern='yyyy-MM-dd HH:mm:ss'/> 回复：
                                                                    </small>
                                                                    <p class="">${reply.replyContent}</p>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                            <%--回复结束--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- 一条评论结束 -->
                                    </div>
                                </div>
                                <!-- 评论结束 -->
                                <!-- 分页链拉开始 -->
                                <div class="row">
                                    <div class="social-body">
                                        <c:if test="${not empty commentPage}">
                                            <ul class="pager pagination pagination-lg">
                                                    <%--article/queryById/${article.artiId }/detail--%>
                                                <li>
                                                    <a href="article/queryById/${article.artiId }/detail?pageNo=1">首页</a>
                                                </li>
                                                <c:if test="${commentPage.pageNo gt 1 &&  commentPage.pageNo le commentPage.totalPage}">
                                                    <li>
                                                        <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.pageNo-1}">«上一页</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${commentPage.pageNo gt 3}">
                                                    <li><a href="javascript:void(0)">....</a></li>
                                                </c:if>
                                                <c:if test="${commentPage.pageNo-2 ge 1}">
                                                    <li>
                                                        <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.pageNo-2}">${commentPage.pageNo-2}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${commentPage.pageNo-1 ge 1}">
                                                    <li>
                                                        <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.pageNo-1}">${commentPage.pageNo-1}</a>
                                                    </li>
                                                </c:if>
                                                <li class="active" style="color:black ;font-weight:bold;"><a
                                                        href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.pageNo}">${commentPage.pageNo}</a>
                                                </li>
                                                <c:if test="${commentPage.pageNo+1 le commentPage.totalPage}">
                                                    <li>
                                                        <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.pageNo+1}">${commentPage.pageNo+1}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${commentPage.pageNo+2 le commentPage.totalPage}">
                                                    <li>
                                                        <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.pageNo+2}">${commentPage.pageNo+2}</a>
                                                    </li>
                                                </c:if>
                                                <c:if test="${commentPage.pageNo+2 lt commentPage.totalPage}">
                                                    <li><a href="javascript:void(0)">....</a></li>
                                                </c:if>
                                                <c:if test="${commentPage.pageNo ge 1 && commentPage.pageNo lt commentPage.totalPage }">
                                                    <li>
                                                        <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.pageNo+1}">下一页»</a>
                                                    </li>
                                                </c:if>
                                                <li>
                                                    <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.totalPage}">尾页</a>
                                                </li>
                                            </ul>
                                        </c:if>
                                    </div>
                                </div>
                                <!-- 分页链拉结束 -->
                            </div>
                        </div>
                        <!-- 博客全文结束 -->

                    </div>
                    <%--博客栏结束--%>

                    <div class="col-md-3" style="padding-left:0px;">
                        <div class="ibox" id="showBg">
                            <div class="tabs-container">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a data-toggle="tab" href="#tab-4" aria-expanded="false">
                                        <h3 class="font-bold">会员中心</h3></a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div id="tab-4" class="tab-pane active">
                                        <div class="panel-body" style="padding: 10px;">
                                            <p class="text-center">
                                                <a href="javascript:void(0);alert('很抱歉，未实现QQ第三方登录！');"
                                                   class="btn btn-white btn-md">
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
                                        <a href="search" target="_blank" class="btn-link">
                                            <i><strong>前往</strong> <i class="fa fa-angle-double-right"></i></i>
                                        </a>
                                    </span></h3>
                            </div>
                            <div class="ibox-content" style="padding: 5px;">
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
        <%@include file="../bottom.html" %>
    </div>
</div>
<style>
    .fixed-btn {
        position: fixed;
        right: 1%;
        bottom: 5%;
        width: 40px;
        border: 1px solid #eee;
        background-color: white;
        font-size: 24px;
        z-index: 1040;
        -webkit-backface-visibility: hidden;
    }

    .fixed-btn .go-top {
        border-bottom: 1px solid #eee;
    }

    .fixed-btn a {
        display: inline-block;
        width: 40px;
        height: 40px;
        text-align: center;
        color: #64854c;
        text-decoration: none;
    }

    .fixed-btn a i {
        vertical-align: middle;
    }

    .fixed-btn .writer {
        background-color: #96b97d;
        font-size: 18px;
        color: white;
    }

    .fixed-btn .modal.fade.in {
        top: auto;
        bottom: 0;
        height: 188px;
        width: 128px;
        padding: 10px;
        margin: 0;
        right: 65px;
        left: auto;
        text-align: center;
    }
</style>
<div class="fixed-btn">
    <a class="go-top" id="toTop" href="javascript:void(0)" title="返回顶部" style="display: inline-block;"> <i
            class="fa fa-angle-up"></i></a>
    <%--<a class="qrcode" href="javascript:void(0)" title="关注我们"><i class="fa fa-qrcode"></i></a>--%>
    <%--<a class="writer" target="_blank" href="//mail.qq.com/cgi-bin/qm_share?t=qm_mailme&amp;email=ssbDyoOAgfLU3crf09venNHd3w" style="font-size: 12px;" title="Bug 反馈"><i class="fa fa-envelope-o" style="font-size: 20px;"></i></a>--%>
    <%--<!-- qrcode modal -->--%>
    <%--<div id="bottom-qrcode" class="modal panel-modal hide fade in" style="display: none;">--%>
    <%--<h4>微信关注</h4>--%>
    <%--<div class="panel-body"><img alt="微信关注" width="128" height="128" src="/wp-content/themes/runoob/assets/images/qrcode.png"></div>--%>
    <%--</div>--%>
</div>
<!-- Toastr script -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script><%--<%=session.getAttribute("logUser")%>--%>
$(function () {
    $(function () {
        $("#toTop").click(function () {
            $("html").animate({"scrollTop": "0px"}, 100); //IE,FF
            $("body").animate({"scrollTop": "0px"}, 100); //Webkit
        });
    })
    /*var logUser = "";
    //console.info(logUser+"类型"+typeof(logUser));
    if (logUser == "null") {
    } else {
        $("#tab-4").children().children().empty().append("<a class='btn-link'><h3>欢迎来到我的博客！</h3><a>");
    }*/

    $.get("article/selectHot", function (data) {
        var showHot = $("#showHot");
        $.each(data, function (i, item) {
            //console.info(item.artiId+"=="+item.artiTitle);
            var option = $("<li class=\"title list-group-item\" style=\"padding-left:25px\"><a href=\"article/queryById/" + item.artiId + " /detail\"\n" +
                "  class=\"btn-link\">" + item.artiTitle + "</a></li>");
            showHot.append(option);
        });
    }, "json");
})

</script>
<script type="text/javascript">
    $(function () {
        var logUser = "<%=session.getAttribute("logUser")%>";
        //console.info(logUser+"类型"+typeof(logUser));
        var n = logUser.split(",");
        var userType;
        for (var i = 0; i < n.length; i++) {
            n2 = n[i].split("=");
            if (n2[0].match("userType")) {
                userType = n2[1];
                break;
            }
        }
        console.info("类型" + userType);
        if (logUser != "null" && userType == 1) {
            $(".delComment").show();
            $(".delReply").show();
            $("#showBg").empty();
            $("#showBg").append("<div class=\"ibox-content\"><a class='' href=\"bg_mgt\"><h1>\n" +
                "<i class=\"fa fa-info-circle\"></i>管理文章</h1></a></div>");
        } else {
            $(".delComment").hide();
            $(".delReply").hide();
            $("#tab-4").children().children().empty().append("<a class='btn-link'><h3>欢迎来到我的博客！</h3><a>");
        }
    })
    //展开
    $("#toggle").click(function () {
        if ($("#toggle").val() == "展开<<<回复>>>") {
            $("#toggle").val("隐藏>>>回复<<<");
            $(".toggleReply").show().fadeIn(1000);
        } else {
            $("#toggle").val("展开<<<回复>>>");
            $(".toggleReply").hide().fadeOut(1000);
        }
    });
    var hasThumbUp = false;
    $('#thumbUp').click(function () {
        if (hasThumbUp) {
            success("你已赞过该文章了");
            return;
        }
        var artiId = $("[name='comtArtiId']").val();
        var json = {artiId: artiId};
        console.info(artiId);
        $.ajax({
            url: "visitor/thumbUp",
            type: "post",
            data: json,
            //dataType: "json",
            success: function (result) {
                console.info(typeof(result) + result);
                if (result != "error") {
                    hasThumbUp = false;
                    $("#thumbUpNum").text(result);
                } else {
                    $("#thumbUp").css("cursor", "not-allowed");
                    hasThumbUp = true;
                    success("你已赞过该文章了");
                }
            },
            error: function () {
                alert("失败");
            }
        });
    });
    $('#addCollect').click(function () {
        var artiId = $("[name='comtArtiId']").val();
        var data = {artiId: artiId};
        $.ajax({
            url: "collect/add",
            type: "post",
            data: data,
            /*dataType: "json",*/
            success: function (result) {
                if (result == "exit") {
                    success("你已收藏过了");
                }
                if (result == "success") {
                    success("收藏成功！请到个人中心查看");
                }
                if (result == "error") {
                    success("请登陆后收藏！");
                }
            },
            error: function () {
                success("收藏失败");
            }
        });
    });
    $('#addComment').click(function () {
        /*if ($("[name='comtContent']").text() == "") {
            success("请填写评论内容！");
            return;
        }*/
        var data = $('#commentForm').serialize();
        console.log("序列化" + data);
        $.ajax({
            url: "comment/add",
            type: "post",
            data: data,
            //dataType: "json",
            success: function (result) {
                console.info(result);
            },
            error: function () {
                alert("请登陆后评论");
            }
        });
    });
    $('.showReplyInput').click(function (event) {
        var artiId = $("[name='comtArtiId']").val();
        var replyComtId = $(this).val();
        //console.info($(this).find("span"));
        var span = $(this).find("span");
        var reply = span.text();
        if (reply == "回复") {
            $(".showR").text("回复");//点当前回复时把其他取消回复变为回复
            span.text("取消回复");
        } else {
            span.text("回复");
            $(".show").empty();
            return;
        }
        var pageNo = $(this).attr("name");
        console.info("replyComtId" + replyComtId);
        $(".show").empty();
        $('#showInput' + replyComtId).empty();
        $('#showInput' + replyComtId).append("<div class=\"social-body\">\n" +
            "    <form action=\"\" name=\"a1\" id=\"replyForm\"><%--javascript:void(0);--%>\n" +
            "        <input type=\"hidden\" class=\"form-control\" name=\"replyComtId\"\n" +
            "               value=\"" + replyComtId + "\"/>\n" +
            "        <input type=\"hidden\" class=\"form-control\" name=\"artiId\"\n" +
            "               value=\"" + artiId + "\"/>\n" +
            "        <textarea class=\"form-control\" name=\"replyContent\" placeholder=\"写点什么...\"\n" +
            "                  required></textarea>\n" +
            "        <button id=\"addReply\" class=\"form-control btn btn-white\"\n" +
            "                style=\"background-color: #F8F8F8;\">提交回复\n" +
            "        </button>\n" +
            "    </form>\n" +
            "</div><script>\n" +
            "    $('#addReply').click(function () {\n" +
/*            "        if($(\"[name='replyContent']\").text()==''){\n" +
            "            //success(\"请填写回复内容！\");\n" +
            "            return ;\n" +
            "        }" +*/
            "var data = $('#replyForm').serialize();\n" +
            "        console.log(\"序列化\" + data);\n" +
            "        $.ajax({\n" +
            "            url: \"reply/add\",\n" +
            "            type: \"post\",\n" +
            "            data: data,\n" +
            "            success: function (result) {\n" +
            "                //$(\".show\").empty();\n" +
            "                console.info(result);location=location;\n" +
            "            },\n" +
            "            error: function () {\n" +
            "                alert(\"error\");\n" +
            "            }\n" +
            "        });\n" +
            "    });" + "<\/script>");

        //$('#showInput'+userId).load("views/reply_input.jsp");
    });
    $(".delComment").click(function () {
        var cur = $(this);
        swal({
            title: "你确定要删除吗？",
            text: "",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#ED5565",//DD6B55
            confirmButtonText: "是的，删除它！",
            cancelButtonText: "不，取消！",
            allowOutsideClick: true,
            closeOnConfirm: true,
            closeOnCancel: true
        }, function (isConfirm) {
            if (isConfirm) {
                //swal("删除!", "你的虚构文件已被删除.", "success");
                var curTr = $(cur).parent().parent().parent().parent();
                var id = $(cur).attr("value");
                var comtArtiId = $("[name='comtArtiId']").val();
                var json = {comtId: id, comtArtiId: comtArtiId};
                $.ajax({
                    url: "comment/del",
                    type: "post",
                    data: json,
                    success: function (result) {
                        //console.info(result);
                        if (result == "success") {
                            //console.info(curTr);
                            curTr.remove();
                            success("删除成功！");
                            location = location;
                        }
                    },
                    error: function () {
                    }
                });
            } else {
                //swal("取消", "该类别未删除！:):):)", "error");
            }
        });
    })

    $(".delReply").click(function () {
        var cur = $(this);
        swal({
            title: "你确定要删除吗？",
            text: "",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#ED5565",//DD6B55
            confirmButtonText: "是的，删除它！",
            cancelButtonText: "不，取消！",
            allowOutsideClick: true,
            closeOnConfirm: true,
            closeOnCancel: true
        }, function (isConfirm) {
            if (isConfirm) {
                var curTr = $(cur).parent().parent();
                var id = $(cur).attr("value");
                var artiId = $("[name='comtArtiId']").val();
                var json = {replyId: id, artiId: artiId};
                $.ajax({
                    url: "reply/del",
                    type: "post",
                    data: json,
                    success: function (result) {
                        //console.info(result);
                        if (result == "success") {
                            //console.info(curTr);
                            curTr.remove();
                            success("删除成功！");
                            location = location;
                        }
                    },
                    error: function () {
                    }
                });
            } else {
            }
        });
    })
</script>
<!-- 底部 -->
<script>
    window._bd_share_config = {
    "common": {
        "bdSnsKey": {},
        "bdText": "",
        "bdMini": "1",
        "bdMiniList": false,
        "bdPic": "",
        "bdStyle": "0",
        "bdSize": "16"
    },
    "share": {},
    "image": {
        "viewList": ["qzone", "tsina", "tqq", "weixin", "sqq", "renren", "copy"],
        "viewText": "分享到：",
        "viewSize": "16"
    },
    "selectShare": {
        "bdContainerClass": null,
        "bdSelectMiniList": ["qzone", "tsina", "tqq", "weixin", "sqq", "renren", "copy"]
    }
};
with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
</body>

</html>

