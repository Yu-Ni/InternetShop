<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./module/css/admin/topTab.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap.min.css">
	
	<script src="./module/js/frame/jquery.min.js"></script>
	<script src="./module/js/frame/bootstrap.min.js"></script>
  </head>
  
  <body>
  
  	<div id="content">
  		<div class="titleInfo">
	  		<div>
	  			<img src="./module/img/admin/logo.png" width="30px" height="30px">
	  		</div>
	  		<div>
	  			<h3>网上<span>购物</span>管理系统</h3>
	  		</div>
		</div>
	
	    <div class="userInfo">
	    	<div>
	    		<span>
	    			<img src="./module/img/admin/homepage_loge_white.png" width="20px" height="20px"/>
	    			<a href="./module/jsp/admin/mainTab.jsp" target="mainFrame">[首页]</a>
	    		</span>
		    	<span><a href="./module/jsp/Login/login.jsp" target="_parent">[退出]</a></span>
		    	<span>${sessionScope.adminname }</span>
		    	<span>
		    		<img src="./upload/${sessionScope.imgHead }" width="30px" height="30px" alt="头像" class="img-circle">
		    	</span>
	    	</div>
	    </div>	
  	</div>
  	
  </body>
</html>
