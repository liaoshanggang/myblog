<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.blog.vo.BlogUsers" %>
<style>
    .fixed-btn {
        position: fixed;
        left: 1%;
        bottom: 40px;
        width: 40px;
        border: 1px solid #eee;
        background-color: white;
        font-size: 24px;
        z-index: 1040;
        -webkit-backface-visibility: hidden;
    }

    .fixed-menu {
        position: fixed;
        left: 1%;
        bottom: 80px;
        width: 100px;
        border: 1px solid #eee;
        background-color: white;
        font-size: 24px;
        z-index: 1040;
        -webkit-backface-visibility: hidden;
    }

    .fixed-menu a {
        border-bottom: 1px solid #eee;
        display: inline-block;
        width: 100px;
        height: 40px;
        text-align: center;
        color: #64854c;
        text-decoration: none;
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
</style>
<div id="menu" class="fixed-menu" style="display:none;">
    <a href="article/query"> <span class="nav-label">文章管理</span> </a>
    <a href="category/query"> <span class="nav-label">类别管理</span> </a>
    <a href="comment/query"> <span class="nav-label">评论管理</span> </a>
    <a href="fileInfo/queryByPath?path=user/files"> <span class="nav-label">文件管理</span> </a>
    <a href="user/queryAll"> <span class="nav-label">用户管理</span> </a>
</div>
<div class="fixed-btn collapse" id="showMenu">
    <a class="go-top" id="toTop" href="javascript:void(0)" title="返回顶部" style="display: inline-block;"> <i
            class="fa fa-bars"></i></a>
</div>
<!-- 头部开始 -->
<div class="row border-bottom">
    <nav class="navbar navbar-static-top  " role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <!-- href="#"没有效果 -->
            <a class="navbar-minimalize minimalize-styl-2 btn btn-white "
               data-toggle="collapse" href="#left_nav"><i class="fa fa-bars"></i> </a>
            <div class="pull-left" id="localtime" style="font-size: 10px;padding-top: 8px;"></div>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li><span class="m-r-sm text-muted welcome-message"> <marquee
                    onmouseover="this.stop();" onmouseout="this.start();"
                    style="font-size: 10px;height: 40px;padding-top: 25px;">
						欢迎来到廖尚岗的个人博客网站 </marquee>
			</span></li>
            <li class="nav_li"><a href="search"> <i class="fa fa-search"></i>搜索</a></li>
            <%
                BlogUsers user = (BlogUsers) session.getAttribute("logUser");
                if (user != null) {
                    if (user.getUserType() == 1) {
            %>
            <li class="nav_li"><a href="views/edit_article.jsp"><i class="fa fa-edit"></i>Go!写博客</a></li>
            <%
                }
            %>
            <li class="nav_li"><a href="user/logOff"> <i class="fa fa-sign-out"></i> 注销
            </a></li>
            <li class="nav_li"><a id="headImg" href="user/showMe" style="height: 67px;">
                <img alt="image" class="img-circle" style="width: 35px;height: 35px;"
                     src="../<%=user.getUserImageUrl()%>">
            </a></li>
            <%
            } else {
            %>
            <li class="nav_li"><a data-toggle="modal" data-target="#myModel3"> <i class="fa fa-sign-out"></i> 去登陆
            </a></li>
            <%} %>
        </ul>
    </nav>
</div>
<!-- 头部结束 -->

<div id="modal"></div>

<script>
    $("#toTop").click(function () {
        $("#menu").toggle();
    });
    $(window).resize(function () {
        fixed();
    });

    function fixed() {
        if (document.body.clientWidth < 750) {
            //$("#showMenu").show();
            $("#showMenu").addClass("in");
        } else {
            $("#showMenu").removeClass("in");
            //$("#showMenu").hide();
            $("#menu").hide();
        }
    }
</script>
<script>
    $(function () {
        $("body").css("background-color", "#20222a");
        $('#modal').load('loginRegister.html');
    })
</script>