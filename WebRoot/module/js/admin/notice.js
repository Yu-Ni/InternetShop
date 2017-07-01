
function queryParams(pageRequest) {
	pageRequest.condition = $("#searchT").val();
	return pageRequest;
}

$(function() {
	loaddata();
});
$("#search").click(function() {

	$('#table').bootstrapTable('refresh', queryParams);
});
function loaddata() {
	$('#table').bootstrapTable({
		// 定义表格的高度
		height : 450,
		striped : true, // 隔行变色效果
		pagination : true, // 在表格底部显示分页条
		pageSize : 10, // 页面数据条数
		pageNumber : 1, // 首页页码
		pageList : [ 10, 15, 20, 30, 50, 100 ], // 设置可供选择的页面数据条数
		clickToSelect : true, // 设置true 将在点击行时，自动选择rediobox 和 checkbox
		cache : false, // 禁用 AJAX 数据缓存
		sortName : 'ID', // 定义排序列
		sortOrder : 'asc', // 定义排序方式
		sidePagination : 'client', // 设置在哪里进行分页
		contentType : 'application/json', // 发送到服务器的数据编码类型SS
		dataType : 'json', // 服务器返回的数据类型
		queryParams : queryParams, // 请求服务器数据时，你可以通过重写参数的方式添加一些额外的参数
		url : 'noticeController/getNoticeList.do', // 服务器数据的加载地址8
		selectItemName : '', // radio or checkbox 的字段名
		singleSelect : true,
		columns : [ {
			radio:true,
			width : '30' // 宽度
		}, {
			field : 'noticeid', // 返回值名称
			title : '公告ID', // 列名
			align : 'center', // 水平居中显示
			valign : 'middle', // 垂直居中显示
			width : '20', // 宽度
			visible : false
		}, {
			field : 'title', // 返回值名称
			title : '话题', // 列名
			align : 'center', // 水平居中显示
			valign : 'middle', // 垂直居中显示
			width : '2', // 宽度
		// visible:false
		}, {
			field : 'username', // 返回值名称
			title : '发表人姓名', // 列名
			align : 'center', // 水平居中显示
			valign : 'middle', // 垂直居中显示
			width : '50', // 宽度
		// visible:false
		}, {
			field : 'theme', // 返回值名称
			title : '主题', // 列名
			align : 'center', // 水平居中显示
			valign : 'middle', // 垂直居中显示
			width : '1' // 宽度
		}, {
			field : 'content', // 返回值名称
			title : '公告内容', // 列名
			align : 'center', // 水平居中显示
			valign : 'middle', // 垂直居中显示
			width : '2' // 宽度
		}, {
			field : 'noticetime', // 返回值名称
			title : '公告日期', // 列名
			align : 'center', // 水平居中显示
			valign : 'middle', // 垂直居中显示
			width : '20' // 宽度
		} ]
	// 列配置项,详情请查看 列参数 表格
	/* 事件 */
	});
}
/* 刷新方法 */
function refresh() {
	$('#table').bootstrapTable('refresh', null);
}

/* 删除方法 */
function delData() {
	var data = $('#table').bootstrapTable('getSelections');

	if (data.length == 0) {
		alert("请至少选中一条数据");
		return;
	}

	var ids = "";
	for (var i = 0; i < data.length; i++) {
		ids += data[i].noticeid + ",";
	}

	var ajaxParameter = {
		noticeids : ids.substring(0, (ids.length - 1))
	};
	var r = confirm("确认删除？");
	if (r == true) {
		$.ajax({
			url : 'noticeController/delNotice.do',
			data : ajaxParameter,
			success : function(o) {
				if (o <= 0) {
					alert("删除失败");
				}				
					refresh();
			}
		});
		alert("删除成功啦");
	} else {
		alert("不用删除啦");
	}
}

function addModal() {
	$('#addModal').modal('show');
}
/* 新增方法 */
function add() {
	var title = $('#title').val();
	if (!title && typeof (title) != "undefined" && title == '') {
		alert("话题不能为空！");
	} else {
		var parame = {};
		parame.title = $('#title').val();
		parame.username = $('#user').val();
		parame.theme = $('#theme').val();
		parame.content = $('#content').val();
		parame.noticetime = $('#noticetime').val();
		$.ajax({
			url : 'noticeController/addNotice.do',
			data : parame,
			success : function(o) {
				if (o <= 0) {
					alert("发布失败");
				}
				$('#addModal').modal('hide');
				refresh();
			}
		});
	}

}

/* 弹出查看弹框方法 */
function showModal() {
	var data = $('#table').bootstrapTable('getSelections');

	if (data.length == 0 || data.length > 1) {
		alert("请选中一条数据");
		return;
	}

	$('#showtitle').val(data[0].title);
	$('#showusername').val(data[0].username);
	$('#showtheme').val(data[0].theme);
	$('#showreply').val(data[0].content);
	$('#shownoticetime').val(data[0].noticetime);
	$('#showModal').modal('show');
}

/* 弹出修改弹框方法 */
function editModal() {
	var data = $('#table').bootstrapTable('getSelections');

	if (data.length == 0 || data.length > 1) {
		alert("请选中一条数据");
		return;
	}
	$('#edittitle').val(data[0].title);
	$('#editusername').val(data[0].username);
	$('#edittheme').val(data[0].theme);
	$('#editreply').val(data[0].content);
	$('#editnoticetime').val(data[0].noticetime);
	$('#editModal').modal('show');
}

/* 修改方法 */
function edit() {
	var title = $('#edittitle').val();
	if (!title && typeof (title) != "undefined" && title == '') {
		alert("话题不能为空！");
	} else {
		var data = $('#table').bootstrapTable('getSelections');
		var ids = data[0].noticeid;
		var parame = {};
		parame.noticeid = ids;
		parame.title = $('#edittitle').val();
		parame.username = $('#editusername').val();
		parame.theme = $('#edittheme').val();
		parame.content = $('#editreply').val();
		parame.noticetime = $('#editnoticetime').val();
		$.ajax({
			url : 'noticeController/updateNotice.do',
			data : parame,
			success : function(o) {
				if (o <= 0) {
					alert("修改失败");
				}
				$('#editModal').modal('hide');
				refresh();
			}
		});
	}
}