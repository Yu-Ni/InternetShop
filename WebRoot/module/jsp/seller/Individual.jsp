<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>卖家个人资料展示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link type="text/css" rel="stylesheet"
	href="./module/css/seller/register.css" />
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap-dialog.min.css" />

<script src="./module/js/frame/jquery.js"></script>
<script src="./module/js/frame/jquery.min.js"></script>
<script src="./module/js/frame/bootstrap.js"></script>
<script src="./module/js/frame/bootstrap.min.js"></script>
<script src="./module/js/frame/bootstrap-dialog.min.js"></script>
 

<style type="text/css">
	body{
	background-image:url('./module/img/seller/timg2.jpg') !important;
	background-size:100% 100%;
	}
	</style>
  </head>
  
  <body>
 	<div class="col-sm-6 col-sm-offset-3 col-md-6" id="IndividualForm">
		<h3>个人资料展示</h3>
		<form  style="font-size:18px">
			<p>
				卖家编号: <input type="text" class="form-control" name="sellerId" id="sellerId" readonly="readonly"/>
			</p>
			<p>
				用户名: <input type="text" class="form-control" name="username" id="username" readonly="readonly"/>
			</p>
			<p>
				真实姓名: <input type="text" class="form-control" name="realname" id="realname"/>
			</p>
			<p>
				银行卡号: <input type="text" class="form-control" name="banknumber" id="banknumber"/>
			</p>
			<p>
				电话号码: <input type="text" class="form-control" name="phonenumber" id="phonenumber"/>
			</p>
			<p>
				地址: <input type="text" class="form-control" name="address" id="address"/>
			</p>
			<p>
				身份证号码: <input type="text" class="form-control" name="id_card" id="id_card"/>
			</p>
			<button type="button" class="btn btn-primary" onclick="update()" >确认修改个人资料</button>
			 
		</form>
	</div>

  </body>
<script type="text/javascript">
$(function(){
$.ajax({
		data:'',
		url:'IndividualController/getIndInfo.do',
		success:function(result){
			var obj=JSON.parse(result);
			$("#sellerId").val(obj.sellerId);
			$("#username").val(obj.username);
			$("#realname").val(obj.realname);
			$("#banknumber").val(obj.banknumber);
			$("#phonenumber").val(obj.phonenumber);
			$("#address").val(obj.address);
			$("#id_card").val(obj.id_card);
			/* var form = document.getElementById("IndividualForm");
			form.style.display="block"; */
		}
	});	
});

 function update(){  
		var parame = {}; 
		parame.sellerId =  $("#sellerId").val();
		parame.username = $("#username").val();
		parame.realname = $("#realname").val();
		parame.banknumber = $("#banknumber").val();
		parame.phonenumber = $("#phonenumber").val();
		parame.address = $("#address").val();
		parame.id_card = $("#id_card").val();
 
		$.ajax({
			url : 'IndividualController/updateInd.do',
			data : parame,
			success : function(o) {
				if (o <= 0) {
					showMessage("修改失败!");
				}else{
				showMessage("修改成功!");
				}
				 
			}
		});
 
 }
 
 function showMessage(message){
	BootstrapDialog.show({
	 	title:"提示",
	 	size:BootstrapDialog.SIZE_SMALL,
    	message: message
	 });
}
 
</script>
</html>
