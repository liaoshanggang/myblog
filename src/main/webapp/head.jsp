<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- 头部开始 -->
<%@page import="com.blog.vo.BlogUsers" %>
<style>
    /*覆盖*/
    .theme-config{
        display: none;
    }
    .enterBorder {
        border-bottom: solid 3px #5FB878;
    }

    /*background-color: #ffffff;*/
    /*border-top-left-radius: 5px;
    border-bottom-right-radius: 5px;*/
    .navbar2-fixed-top {
        background: #fff;
        transition-duration: 0.5s;
        border-bottom: 1px solid #e7eaec !important;
        z-index: 2030;
        top: 0px;
        right: 0;
        left: 0;
        position: fixed;
    }

    .navbar1-fixed-top {
        background: #fff;
        transition-duration: 0.5s;
        border-bottom: 1px solid #e7eaec !important;
        z-index: 2030;
        top: 0px;
        right: 0;
        left: 0;
        position: fixed;
    }
</style>
<script>
    $(function () {
        $(".nav_li").hover(
            function () {
                $(this).addClass("enterBorder");
            },
            function () {
                $(this).removeClass("enterBorder");
            }
        );
        fixed();
        // $(window).resize(function() {
        //     }
        // });
        // window.onresize = function(){
        //     if(document.body.clientWidth<766){
        //         var height = $("#nav2").outerHeight() ;
        //         console.info(height);
        //         /* $("#nav1").removeClass("navbar-static-top");
        //          $("#nav1").addClass("navbar1-fixed-top");*/
        //         $("#nav2").removeClass("navbar-static-top");
        //         $("#nav2").addClass("navbar2-fixed-top");
        //         //$("#nav1").css("top",height);
        //     }else{
        //         /*$("#nav1").removeClass("navbar1-fixed-top");
        //         $("#nav1").addClass("navbar-static-top");*/
        //         $("#nav2").removeClass("navbar2-fixed-top");
        //         $("#nav2").addClass("navbar-static-top");
        //     }
        // }
    })

    function fixed() {
        if (document.body.clientWidth < 766) {
            var height = $("#nav2").outerHeight();
            console.info(height);
            /* $("#nav1").removeClass("navbar-static-top");
             $("#nav1").addClass("navbar1-fixed-top");*/
            $("#nav2").removeClass("navbar-static-top");
            $("#nav2").addClass("navbar2-fixed-top");
            //$("#nav1").css("top",height);
        } else {
            /*$("#nav1").removeClass("navbar1-fixed-top");
            $("#nav1").addClass("navbar-static-top");*/
            $("#nav2").removeClass("navbar2-fixed-top");
            $("#nav2").addClass("navbar-static-top");
        }
    }
</script>

<!-- 头部开始 -->
<div class="row border-bottom">
    <nav id="nav1" class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;background-color:#20222a"><%--#393D49--%>
        <div class="navbar-header">
            <!-- href="#"没有效果 -->
            <a href="showHome" class="navbar-minimalize minimalize-styl-2 btn"><i
                    class="fa fa-graduation-cap" style="font-size: 25px;"></i> <i style="font-size: 25px;">LSG's
                Blog</i></a>
            <div class="pull-left" id="localtime" style="font-size: 10px;padding-top: 8px;"></div>
            <%--<form role="search" class="navbar-form-custom"
                  action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..."
                           class="form-control" name="top-search" id="top-search" style="padding-top:20px">
                </div>
            </form>--%>
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
            <li class="nav_li"><a href="user/showMe" style="height: 67px;"> <img alt="image"  id="headImg"
                                                                                              class="img-circle"
                                                                                              style="width: 35px;height: 35px;"
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
    $(function () {
        $('#modal').load('loginRegister.html');
    })
</script>
<!-- 头部结束 -->
<!-- 链接开始 -->
<div class="white-bg" style="padding-bottom:0px;">
    <nav class="navbar navbar-static-top" role="navigation" id="nav2">
        <div class="navbar-header col-md-1">
            <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                    class="btn-white navbar-toggle collapsed" type="button">
                <i class="fa fa-reorder"></i>
            </button>
            <%--<a href="#" class="navbar-brand">我的博客</a>--%>
        </div>
        <div class="navbar-collapse collapse" id="navbar" aria-expanded="false" style="height: 1px;">
            <ul class="nav navbar-nav">
                <li class="nav_li">
                    <a aria-expanded="false" role="button" href="showHome" title="首页">首页</a>
                </li>
                <%--<li class="nav_li">
                    <a aria-expanded="false" role="button" href="tech" target="_blank" title="技术话题">技术话题</a>
                </li>--%>
                <%--<li class="nav_li">--%>
                <%--<a aria-expanded="false" role="button" href="share" target="_blank" title="分享">分享</a>--%>
                <%--</li>--%>
                <li class="nav_li">
                    <a aria-expanded="false" role="button" href="playback" target="_blank" title="现场还原">现场还原</a>
                </li>
                <li class="nav_li">
                    <a aria-expanded="false" role="button" href="showFile" target="_blank" title="资料库">资料库</a>
                </li>
                <li class="nav_li">
                    <a aria-expanded="false" role="button" href="views/article_archives.jsp" title="文章存档">文章存档</a>
                </li>
                <li class="nav_li">
                    <a aria-expanded="false" role="button" href="views/profile.jsp" title="关于">关于</a>
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
<script type="text/javascript">
    function showLocale(objD) {
        var str, colorhead, colorfoot;
        var yy = objD.getYear();
        if (yy < 1900) yy = yy + 1900;
        var MM = objD.getMonth() + 1;
        if (MM < 10) MM = '0' + MM;
        var dd = objD.getDate();
        if (dd < 10) dd = '0' + dd;
        var hh = objD.getHours();
        if (hh < 10) hh = '0' + hh;
        var mm = objD.getMinutes();
        if (mm < 10) mm = '0' + mm;
        var ss = objD.getSeconds();
        if (ss < 10) ss = '0' + ss;
        var ww = objD.getDay();
        if (ww == 0) colorhead = "<a class=\"navbar-minimalize minimalize-styl-2 btn\">";
        if (ww > 0 && ww < 6) colorhead = "<a class=\"navbar-minimalize minimalize-styl-2 btn\">";
        if (ww == 6) colorhead = "<a class=\"navbar-minimalize minimalize-styl-2 btn\">";
        if (ww == 0) ww = "星期日";
        if (ww == 1) ww = "星期一";
        if (ww == 2) ww = "星期二";
        if (ww == 3) ww = "星期三";
        if (ww == 4) ww = "星期四";
        if (ww == 5) ww = "星期五";
        if (ww == 6) ww = "星期六";
        colorfoot = "</a>"
        str = colorhead + yy + "年" + MM + "月" + dd + "日" + ww + "" + hh + ":" + mm + ":" + ss + " " + colorfoot;
        //alert(str);
        return str;
    }

    function tick() {
        var today;
        today = new Date();
        $("#localtime").html(showLocale(today));
        window.setTimeout("tick()", 1000);
    }

    tick();
</script>