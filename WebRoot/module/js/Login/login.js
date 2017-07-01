

function userLogin(form){
	var username = form.username.value;
	var password = form.password.value;
	var role = form.role.value;
	var queryParams = {
		username:username,
		password:password,
		roleString:role
	}	
	$.ajax({
        url : "loginController/login.do",
        data: queryParams,
        type : "get",
        dataType : "json",
        success : function(result) {
        	if(result[0].result=='fail'){
        		alert("密码或者用户名输入错误，请重新输入");
        		window.location.href="./module/jsp/Login/login.jsp";
        	}else{
        	    window.location.href=result[0].result;
        	    
        	}
            
        }
    });
}

function userRegister(){
	 BootstrapDialog.show({
	     title: '用户注册',
	     message: '请选择你要注册的角色',
	     buttons: [{
	         label: '卖家',
	         action: function(dialog) {
	        	 sellerRegister();
	         }
	     },{
	         label: '买家',
	         action: function(dialog) {
	        	 buyerRegister();
	         }
	     }, {
	         label: '管理员',
	         action: function(dialog) {
	        	 adminRegister();
	         }
	     }]
	 });
}

function sellerRegister(){
	 BootstrapDialog.show({
		title:"卖家注册",
    	message: $('<div></div>').load('./module/jsp/Login/sellerRegister.jsp')
	 });
	 
}

function buyerRegister(){
	 BootstrapDialog.show({
		title:"买家注册",
		message: $('<div></div>').load('./module/jsp/Login/buyerRegister.jsp')
	 });
}

function adminRegister(){
	BootstrapDialog.show({
		title:"管理员注册",
		message: $('<div></div>').load('./module/jsp/Login/adminRegister.jsp')
	});
}

function sellerInfoRegister(form){
	var username = form.username.value;
	var realname = form.realname.value;
	var password = form.password.value;
	var bankNumber = form.bankNumber.value;
	var phoneNumber = form.phoneNumber.value;
	var address = form.address.value;
	var idCard = form.idCard.value;
	
	var queryParams = {
		username:username,
		realname:realname,
		password:password,
		bankNumber:bankNumber,
		phoneNumber:phoneNumber,
		address:address,
		idCard:idCard
	}
	
	$.ajax({
        url : "loginController/sellerRegister.do",
        data: queryParams,
        type : "get",
        dataType : "json",
        success : function(result) {
        	if(result[0].result=='fail'){
        		alert("注册失败!");
        	}else{
        		window.location.href="./module/jsp/Login/login.jsp";
        	}
            
        }
    });
}

function adminInfoRegister(form){
	var username = form.username.value;
	var realname = form.realname.value;
	var password = form.password.value;
	var telphone = form.telphone.value;
	var avatar = form.avatar.value;
	var sex = form.sex.value;
	
	var queryParams = {
			username:username,
			realname:realname,
			password:password,
			telphone:telphone,
			avatar:avatar,
			sex:sex
	}
	
	$.ajax({
		url : "loginController/adminRegister.do",
		data: queryParams,
		type : "get",
		dataType : "json",
		success : function(result) {
			if(result[0].result=='fail'){
				alert("注册失败!");
			}else{
				window.location.href="./module/jsp/Login/login.jsp";
			}
			
		}
	});
}

function cancelRegister(){
	window.location.href="./module/jsp/Login/login.jsp";
}