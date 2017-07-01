$(function() {
	getAllShow();
});
function getAllShow(){
	$.ajax({
		data:'',
		url : 'buyerController/selectAll.do',
		type : 'post',
		dataType : 'json',
		success : function(msg) {
			var obj = msg;
			Show("AllShow", obj);
		}
	});
}
function Show(divId, obj) {
	for (var i = 0; i < obj.length; i++) {
		var div1 = document.getElementById(divId);
		var everyShow = document.createElement("div");
		everyShow.style.float = "left";
		everyShow.style.marginLeft = '40px';
		everyShow.style.marginTop = '30px';
		var imgContent = document.createElement("img");
		var spanPrice = document.createElement("div");
		pricecontent = "<div class='a' style='width:200;height:80;'>price:" + "￥" + obj[i].price+"<br/>"+ '<a href="./module/jsp/buyer/Detailproduct.html?productId='+obj[i].productId+'">'+obj[i].productName +'</a>' +  "</div>";
		spanPrice.innerHTML = pricecontent;
		imgContent.src = obj[i].img;
		imgContent.height = 260;
		imgContent.width = 200;
		everyShow.appendChild(imgContent);
		everyShow.appendChild(spanPrice);
		div1.appendChild(everyShow);
	}
}