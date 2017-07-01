<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sellerRegister.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="./module/css/Login/register.css">
	<script type="text/javascript" src="module/js/frame/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#usernameSHU").blur(function() {
			var user = $("#usernameSHU").val();
			$.ajax({
				data : {
					username : user
				},
				url : 'loginController/validateSeller.do',
				dataType : 'json',
				success : function(result) {
					if (result == 0) {
					var repeatSpan = document.getElementById("repeat");
						repeatSpan.style.display="inline";
						repeatSpan.innerText="用户名有人用了!";
						document.getElementById("password").disabled = true;
						document.getElementById("phoneNumber").disabled = true;
						document.getElementById("realname").disabled = true;
						document.getElementById("bankNumber").disabled = true;
						document.getElementById("address").disabled = true;
						document.getElementById("idCard").disabled = true;
						document.getElementById("registBtn").disabled = true;						
					}
				}
			});
		})
		$("#fileUpload").change(function() {
			var $file = $(this);
			var objUrl = $file[0].files[0];
			var windowURL = window.URL || window.webkitURL;
			var dataURL;

			dataURL = windowURL.createObjectURL(objUrl);
			console.log(objUrl);
			$("#imageview").attr("src", dataURL);
		});
	});
	function change(){
	document.getElementById("password").disabled = false;
	document.getElementById("phoneNumber").disabled = false;
	document.getElementById("realname").disabled = false;
	document.getElementById("bankNumber").disabled = false;
	document.getElementById("address").disabled = false;
	document.getElementById("idCard").disabled = false;
	document.getElementById("registBtn").disabled = false;		
		if($("input[name='username']").val()==""){
			var repeatSpan = document.getElementById("repeat");
			repeatSpan.innerText="";
		}
	}
</script>
</head>
  
  <body>
  	<form method="post">
    	<div class="input-group">
			<span class="input-group-addon">登录账号</span>
			<input type="text" onchange="change()" class="form-control" name="username" id="usernameSHU">
		</div>
		<span id="repeat" style="position:absolute;left:80%;top:8%;display:none;"></span>
		<div class="input-group">
			<span class="input-group-addon">真实姓名</span>
			<input type="text" class="form-control" name="realname" id="realname">
		</div>
		<div class="input-group">
			<span class="input-group-addon">登录密码</span>
			<input type="password" class="form-control" name="password" id="password">
		</div>
		<div class="input-group">
			<span class="input-group-addon">银行卡号</span>
			<input type="text" class="form-control" name="bankNumber" id="bankNumber">
		</div>
		<div class="input-group">
			<span class="input-group-addon">联系方式</span>
			<input type="text" class="form-control" name="phoneNumber" id="phoneNumber">
		</div>
		<div class="input-group">
			<span class="input-group-addon">联系地址</span>
			<input type="text" class="form-control" name="address" id="address">
		</div>
		<div class="input-group">
			<span class="input-group-addon">身份证号</span>
			<input type="text" class="form-control" name="idCard" id="idCard">
		</div>
    	<div>
    		<input type="button" value="注册" class="registerBtn" id="registBtn" onclick="sellerInfoRegister(this.form)"/>
    		<input type="button" value="取消" class="registerBtn" onclick="cancelRegister()"/>
    	</div>
    </form>
    
  </body>
</html>
