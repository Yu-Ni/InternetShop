<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="./module/css/register.css">

  </head>
  
  <body>
    <form method="post" action="userController/register">
    	<div class="input-group">
			<span class="input-group-addon">Username</span>
			<input type="text" class="form-control" name="username">
		</div>
		<div class="input-group">
			<span class="input-group-addon">Password&nbsp;</span>
			<input type="password" class="form-control" name="password">
		</div>
		<div class="input-group">
			<span class="input-group-addon">Realname</span>
			<input type="text" class="form-control" name="realname">
		</div>
    	<input type="submit" value="Register" class="registerBtn"/>
    </form>
  </body>
</html>
