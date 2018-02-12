<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    application.setAttribute("rootpath", basePath);
%>
<!DOCTYPE>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<meta name="description" content="">
    <meta name="author" content="">--%>
    <base href="${rootpath}">
    <%@include file="../css-common.jsp" %>
    <%@include file="../js-common.jsp" %>
    <title>前台主页</title>
    <style type="text/css">
        div img {
            max-width: 200px;
            height: auto;
            cursor: pointer;
            border: 1px double #cccccc;
            padding: 3px;
            zoom: expression( function(elm)
	       {     if (elm.width>200) 
	               {  var oldVW = elm.width; elm.width=200;             
	                   elm.height = elm.height*(200 /oldVW);        
	                }         elm.style.zoom = '1';     
	      }
	(this));
        }

        #title {
            width: 98%; /*必须设置宽度*/
            overflow: hidden; /*溢出隐藏*/
            text-overflow: ellipsis; /*以省略号...显示*/
            white-space: nowrap; /*强制不换行*/
        }
    </style>
</head>
<body id="" class="gray-bg">

<div id="wrapper">
    <div class="row" style="width: 100%;">
        <%@include file="../head.jsp" %>

        <!-- ===================主要内容开始=================== -->
        <div
                class="wrapper wrapper-content col-md-offset-1 animated  fadeInRight article">
            <!-- 主面板 -->
            <div class="row col-md-9">
                <div class="panel col-md-12">
                    <div class="panel-heading col-md-12">
                        <ol class="breadcrumb">
                            <li><a href="index.jsp">首页</a></li>
                            <li class="active"><strong>本页</strong></li>
                        </ol>
                    </div>
                    <div class="panel-body col-md-12">
                        <!-- 博客全文开始 -->

                        <div class="ibox col-md-12">
                            <div class="ibox-content col-md-12">
                                <div class="pull-right">
                                    <button class="btn btn-white btn-xs" type="button">模型
                                    </button>
                                    <button class="btn btn-white btn-xs" type="button">出版
                                    </button>
                                    <button class="btn btn-white btn-xs" type="button">现代
                                    </button>
                                </div>
                                <div class="text-center article-title" style="width:100%;word-wrap: break-word">
										<span class="text-muted"><i class="fa fa-clock-o"></i><fmt:formatDate
                                                value='${article.artiTime}'
                                                pattern='yyyy-MM-dd HH:mm:ss'/></span>
                                    <h1 id="title"> ${article.artiTitle }
                                    </h1>
                                </div>
                                <!-- <div style="overflow:auto"> -->
                                <div>
                                    <p>${article.artiContent }</p>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <h5>标签：
                                        </h5>
                                        <button class="btn btn-primary btn-xs" type="button">模型
                                        </button>
                                        <button class="btn btn-white btn-xs" type="button">出版
                                        </button>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="small text-right">
                                            <h5>统计：
                                            </h5>
                                            <div>
                                                <i class="fa fa-comments-o"> </i>
                                                ${article.artiComtNumber }评论
                                            </div>
                                            <i class="fa fa-eye"> </i>
                                            ${article.artiPageView }意见
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="social-avatar" style="background-color: #F7F7F7;">
                                        <h3>
                                            <a href="#">
                                                ${logUser.userName}
                                            </a><span>发表我的评论</span></h3>
                                    </div>
                                    <div class="social-body">
                                        <form action="javascript:void(0);" id="commentForm">
                                            <input type="hidden" class="form-control" name="comtArtiId"
                                                   value="${article.artiId}"/>
                                            <textarea class="form-control" name="comtContent" placeholder="写点什么..."
                                                      required></textarea>
                                            <button id="addComment" class="form-control btn btn-white"
                                                    style="background-color: #F8F8F8;">提交评论
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                网友最新评论 (${commentPage.getTotalRow()})
                                <hr>
                                <!-- 评论开始 -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <!-- 一条评论开始 -->
                                        <c:forEach var="comment" items="${commentList}" varStatus="status">
                                            <div class="social-feed-box">
                                                <div class="social-avatar">
                                                    <a href="" class="pull-left">
                                                        <img alt="图片" class="img-circle" src="img/a1.jpg">
                                                    </a>
                                                    <div class="media-body">
                                                        <a href="#">${comment.comtUserId}</a>
                                                        <small class="text-muted">
                                                            <fmt:formatDate value='${comment.comtTime}'
                                                                            pattern='yyyy-MM-dd HH:mm:ss'/> 评论：
                                                        </small>
                                                        <p class="">${comment.comtContent}</p>
                                                            <%--回复开始--%>
                                                        <c:forEach var="reply" items="${comment.replies}"
                                                                   varStatus="status1">
                                                            <div class="social-avatar">
                                                                <a href="" class="pull-left">
                                                                    <img alt="图片" class="img-circle" src="img/a1.jpg">
                                                                </a>
                                                                <div class="media-body">
                                                                    <a href="#">安德鲁·威廉姆斯</a>
                                                                    <small class="text-muted"><fmt:formatDate
                                                                            value='${reply.replyTime}'
                                                                            pattern='yyyy-MM-dd HH:mm:ss'/> 回复：
                                                                    </small>
                                                                    <p class="">${reply.replyContent}</p>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                            <%--回复结束--%>
                                                        <div class="pull-right">
                                                            <a class="btn btn-xs btn-white">
                                                                <i class="fa fa-thumbs-up"></i>Like
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- 一条评论结束 -->
                                    </div>
                                </div>
                                <!-- 评论结束 -->
                                <!-- 分页链拉开始 -->
                                <div class="row" style="width: 50px">
                                    <div class="col-lg-12">
                                        <c:if test="${not empty commentPage}">
                                            <ul class="pagination">
                                                    <%--article/queryById/${article.artiId }/detail--%>
                                                <li><a href="article/queryById/${article.artiId }/detail?pageNo=1">«</a></li>
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
                                                <li><a href="article/queryById/${article.artiId }/detail?pageNo=${commentPage.totalPage}">»</a>
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
                </div>
            </div>
            <!-- 主面板 -->

            <div class="col-md-3">
                <div class="panel">
                    <div class="panel-heading">
                        <i class="fa fa-info-circle"></i> 5555信息面板
                    </div>
                    <div class="panel-body">
                        <p>Lorem存有悲坐阿梅德，consectetur
                            adipiscing ELIT。前庭是租赁。最新的足球教练池，并设置毕业分类宣传。
                        </p>
                    </div>

                </div>
            </div>
        </div>

        <!-- ===================主要内容结束=================== -->


    </div>
</div>
<!-- <hr style="height: 100;color:red;"> -->
<!-- 底部 -->
<footer style="background-color: white;">
    <div>
        <div style="text-align: center; margin-top: 0px;">
            <strong>Copyright</strong> &copy; ForwardLiao 2018
        </div>
    </div>
</footer>
<script type="text/javascript">
    $('#addComment').click(function () {
        var data = $('#commentForm').serialize();
        console.log("序列化" + data);
        $.ajax({
            url: "comment/add",
            type: "post",
            data: data,
            dataType: "json",
            success: function (result) {
                console.info(result);
            },
            error: function () {
            }
        });
    });
</script>
</body>
</html>