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
<title>指挥特辑-君科沃特</title>
<meta charset="utf-8">
<link rel="icon" href="images/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->

</head>
<body>
	<div class="back">
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
								<li><a href="choir.html" class="current" style="font-size:15px;">合唱团</a>
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
								<li><a href="announcement.html"
									style="font-size:15px;">公告</a>
								</li>
								<li><a href="contact.html" style="font-size:15px;">联系我们</a>
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
							当前位置：<a href="home.html">首页</a>-<a href="choir.html">合唱团</a>-<a
								href="#">指挥特辑</a><br />
							<br />
							<br />
							<div class="container_16">
								<center><h2>指挥特辑</h2></center>
									<div class="container" style="padding-left:20px;">
										${conductor }
									</div>
									<br />
							
								<div class="tail2">

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
	</div>
</body>
</html>
