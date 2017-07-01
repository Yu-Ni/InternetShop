/**
 * 
 */
function addModal(){ 
  	$.ajax({
		data:'',
		url:'ShopController/getShopInfo.do',
		success:function(result){
			var obj=JSON.parse(result);
			if(obj==null){
				$('#addModal').modal('show');
			}else{
				showMessage("店铺已注册，无需再注册");
				
			}
		}
	});  
	
	
}
/* 新增方法 */
function add(){ 
	var name = $('#shopkkname').val(); 
	if (!name && typeof(name)!="undefined" && name=='') 
	{ 
		alert("店铺名不能为空！"); 
	}
	else {
		var parame = {};
		parame.sellerId = $('#sellerId').val();
		parame.shopname = $('#shopkkname').val();
		console.log(parame);
		$.ajax({
		  data:parame,
		  url:'ShopController/addShop.do',		
		  success:function(o){
			  if(o<=0){
				  alert("新增失败");
			  }else
			  $('#addModal').modal('hide');
		  }
		});
	}
}
function ShopInfoList(){
	var ui = document.getElementById("StoreIndex");
	ui.style.display="none";
	$.ajax({
		data:'',
		url:'ShopController/getShopInfo.do',
		success:function(result){
			var obj=JSON.parse(result);
			$("#shopid").val(obj.shopid);
			$("#sellerId").val(obj.sellerId);
			$("#shopname").val(obj.shopname);
			$("#shopage").val(obj.shopage);
			var form = document.getElementById("StoreForm");
			form.style.display="block";
		}
	});
	
}

function showMessage(message){
	BootstrapDialog.show({
	 	title:"提示",
    	message: message,
    	size:BootstrapDialog.SIZE_SMALL,
    	type: BootstrapDialog.TYPE_WARNING, 
	 });
}