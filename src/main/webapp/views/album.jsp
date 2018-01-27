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
<link href="css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet">

    <!-- <style>
        /* Local style for demo purpose */

        .lightBoxGallery {
            text-align: center;
        }

        .lightBoxGallery img {
            margin: 5px;
        }

    </style> -->
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
                <div class="ibox float-e-margins">

                    <div class="ibox-content">

                        <h2>灯箱图片库</h2>
                        <p>
                            <strong>blueimp Gallery</strong> blueimp图库是一个触摸功能，响应和可定制的图像和视频库，旋转木马和灯箱，为移动和桌面浏览器优化。它具有滑动，鼠标和键盘导航，过渡效果，幻灯片功能，全屏支持和按需内容加载，并可以扩展显示其他内容类型。完整的文档可以在 <a href="https://github.com/blueimp/Gallery/blob/master/README.md" target="_blank">https://github.com/blueimp/Gallery/blob/master/README.md</a>找到。
                        </p>

                        <div class="lightBoxGallery">
                            <a href="img/gallery/1.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/1s.jpg"></a>
                            <a href="img/gallery/2.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/2s.jpg"></a>
                            <a href="img/gallery/3.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/3s.jpg"></a>
                            <a href="img/gallery/4.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/4s.jpg"></a>
                            <a href="img/gallery/5.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/5s.jpg"></a>
                            <a href="img/gallery/6.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/6s.jpg"></a>
                            <a href="img/gallery/7.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/7s.jpg"></a>
                            <a href="img/gallery/8.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/8s.jpg"></a>
                            <a href="img/gallery/9.jpg" title="Image from Unsplash" data-gallery=""><img src="img/gallery/9s.jpg"></a>
                            <!-- The Gallery as lightbox dialog, should be a child element of the document body -->
                            <div id="blueimp-gallery" class="blueimp-gallery">
                                <div class="slides"></div>
                                <h3 class="title"></h3>
                                <a class="prev">‹</a>
                                <a class="next">›</a>
                                <a class="close">×</a>
                                <a class="play-pause"></a>
                                <ol class="indicator"></ol>
                            </div>

                        </div>

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
	<!-- blueimp gallery -->
    <script src="js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
	<script type="text/javascript">
	
	</script>
</body>

</html>