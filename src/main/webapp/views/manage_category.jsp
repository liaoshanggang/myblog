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
				<div>

					<div class="col-lg-12">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<div class="row">
									<form method="get" action="index.html" class="col-lg-4 pull-left">
										<div class="input-group">
											<input type="text" class="form-control col-lg-2"
												name="" placeholder="请输入新类别111">
											<div class="input-group-btn">
												<button type="submit" class="btn btn-outline btn-primary">新增类别
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="ibox-content">
								<table class="table table-hover">
									<colgroup>
										<col class="col-lg-8">
										<col class="col-lg-2">
										<col class="col-lg-2">
									</colgroup>

									<thead>
										<tr>
											<th class="">类别</th>
											<th class="">文章数</th>
											<th class="">操作</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="">Mark</td>
											<td class="">Mark</td>
											<td class=""><button
													class="btn btn-success btn-outline btn-xs" type="button">编辑</button>
												<button class="btn btn-danger btn-outline btn-xs"
													type="button">删除</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="ibox-footer">
								<span class="pull-right"> The righ side of the footer </span>
								The righ side of the footer
							</div>
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