


function queryParams(pageRequest){
	pageRequest.condition=$("#searchT").val();
	return pageRequest;
}

	$(function () {
	loaddata();
	});
$("#search").click(function(){
	
	$('#table').bootstrapTable('refresh', queryParams);
});
function loaddata()
{
	$('#table').bootstrapTable({
		 //定义表格的高度
		height: 450,
		striped: true,// 隔行变色效果
		pagination: true,//在表格底部显示分页条
		pageSize: 10,//页面数据条数
		pageNumber:1,//首页页码
		pageList: [10, 15, 20, 30,50,100],//设置可供选择的页面数据条数
		//clickToSelect:true,//设置true 将在点击行时，自动选择rediobox 和 checkbox
		cache: false,//禁用 AJAX 数据缓存
		sortName:'ID',//定义排序列
		sortOrder:'asc',//定义排序方式		
		sidePagination:'client',//设置在哪里进行分页
		contentType:'application/json',//发送到服务器的数据编码类型SS
		dataType:'json',//服务器返回的数据类型
    	queryParams:queryParams,//请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数
    	url:'adminManageController/getAdminList.do',//服务器数据的加载地址8
		selectItemName:'',//radio or checkbox 的字段名
		singleSelect : true,
		columns:[{
			radio:true,
			width:'5'//宽度
		},{
			field:'adminid',//返回值名称
			title:'管理员ID',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
			width:'10',//宽度
			visible:false
		},{
			field:'username',//返回值名称
			title:'管理员用户名',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
			width:'10',//宽度
			//  visible:false
		},{
			field:'realname',//返回值名称
			title:'管理员姓名',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
			width:'10',//宽度
			//visible:false
		},{
			field:'password',//返回值名称
			title:'密码',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
			width:'10',//宽度
			visible:false
		},{
			field:'telphone',//返回值名称
			title:'联系方式',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
			width:'10'//宽度
		},{
			field:'avatar',//返回值名称
			title:'头像',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
			width:'10'//宽度
		},{
			field:'sex',//返回值名称
			title:'性别',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
			width:'10'//宽度
		}]//列配置项,详情请查看 列参数 表格
		/*事件*/
	});
}
/* 刷新方法 */
function refresh(){
	$('#table').bootstrapTable('refresh', null);
}


/* 删除方法 */
function delData(){
	var data = $('#table').bootstrapTable('getSelections');
	
	if(data.length==0){
		alert("请至少选中一条数据");
		return;
	}
	var ids = "";
	for(var i=0; i<data.length; i++){
		ids += data[i].adminid + ",";
	}
	var ajaxParameter = {
		adminids:ids.substring(0, (ids.length-1))
	};
	var r=confirm("确认删除");
	if(r==true){
	$.ajax({
	  url:'adminManageController/delAdmin.do',
	  data:ajaxParameter,
	  success:function(o){
		  if(o<=0){
			  alert("删除失败");
		  }
		  refresh();
	  }
	});
	alert("删除成功");
}
	else
		{
		alert("不用删除了");
		}
}

function addModal(){ 
	$('#addModal').modal('show');
}
/* 新增方法 */
function add(){
	var username= $('#username').val();	
	if (!username && typeof(username)!="undefined" && username=='') 
	{ 
		alert("用户名不能为空！"); 
	}else {
		var parame = {};
		var chkObjs=null;
		var obj=document.getElementsByName("sex");  
        for (var i=0;i<obj.length;i++){  //遍历Radio    
            if(obj[i].checked){   
            	chkObjs=obj[i].value;  
            }    
        } 
      
		parame.username =  $('#username').val(); 
		parame.realname = $('#realname').val();
		parame.password =  $('#password').val(); 
		parame.avatar = $('#avatar').val(); 
		parame.telphone = $('#telphone').val(); 
		parame.sex=chkObjs
		$.ajax({
		  url:'adminManageController/addRole.do',
		  data:parame,
		  success:function(o){
			  if(o<=0){
				  alert("新增失败");
			  }
			  $('#addModal').modal('hide');
			  refresh();
		  }
		});
	}
	
}

/* 弹出查看弹框方法 */
function showModal(){ 
	var data = $('#table').bootstrapTable('getSelections');
	
	if(data.length==0 || data.length>1){
		alert("请选中一条数据");
		return;
	}
	
	$('#showusername').val(data[0].username);
	$('#showrealname').val(data[0].realname);
	$('#showpassword').val(data[0].password);
	$('#showtelphone').val(data[0].telphone);
	$('#showavatar').val(data[0].avatar);
	$('#showsex').val(data[0].sex);
	$('#showModal').modal('show');
}



/* 弹出修改弹框方法 */
function editModal(){
	var data = $('#table').bootstrapTable('getSelections');
	
	if(data.length==0 || data.length>1){
		alert("请选中一条数据");
		return;
	}
	$('#editusername').val(data[0].username);
	$('#editrealname').val(data[0].realname);
	$('#editpassword').val(data[0].password);
	$('#edittelphone').val(data[0].telphone);
	$('#editsex').val(data[0].sex);
	$('#editModal').modal('show');
}

/* 修改方法 */
function edit(){
	var name = $('#editusername').val(); 
	if (!name && typeof(name)!="undefined" && name=='') 
	{ 
		alert("不能为空！"); 
	}else {
		var data = $('#table').bootstrapTable('getSelections');
		var ids =  data[0].adminid;
		var parame = {};
		var chkObjs=null;
		var obj=document.getElementsByName("sex");  
        for (var i=0;i<obj.length;i++){  //遍历Radio    
            if(obj[i].checked){   
            	chkObjs=obj[i].value;  
            }    
        } 
		parame.adminid = ids;
		parame.username = $('#editusername').val();
		parame.realname = $('#editrealname').val();
		parame.password = $('#editpassword').val();
		parame.telphone = $('#edittelphone').val();
		parame.avatar = $('#editavatar').val();
		parame.sex = chkObjs;  	
		$.ajax({
		  url:'adminManageController/updateAdmin.do',
		  data:parame,
		  success:function(o){
			  if(o<=0){
				  alert("修改失败");
			  }
			  $('#editModal').modal('hide');
			      refresh();
		  }
		});
	}
}
	
 
