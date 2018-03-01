<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.blog.vo.BlogUsers" %>
<!-- 头部开始 -->
<div class="row border-bottom">
    <nav class="navbar navbar-static-top  " role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <!-- href="#"没有效果 -->
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary "><i
                    class="fa fa-bars"></i> </a>
            <form role="search" class="navbar-form-custom"
                  action="search_results.html">
                <div class="form-group">
                    <input type="text" placeholder="Search for something..."
                           class="form-control" name="top-search" id="top-search">
                </div>
            </form>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li><span class="m-r-sm text-muted welcome-message"> <marquee
                    onmouseover="this.stop();" onmouseout="this.start();">
						欢迎来到廖尚岗的个人博客网站 </marquee>
			</span></li>
            <li class="dropdown"><a class="dropdown-toggle count-info"
                                    data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
                <span class="label label-warning">16</span>
            </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <div class="dropdown-messages-box">
                            <a href="profile.html" class="pull-left"> <img alt="image"
                                                                           class="img-circle" src="img/profile.jpg">
                            </a>
                            <div class="media-body ">
                                <small class="pull-right">23h ago</small>
                                <strong>Monica
                                    Smith</strong> love <strong>Kim Smith</strong>. <br>
                                <small
                                        class="text-muted">2 days ago at 2:30 am - 11.06.2014
                                </small>
                            </div>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block">
                            <a href="mailbox.html"> <i class="fa fa-envelope"></i> <strong>Read
                                All Messages</strong>
                            </a>
                        </div>
                    </li>
                </ul>
            </li>
            <li class="dropdown"><a class="dropdown-toggle count-info"
                                    data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span
                    class="label label-primary">8</span>
            </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <div>
                            <a href="mailbox.html"> <i class="fa fa-envelope fa-fw"></i>
                                You have 16 messages <span class="pull-right text-muted small">4
									minutes ago</span>

                            </a>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div>
                            <a href="profile.html"> <i class="fa fa-twitter fa-fw"></i> 3
                                New Followers <span class="pull-right text-muted small">12
									minutes ago</span>

                            </a>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div>
                            <a href="grid_options.html"> <i class="fa fa-upload fa-fw"></i>
                                Server Rebooted <span class="pull-right text-muted small">4
									minutes ago</span>

                            </a>
                        </div>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <div class="text-center link-block">
                            <a href="notifications.html"> <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </li>
                </ul>
            </li>
            <%
                BlogUsers user = (BlogUsers) session.getAttribute("logUser");
                if (user != null) {
                    if (user.getUserType() == 1) {
            %>
            <li><a href="views/edit_article.jsp"><i class="fa fa-edit"></i><font
                    style="vertical-align: inherit;"><font
                    style="vertical-align: inherit;">Go!写博客</font></font></a></li>
            <%
                }
            %>
            <li><a href="user/logOff"> <i class="fa fa-sign-out"></i> 注销
            </a></li>
            <li><a href="user/showMe"> <img alt="image" class="img-circle" id="headImg"
                                            style="width: 35px;height: 35px;" src="../<%=user.getUserImageUrl()%>">
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