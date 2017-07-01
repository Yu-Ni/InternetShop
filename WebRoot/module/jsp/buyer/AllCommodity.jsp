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

<title>所有商品展示</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link type="text/css" rel="stylesheet"
	href="module/css/frame/bootstrap.min.css" />
<link type="text/css" rel="stylesheet" href="module/css/buyer/AllCommodity.css" />
<script type="text/javascript" src="module/js/frame/jquery.min.js"></script>
<script type="text/javascript" src="module/js/frame/bootstrap.min.js"></script>
<script type="text/javascript" src="module/js/buyer/AllCommodity.js"></script>
</head>

<body>

		<div id="header" class="main-topbar">
        <div class="content-inner">
		  <div id="account" class="account">
				<a href="">你好！请登录</a>&nbsp;&nbsp;
				<a href="">立即注册</a>
		 </div>
		   <div class="topnav">
		   <ul>
				<li><a href="">我的SHOP</a></li>
				<li><a href="">购物车</a></li>
				<li><a href="">商品分类</a></li>
				<li><a href="">卖家中心</a></li>
			</ul>
			</div>
		</div>
		</div>
		<div id="SearchHeader">
			<img src="">
			<div id="search" class="input-group col-md-6">
				<input type="text" class="form-control" placeholder="你想要什么" /> <span
					class="input-group-btn">
					<button class="btn btn-search">查找</button>
				</span>
			</div>
		</div>
		<div id="nav">
			<ul id="SecondNav">
				<li><a href="module/jsp/buyer/Index.jsp">首页</a></li>
				<li><a href="#clotheShow">女装男装</a></li>
				<li><a href="#bagShow">鞋类箱包</a></li>
				<li><a href="#foodShow">汇吃美食</a></li>
				<li><a href="#furnitureShow">家居家纺</a></li>
				<li><a href="">更多>></a></li>
			</ul>
		</div>
		<div id="AllShow"></div>
	</div>
</body>
</html>
