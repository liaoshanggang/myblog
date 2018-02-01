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
div img
	{
	max-width:200px;
	height:auto;
	cursor:pointer;
	border:1px double #cccccc;
	padding: 3px;
	zoom:expression( function(elm)
	       {     if (elm.width>200) 
	               {  var oldVW = elm.width; elm.width=200;             
	                   elm.height = elm.height*(200 /oldVW);        
	                }         elm.style.zoom = '1';     
	      }
	(this));
	}
#title{
	width: 98%;  /*必须设置宽度*/
	overflow: hidden;  /*溢出隐藏*/
	text-overflow: ellipsis; /*以省略号...显示*/
	white-space: nowrap;  /*强制不换行*/
}
</style>
</head>
<body id="" class="gray-bg" style="background-color:;">

	<div id="wrapper">
		<div id="" class="row" style="width: 100%;">
			<%@include file="../head.jsp"%>

			<!-- ===================主要内容开始=================== -->
			<div
				class="wrapper wrapper-content col-md-offset-1 animated  fadeInRight article">
				<!-- 主面板 -->
				<div class="row col-md-9">
					<div class="panel col-md-12">
						<div class="panel-heading col-md-12">
							<ol class="breadcrumb">
								<li><a href="index.jsp">首页</a></li>
								<li class="active"><strong>本页</strong></li>
							</ol>
						</div>
						<div class="panel-body col-md-12">
							<!-- 博客全文开始 -->

							<div class="ibox col-md-12">
								<div class="ibox-content col-md-12">
									<div class="pull-right">
										<button class="btn btn-white btn-xs" type="button">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">模型</font></font>
										</button>
										<button class="btn btn-white btn-xs" type="button">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">出版</font></font>
										</button>
										<button class="btn btn-white btn-xs" type="button">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">现代</font></font>
										</button>
									</div>
									<div class="text-center article-title" style="width:100%;word-wrap: break-word">
										<span class="text-muted"><i class="fa fa-clock-o"></i><font
											style="vertical-align: inherit;"><font
												style="vertical-align: inherit;"> <fmt:formatDate value='${article.artiTime}' pattern='yyyy-MM-dd HH:mm:ss'/></font></font></span>
										<h1 id="title">
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;"> ${article.artiTitle }</font></font>
										</h1>
									</div>
									<!-- <div style="overflow:auto"> -->
									<div>
										<p>${article.artiContent }</p>
									</div>
									<hr>
									<div class="row">
										<div class="col-md-6">
											<h5>
												<font style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">标签：</font></font>
											</h5>
											<button class="btn btn-primary btn-xs" type="button">
												<font style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">模型</font></font>
											</button>
											<button class="btn btn-white btn-xs" type="button">
												<font style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">出版</font></font>
											</button>
										</div>
										<div class="col-md-6">
											<div class="small text-right">
												<h5>
													<font style="vertical-align: inherit;"><font
														style="vertical-align: inherit;">统计：</font></font>
												</h5>
												<div>
													<i class="fa fa-comments-o"> </i><font
														style="vertical-align: inherit;"><font
														style="vertical-align: inherit;">
															${article.artiComtNumber }评论 </font></font>
												</div>
												<i class="fa fa-eye"> </i><font
													style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">
														${article.artiPageView }意见 </font></font>
											</div>
										</div>
									</div>
									<!-- 评论开始 -->
									<div class="row">
										<div class="col-lg-12">

											<h2>
												<font style="vertical-align: inherit;"><font
													style="vertical-align: inherit;">注释：</font></font>
											</h2>
											<div class="social-feed-box">
												<div class="social-avatar">
													<a href="" class="pull-left"> <img alt="图片"
														src="img/a1.jpg">
													</a>
													<div class="media-body">
														<a href="#"><font style="vertical-align: inherit;"><font
																style="vertical-align: inherit;"> 安德鲁·威廉姆斯 </font></font></a> <small
															class="text-muted"><font
															style="vertical-align: inherit;"><font
																style="vertical-align: inherit;">今天下午4:21 -
																	12.06.2014</font></font></small>
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

										</div>
									</div>
									<!-- 评论结束 -->
								</div>
							</div>
							<!-- 博客全文结束 -->
						</div>
					</div>
				</div>
				<!-- 主面板 -->

				<div class="col-md-3">
					<div class="panel">
						<div class="panel-heading">
							<i class="fa fa-info-circle"></i><font
								style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"> 5555信息面板 </font></font>
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
	<script type="text/javascript">
	
	</script>
</body>
</html>