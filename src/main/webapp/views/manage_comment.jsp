<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<base href="${rootpath}">

<title>后台管理主页</title>

<%@include file="../../css-common.jsp"%>
</head>

<body class="">

	<div id="wrapper">
		<%-- <jsp:include page="left_nav.html" flush="true"/> --%>
		<!-- 左边导航栏开始 -->
		<%@include file="../left_nav.jsp"%>
		<!-- 左导航栏结束 -->
		<div id="page-wrapper" class="gray-bg">
			<!-- 头部开始 -->
			<%@include file="../top_nav.jsp"%>
			<!-- 头部结束 -->
			<!-- 链接开始 -->
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-4">
					<h2>主标题</h2>
					<ol class="breadcrumb">
						<li><a href="index.jsp">前台展示页</a></li>
						<li class="active"><strong>本页</strong></li>
					</ol>
				</div>
				<div class="col-sm-8">
					<div class="title-action">
						<a href="" class="btn btn-primary">行动区</a>
					</div>
				</div>
			</div>
			<!-- 链接结束 -->

			<!-- ===================主要内容开始=================== -->
			<div class="wrapper wrapper-content animated fadeInRight">
				<div class="row">

					<div class="col-lg-12">
						<div class="tabs-container">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#tab-1"
									aria-expanded="true">我的文章评论</a></li>
								<li class=""><a data-toggle="tab" href="#tab-2"
									aria-expanded="false">我发表的评论</a></li>
							</ul>
							<div class="tab-content">
								<div id="tab-1" class="tab-pane active">
									<div class="panel-body">
										<!-- 评论 -->
										<div class="col-md-11 social-feed-box">
											<div class="social-avatar">
												<a href="" class="pull-left"> <img alt="图片"
													src="img/a1.jpg">
												</a>
												<div class="media-body">
													<a href="#"><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;"> 安德鲁·威廉姆斯 </font></font></a> <small
														class="text-muted">今天下午4:21 - 12.06.2014 回复了你的文章 <a
														href="views/article_detail.jsp" class="btn-link"> One
															morning, when Gregor Samsa </a></small>

												</div>
											</div>
											<div class="social-body">
												<p>
													<font style="vertical-align: inherit;"><font
														style="vertical-align: inherit;">
															现在，许多桌面出版软件包和网页编辑器都使用Lorem Ipsum作为默认模型文本，搜索“lorem
															ipsum”将会发现许多仍然是默认模型文本的网站。 </font></font>
												</p>
											</div>
										</div>
										<!-- 评论 -->
										<div class="col-md-1 text-right">
											<button class="btn btn-success btn-outline btn-lg "
												type="button">回复</button>
											<button class="btn btn-danger btn-outline btn-lg"
												type="button">删除</button>
										</div>
									</div>
								</div>
								<div id="tab-2" class="tab-pane">
									<div class="panel-body">
																			<!-- 评论 -->
										<div class="col-md-11 social-feed-box">
											<div class="social-avatar">
												<a href="" class="pull-left"> <img alt="图片"
													src="img/a1.jpg">
												</a>
												<div class="media-body">
													<a href="#"><font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;"> 我 </font></font></a> <small
														class="text-muted">今天下午4:21 - 12.06.2014 评论了你的文章 <a
														href="views/article_detail.jsp" class="btn-link"> One
															morning, when Gregor Samsa </a></small>

												</div>
											</div>
											<div class="social-body">
												<p>
													<font style="vertical-align: inherit;"><font
														style="vertical-align: inherit;">
															现在，许多桌面出版软件包和网页编辑器都使用Lorem Ipsum作为默认模型文本，搜索“lorem
															ipsum”将会发现许多仍然是默认模型文本的网站。 </font></font>
												</p>
											</div>
										</div>
										<!-- 评论 -->
										<div class="col-md-1 text-right">
											<button class="btn btn-danger btn-outline btn-lg"
												type="button">删除</button>
										</div>
									
									</div>
								</div>
							</div>
						</div>
					</div>








					<div class="col-lg-12"></div>
				</div>
			</div>
			<!-- ===================主要内容结束=================== -->

			<!-- 底部 -->
			<%@include file="../bottom.html"%>
		</div>
	</div>


	<%@include file="../../js-common.jsp"%>
</body>

</html>