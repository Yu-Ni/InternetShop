<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Evaluation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap-select.min.css">
	<link rel="stylesheet" type="text/css" href="./module/css/buyer/table.css">
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
		
  </head>
  
  <body>
		<div id="header" class="main-topbar">
        <div class="content-inner">
		  <div id="account" class="account">
				<a href="">你好！${sessionScope.realname }</a>&nbsp;&nbsp;
				<a href="">立即注册</a>
		 </div>
		   <div class="topnav">
		   <ul>
				<li><a href="">我的SHOP</a></li>
				<li><a href="">购物车</a></li>
				<li><a href="">商品分类</a></li>
				<li><a href="">卖家中心</a></li>
			</ul>
			</div>
		</div>
		</div>
		<div class="evalu">
		<div class="search" style="color:rgb(100,138,175)">
		<div class="input-group col-md-5" >
			<input type="text" class="form-control" placeholder="查找您的评价" id="searchT" /> 
				<span class="input-group-btn">
				<button class="btn btn-search" id="search" >搜索</button>
			    </span>
		</div>
		</div>	
		<div class="button" style="color:rgb(100,138,175); font-weight:30"> 
		<button type="button" id="edit" onclick="editModal()" class="btn">&nbsp;修改</button>
		<button id="del" onclick="delData()" type="button" class="btn">&nbsp;删除</button>
		<button id="refresh" onclick="refresh()" type="button" class="btn">&nbsp;刷新</button>
	  </div>
	  </div>
	<div class="imgh" >
       <img src="module/img/buyer/fff.jpg"  alt="抢购" width=100% height=30% />
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
					<h5 class="modal-title">修改</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h5>评论编号：</h5>
							<input type="text" id="editevaluationid" name="evaluationid"
								class="form-control" aria-describedby="basic-addon1"
								readonly="readonly" />
						</div>
						<div class="col-xs-12 col-md-5">
							<h5>订单编号：</h5>
							<input readonly="readonly" type="text" id="editorderid"
								name="orderid" class="form-control"
								aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h5>时间：</h5>
							<input readonly="readonly" type="text" id="edittime" name="time"
								class="form-control" aria-describedby="basic-addon1" />
						</div>

						<div class="col-xs-12 col-md-5">
							<h5>买家ID：</h5>
							<input readonly="readonly" type="text" id="editbuyerid"
								name="buyerid" class="form-control"
								aria-describedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h5>内容：</h5>
							<input type="textarea" id="editcontent" name="content"
								class="form-control" aria-describedby="basic-addon1" width="80%" height="10%" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						style="color:rgb(41,96,146)">取消</button>
					<button type="button" class="btn btn-primary" onclick="edit()">修改</button>
				</div>
			</div>
		</div>
	</div>
	<div style="padding-top:30px">
		<div style="margin-top:100px; color:rgb(100,138,175)" class="tble">
			<table id="tb">
			</table>
		</div>
	</div>
<<<<<<< .mine
	<div  class="pagefen">
		<ul class="pagination">
		<li><a href="#">&laquo;</a></li>
		<li class="active"><a href="#">1</a></li>
		<li class="disabled"><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">&raquo;</a></li>	
	   </ul>
	  </div>
=======
>>>>>>> .r93
	<script type="text/javascript" src="./module/js/buyer/Evaluation.js"></script>
   </body>
</html>
