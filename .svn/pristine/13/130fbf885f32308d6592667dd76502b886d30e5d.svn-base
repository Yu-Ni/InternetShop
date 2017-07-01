<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="./module/css/login.css" rel="stylesheet" type="text/css">
	<link href="./module/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css" />
	<link href="./module/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script src="./module/frame/jquery.min.js"></script>
	<script src="./module/frame/bootstrap.min.js"></script>
	<script src="./module/frame/bootstrap-dialog.min.js"></script>
	<script src="./module/frame/bootstrap.js"></script>
	
  </head>
  
  <body>
  	
  	<div id="header">
  		<span class="title">Sign In Form</span>
  	</div>
  	<div id="container">
  		<form method="post" action="userController/login">
  			<div class="tips">
  				<img src="./module/img/icons.png"/>
  			</div>
	    	<input type="text" name="username" class="username"><br/>
	    	<input type="password" name="password" class="password"><br/>
	    	<input type="button" value="Register" onclick="register()" class="submit"/>
	    	<input type="submit" value="Sign in" class="submit">
    	</form>
  	</div>
  	
  	<script type="text/javascript">
		function register(){
			 BootstrapDialog.show({
			 	title:"Register",
            	message: $('<div></div>').load('./module/jsp/register.jsp')
        	 });
		}
  	</script>
  </body>
</html>
