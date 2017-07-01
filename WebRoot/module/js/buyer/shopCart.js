/**
 * 
 */
$(function() {
	initCart();
});

function initCart(){
	var param = {
			goodType:"0",
			searchContent:""
	};
	$.ajax({
		url : '../../../cartManageController/getCartList.do',
		data:param,
		type : 'get',
		dataType : 'json',
		success : function(msg) { 
			 var  obj = {"list":msg}; 
			 console.log(obj);
			 var bt=baidu.template; 
			 var html=bt('tpl',obj); 
			 document.getElementById('cart_table').innerHTML=html;
		}
	});
	
	document.getElementById("sum_money").innerHTML = "￥"+0.00;
	document.getElementById("sum_money2").innerHTML = "￥"+0.00;
	document.getElementById("sum_amount").innerHTML = "0";
}


function search(){
	var goodType = document.getElementById("goodType").value;
	console.log(goodType);
	var searchContent = document.getElementById("searchContent").value;
	console.log(searchContent);
	var param = {
			goodType:goodType,
			searchContent:searchContent
	};
	
	$.ajax({
		url : '../../../cartManageController/getCartList.do',
		data:param,
		type : 'get',
		dataType : 'json',
		success : function(msg) { 
			 var  obj = {"list":msg}; 
			 var bt=baidu.template; 
			 var html=bt('tpl',obj); 
			 document.getElementById('cart_table').innerHTML=html;
		}
	});
	
}

function checkbox_click(){
	var obj=document.getElementsByName("check_shop");
	var purchase_amountType = "";
	for(var i=0; i<obj.length; i++){ 
		if(obj[i].checked){
			purchase_amountType = obj[i].value;
		}
	} 
	
	console.log(purchase_amountType);
	var str = new Array();
	str = purchase_amountType.split(",")
	var purchase=str[0];
	var amountType=str[1];
	document.getElementById("sum_money").innerHTML = "￥"+purchase;
	document.getElementById("sum_money2").innerHTML = "￥"+purchase;
	document.getElementById("sum_amount").innerHTML = amountType;
}

function purcharse_good(that){
	
	var cartid = that.parentNode.firstElementChild.innerText;
	var param = {
			cartid:cartid
	}
	$.ajax({
		data:param,
		url : '../../../cartManageController/addOrderByCart.do',
		type : 'get',
		dataType : 'json',
		success : function(msg) { 
			 if(msg[0].result == 'true'){
				 showMessage("购买成功！");
				 initCart();
			 }else{
				 showMessage("购买失败！");
			 }
		}
	});
}


function delete_good(that){
	var cartid = that.parentNode.firstElementChild.innerText;
	var param = {
			cartid:cartid
	}
	$.ajax({
		data:param,
		url : '../../../cartManageController/deleteCart.do',
		type : 'get',
		dataType : 'json',
		success : function(msg) { 
			 if(msg[0].result == 'true'){
				 showMessage("删除成功！");
				 initCart();
			 }else{
				 showMessage("删除失败！");
			 }
		}
	});
}

function purcharse_good_shop(){
	var purchase_amountType = "";
	var obj=document.getElementsByName("check_shop");
	for(var i=0; i<obj.length; i++){ 
		if(obj[i].checked){
			purchase_amountType = obj[i].value;
		}
	} 
	
	console.log(purchase_amountType);
	str = purchase_amountType.split(",")
	var shopid=str[2];
	var param = {
			shopid:shopid
	}
	$.ajax({
		data:param,
		url : '../../../cartManageController/addOrderByCartShop.do',
		type : 'get',
		dataType : 'json',
		success : function(msg) { 
			 if(msg[0].result == 'true'){
				 showMessage("购买成功！");
				 initCart();
			 }else{
				 showMessage("购买失败！");
			 }
		}
	});
}

function showMessage(message){
	BootstrapDialog.show({
	 	title:"提示",
    	message: message
	 });
}

