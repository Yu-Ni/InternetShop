<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>卖家界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap-table.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap-table.min.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap-theme.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/admin/changeColor.css">
<!-- <link rel="stylesheet" type="text/css"
	href="./module/css/admin/buttons.css"> -->



<script type="text/javascript" src="./module/js/frame/jquery.js"></script>
<script type="text/javascript" src="./module/js/frame/jquery.min.js"></script>
<script type="text/javascript" src="./module/js/frame/bootstrap.js"></script>
<script type="text/javascript" src="./module/js/frame/bootstrap.min.js"></script>
<script type="text/javascript"
	src="./module/js/frame/bootstrap-table.js"></script>
<script type="text/javascript"
	src="./module/js/frame/bootstrap-table.min.js"></script>
<script type="text/javascript"
	src="./module/js/frame/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript"
	src="./module/js/frame/bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript"
	src="./module/js/frame/bootstrap-table-zh-CN.min.js"></script>



</head>

<body>
	<div>
		<button type="button" class="btn" onclick="addModal()">&nbsp;新增</button>
		<button type="button" onclick="editModal()" class="btn">&nbsp;修改</button>
		<button id="del" onclick="delData()" type="button" class="btn">&nbsp;删除</button>
		<button id="refresh" onclick="refresh()" type="button" class="btn"
			onclick="refresh()">&nbsp;刷新</button>
		<div class="input-group col-md-5"
			style="float:right;margin-right:30px">
			<input type="text" class="form-control" placeholder="想搜什么搜什么"
				id="searchT" /> <span class="input-group-btn">
				<button class="btn btn-search" id="search">搜索</button>
			</span>
			<!-- <button id="search" type="button" class="btn">&nbsp;搜索</button> -->
		</div>
	</div>

	<div id="addModal" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新增</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>用户名：</h4>
							<input type="text" id="userName" name="userName"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>真实姓名：</h4>
							<input type="text" id="realName" name="realName"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>密码：</h4>
							<input type="password" id="password" name="password"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>银行帐号：</h4>
							<input type="text" id="bankNumber" name="bankNumber"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>电话号码：</h4>
							<input type="text" id="phoneNumber" name="phoneNumber"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>地址：</h4>
							<input type="text" id="address" name="address"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>身份证号：</h4>
							<input type="text" id="id_card" name="id_card"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="add()">确定</button>
				</div>
			</div>
		</div>
	</div>

	<div id="editModal" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-md-5" style="display:none;">
							<h4>用户Id：</h4>
							<input type="text" id="editsellerId" name="sellerId"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>用户名：</h4>
							<input type="text" id="edituserName" name="userName"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>真实姓名：</h4>
							<input type="text" id="editrealName" name="realName"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>密码：</h4>
							<input type="password" id="editpassword" name="password"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>银行帐号：</h4>
							<input type="text" id="editbankNumber" name="bankNumber"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>电话号码：</h4>
							<input type="text" id="editphoneNumber" name="phoneNumber"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>地址：</h4>
							<input type="text" id="editaddress" name="address"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>身份证号：</h4>
							<input type="text" id="editid_card" name="id_card"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="edit()">修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="yangs">
	<table id="tb">
	</table></div>
	<script type="text/javascript" src="./module/js/admin/sellerManager.js"></script>
</body>
</html>