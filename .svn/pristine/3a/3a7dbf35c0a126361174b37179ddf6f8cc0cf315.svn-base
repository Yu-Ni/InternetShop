$(function() {
	initOrder();
});

function initOrder(){
	
	$.ajax({ 
		url : '../../../orderController/getOrderList.do',
		type : 'get',
		dataType : 'json',
		success : function(msg) { 
			 console.log(msg); 
			 var  obj = {"list":msg}; 
			 console.log(obj);
			 //使用baidu.template命名空间
			 var bt=baidu.template; 
			 var html=bt('tpl',obj); 
			 //渲染
			 document.getElementById('order_table').innerHTML=html;
		}
	});
}

function receive(t){
	var orderdetailid = t.parentNode.firstElementChild.innerText;
 
	var pa = {
			orderdetailid: orderdetailid,
	};
	$.ajax({
		url:'../../../orderController/received.do',
		data:pa,
		success:function(result){
			if(result<=0){
				alert("收货失败");
			}else{
				alert("收货成功");
				initOrder();
			}
		}
		
	}); 
	
}
function deleteorder(t){ 

	var orderid = t.parentNode.firstElementChild.innerText;
	var pa = {
			orderId: orderid
	}; 
	$.ajax({
	  url:'../../../orderController/deleteOrder.do',
	  data:pa,
	  success:function(o){
		  if(o<=0){
			  alert("删除失败");
		  }else{
			  initOrder(); 
		  }
		   
	  }
	});
}
function search(){
	var searchinfo = $('#searchinfo').val();
	
	var p = {
			searchinfo:searchinfo
	}
	$.ajax({ 
		url : '../../../orderController/getOrderListByCondition.do',
		type : 'get',
		dataType : 'json',
		data:p,
		success : function(msg) { 
			 console.log(msg); 
			 var  obj = {"list":msg}; 
			 console.log(obj);
			 //使用baidu.template命名空间
			 var bt=baidu.template; 
			 var html=bt('tpl',obj); 
			 //渲染
			 document.getElementById('order_table').innerHTML=html;
		}
	});
}