<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网上购物系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./module/css/Login/login.css"> 
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap-dialog.min.css"/>
	
	<script src="./module/js/frame/jquery.js"></script>
	<script src="./module/js/frame/jquery.min.js"></script>
	<script src="./module/js/frame/bootstrap.js"></script>
	<script src="./module/js/frame/bootstrap.min.js"></script>
	<script src="./module/js/frame/bootstrap-dialog.min.js"></script>
  </head>
  
  <body>
  
   <div id="login">
    <div class="wrapper">
        <div class="login">
            <form method="post" class="container offset1 loginform" >
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad" style="">
                    <div class="control-group">
                        <div class="controls">
                             <label for="">用户名:</label>
                            <input id="username" type="text" name="username"  tabindex="1" autofocus="autofocus" class="form-control input-medium" style="padding-left: 80px">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                             <label for="password" >密&nbsp;&nbsp;&nbsp;码:</label>
                            <input id="password" type="password" name="password"  tabindex="2" class="form-control input-medium" style="padding-left: 80px">
                        </div>
                    </div>
                    <div class="control-group">
                         <div class="controls">
								<fieldset>
									<legend align="left" class="tip">请选择身份</legend>
									<input type=radio name="role" checked value="0">卖家
									<input type=radio name="role" value="1">买家
									<input type=radio name="role" value="2">管理员 <br>
								</fieldset>
							</div>
                    </div>
                </div>
                <div class="form-actions">
                	<input tabindex="4" class="btn btn-primary" onclick="userLogin(this.form)" value="登录" readonly="readonly"/>
                	<a href="javascript:userRegister()" tabindex="6" class="btn btn-link text-muted">注册</a>
                </div>
            </form>
        </div>
    </div>
    </div>
    <div style="height: 18%;position: absolute;bottom: 0;background-color: #DEDDD8;width: 100%;">
    
    </div>
    <script type="text/javascript" src="./module/js/Login/login.js"></script>
  </body>
</html>
