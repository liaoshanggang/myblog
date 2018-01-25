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

<title>后台主页</title>

<%@include file="../../css-common.jsp"%>
<%@include file="../../js-common.jsp"%>
</head>

<body class="">

	<div id="wrapper">
		<%-- <jsp:include page="left_nav.html" flush="true"/> --%>
		<!-- 左边导航栏开始 -->
		<%@include file="left_nav.jsp"%>
		<!-- 左导航栏结束 -->
		<div id="page-wrapper" class="gray-bg">
			<!-- 头部开始 -->
			<%@include file="top_nav.jsp"%>
			<!-- 头部结束 -->
			<!-- 链接开始 -->
			<div class="row wrapper border-bottom white-bg page-heading">
				<div class="col-sm-4">
					<h2>主标题</h2>
					<ol class="breadcrumb">
						<li><a href="index.html">首页</a></li>
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
				<div class="middle-box text-center animated fadeInRightBig">
					<h3 class="font-bold">这是页面内容</h3>
					<div class="error-desc">
						这是页面内容你可以在这里创建你想要的任何网格布局。和你想象的任何变化布局:)检查主仪表板和其他网站。 它使用许多不同的布局。<br />
						<a href="index.html" class="btn btn-primary m-t">仪表板</a>
					</div>
				</div>
			</div>
			<!-- ===================主要内容结束=================== -->

			<!-- 底部 -->
			<%@include file="bottom.html"%>
		</div>
	</div>


</body>

</html>