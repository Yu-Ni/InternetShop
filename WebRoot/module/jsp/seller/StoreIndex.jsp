<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link type="text/css" rel="stylesheet"
	href="./module/css/seller/register.css" />
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="./module/css/frame/bootstrap-dialog.min.css" />

<script src="./module/js/frame/jquery.js"></script>
<script src="./module/js/frame/jquery.min.js"></script>
<script src="./module/js/frame/bootstrap.js"></script>
<script src="./module/js/frame/bootstrap.min.js"></script>
<script src="./module/js/frame/bootstrap-dialog.min.js"></script>

<style type="text/css">
body {
	background-image: url('./module/img/seller/timg2.jpg') !important;
	background-size:100% 100%;  
}
</style>
</head>


<body>
 	<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
<!-- 	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand">店铺管理</a>


		</div>

	</div> 
	</nav> -->

	<!-- 左侧菜单选项========================================= -->
	<div class="container-fluid">
		<div class="row-fluie">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar" style="margin-top:50px;float:left">
					<!-- 一级菜单 -->
					<br>
					<li class="active"><button type="button" class="btn btn-lg"
							onclick="addModal()">注册店铺</button></li>
					<br>
					<br>
					<li class="active">
						<button type="button" class="btn btn-lg" onclick="ShopInfoList()">店铺资料</button>
					</li>
				</ul>

			</div>
		</div>
	</div>

	<!-- 右侧内容展示==================================================   -->
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"
		id="StoreIndex">
		<h1 class="page-header">
			<i class="fa fa-cog fa-spin"></i>&nbsp;首页<small>&nbsp;&nbsp;&nbsp;欢迎进入店铺管理中心</small>
		</h1>

		<!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
		<div id="content">

			<h4>
				<strong>使用指南：</strong><br> <br> <br>如果您是第一次成为卖家，请进行店铺注册。
				<br> <br>如果您已经注册了店铺，可以在店铺资料中进行查看。

			</h4>

		</div>

	</div>
	<div class="col-sm-9 col-sm-offset-3 col-md-6" style="display: none;float:left;margin-top: -200px"
		id="StoreForm">
		<h3>店铺资料展示</h3>
		<form action="" method="get" style="font-size:20px">
			<p>
				店铺编号: <input type="text" class="form-control" name="shopid"
					id="shopid" readonly="readonly" />
			</p>
			<p>
				卖家编号: <input type="text" class="form-control" name="sellerId"
					id="sellerId" readonly="readonly" />
			</p>
			<p>
				店铺名称: <input type="text" class="form-control" name="shopname"
					id="shopname" readonly="readonly" />
			</p>
			<p>
				店铺铺龄: <input type="text" class="form-control" name="shopage"
					id="shopage" readonly="readonly" />
			</p>
		</form>
	</div>

	<script type="text/javascript">
        
        /*
         * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
         * （实现左侧菜单中的标签点击后变色的效果）
         */
        $(document).ready(function () {
            $('ul.nav > li').click(function (e) {
                //e.preventDefault();    加上这句则导航的<a>标签会失效
                $('ul.nav > li').removeClass('active');
                $(this).addClass('active');
            });
        });
        
        /*
         * 解决ajax返回的页面中含有javascript的办法：
         * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
         */
        function executeScript(html)
        {
            
            var reg = /<script[^>]*>([^\x00]+)$/i;
            //对整段HTML片段按<\/script>拆分
            var htmlBlock = html.split("<\/script>");
            for (var i in htmlBlock) 
            {
                var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
                if (blocks = htmlBlock[i].match(reg)) 
                {
                    //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                    var code = blocks[1].replace(/<!--/, '');
                    try 
                    {
                        eval(code) //执行脚本
                    } 
                    catch (e) 
                    {
                    }
                }
            }
        }
        
        /*
         * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
         * 注意：
         *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
         *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
         *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
        */
        function showAtRight(url) {
            var xmlHttp;
            
            if (window.XMLHttpRequest) {
                // code for IE7+, Firefox, Chrome, Opera, Safari
                xmlHttp=new XMLHttpRequest();    //创建 XMLHttpRequest对象
            }
            else {
                // code for IE6, IE5
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
        
            xmlHttp.onreadystatechange=function() {        
                //onreadystatechange — 当readystate变化时调用后面的方法
                
                if (xmlHttp.readyState == 4) {
                    //xmlHttp.readyState == 4    ——    finished downloading response
                    
                    if (xmlHttp.status == 200) {
                        //xmlHttp.status == 200        ——    服务器反馈正常            
                        
                        document.getElementById("content").innerHTML=xmlHttp.responseText;    //重设页面中id="content"的div里的内容
                        executeScript(xmlHttp.responseText);    //执行从服务器返回的页面内容里包含的JavaScript函数
                    }
                    //错误状态处理
                    else if (xmlHttp.status == 404){
                        alert("出错了☹   （错误代码：404 Not Found），……！"); 
                        /* 对404的处理 */
                        return;
                    }
                    else if (xmlHttp.status == 403) {  
                        alert("出错了☹   （错误代码：403 Forbidden），……"); 
                        /* 对403的处理  */ 
                        return;
                    }
                    else {
                        alert("出错了☹   （错误代码：" + request.status + "），……"); 
                        /* 对出现了其他错误代码所示错误的处理   */
                        return;
                    }   
                } 
                    
              }
            
            //把请求发送到服务器上的指定文件（url指向的文件）进行处理
            xmlHttp.open("GET", url, true);        //true表示异步处理
            xmlHttp.send();
        }        
        </script>
	<!-- 新增弹框 -->
	<div id="addModal" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新增</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-md-5" style="display:none;">
							<h4>卖家ID：</h4>
							<input type="text" id="sellerId" name="sellerId"
								class="form-control" aria-descr ibedby="basic-addon1" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-md-5">
							<h4>店铺名称：</h4>
							<input type="text" id="shopkkname" name="shopname"
								class="form-control" aria-describedby="basic-addon1" />
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="add()">新增</button>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="./module/js/seller/StoreManage.js"></script>

</html>
