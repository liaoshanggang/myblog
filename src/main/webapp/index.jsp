<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	application.setAttribute("rootpath", basePath);

	/* response.sendRedirect("login.jsp"); */
%>
<!DOCTYPE>
<!-- <html lang="en"> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<base href="${rootpath}">
<%@include file="../../css-common.jsp"%>
<%@include file="../../js-common.jsp"%>
<title>前台主页</title>
<style type="text/css">
</style>
</head>
<body id="" class="gray-bg" style="background-color:;">

	<div id="wrapper">
		<div id="" class="row" style="width: 100%;">
			<%@include file="head.jsp"%>

			<!-- ===================主要内容开始=================== -->
			<div
				class="wrapper wrapper-content col-md-offset-1 animated fadeInRight  blog ">
				<!-- 主面板 -->
				<div class="row col-md-9">
					<div class="panel">
						<div class="panel-heading col-sm-4">
							<ol class="breadcrumb">
								<li><a href="index.jsp">首页</a></li>
								<li class="active"><strong>本页</strong></li>
							</ol>
						</div>
						<div class="panel-body">
							<!-- 博客列表开始 -->
							<div class="ibox">
								<div class="ibox-content">
									<h2>
										<a href="views/article_detail.jsp" class="btn-link"> One
											morning, when Gregor Samsa </a>
									</h2>
									<div class="small m-b-xs">
										<strong>Adam Novak</strong> <span class="text-muted"><i
											class="fa fa-clock-o"></i> 28th Oct 2015</span>
									</div>
									<p>English. Many desktop publishing packages and web page
										editors now use Lorem Ipsum as their default model text, and a
										search for 'lorem ipsum' will uncover many web</p>
									<div class="row">
										<div class="col-md-6">
											<h5>Tags:</h5>
											<button class="btn btn-primary btn-xs" type="button">Model</button>
											<button class="btn btn-white btn-xs" type="button">Publishing</button>
										</div>
										<div class="col-md-6">
											<div class="small text-right">
												<h5>Stats:</h5>
												<div>
													<i class="fa fa-comments-o"> </i> 56 comments
												</div>
												<i class="fa fa-eye"> </i> 144 views
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 博客列表结束 -->
						</div>
					</div>
				</div>
				<!-- 主面板 -->

				<div class="col-md-3">
					<div class="panel">
						<div class="panel-heading">
							<h1>
								<i class="fa fa-info-circle"></i><font
									style="vertical-align: inherit;"><font
									style="vertical-align: inherit;"> <a
										href="views/bgmgr_index.jsp">后台管理主页</a>
								</font></font>
							</h1>
						</div>
						<div class="panel-body">
							<p>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">Lorem存有悲坐阿梅德，consectetur
										adipiscing ELIT。</font><font style="vertical-align: inherit;">前庭是租赁。</font><font
									style="vertical-align: inherit;">最新的足球教练池，并设置毕业分类宣传。</font></font>
							</p>
						</div>

					</div>
				</div>
			</div>

			<!-- ===================主要内容结束=================== -->


		</div>
	</div>
	<!-- <hr style="height: 100;color:red;"> -->
	<!-- 底部 -->
	<footer style="background-color: white;">
		<div>
			<div style="text-align: center; margin-top: 0px;">
				<strong>Copyright</strong> &copy; ForwardLiao 2018
			</div>
		</div>
	</footer>
</body>
</html>