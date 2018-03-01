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
    <title>前台主页</title>
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
            margin-top: 10px;
        }

        .post-copyright a {
            color: #999;
            text-decoration: none;
        }

        .detailInfo {
            max-width: 100%;
            border-top: #E6E6E6 1px solid;
            border-bottom: #E6E6E6 1px solid;
            padding: 10px;

            white-space: pre-wrap;
            word-wrap: break-word;
            /*height: 5em;*/
            /*margin: 1em;*/
            /*overflow:hidden;*/
        }
        .social-feed-box a{
            href:"javascript:void(0)";
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
                                <div class="text-center article-title" style="width:100%;word-wrap: break-word">
                                    <h1 id="title"> ${article.artiTitle }
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
                                <hr>
                                <div class="detailInfo">${article.artiContent }
                                </div>
                                <hr>
                                <div class="post-copyright">
                                    <p>转载请注明：
                                        <a href="">一个看起来不像博客的博客</a> » <a href="">${article.artiTitle }</a>
                                    </p>
                                </div>
                                <div class="small text-left">
                                    <button class="btn btn-md btn-white"><i
                                            class="fa fa-share"></i> Share
                                    </button>
                                </div>
                                <div class="small text-right">
                                    标签：
                                    <button class="btn btn-white btn-xs" type="button">模型
                                    </button>
                                    <button class="btn btn-white btn-xs" type="button">出版
                                    </button>
                                    <button class="btn btn-white btn-xs" type="button">现代
                                    </button>
                                </div>
                                <hr>
                                <div class="pull-center text-center"><a class="btn btn-lg btn-white">
                                    <i class="fa fa-thumbs-up"></i>赞（10）
                                </a></div>
                                <div class="row">
                                    <div class="social-avatar" style="background-color: #F7F7F7;">
                                        <h3>
                                            <a href="#">
                                                ${logUser.userName}
                                            </a><span>发表我的评论</span></h3>
                                    </div>
                                    <div class="social-body">
                                        <form action="" name="a1" id="commentForm"><%--javascript:void(0);--%>
                                            <input type="hidden" class="form-control" name="comtArtiId"
                                                   value="${article.artiId}"/>
                                            <textarea class="form-control" name="comtContent" placeholder="写点什么..."
                                                      required></textarea>
                                            <button id="addComment" class="form-control btn btn-white"
                                                    style="background-color: #F8F8F8;" name="${commentPage.pageNo}">提交评论
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                网友最新评论 (${commentPage.getTotalRow()})<input class="pull-right btn btn-white"
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
                                                    <a href="" class="pull-left">
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
                                                                <i class="fa fa-comments"></i> <span>回复</span>
                                                            </button>
                                                            <button class="btn btn-danger btn-outline btn-xs delComment"
                                                                    type="button" value="${comment.comtId}">删除
                                                            </button>
                                                        </div>
                                                        <a href="#">${comment.getBlogUsers().getUserName()}</a>
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
                                                                <a href="" class="pull-left">
                                                                    <img alt="回复者头像" class="img-circle"
                                                                         src="../${reply.getBu().getUserImageUrl()}">
                                                                </a>
                                                                <div class="media-body">
                                                                    <a href="#">${reply.getBu().getUserName()}</a>
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
                                            <ul class="pagination">
                                                    <%--article/queryById/${article.artiId }/detail--%>
                                                <li><a href="article/queryById/${article.artiId }/detail?pageNo=1">«</a>
                                                </li>
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
                                                <li class="active"><a
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
                                                <li>
                                                    <a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.totalPage}">»</a>
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
                        <div class="panel">
                            <div class="panel-heading">
                                <h1>
                                    <i class="fa fa-info-circle"></i><%--<a
                                href="views/templet.jsp">后台管理主页</a>--%>
                                </h1>
                            </div>
                            <div class="panel-body">
                                <p>Lorem存有悲坐阿梅德，consectetur
                                    adipiscing ELIT。前庭是租赁。
                                    最新的足球教练池，并设置毕业分类宣传。
                                </p>
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
<!-- Toastr script -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript">
    $(function(){
        var logUser = "<%=session.getAttribute("logUser")%>";
        //console.info(logUser+"类型"+typeof(logUser));
        var n = logUser.split(",");
        var userType;
        for(var i=0;i<n.length;i++){
            n2 = n[i].split("=");
            if(n2[0].match("userType")){
                userType = n2[1];
                break;
            }
        }
        console.info("类型"+userType);
        if(logUser!="null" && userType==1){
            $(".delComment").show();
            $(".delReply").show();
        }else{
            $(".delComment").hide();
            $(".delReply").hide();
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
    $('#addComment').click(function () {
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
            "    <form action=\"javascript:void(0);\" name=\"a1\" id=\"replyForm\"><%--javascript:void(0);--%>\n" +
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
            "        var data = $('#replyForm').serialize();\n" +
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
                var json = {comtId: id,comtArtiId:comtArtiId};
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
                var json = {replyId: id,artiId:artiId};
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
</body>

</html>

