<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'navTab.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./module/css/buyer/navTab.css">

  </head>
  
  <body>
    	<div id="headerDiv">
    		<span class="userInfo">你好！${sessionScope.buyername }</span>
    		<span class="navInfo">
    			<span>
    				<a href="./module/jsp/buyer/BuyerIndex.jsp" target="_parent">首页</a>
    			</span>
	    		<span>
	    			<a href="./module/jsp/buyer/shopCart.html" target="_parent">购物车</a>
	    		</span>
	    		<span>
	    			<a href="./module/jsp/buyer/Allorder.html" target="_parent">我的订单</a>
	    		</span>
	    		<span>
	    			<a href="./module/jsp/Login/login.jsp" target="_parent">注销</a>
	    		</span>
    		</span>
    	</div>
  </body>
</html>
