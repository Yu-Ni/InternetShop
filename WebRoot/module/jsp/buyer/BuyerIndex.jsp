<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

	<title>买家首页</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="module/css/frame/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="module/css/buyer/Index.css" />
	<script type="text/javascript" src="./module/js/frame/jquery.js"></script>
	<script type="text/javascript" src="./module/js/frame/jquery.min.js"></script>
	<script type="text/javascript" src="./module/js/frame/bootstrap.js"></script>
	<script type="text/javascript" src="./module/js/frame/bootstrap.min.js"></script>
	<script type="text/javascript" src="./module/js/frame/bootstrap-table.js"></script>
	<script type="text/javascript" src="./module/js/frame/bootstrap-table.min.js"></script>
	<script type="text/javascript" src="./module/js/frame/bootstrap-table-zh-CN.js"></script>
	<script type="text/javascript" src="./module/js/frame/bootstrap-table-zh-CN.min.js"></script>
	<script type="text/javascript" src="./module/js/frame/bootstrap-table-zh-CN.min.js"></script>

</head>

<body>
	<iframe src="./module/jsp/buyer/navTab.jsp" width="100%" height="45px"></iframe>
	<div class="bannerDiv"></div>
	<div id="mapper">
		<div id="SearchHeader">
			<img src="module/img/buyer/logo.gif">
			<div id="search" class="input-group col-md-6">
				<input type="text" class="form-control" placeholder="你想要什么" id="SearchWhat"/>
				 <span class="input-group-btn">
					<button class="btn btn-search" onclick="search()">查找</button>
				</span>
			</div>
		</div>
		<div id="nav"></div>
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="module/img/buyer/1.jpg" alt="First slide">
				</div>
				<div class="item">
					<img src="module/img/buyer/2.jpg" alt="Second slide">
				</div>
				<div class="item">
					<img src="module/img/buyer/3.png" alt="Third slide">
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
		<div id="notice">
			<table id="tbNotice"></table>
		</div>
		<div id="mainTab"></div>
 		<div id="footer">
 			<div class="footer_content">
 				<div class="content_div1">
 					<span>关于我们&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>联系我们&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>联系客服&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>合作招商&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>商家帮助&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>营销中心&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>友情链接&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>销售联盟&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>风险监测&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>隐私政策&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>English Site&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>Contact Us</span>
 				</div>
 				<div class="content_div2">
 					<span>京公网安备 11000002000088号&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>京ICP证070359号&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>互联网药品信息服务资格证编号(京)-经营性-2014-0008&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>新出发京零 字第大120007号</span>
 				</div>
 				<div class="content_div2">
 					<span>Copyright © 2004 - 2017  淘宝Taobao.com 版权所有&nbsp;&nbsp;|&nbsp;&nbsp;</span>
	 				<span>消费者维权热线：4006067733&nbsp;&nbsp;&nbsp;&nbsp;经营证照</span>
 				</div>
 			</div>
 		</div>
	</div>
	
	<!-- 新增弹框 -->
	<div>
		<div id="NoticeShow" class="modal fade" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">公告详情</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12 col-md-5" style="display:none;">
								<h4>公告标题</h4>
								<input type="text" id=noticeid name="noticeid"
									class="form-control" aria-describedby="basic-addon1" />
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xs-12 col-md-12">
										<h4>公告标题</h4>
										<input type="text" id="title" name="title"
											class="form-control" aria-describedby="basic-addon1" readonly/>
									</div>
									<div class="col-xs-12 col-md-12">
										<h4>发布人</h4>
										<input type="text" id="username" name="username"
											class="form-control" aria-describedby="basic-addon1" readonly />
									</div>
									<div class="col-xs-12 col-md-12">
										<h4>公告内容</h4>
										<textarea rows="5" cols="" class="form-control" id="reply"
											name="reply" readonly>
										</textarea>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal" style="color:rgb(41,96,146)">关闭</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$("#SecondNav a").each(function() {
				var link = $(this);
				var href = link.attr("href");
				if (href && href[0] == "#") {
					var name = href.substring(1);
					$(this).click(function() {
						var nameElement = $("[name='" + name + "']");
						var idElement = $("#" + name);
						var element = null;
						if (nameElement.length > 0) {
							element = nameElement;
						} else if (idElement.length > 0) {
							element = idElement;
						}
	
						if (element) {
							var offset = element.offset();
							window.parent.scrollTo(offset.left, offset.top);
						}
	
						return false;
					});
				}
			});
		});
	</script>
	
	<script type="text/javascript" src="./module/js/buyer/BuyerIndex.js"></script>
</body>
</html>
