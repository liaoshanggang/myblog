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
</head>
<body id="page-top" class="" style="background-color: white;">

	<div id="wrapper">
		<div id="" class="gray-bg" style="width: 100%;height: 85%">
			<%@include file="head.jsp"%>

			<!-- ===================主要内容开始=================== -->
			<div class="wrapper wrapper-content col-md-offset-1">
				<h3 class="font-bold">这是页面内容</h3>
				<!-- <div class="middle-box text-center animated fadeInRightBig">
					<h3 class="font-bold">这是页面内容</h3>
					<div class="error-desc">
						这是页面内容你可以在这里创建你想要的任何网格布局。和你想象的任何变化布局:)检查主仪表板和其他网站。 它使用许多不同的布局。<br />
						<a href="index.html" class="btn btn-primary m-t">仪表板</a>
					</div>
				</div> -->

			</div>
			<!-- ===================主要内容结束=================== -->


		</div>
	</div>
	
	<!-- 底部 -->
	<footer>
		<div>
			<div
				style="text-align: center; margin-bottom: 25px; margin-top: 25px;">
				<strong>Copyright</strong> &copy; ForwardLiao 2018
			</div>
		</div>
	</footer>
</body>
</html>