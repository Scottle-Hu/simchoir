<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
	<head>
		<link rel="icon" href="images-back/logo.png" type="image/x-icon"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
		<title>后台管理-君科沃特</title>
		<meta name="keywords" content="君科沃特信管合唱" />
		<meta name="description" content="君科沃特" />
		<link href="css-back/layout.css" rel="stylesheet" type="text/css">
		<link href="css-back/login.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="js-back/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="js-back/js.js"></script>
	</head>
	<style>
		
		.ibar {display: none;}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			//登录请求提交前的验证码检查
			$('.login-btn').click(function(){
				//alert("验证码检查");
				if($('#vericode').val()==''){
					$('.error-msg').text('请输入验证码');
					return flase;
				}
				else if($('#vericode').val().toLowerCase()!=$('.convericode').val().toLowerCase()){
					$('.error-msg').text('验证码错误');
					return flase;
				}else if($('#username').val()==''){
					$('.error-msg').text('用户名不能为空');
					return flase;
				}else if($('#password').val()==''){
					$('.error-msg').text('密码不能为空');
					return flase;
				}else{
					$('.error-msg').text('');
					$('.login-form').submit();
				}
			});
		});
		
	</script>
	<body class="login-bg">
		<div class="main ">
			<!--登录-->
			<div class="login-dom login-max">
				<div class="logo text-center">
					<a href="#">
					<img src="images-back/logo.png" width="180px" height="180px">
					</a>
				</div>
				<div class="login container " id="login">
					<p class="text-big text-center logo-color">
						欢迎您登陆君科沃特后台管理
					</p>
					<p style="color:red;font-style:bold;" class="error-msg text-center margin-small-top logo-color text-small">
						${errorMsg }
					</p>
					<form class="login-form" action="check.html" method="post" autocomplete="off">
						<div class="login-box border text-small" id="box" style="height:130px;">
							<div class="name border-bottom">
								<input type="text" placeholder="管理员账号" id="username" name="username" datatype="*" nullmsg="请填写帐号信息">
							</div>
							<hr/>
							<div class="pwd">
								<input type="password" placeholder="密码" datatype="*" id="password" name="password" nullmsg="请填写帐号密码">
							</div>
							<hr/>
							<div class="pwd" >
								<input type="text" placeholder="验证码" id="vericode" name="vericode" nullmas="请输入验证码" style="float:left;width:200px;"/>
								<img onclick="location.href='login.html'" class="veri_code" alt="验证码" src="vericodeImg.html?code=${veriCode }" style="width:100px;height:40px;margin-top:2px;"/>
							</div>
						</div>
						<input type="hidden" class="convericode" value="${veriCode }"/>
						<input type="button" class="btn text-center login-btn" value="立即登录">
					</form>
					<div class="forget">
						<a href="javascript:return false;" class="forget-pwd text-small fl">君科沃特</a><a href="javascript:return false;" class="forget-new text-small fr" id="forget-new">信管合唱团</a>
					</div>
				</div>
			</div>

			<div class="footer text-center text-small ie">
				Copyright&copy; 2017 武汉大学信管合唱团 版权所有
			</div>
			<div class="popupDom">
				<div class="popup text-default">
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js-back/Validform_v5.3.2_min.js"></script>
	<script type="text/javascript">
		function popup_msg(msg) {
			$(".popup").html("" + msg + "");
			$(".popupDom").animate({
				"top": "0px"
			}, 400);
			setTimeout(function() {
				$(".popupDom").animate({
					"top": "-40px"
				}, 400);
			}, 2000);
		}

		/*动画（注册）*/
		$(document).ready(function(e) {
			// $("input[name=username]").focus();
			// $('.login-form').Validform({
			// 	ajaxPost: true,
			// 	tiptype: function(msg) {
			// 		if (msg) popup_msg('' + msg + '');
			// 	},
			// 	callback: function(ret) {
			// 		popup_msg('' + ret.info + '');
			// 		if (ret.status == 1) {
			// 			if (ret.uc_user_synlogin) {
			// 				$("body").append(ret.uc_user_synlogin);
			// 			}
			// 			setTimeout("window.location='" + ret.url + "'", 2000);
			// 		}
			// 	}
			// })

		});
	</script>

</html>