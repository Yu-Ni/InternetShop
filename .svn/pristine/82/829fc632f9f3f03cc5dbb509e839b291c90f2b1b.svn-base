$(function() {
	IntiNotice();
	initTab();
	initNavTab();
	
	showAllGood();
});

function IntiNotice(){
	$('#tbNotice').bootstrapTable({
		striped: false,// 隔行变色效果
		pagination: false,//在表格底部显示分页条
		pageSize: 10,//页面数据条数
		pageNumber:1,//首页页码
		pageList: [10, 15, 20, 30,50,100],//设置可供选择的页面数据条数
		clickToSelect:true,//设置true 将在点击行时，自动选择rediobox 和 checkbox
		cache: false,//禁用 AJAX 数据缓存
		sortName:'noticetime',//定义排序列
		sortOrder:'asc',//定义排序方式		
		sidePagination:'client',//设置在哪里进行分页
		contentType:'application/json',//发送到服务器的数据编码类型SS
		dataType:'json',//服务器返回的数据类型
    	url:'buyerController/selectNotice.do',//服务器数据的加载地址8
		selectItemName:'',//radio or checkbox 的字段名
		singleSelect : true,
		columns:[{
			field:'title',//返回值名称
			title:'公告',//列名
			align:'center',//水平居中显示
			valign:'middle',//垂直居中显示
		}],
		onClickRow: function (item, $element) {
			$("#title").val(item.title);
			$("#username").val(item.username);
			$("#reply").val(item.content);
			$('#NoticeShow').modal('show');
		} 
	});
}

function initNavTab(){
	$.ajax({
		url:'commodityManagerController/getAllGoodType.do',
	    success:function(list){
		  var obj = eval("("+list+")");         
		  var typeid = "";
		  var typename = "";
		  var nav = document.getElementById("nav");
		  var ul = document.createElement('ul');
		  for(var i=0;i<obj.length;i++){
			 typeid = obj[i].typeid
			 typename = obj[i].typename
			 var li = document.createElement('li');
			 var a = document.createElement('a');
			 a.setAttribute("href", "./module/jsp/buyer/BuyerIndex.jsp#div"+typeid);
			 a.innerHTML = typename;
			 li.appendChild(a);
			 ul.appendChild(li);
			 nav.appendChild(ul);
		 }
	  }
	});
}

function initTab(){
	$.ajax({
		url:'commodityManagerController/getAllGoodType.do',
	    success:function(list){
		  var obj = eval("("+list+")");         
		  var typeid = "";
		  var typename = "";
		  var mainTab = document.getElementById("mainTab");
		  var ul = document.createElement('ul');
		  for(var i=0;i<obj.length;i++){
			 typeid = obj[i].typeid
			 typename = obj[i].typename
			 
			 var div = document.createElement('div');
			 var innerdiv = document.createElement('div');
			 var h3 = document.createElement('h3');
			 div.classList.add("panel");
			 h3.classList.add("panel-title");
			 div.id="div"+typeid;
			 h3.innerHTML = typename;
			 innerdiv.appendChild(h3);
			 div.appendChild(innerdiv);
			 mainTab.appendChild(div);
		 }
	  }
	});
}

function showAllGood(){
	var searInput = document.getElementById("SearchWhat").value;
	var param = {
			searInput:searInput
	}
	$.ajax({
		url : 'sellManageController/getProductByType.do',
		data:param,
		success : function(list) {
			var obj = eval("("+list+")");    
			for(var i=0;i<obj.length;i++){
				var typeId = obj[i].typeId;
				
				var div = document.getElementById("div"+typeId);
				var innerdiv = document.createElement('div');
				innerdiv.classList.add("panel-body");
				
				var product = obj[i].product;
				
				var screenWidth = screen.width;
				var divWidth = screenWidth*0.8-20;
				var imgDivWidth = (divWidth-20*5)/5;
				
				for(var j=0;j<product.length;j++){
					var productdiv = document.createElement('div');
					var imgdiv = document.createElement('div');
					var descridiv = document.createElement('div');
					var priceidiv = document.createElement('div');
					var imgA = document.createElement('a');
					var imgContent = document.createElement("img");
					
					imgdiv.classList.add("panel-body-img");
					descridiv.classList.add("panel-body-descri");
					priceidiv.classList.add("panel-body-price");
					productdiv.classList.add("panel-body-product");
					
					productdiv.style.width = imgDivWidth+"px";
					imgContent.src = "/InternetShop/upload/"+product[j].img;
					imgContent.height = imgDivWidth;
					imgContent.width = imgDivWidth;
					imgA.setAttribute("href", "./module/jsp/buyer/Detailproduct.html?productId="+product[j].productId);
					imgA.appendChild(imgContent);
					imgdiv.appendChild(imgA);
					
					descridiv.innerHTML = product[j].productName;
					priceidiv.innerHTML = "￥"+product[j].price;
					
					productdiv.appendChild(imgdiv);
					productdiv.appendChild(descridiv);
					productdiv.appendChild(priceidiv);
					div.appendChild(productdiv);
				}
				
				
			}
		}
	});
}

function search(){
	var searInput = document.getElementById("SearchWhat").value;
	var param = {
			searInput:searInput
	}
	
	var mainTab = document.getElementById("mainTab");
	mainTab.innerHTML="";
	initTab();
	
	$.ajax({
		url : 'sellManageController/getProductByType.do',
		data:param,
		success : function(list) {
		
			var obj = eval("("+list+")");    
			for(var i=0;i<obj.length;i++){
				var typeId = obj[i].typeId;
				console.log("div"+typeId);
				console.log(mainTab);
				var div = document.getElementById("div"+typeId);
				var div2 = document.getElementById("div2");
				console.log(div);
				console.log(div2);
				var innerdiv = document.createElement('div');
				innerdiv.classList.add("panel-body");
				
				var product = obj[i].product;
				
				var screenWidth = screen.width;
				var divWidth = screenWidth*0.8-20;
				var imgDivWidth = (divWidth-20*5)/5;
				
				for(var j=0;j<product.length;j++){
					
					var productdiv = document.createElement('div');
					var imgdiv = document.createElement('div');
					var descridiv = document.createElement('div');
					var priceidiv = document.createElement('div');
					var imgA = document.createElement('a');
					var imgContent = document.createElement("img");
					
					imgdiv.classList.add("panel-body-img");
					descridiv.classList.add("panel-body-descri");
					priceidiv.classList.add("panel-body-price");
					productdiv.classList.add("panel-body-product");
					
					productdiv.style.width = imgDivWidth+"px";
					imgContent.src = "/InternetShop/upload/"+product[j].img;
					imgContent.height = imgDivWidth;
					imgContent.width = imgDivWidth;
					imgA.setAttribute("href", "./module/jsp/buyer/Detailproduct.html?productId="+product[j].productId);
					imgA.appendChild(imgContent);
					imgdiv.appendChild(imgA);
					
					descridiv.innerHTML = product[j].productName;
					priceidiv.innerHTML = "￥"+product[j].price;
					
					productdiv.appendChild(imgdiv);
					productdiv.appendChild(descridiv);
					productdiv.appendChild(priceidiv);
					div.appendChild(productdiv);
				}
				
				
			}
		}
	});
}

