<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="cn">
<head>
<title>联系我们-君科沃特</title>
<meta charset="utf-8">
<link rel="icon" href="images/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->

</head>
<script type="text/javascript">
	function addMessage(){
		var name=document.getElementById('name').value;
		var email=document.getElementById('email').value;
		var phone=document.getElementById('phone').value;
		var message=document.getElementById('message').value;
		if((name==""||name=="Name:") && (email==""||email=="E-mail:")&&(phone==""||phone=="Phone:")){
			alert("请至少填写一种联系方式！");
			return false;
		}
		if(message=="" || message=="Message:"){
			alert("发送的消息不能为空！");
			return false;
		}
		alert("发送成功！");
		document.getElementById('form').submit();
	}
</script>
<body>
	<div class="top1">
		<header>
			<div class="main">
				<iframe width="280" scrolling="no" height="25" frameborder="0"
					allowtransparency="true" style="margin-top:10px;"
					src="http://i.tianqi.com/index.php?c=code&id=34&icon=1&num=3">
				</iframe>
				<h1>
					<a href="home.html">君 科 沃 特 ♪.</a>
				</h1>
				<form action="" id="Search">
					<div class="indent">
						<div class="rowElem1">
							<a href="#" onClick="document.getElementById('Search').submit()"
								class=" fright alignMiddle"><img alt=""
								src="images/button.gif" />
							</a><input type="text" class="input" value="Quick Search..."
								onBlur="if(this.value=='') this.value='Quick Search...'"
								onFocus="if(this.value =='Quick Search...' ) this.value=''" />
						</div>
					</div>
				</form>
				<div class="inside">
					<nav>
						<ul class="sf-menu">
							<li><a href="home.html" style="font-size:15px;">首页</a>
							</li>
							<li><a href="choir.html" style="font-size:15px;">合唱团</a>
								<ul>
									<li><a href="introduction.html">简介</a>
									</li>
									<li><a href="history.html">发展历史</a>
									</li>
									<li><a href="member.html">现任成员</a>
									</li>
									<li><a href="conductor.html">指挥特辑</a>
									</li>
								</ul></li>
							<li><a href="news.html" style="font-size:15px;">最新动态</a>
							</li>
							<li><a href="song.html" style="font-size:15px;">我们的歌</a>
							</li>
							<li><a href="picture.html" style="font-size:15px;">图片</a>
							</li>
							<li><a href="announcement.html" style="font-size:15px;">公告</a>
							</li>
							<li><a href="contact.html" style="font-size:15px;"
								class="current">联系我们</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
	<div class="bg_cont1">
		<div class="bg_cont">
			<section id="content">
				<div class="main">
					<div class="inside">
						<div class="container_16">
							<div class="container">
								<div class="grid_5 alpha">
									<h2>欢迎关注</h2>

									<div width="217" height="192">
										<img width="180" src="imageIO/contactImage.html">
									</div>
									<div class="indent5">
										<strong class="txt5">合唱团联系方式.</strong><br> 武汉大学,信息管理学院<br>
										排练教室: ${contact.room }.
										<p class="block-contact">
											<span>${contact.tel1 }</span>联系电话1:<br> <span>${contact.tel2 }</span>联系电话2:
											<br> <span>${contact.tel3 } </span>联系电话3:<br> <a
												href="#">E-mail: ${contact.email }</a>
										</p>
									</div>
								</div>
								<div class="grid_11 omega">
									<div class="suffix_1">
										<h2>联系我们</h2>
										<form action="addMessage.html" id="form" method="post">
											<fieldset>
												<div class="rowElem">
													<input type="text" value="Name:" name="name" id="name"
														onBlur="if(this.value=='') this.value='Name:'"
														onFocus="if(this.value =='Name:' ) this.value=''" />
												</div>
												<div class="rowElem">
													<input type="Email" value="E-mail:" name="email" id="email"
														onBlur="if(this.value=='') this.value='E-mail:'"
														onFocus="if(this.value =='E-mail:' ) this.value=''" />
												</div>
												<div class="rowElem">
													<input type="text" value="Phone:" name="phone" id="phone"
														onBlur="if(this.value=='') this.value='Phone:'"
														onFocus="if(this.value =='Phone:' ) this.value=''" />
												</div>
												<div class="rowElem2">
													<textarea rows="40" cols="30" name="message" id="message"
														onBlur="if(this.value=='') this.value='Message:'"
														onFocus="if(this.value =='Message:' ) this.value=''">Message:</textarea>
												</div>
												<div class="container">
													<div class="fright">
														<a href="javascript:;" class="link-1"
															onClick="document.getElementById('form').reset()">清空</a>
														<div class="indent-2">
															<a href="javascript:;" class="link-1"
																onclick="addMessage()">发送</a>
														</div>
													</div>
												</div>
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<footer>
		<div class="main">
			<div class="inside">
				<div class="container">
					<div class="fright">
						<!--{%FOOTER_LINK}-->
					</div>
					<div class="fleft">
						<span>君科沃特</span> &copy; 2017 sim choir &bull; <a
							href="back/login.html">back</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>
