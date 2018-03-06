<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<style>
    .my-nav-header {
        padding: 33px 25px;
    }
    .enterBorder {
        border-left: solid 5px #009688;
    }
    .left_nav_li a{
        background: #17181e;
    }
</style>
<!-- 左边导航栏开始 -->
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse" id="">
        <ul class="nav metismenu" id="side-menu">
            <!-- 左上导航栏开始  #17181e-->
            <li class="my-nav-header">
                <div class="dropdown profile-element">
					<span> <img alt="image" class="img-circle"
                                src="img/gallery/4s.jpg"/>
					</span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="clear">
                            <span class="block m-t-xs">
                                <strong class="font-bold">ForwardLiao</strong>
						    </span>
                            <span class="text-muted text-xs block">Software Engineer</span>
					    </span>
                    </a>
                </div>
            </li>
            <!-- 左上导航栏结束  -->

            <!-- 左下导航栏开始 -->
            <!-- 一个列表项开始 -->
            <li class="left_nav_li">
                <a href="article/query">
                    <i class="fa fa-diamond"></i>
                    <span class="nav-label">文章管理</span>
                </a>
            </li>
            <!-- 一个列表项结束 -->
            <li class="left_nav_li">
                <a href="category/query">
                    <i class="fa fa-diamond"></i>
                    <span class="nav-label">类别管理</span>
                </a>
            </li>
            <li class="left_nav_li">
                <a href="comment/query">
                    <i class="fa fa-diamond"></i>
                    <span class="nav-label">评论管理</span>
                </a>
            </li>
            <li class="left_nav_li">
                <a href="views/manage_file.jsp">
                    <i class="fa fa-diamond"></i>
                    <span class="nav-label">文件管理</span>
                </a>
            </li>
            <li class="left_nav_li">
                <a href="user/queryAll">
                    <i class="fa fa-th-large"></i>
                    <span class="nav-label">用户管理</span>
                </a>
            </li>
            <!-- 左下导航栏结束 -->
        </ul>

    </div>
</nav>
<!-- 左导航栏结束 -->

<script>
    $(function () {
        $(".left_nav_li").hover(
            function () {
                $(this).addClass("enterBorder");
            },
            function () {
                $(this).removeClass("enterBorder");
            }
        );
        $(".left_nav_li").click(
            function () {
                $(this).addClass("active");
            }
        );
    })
</script>