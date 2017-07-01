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

<title>公告管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
		<button type="button" class="btn" id="add" onclick="addModal()">&nbsp;发布公告</button>
		<button type="button" id="edit" onclick="editModal()" class="btn">&nbsp;修改公告</button>
		<button id="del" onclick="delData()" type="button" class="btn">&nbsp;删除公告</button>
		<button id="refresh" onclick="refresh()" type="button" class="btn">&nbsp;刷新</button>
		<!-- <input type="text" class="txt" id="searchT"> -->
		<div class="input-group col-md-5"
			style="float:right;margin-right:30px">
			<input type="text" class="form-control" placeholder="搜索公告"
				id="searchT" /> <span class="input-group-btn">
				<button class="btn btn-search" id="search">搜索</button></span>
				<!-- <button id="search" type="button" class="btn">&nbsp;搜索</button> -->
		</div>

	</div>

	<!-- 新增弹框 -->
	<div>
		<div id="addModal" class="modal fade" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">发布公告</h4>
					</div>

					<div class="modal-body">
						<div class="row">
							<div class="col-xs-12 col-md-5">
								<h4>话题：</h4>
								<input type="text" id="title" name="title" class="form-control"
									aria-describedby="basic-addon1"
									style="width: 480px;height: 34px;" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-md-5">
								<h4>发表人姓名：</h4>
								<input type="text" id="user" name="user" class="form-control"
									aria-describedby="basic-addon1" />
							</div>
							<div class="col-xs-12 col-md-5">
								<h4>主题：</h4>
								<input type="text" id="theme" name="theme" class="form-control"
									aria-describedby="basic-addon1" />
							</div>
							<div class="col-xs-12 col-md-12">
								<h4>内容：</h4>
								<textarea rows="5" cols="10" class="form-control"  id="content" name="content"></textarea>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="add()">发布</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 查看弹框 -->
	<div id="showModal" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">搜索</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>话题：</h4>
							<input type="text" id="showtitle" name="title"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>发表人姓名：</h4>
							<input type="text" id="showusername" name="username"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>主题：</h4>
							<input type="theme" id="showtitle" name="title"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>内容：</h4>
							<textarea rows="5" cols="10" class="form-control"  id="showreply" name="content"></textarea>
						</div>
					</div>
					<div class="col-xs-12 col-md-5">
						<h4>公告日期：</h4>
						<input type="text" id="shownoticetime" name="noticetime"
							class="form-control" aria-describedby="basic-addon1" />
					</div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
				<!--  <button type="button" class="btn btn-primary" onclick="edit()">修改</button> -->
			</div>
		</div>
	</div>

	<!-- 修改弹框 -->
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
						<div class="col-xs-12 col-md-5">
							<h4>话题：</h4>
							<input type="text" id="edittitle" name="title"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>发表人姓名：</h4>
							<input type="text" id="editusername" name="username"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>主题：</h4>
							<input type="text" id="edittheme" name="theme"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h4>内容：</h4>
							<textarea rows="5" cols="10" class="form-control"  id="editreply" name="content"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>公告日期：</h4>
							<input type="text" id="editnoticetime" name="noticetime"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="edit()">修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
<div class="yangs">
	<table id="table">
	</table>
	</div>
	<script type="text/javascript" src="./module/js/admin/notice.js"></script>
</body>
</html>

