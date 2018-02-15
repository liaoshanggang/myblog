<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- 左边导航栏开始 -->
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <!-- 左上导航栏开始  -->
            <li class="nav-header">
                <div class="dropdown profile-element">
					<span> <img alt="image" class="img-circle"
                                src="img/gallery/4s.jpg"/>
					</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
                        class="clear"> <span class="block m-t-xs"> <strong
                        class="font-bold">ForwardLiao</strong>
						</span> <span class="text-muted text-xs block">Software Engineer<b
                        class="caret"></b></span>
					</span>
                </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li><a href="profile.html">轮廓</a></li>
                        <li><a href="contacts.html">往来</a></li>
                        <li><a href="mailbox.html">邮箱</a></li>
                        <li class="divider"></li>
                        <li><a href="login.html">登出</a></li>
                    </ul>
                </div>
                <div class="logo-element">IN+</div>
            </li>
            <!-- 左上导航栏结束  -->

            <!-- 左下导航栏开始 -->
            <!-- 一个列表项开始 -->
            <li class="active"><a href="article/query"><i
                    class="fa fa-diamond"></i> <span class="nav-label">文章管理</span></a></li>

            <!-- 一个列表项结束 -->
            <li class=""><a href="category/query"><i
                    class="fa fa-diamond"></i> <span class="nav-label">类别管理</span></a></li>
            <li class=""><a href="comment/query"><i
                    class="fa fa-diamond"></i> <span class="nav-label">评论管理</span></a></li>
            <li class=""><a href="views/manage_file.jsp"><i
                    class="fa fa-diamond"></i> <span class="nav-label">文件管理</span></a></li>

            <li><a href="index.html"><i class="fa fa-th-large"></i> <span
                    class="nav-label">用户管理</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li class="active"><a href="user/showMe">修改个人资料</a></li>
                    <li class="active"><a href="user/queryAll">批量操作用户</a></li>
                </ul>
            </li>
            <!-- 左下导航栏结束 -->
        </ul>

    </div>
</nav>
<!-- 左导航栏结束 -->