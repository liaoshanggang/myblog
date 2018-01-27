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
			<div class="wrapper wrapper-content">

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
<!-- pre-scrollable -->
							<div class="panel-body scroll_content">
								<!-- 博客列表开始 -->
								<div class="ibox">
									<div class="ibox-content">
										<h2>
											<a href="views/article_detail.jsp" class="btn-link"> One
												morning, when Gregor Samsa </a>
										</h2>
										<div class="row">
											<div class="col-md-3 small m-b-xs">
												<strong>类别</strong> <span class="text-muted"><i
													class="fa fa-clock-o"></i> 28th Oct 2015</span>
											</div>
											<div class="col-md-3">
												<div class="small">
													<div>
														<i class="fa fa-comments-o"> </i> 56 评论 <i
															class="fa fa-eye"> </i> 144 浏览
													</div>
												</div>
											</div>
											<div class="col-md-6 text-right">
												<button class="btn btn-success btn-outline btn-xs" type="button">编辑</button>
												<button class="btn btn-danger btn-outline btn-xs" type="button">删除</button>
											</div>

										</div>
									</div>
								</div>
								<!-- 博客列表结束 -->
							</div>
							<div class="panel-heading panel-default ">
								<hr>
								<h3>分页链接</h3>
								<div class="hr-line-dashed"></div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-content"></div>

						</div>
					</div>
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