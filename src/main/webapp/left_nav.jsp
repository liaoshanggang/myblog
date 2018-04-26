<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<style>
    .my-nav-header {
        padding: 33px 25px;
    }
    .enterBorder {
        border-left: solid 3px #009688;
        background: #17181e;
    }
    /*.left_nav_li a{
        background: #17181e;
    }*/
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
            <li class="left_nav_li" name="mgr_article">
                <a href="article/query">
                    <span class="glyphicon glyphicon-list-alt" style="color: rgb(255, 255, 255);"></span>
                    <span class="nav-label">文章管理</span>
                </a>
            </li>
            <!-- 一个列表项结束 -->
            <li class="left_nav_li" name="mgr_category">
                <a href="category/query">
                    <span class="glyphicon glyphicon-tags" style="color: rgb(255, 255, 255);"></span>
                    <span class="nav-label">类别管理</span>
                </a>
            </li>
            <li class="left_nav_li" name="mgr_comment">
                <a href="comment/query">
                    <span class="glyphicon glyphicon-comment" style="color: rgb(255, 255, 255);"></span>
                    <span class="nav-label">评论管理</span>
                </a>
            </li>
            <li class="left_nav_li" name="mgr_file">
                <a href="fileInfo/queryByPath?path=user/files">
                    <span class="glyphicon glyphicon-file" style="color: rgb(255, 255, 255);"></span>
                    <span class="nav-label">文件管理</span>
                </a>
            </li>
            <li class="left_nav_li" name="mgr_users">
                <a href="user/queryAll">
                    <span class="glyphicon glyphicon-user" style="color: rgb(255, 255, 255);"></span>
                    <span class="nav-label">用户管理</span>
                </a>
            </li>
            <!-- 左下导航栏结束 -->
        </ul>

    </div>
</nav>
<!-- 左导航栏结束 -->

<script>
    window.onload = function () {
        var leftNavLi = $(".left_nav_li");
        var value = $(".breadcrumb").find(".active").attr("id");
        for(var i=0;i<leftNavLi.length;i++){
            console.info($(leftNavLi[i]).attr("name"));
            if($(leftNavLi[i]).attr("name")==value){
                $(leftNavLi[i]).find("a").addClass("enterBorder");
            }
        }
    }
    $(function () {

        /*$(".left_nav_li").find("a").hover(
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
        );*/
    })
</script>