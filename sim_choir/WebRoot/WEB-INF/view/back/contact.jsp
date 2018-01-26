<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 设置联系方式 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>设置联系方式-君科沃特</title>
		<link rel="icon" href="images-back/logo.png" type="image/x-icon"/>
		
		<link rel="stylesheet" type="text/css" href="css-back/identify.css" />
		<link rel="stylesheet" type="text/css" href="css-back/layout.css" />
		<link rel="stylesheet" type="text/css" href="css-back/account.css" />
		<link rel="stylesheet" type="text/css" href="css-back/style.css" />
		<link rel="stylesheet" type="text/css" href="css-back/control_index.css" />
		<script type="text/javascript" src="js-back/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="js-back/layer/layer.js"></script>
		<script type="text/javascript" src="js-back/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="js-back/select.js"></script>
		<script type="text/javascript" src="js-back/haidao.validate.js"></script>
		<style type="text/css">
		  	.form{
		  		margin-top:20px;
		  		margin-left:20px;
		  		font-size:18px;
		  	}
		  	.text{
		  		border:1px solid gray;
		  		width:200px;
		  		height:25px;
		  		border-radius:8px;
		  		-moz-border-radius:8px;
		  		-webkit-border-radius:8px;
		  	}
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
						
		});
	</script>
	<body>
		<div class="back">
		<div class="view-topbar">
			<div class="topbar-console">
				<div class="tobar-head fl">
					<a href="javascript:void(0);" class="topbar-logo fl">
					<span><img src="images-back/logo.png" width="20" height="20"/></span>
					</a>
					<a href="main.html" class="topbar-home-link topbar-btn text-center fl"><span>管理控制台</span></a>
				</div>
			</div>
			<div class="topbar-info">
				<ul class="fr">
					<a href="message.html" class="dropdown-toggle">
					<li class="fl dropdown topbar-notice topbar-btn">新消息
					
					<span class="icon-notice"></span>
					<span class="topbar-num have">${numOfWait }</span>
					<!--have表示有消息，没有消息去掉have-->
					</li>
					</a>
					<li class="fl topbar-info-item">
					<div class="dropdown">
						<a href="#" class="topbar-btn">
						<span class="fl text-normal">设置中心</span>
						<span class="icon-arrow-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">账户管理</a></li>
							<li><a href="contact.html">联系方式设置</a></li>
						</ul>
					</div>
					</li>
					<li class="fl topbar-info-item">
					<div class="dropdown">
						<a href="javascript:return false;" class="topbar-btn">
						<span class="fl text-normal">${admin.username }</span>
						<span class="icon-arrow-down"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="javascript:quit();">退出</a></li>
						</ul>
					</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="view-body" style="background-color:white;">
			<div class="view-sidebar">
				<div class="sidebar-content">
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">用户管理</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="message.html">
									<b class="sidebar-icon"><img src="images-back/icon_message.png" width="16" height="16" /></b>
									<span class="text-normal">消息中心</span>
								</a>
							</li>
							<li>
								<a href="remark.html">
									<b class="sidebar-icon"><img src="images-back/icon_message.png" width="16" height="16" /></b>
									<span class="text-normal">评论管理</span>
								</a>
							</li>
							
						</ul>
					</div>
					<div class="sidebar-nav">
						<div class="sidebar-title">
							<a href="#">
								<span class="icon"><b class="fl icon-arrow-down"></b></span>
								<span class="text-normal">内容管理</span>
							</a>
						</div>
						<ul class="sidebar-trans">
							<li>
								<a href="picture.html">
									<b class="sidebar-icon"><img src="images-back/icon_cost.png" width="16" height="16" /></b>
									<span class="text-normal">图片管理</span>
								</a>
							</li>
							<li>
								<a href="member.html">
									<b class="sidebar-icon"><img src="images-back/icon_authentication.png" width="16" height="16" /></b>
									<span class="text-normal">成员管理</span>
								</a>
							</li>
							<li>
								<a href="news.html">
									<b class="sidebar-icon"><img src="images-back/icon_news.png" width="16" height="16" /></b>
									<span class="text-normal">新闻管理</span>
								</a>
							</li>
							<li>
								<a href="notice.html">
									<b class="sidebar-icon"><img src="images-back/icon_gold.png" width="16" height="16" /></b>
									<span class="text-normal">公告管理</span>
								</a>
							</li>
							<li>
								<a href="song.html">
									<b class="sidebar-icon"><img src="images-back/icon_order.png" width="16" height="16" /></b>
									<span class="text-normal">歌曲管理</span>
								</a>
							</li>
							<li>
								<a href="intro-his.html">
									<b class="sidebar-icon"><img src="images-back/icon_order.png" width="16" height="16" /></b>
									<span class="text-normal">简介历史</span>
								</a>
							</li>
							<li>
								<a href="conductor.html">
									<b class="sidebar-icon"><img src="images-back/icon_order.png" width="16" height="16" /></b>
									<span class="text-normal">指挥特辑</span>
								</a>
							</li>
							
						</ul>
					</div>
				</div>
			</div>
			<div class="view-product">
				<div class="info-center">
		            <div class="manage-head">
		                <h6 class="padding-left manage-head-con">设置联系方式</h6>
		            </div>
		            <form  action="updateContact.html" method="post" class="form" id="form-id" enctype="multipart/form-data">
		            	<label for="room" style="color:gray;">排练教室</label><br/>
		            	<label for="room">武汉大学，信息管理学院，</label>
		            	<input type="text" name="room" class="text" id="room" value="${contact.room }"
		            	style="width:100px;"/>
		            	<label>教室。</label>
		            	<br/><br/>
		            	<label for="tel1" style="color:gray;">联系电话1</label>
		            	<input type="text" name="tel1" class="text" id="tel1" value="${contact.tel1 }"/>
		            	<br/><br/>
		            	<label for="tel2" style="color:gray;">联系电话2</label>
		            	<input type="text" name="tel2" class="text" id="tel2" value="${contact.tel2 }"/>
		            	<br/><br/>
		            	<label for="tel3" style="color:gray;">联系电话3</label>
		            	<input type="text" name="tel3" class="text" id="tel3" value="${contact.tel3 }"/>
		            	<br/><br/>
		            	<label for="email" style="color:gray;">Email邮箱</label>
		            	<input type="text" name="email" class="text" id="email" value="${contact.email }" style="width:250px;"/>
		            	<br/><br/>
		            	<label>微信二维码图片</label><br/>
		            	<img src="imageIO/contactImage.html" id="weixin-pic" style="width:200px;height:200px;"/>
		            	<button type="button" onclick="javascript:document.getElementById('weixin-file').click();" style="margin-left:50px;">更换二维码图片</button>
		            	<input type="file" value="" name="weixin" id="weixin-file" onchange="showWeixin()" style="display:none;"/>
		            	<br/><br/><br/>
		            	<input type="button" value="返回" onclick="location.href='main.html'" style="width:100px;height:30px;background-color:red;color:white;"/>
		            	<input type="button" value="确认更改" onclick="confirmSubmit()" style="width:100px;height:30px;background-color:blue;color:white;margin-left:50px;"/>
		            </form>
		        </div>
			</div>
		</div>
		</div>
		
		
		
		<script>
			//退出登录函数
			function quit(){
				<%
					//清除错误提示
					request.getSession().removeAttribute("errorMsg");
				%>
				//跳转
				location.href="login.html";
			}
			
			function showWeixin(){
				var imgFile = document.getElementById('weixin-file').files[0];
				var fr = new FileReader();
				fr.onload=function(){
					document.getElementById('weixin-pic').src=fr.result;
				};
				fr.readAsDataURL(imgFile);
			}
			
			function confirmSubmit(){
				var room = document.getElementById('room').value;
				var tel1 = document.getElementById('tel1').value;
				var tel2 = document.getElementById('tel2').value;
				var tel3 = document.getElementById('tel3').value;
				var email = document.getElementById('email').value;
				
				var file = document.getElementById('weixin-file').value;
				if(room=="" || tel1=="" || tel2=="" || tel3=="" || email==""){
					alert("有未完成的表单，请完成后再提交！");
					return false;
				}
				alert('修改成功！');
				document.getElementById('form-id').submit();
				
			}
			
			$(".sidebar-title").live('click', function() {
				if ($(this).parent(".sidebar-nav").hasClass("sidebar-nav-fold")) {
					$(this).next().slideDown(200);
					$(this).parent(".sidebar-nav").removeClass("sidebar-nav-fold");
				} else {
					$(this).next().slideUp(200);
					$(this).parent(".sidebar-nav").addClass("sidebar-nav-fold");
				}
			});
		</script>
	</body>

</html>