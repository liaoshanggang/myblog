<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
application.setAttribute("rootpath",basePath);
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="${rootpath}">
<%@include file="../../css-common.jsp"%>
<%@include file="../../js-common.jsp"%>
<title>个人博客系统</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome/css/font-awesome.css" rel="stylesheet">

<link href="css/animate.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">

		<nav class="navbar-default navbar-static-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav metismenu" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span> <img alt="image" class="img-circle"
								src="img/a4.jpg" />
							</span> <a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<span class="clear"> <span class="block m-t-xs"> <strong
										class="font-bold">Mr James</strong>
								</span> <span class="text-muted text-xs block">Art Director <b
										class="caret"></b></span>
							</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a href="profile.html">简介</a></li>
								<li><a href="contacts.html">联系</a></li>
								<li><a href="mailbox.html">邮箱</a></li>
								<li class="divider"></li>
								<li><a href="login.html">退出</a></li>
							</ul>
						</div>
						<div class="logo-element">IN+</div>
					</li>
					<li><a href="index.html"><i class="fa fa-th-large"></i> <span
							class="nav-label">客户管理</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li class="active"><a href="cust/list">客户信息管理</a></li>
							<li class="active"><a href="cust/showLostList">客户流失管理</a></li>
						</ul></li>

					<li><a href="index.html"><i class="fa fa-th-large"></i> <span
							class="nav-label">营销管理</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li class="active"><a href="~sale/add.jsp">销售机会管理</a></li>
							<li class="active"><a href="chances/selChances">客户开发计划</a></li>
						</ul></li>

					<li><a href="index.html"><i class="fa fa-th-large"></i> <span
							class="nav-label">服务管理</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li class="active"><a href="serv/showCstSer">服务创建</a>
							</li>
							<li class="active"><a href="serv/showDispatchCstSer">服务分配</a></li>
							<li class="active"><a href="serv/showDeal">服务处理</a></li>
							<li class="active"><a href="serv/showFeedback">服务反馈</a></li>
							<li class="active"><a href="serv/showArch">服务归档</a></li>
						</ul></li>

					<li><a href="index.html"><i class="fa fa-th-large"></i> <span
							class="nav-label">统计报表</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li class="active"><a href="cstcustomer/customerForlist">客户贡献分析</a></li>
							<li class="active"><a href="#catagory">客户构成分析</a></li>
							<li class="active"><a href="#catagory">客户服务分析</a></li>
							<li class="active"><a href="lostuser/listForlostUser">客户流失分析</a></li>
						</ul></li>

					<li><a href="index.html"><i class="fa fa-th-large"></i> <span
							class="nav-label">用户管理</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li class="active"><a href="#user">用户管理入口</a></li>
							<li class="active"><a href="#user">权限管理</a></li>
						</ul></li>

					<li><a href="index.html"><i class="fa fa-th-large"></i> <span
							class="nav-label">点我，看下面</span> <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li class="active"><a href="showTemplet">点我，看模板</a></li>
							<li class="active"><a href="views/user/templet.jsp">user/templet.jsp也行</a>
							</li>
							<li class="active"><a href="aindex.html">新模板</a></li>
						</ul></li>
				</ul>

			</div>
		</nav>

		<div id="page-wrapper" class="gray-bg">
			<div class="row border-bottom">
				<nav class="navbar navbar-static-top" role="navigation"
					style="margin-bottom: 0">
					<div class="navbar-header">
						<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
							><i class="fa fa-bars"></i> </a>
						<form role="search" class="navbar-form-custom"
							action="search_results.html">
							<div class="form-group">
								<input type="text" placeholder="Search for something..."
									class="form-control" name="top-search" id="top-search">
							</div>
						</form>
					</div>
					<ul class="nav navbar-top-links navbar-right">
						<li><span class="m-r-sm text-muted welcome-message">Welcome
								to orm system.</span></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-envelope"></i>
								<span class="label label-warning">16</span>
						</a>
							<ul class="dropdown-menu dropdown-messages">
								<li>
									<div class="dropdown-messages-box">
										<a href="profile.html" class="pull-left"> <img alt="image"
											class="img-circle" src="img/a7.jpg">
										</a>
										<div class="media-body">
											<small class="pull-right">46h ago</small> <strong>Mike
												Loreipsum</strong> started following <strong>Monica Smith</strong>. <br>
											<small class="text-muted">3 days ago at 7:58 pm -
												10.06.2014</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a href="profile.html" class="pull-left"> <img alt="image"
											class="img-circle" src="img/a4.jpg">
										</a>
										<div class="media-body ">
											<small class="pull-right text-navy">5h ago</small> <strong>Chris
												Johnatan Overtunk</strong> started following <strong>Monica
												Smith</strong>. <br> <small class="text-muted">Yesterday
												1:21 pm - 11.06.2014</small>
										</div>
									</div>
								</li>
								<li class="divider"></li>
								<li>
									<div class="dropdown-messages-box">
										<a href="profile.html" class="pull-left"> <img alt="image"
											class="img-circle" src="img/profile.jpg">
										</a>
										<div class="media-body ">
											<small class="pull-right">23h ago</small> <strong>Monica
												Smith</strong> love <strong>Kim Smith</strong>. <br> <small
												class="text-muted">2 days ago at 2:30 am -
												11.06.2014</small>
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
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle count-info"
							data-toggle="dropdown" href="#"> <i class="fa fa-bell"></i> <span
								class="label label-primary">8</span>
						</a>
							<ul class="dropdown-menu dropdown-alerts">
								<li><a href="mailbox.html">
										<div>
											<i class="fa fa-envelope fa-fw"></i> You have 16 messages <span
												class="pull-right text-muted small">4 minutes ago</span>
										</div>
								</a></li>
								<li class="divider"></li>
								<li><a href="profile.html">
										<div>
											<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
												class="pull-right text-muted small">12 minutes ago</span>
										</div>
								</a></li>
								<li class="divider"></li>
								<li><a href="grid_options.html">
										<div>
											<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
												class="pull-right text-muted small">4 minutes ago</span>
										</div>
								</a></li>
								<li class="divider"></li>
								<li>
									<div class="text-center link-block">
										<a href="notifications.html"> <strong>See All
												Alerts</strong> <i class="fa fa-angle-right"></i>
										</a>
									</div>
								</li>
							</ul></li>

						<li><a href="user/logoff"> <i class="fa fa-sign-out"></i>
								退出系统
						</a></li>
					</ul>

				</nav>
			</div>
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-lg-10">
					<!-- <h2>Tabs</h2> -->
					<ol class="breadcrumb">
						<li><a href="main1.jsp">index</a></li>
						<!-- <li><a></a></li> -->
						<li class="active"><strong>main1</strong></li>
					</ol>
				</div>
				<div class="col-lg-2"></div>
			</div>
			<!-- 主要内容开始主要内容开始主要内容开始主要内容开始 主要内容开始主要内容开始主要内容开始主要内容开始-->
			<div class="wrapper wrapper-content white-bg animated fadeIn">
					
				<!--
        	作者：offline
        	时间：2017-08-27
        	描述：扣内容到这里
        -->
				<!--======================================在这里开始添加内容======================================-->
				<h1>This is main1.jsp, from the 384 line or so, see what you want to button, add here, one block down, change link</h1>
				<!--======================================在这里结束添加内容======================================-->
			</div>
			<!-- 主要内容结束主要内容结束主要内容结束主要内容结束主要内容结束主要内容结束主要内容结束主要内容结束 -->
			<div class="footer">
				<div class="pull-right">
					10GB of <strong>250GB</strong> Free.
				</div>
				<div>
					<strong>Copyright</strong> Example Company &copy; 2014-2015
				</div>
			</div>

		</div>
	</div>


</body>

</html>