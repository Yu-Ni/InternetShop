 $(document).ready(function () {
            init(); 
            $("#cart_in").click(function () {
                var id = $("#ProductId").val();
                var number = $("#number").val();
                var userId = $("#userId").val();
                var datapra = "{'ProductId':'" + id + "','UserId':'" + userId + "','Number':'" + number + "'}";
                if (userId == "") {
                    window.location = ("login.aspx");
                } else {
                    $.ajax({
                        url: "cart.aspx/AddToCart",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        data: datapra,//参数，这里是一个json语句
                        success: function (data) {
                            if (data.d == "1") {
                            	showMessage("成功加入购物车！！！");
                            } else {
                            	showMessage("加入失败！！！");
                            }
                        }
                    });
                }

            });
            
        });
 
        function init() {
            var id = getUrlParam('productId');
            $.ajax({ 
            	data:{productId:id},
        		url : '../../../commodityManagerController/getCommodity.do',
        		type : 'get',
        		dataType : 'json',
        		success : function(msg) { 
        			 console.log(msg);
        			 var obj= {"data":msg};
        			 console.log(obj);
        			  var bt=baidu.template; 
        			  var html=bt('tpl',obj); 
        			  
        			  var imgName = obj.data[0].img;
        			  var ul = document.getElementById("slides");
        			  var li = document.createElement("li");
        			  var div = document.createElement("div");
        			  var img = document.createElement("img");
        			  img.src="/InternetShop/upload/"+imgName;
        			  img.width = "400";
        			  img.height = "500";
        			  div.appendChild(img);
        			  li.appendChild(div);
        			  ul.appendChild(li);
        			  
        			  //渲染
        			  document.getElementById('detailDiv').innerHTML=html;
        			 
        		}
        	}); 
            
           
        }
        function getUrlParam(name) {
            //构造一个含有目标参数的正则表达式对象  
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            //匹配目标参数  
            var r = window.location.search.substr(1).match(reg);
            //返回参数值  
            if (r != null) return unescape(r[2]);
            return null;
        }
function buynow(){
	var price = $("#price").html().trim();
	var totolPrice = $("#number").val() * price;
    
    var parama = {}; 
	parama.shopId = $('#shopId').val();
	parama.productId = $('#productId').val();
	parama.number = $('#number').val();
	parama.price = totolPrice; 
	
	$.ajax({
		  url:'../../../orderController/createOrderOne.do',
		  data:parama,
		  success:function(o){
			    if(o==1){
			    	showMessage("购买成功!");
			    } else{
			    	showMessage("购买失败!");
			    }
		  }
		}); 
}
function addtocart(){ 
	var parama = {}; 
 	parama.productId = $('#productId').val();
	parama.number = $('#number').val();
 	
	$.ajax({
		  url:'../../../cartManageController/addToCart.do',
		  data:parama,
		  success:function(o){
			    if(o==1){
			    	showMessage("加入购物车成功!");
			    } else{
			    	showMessage("加入购物车失败!");
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