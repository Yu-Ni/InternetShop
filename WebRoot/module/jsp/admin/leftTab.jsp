<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'leftTab.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./module/css/admin/leftTab.css">

  </head>
  
  <body>
    <div id="leftTab">
    	<ul>
	    	<li>
	    		<img src="./module/img/admin/buyerM.png" width="20px" height="20px"/>
	    		<a href="./module/jsp/admin/buyerManager.jsp" target="mainFrame">买&nbsp;家&nbsp;管&nbsp;理</a>
	    	</li>
	    	<li>
	    		<img src="./module/img/admin/sellerM.png" width="20px" height="20px"/>
	    		<a href="./module/jsp/admin/sellerManager.jsp" target="mainFrame">卖&nbsp;家&nbsp;管&nbsp;理</a>
	    	</li>
	    	<li>
	    		<img src="./module/img/admin/Manager.png" width="20px" height="20px"/>
	    		<a href="./module/jsp/admin/adminManager.jsp" target="mainFrame">管理员管理</a>
	    	</li>
	    	<li>
	    		<img src="./module/img/admin/Notice.png" width="20px" height="20px"/>
	    		<a href="./module/jsp/admin/notice.jsp" target="mainFrame">公告管理</a>
	    	</li>
    	</ul>
    </div>
  </body>
</html>
