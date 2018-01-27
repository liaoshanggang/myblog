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
			<%@include file="../head.jsp"%>

			<!-- ===================主要内容开始=================== -->
			<div
				class="wrapper wrapper-content col-md-offset-1 animated  fadeInRight article">
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
							<!-- 博客全文开始 -->

							<div class="ibox">
								<div class="ibox-content">
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
									<div class="text-center article-title">
										<span class="text-muted"><i class="fa fa-clock-o"></i><font
											style="vertical-align: inherit;"><font
												style="vertical-align: inherit;"> 2015年10月28日</font></font></span>
										<h1>
											<font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;"> 在山的背后 </font></font>
										</h1>
									</div>
									<p>
										<font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"> 许多桌面出版软件包和网页编辑器现在都使用</font></font><strong><font
											style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">Lorem
													Ipsum作为他们的默认模型文本</font></font></strong><font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">，而搜索'lorem
												ipsum'将会发现很多网页 </font></font>
									</p>
									<p>
										<font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">
												一天早晨，当格里高尔·萨姆萨从不安的梦中醒来时，发现自己在床上变成了一个可怕的害虫。</font><font
											style="vertical-align: inherit;">他躺在盔甲般的背上，如果他抬起头，他可以看到他的棕色腹部，稍微穹顶，并由拱门分成僵硬的部分。</font><font
											style="vertical-align: inherit;">床上用品几乎不能盖住它，似乎随时都会滑下来。</font><font
											style="vertical-align: inherit;">他的许多腿，比起其他人来，更可怜的是，他看起来无助的挥手。</font><font
											style="vertical-align: inherit;">“发生了什么事？</font><font
											style="vertical-align: inherit;">他以为。</font><font
											style="vertical-align: inherit;">这不是一个梦想。</font><font
											style="vertical-align: inherit;">他的房间，虽然有点太小，但还是安静地躺在四个熟悉的墙壁之间。</font><font
											style="vertical-align: inherit;">桌子上摆放着一系列纺织样品 -
												萨姆萨是一名旅行推销员，在那上面挂着一幅他最近从一本插图杂志上剪下来的照片，放在一个漂亮的镀金框架里。</font><font
											style="vertical-align: inherit;">它展示了一位女士装上了一个毛茸茸的帽子和皮毛蟒，直立坐着，举起一个沉重的毛皮手套，把整个下臂伸向观众。</font><font
											style="vertical-align: inherit;">然后格里高尔转过身来，在天气沉闷的时候看着窗外。</font><font
											style="vertical-align: inherit;">滴剂 </font></font>
									</p>
									<p>
										<i><font style="vertical-align: inherit;"><font
												style="vertical-align: inherit;">
													在遥远的背后，远离Vokalia和Consonantia国家的山脉，生活在盲文。</font><font
												style="vertical-align: inherit;">他们分居在Bookmarksgrove，就在大型语言海洋语义学的海岸。</font><font
												style="vertical-align: inherit;">一条名叫杜登（Duden）的小河流过他们的地方，并为它提供必要的重生。</font><font
												style="vertical-align: inherit;">这是一个天堂般的国家，句子的烘烤部分飞进你的嘴里。
											</font></font></i>
									</p>
									<p>
										<font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;">
												大Oxmox建议她不要这样做，因为有成千上万的错误逗号，狂野的问号和迂回的Semikoli，但小盲文没有听。</font><font
											style="vertical-align: inherit;">她收拾了她的七个诗节，把她的首字母放在腰带上，自己走上了路。</font><font
											style="vertical-align: inherit;">当她到达斜坡山脉的第一座山丘时，她最后一次回到了她的家乡书签树的标题，字母村的标题以及她自己的路线，线路的底线。</font><font
											style="vertical-align: inherit;">一个怜悯的回答问题跑过她的脸颊， </font></font>
									</p>
									<p>
										<font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"> 两个驱动的运动员帮助传真我的大测验。</font><font
											style="vertical-align: inherit;">快，巴兹，拿我的编织胡麻乔德！</font><font
											style="vertical-align: inherit;">“现在传真问答杰克！” </font><font
											style="vertical-align: inherit;">我的勇敢的鬼魂。</font><font
											style="vertical-align: inherit;">五个qu ze的混乱震动了我的蜡床。</font><font
											style="vertical-align: inherit;">被工作压得喘不过气来。</font><font
											style="vertical-align: inherit;">舒适的狮身人面像波夸脱水罐坏牛奶。</font><font
											style="vertical-align: inherit;">一个非常糟糕的嘎嘎可能会使快乐的家禽不高兴。</font><font
											style="vertical-align: inherit;">几乎没有什么打趣的模拟陪审团框。</font><font
											style="vertical-align: inherit;">快速的棕色狗跳过懒惰的狐狸。</font><font
											style="vertical-align: inherit;">杰，猪，狐狸，斑马和我的狼嘎嘎！</font><font
											style="vertical-align: inherit;">吹嘘红色vixens争取一个快速跳跃。</font><font
											style="vertical-align: inherit;">华金凤凰被MTV盯上好运。</font><font
											style="vertical-align: inherit;">巫师的工作就是在雾中快速克服困难。</font><font
											style="vertical-align: inherit;">观看Alex
												Trebek有趣的电视问答游戏“Jeopardy！”。</font><font
											style="vertical-align: inherit;">被编织的丝绸睡衣交换了蓝色石英。</font><font
											style="vertical-align: inherit;">壮汉神只是 </font></font>
									</p>
									<p>
										<font style="vertical-align: inherit;"><font
											style="vertical-align: inherit;"> 砖测验whangs jumpy
												veldt狐狸。</font><font style="vertical-align: inherit;">明亮的vixens跳;
										</font><font style="vertical-align: inherit;">家禽庸医。</font><font
											style="vertical-align: inherit;">快速飘动的zemprs vex大胆的吉姆。</font><font
											style="vertical-align: inherit;">快速的震耳欲聋的吹，令人烦恼的吉姆。</font><font
											style="vertical-align: inherit;">性冲动的fop吹了我的垃圾电视测验。</font><font
											style="vertical-align: inherit;">如何快速愚蠢的跳跃斑马vex。 </font></font>
									</p>
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
														style="vertical-align: inherit;"> 56评论 </font></font>
												</div>
												<i class="fa fa-eye"> </i><font
													style="vertical-align: inherit;"><font
													style="vertical-align: inherit;"> 144意见 </font></font>
											</div>
										</div>
									</div>

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
											<div class="social-feed-box">
												<div class="social-avatar">
													<a href="" class="pull-left"> <img alt="图片"
														src="img/a2.jpg">
													</a>
													<div class="media-body">
														<a href="#"><font style="vertical-align: inherit;"><font
																style="vertical-align: inherit;"> Michael Novek </font></font></a>
														<small class="text-muted"><font
															style="vertical-align: inherit;"><font
																style="vertical-align: inherit;">今天4:21 pm -
																	12.06.2014</font></font></small>
													</div>
												</div>
												<div class="social-body">
													<p>
														<font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">
																许多桌面出版软件包和网页编辑器现在都使用Lorem Ipsum作为默认的模型文本，搜索'lorem
																ipsum'将会发现许多网站仍然是默认的模型文本，搜索'lorem
																ipsum'将会发现许多网站仍然在他们的婴儿期。</font><font
															style="vertical-align: inherit;">包和网页编辑器现在使用Lorem
																Ipsum作为它们的默认模型文本。 </font></font>
													</p>
												</div>
											</div>
											<div class="social-feed-box">
												<div class="social-avatar">
													<a href="" class="pull-left"> <img alt="图片"
														src="img/a3.jpg">
													</a>
													<div class="media-body">
														<a href="#"><font style="vertical-align: inherit;"><font
																style="vertical-align: inherit;"> 爱丽丝Mediater </font></font></a> <small
															class="text-muted"><font
															style="vertical-align: inherit;"><font
																style="vertical-align: inherit;">今天下午4点21分-
																	2014年6月12日</font></font></small>
													</div>
												</div>
												<div class="social-body">
													<p>
														<font style="vertical-align: inherit;"><font
															style="vertical-align: inherit;">
																现在，许多桌面出版软件包和网页编辑器都使用Lorem Ipsum作为其默认模型文本，搜索“lorem
																ipsum”将会发现许多仍处于初级阶段的网站。</font><font
															style="vertical-align: inherit;">包和网页编辑器现在使用Lorem
																Ipsum作为它们的默认模型文本。 </font></font>
													</p>
												</div>
											</div>
											<div class="social-feed-box">
												<div class="social-avatar">
													<a href="" class="pull-left"> <img alt="图片"
														src="img/a5.jpg">
													</a>
													<div class="media-body">
														<a href="#"><font style="vertical-align: inherit;"><font
																style="vertical-align: inherit;"> 莫妮卡Flex </font></font></a> <small
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
																现在，许多桌面出版软件包和网页编辑器都使用Lorem Ipsum作为其默认模型文本，搜索“lorem
																ipsum”将会发现许多仍处于初级阶段的网站。</font><font
															style="vertical-align: inherit;">包和网页编辑器现在使用Lorem
																Ipsum作为它们的默认模型文本。 </font></font>
													</p>
												</div>
											</div>
										</div>
									</div>
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
</body>
</html>