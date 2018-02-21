<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- 头部开始 -->
<%@page import="com.blog.vo.BlogUsers" %>
<!-- 头部开始 -->
<div class="row border-bottom">
    <nav class="navbar navbar-static-top  " role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <!-- href="#"没有效果 -->
            <a class="navbar-minimalize minimalize-styl-2 btn"><i
                    class="fa fa-graduation-cap" style="font-size: 25px;"></i> <i style="font-size: 25px;">LSG's
                Blog</i></a>
            <form role="search" class="navbar-form-custom"
                  action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..."
                           class="form-control" name="top-search" id="top-search" style="padding-top:20px">
                </div>
            </form>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li><span class="m-r-sm text-muted welcome-message"> <marquee
                    onmouseover="this.stop();" onmouseout="this.start();"
                    style="font-size: 10px;height: 20px;padding-top: 5px;">
						欢迎来到廖尚岗的个人博客网站 </marquee>
			</span></li>
            <li class=""><a href="#"> <i class="fa fa-search"></i>搜索</a></li>
            <%
                BlogUsers user = (BlogUsers) session.getAttribute("logUser");
                if (user != null) {
                    if (user.getUserType() == 1) {
            %>
            <li><a href="views/edit_article.jsp"><i class="fa fa-edit"></i>Go!写博客</a></li>
            <%
                }
            %>
            <li><a href="user/logOff"> <i class="fa fa-sign-out"></i> 注销
            </a></li>
            <li><a href="user/showMe"> <img alt="image" class="img-circle" style="width: 35px;height: 35px;"
                                            src="../<%=user.getUserImageUrl()%>">
            </a></li>
            <%
            } else {
            %>
            <li><a data-toggle="modal" data-target="#myModel3"> <i class="fa fa-sign-out"></i> 去登陆
            </a></li>
            <%} %>
        </ul>
    </nav>
</div>
<!-- 头部结束 -->

<div id="modal"></div>
<script>
    $(function () {
        $('#modal').load('loginRegister.html');
    })
</script>
<!-- 头部结束 -->
<!-- 链接开始 -->
<div class="white-bg" style="padding-bottom:0px;">
    <nav class="navbar navbar-static-top" role="navigation">
        <div class="navbar-header col-md-1">
            <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                    class="btn-white navbar-toggle collapsed" type="button">
                <i class="fa fa-reorder"></i>
            </button>
            <%--<a href="#" class="navbar-brand">我的博客</a>--%>
        </div>
        <div class="navbar-collapse collapse" id="navbar" aria-expanded="false" style="height: 1px;">
            <ul class="nav navbar-nav">
                <li class="">
                    <a aria-expanded="false" role="button" href="showHome" title="首页">首页</a>
                </li>
                <li class="">
                    <a aria-expanded="false" role="button" href="tech" target="_blank" title="技术话题">技术话题</a>
                </li>
                <li class="">
                    <a aria-expanded="false" role="button" href="share" target="_blank" title="分享">分享</a>
                </li>
                <li class="">
                    <a aria-expanded="false" role="button" href="share" target="_blank" title="足迹">足迹</a>
                </li>
                <li class="">
                    <a aria-expanded="false" role="button" href="showFile" target="_blank" title="我的相册">我的相册</a>
                </li>
                <li class="">
                    <a aria-expanded="false" role="button" href="aboutMe" target="_blank" title="关于我">关于我</a>
                </li>
                <%--<li class="">
                    <a aria-expanded="false" role="button" href="#" class="dropdown-toggle" data-toggle="dropdown"> Menu item <span class="caret"></span></a>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="">Menu item</a></li>
                    </ul>
                </li>--%>
            </ul>

        </div>
    </nav>
</div>

<%--<div class="row wrapper border-bottom white-bg">
    <div class="col-md-12">
        <ul class="nav nav-pills col-md-offset-1">
            <li><a href="showHome">首页</a></li>
            <li><a href="http://localhost:8080/myblog/tech/" target="_blank"
                   title="TECHNOLOGY TOPICS">技术话题</a></li>
            <li><a href="http://localhost:8080/myblog/share/" target="_blank"
                   title="MY SHARE">分享</a></li>
            <li><a href="http://localhost:8080/myblog/collect/"
                   target="_blank" title="MY COLECTTION">足迹</a></li>
            <li><a href="showFile" target="_blank"
                   title="MY ALBUM">我的相册</a></li>
            <li><a href="http://localhost:8080/myblog/aboutMe/"
                   target="_blank" title="ABOUT ME">关于我</a></li>
        </ul>
    </div>
</div>--%>
<!-- 链接结束 -->
