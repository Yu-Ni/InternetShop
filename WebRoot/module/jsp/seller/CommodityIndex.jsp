<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap-select.min.css">
	<link rel="stylesheet" type="text/css" href="./module/css/frame/bootstrap-dialog.min.css">
	
	<script src="./module/js/frame/jquery.min.js"></script>
	<script src="./module/js/frame/bootstrap.js"></script>
	<script src="./module/js/frame/bootstrap-table.js"></script>
	<script src="./module/js/frame/bootstrap-table-zh-CN.js"></script>
	<script src="./module/js/frame/bootstrap-select.min.js"></script>
	<script src="./module/js/frame/bootstrap-dialog.min.js"></script>
	
	<style type="text/css">
		.bootstrap-dialog.type-primary .modal-header{
			background-color:#16B398 !important;
		}
		
		.modal-dialog {
		    margin: 1% auto !important;
		}
		
		body{
			margin: 10px 30px;
		}
		
		td{
			width: 20% !important;
		}
		
	</style>
	
	<script type="text/javascript">
	$(function(){
	  $("#image").change(function() {  
	        var $file = $(this);  
	        var objUrl = $file[0].files[0];  
	        var windowURL = window.URL || window.webkitURL;  
	        var dataURL;  
	        
	        dataURL = windowURL.createObjectURL(objUrl); 
	        console.log(objUrl);
	        $("#imageview").attr("src",dataURL);  
	    });  
	});
	
	</script>
  </head>
  
  <body> 
   <div id="toolbar" style="margin:10px 0px 10px 5px;">
	        <p id="add" class="btn btn-sm btn-primary" onclick="addModal()" >
	            <i class="glyphicon glyphicon-plus"></i> 添加
	        </p>  
            <p id="edit" class="btn btn-sm btn-warning" onclick="editModal()" >
               <i class="glyphicon glyphicon-pencil"></i> 修改
            </p>
            <p id="delete" class="btn btn-sm btn-primary" onclick="showModal()">
                <i class="glyphicon glyphicon-show"></i> 查看
            </p>
             <p id="delete" class="btn btn-sm btn-danger" onclick="delData()">
                <i class="glyphicon glyphicon-minus"></i> 删除
            </p>
             <p id="delete" class="btn btn-sm btn-primary" onclick="refresh()">
                <i class="glyphicon glyphicon-refresh"></i> 刷新
            </p>
       </div>  
  	<!-- 新增弹框 -->
  	<div id="addModal" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel">
	  <div class="modal-dialog" role="document">
	  <form id="fm" method="post" enctype="multipart/form-data"  action="commodityManagerController/addCommodity.do" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">新增</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
               <div class="col-xs-12 col-md-5">
                   <h4>商品名称：</h4>
                   <input type="text" id="productname" name="productname" class="form-control" aria-describedby="basic-addon1"/>
               </div>
               <div class="col-xs-12 col-md-5">
                   <h4>商品类别：</h4>
                   <select id="typeid" name="typeid">
                   </select>
               </div>
             </div>
             <div class="row">
               <div class="col-xs-12 col-md-5">
                   <h4>单价：</h4>
                   <input type="text" id="price" name="price" class="form-control" aria-describedby="basic-addon1"/>
               </div>
               <div class="col-xs-12 col-md-5">
                   <h4>库存：</h4>
                   <input type="text" id="margin" name="margin" class="form-control" aria-describedby="basic-addon1"/>
               </div>
             </div>
             <div class="row"> 
               <div class="col-xs-12 col-md-5">
                   <h4>图片：</h4>
                   <img id="imageview"  width="200px" height="200px" src="upload/emptyImg.jpg">  
                   <input type="file" id="image" name="image" class="form-control" aria-describedby="basic-addon1"/>
               </div>
                <div class="col-xs-12 col-md-5">
                   <h4>备注：</h4>
                   <input type="text" id="remark" name="remark" class="form-control" aria-describedby="basic-addon1"/>
               </div>
             </div>
             <div class="row"> 
               <div class="col-xs-12 col-md-12">
                   <h4>描述：</h4>
                         <div class="form-group"> 
						    <textarea class="form-control" id="description" name="description" rows="3"></textarea> 
						 </div>   
                </div> 
             </div>
              
             
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <input type="submit" class="btn btn-primary" value="新增">
	      </div>
	    </div>
	    </form>
	  </div>
	  
	</div>
  	
  	<!-- 查看弹框 -->
  	<div id="showModal" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">查看</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
               <div class="col-xs-12 col-md-5">
                   <h4>商品名称：</h4>
                   <input type="text" id="showproductname" name="productname" class="form-control" aria-describedby="basic-addon1"/>
               </div>
               <div class="col-xs-12 col-md-5">
                   <h4>商品类别：</h4>
                   <select id="showtypeid" name="typeid" class="form-control"></select>
               </div>
             </div>
             <div class="row">
               <div class="col-xs-12 col-md-5">
                   <h4>单价：</h4>
                   <input type="text" id="showprice" name="price" class="form-control" aria-describedby="basic-addon1"/>
               </div>
               <div class="col-xs-12 col-md-5">
                   <h4>库存：</h4>
                   <input type="text" id="showmargin" name="margin" class="form-control" aria-describedby="basic-addon1"/>
               </div>
             </div>
             <div class="row"> 
               <div class="col-xs-12 col-md-5">
                   <h4>图片：</h4>
                   <input type="file" id="showimage" name="image" class="form-control" aria-describedby="basic-addon1"/>
               </div>
                <div class="col-xs-12 col-md-5">
                   <h4>备注：</h4>
                   <input type="text" id="showremark" name="remark" class="form-control" aria-describedby="basic-addon1"/>
               </div>
             </div>
             <div class="row"> 
               <div class="col-xs-12 col-md-12">
                   <h4>描述：</h4>
                   <div class="form-group"> 
						    <textarea class="form-control" id="showdescription" name="description" rows="3"></textarea> 
						 </div>   
                </div> 
             </div>
             
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
	       <!--  <button type="button" class="btn btn-primary" onclick="edit()">修改</button> -->
	      </div>
	    </div>
	  </div>
	</div>
  	
  	<!-- 修改弹框 -->
  	<div id="editModal" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel">
	  <div class="modal-dialog" role="document">
	  <form id="fmedit" method="post" enctype="multipart/form-data"  action="commodityManagerController/updateCommodity.do" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">修改</h4>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
               <div class="col-xs-12 col-md-5">
                   <h4>商品名称：</h4>
                   <input type="hidden" name="productid" id="editproductid" >
                   <input type="text" id="editproductname" name="productname" class="form-control" aria-describedby="basic-addon1"/>
               </div>
               <div class="col-xs-12 col-md-5">
                   <h4>商品类别：</h4>
                   <select id="edittypeid" name="typeid" class="form-control"></select>
               </div>
             </div>
             <div class="row">
               <div class="col-xs-12 col-md-5">
                   <h4>单价：</h4>
                   <input type="text" id="editprice" name="price" class="form-control" aria-describedby="basic-addon1"/>
               </div>
               <div class="col-xs-12 col-md-5">
                   <h4>库存：</h4>
                   <input type="text" id="editmargin" name="margin" class="form-control" aria-describedby="basic-addon1"/>
               </div>
             </div>
             <div class="row"> 
               <div class="col-xs-12 col-md-5">
                   <h4>图片：</h4>
                   <input type="file" id="editimage" name="image" class="form-control" aria-describedby="basic-addon1"/>
               </div>
                <div class="col-xs-12 col-md-5">
                   <h4>备注：</h4>
                   <input type="text" id="editremark" name="remark" class="form-control" aria-describedby="basic-addon1"/>
               </div>
             </div>
             <div class="row"> 
               <div class="col-xs-12 col-md-12">
                   <h4>描述：</h4>
						<div class="form-group"> 
						    <textarea class="form-control" id="editdescription" name="description" rows="3"></textarea> 
						 </div>    
               </div> 
             </div>
             
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	       <input type="submit" class="btn btn-primary" value="修改">
	      </div>
	    </div>
	    </form>
	  </div>
	</div>
  	
  	<!-- 表格 -->
  	<table id="tb">
  	</table>
  	
  </body>
 <script  src="./module/js/seller/CommodityManage.js"></script>
 </html>

