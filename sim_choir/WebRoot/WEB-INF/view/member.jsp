<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="cn">
<head>
<title>现任成员-君科沃特</title>
<meta charset="utf-8">
<link rel="icon" href="images/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->
<style type="text/css">
/* .img2:hover{
  		border:black solid 1px;
  	} */
.img2 {
	height: 280px;
	width: 200px;
}

.disable {
	opacity: 0.3;
}
/*大图原图悬浮层的样式*/
.big_pic {
	position: fixed;
	top: 100px;
	left: 470px;
	background-color: gray;
	padding: 10px;
}

.pic2 {
	height: 450px;
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		$('.big_pic').hide();
		//点击缩略图显示大图
		$('.img2').click(function(e) {
			var src = $(e.target).attr('src');
			$('.pic2').attr('src', src);
			$('.big_pic').show();
			$('.back').addClass('disable');
		});
		//点击大图恢复
		$('.big_pic').click(function() {
			$('.big_pic').hide();
			$('.back').removeClass('disable');
		});
	});
</script>
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
								<li><a href="choir.html" class="current"
									style="font-size:15px;">合唱团</a>
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
							<!-- <h2><a href="#">现任成员</a></h2> -->
							当前位置：<a href="home.html">首页</a>-<a href="choir.html">合唱团</a>-<a
								href="#">现任成员</a><br />
							<br />
							<br />
							<div class="container_16">
								<div class="tail2">
									<div class="container">
										<c:forEach items="${memberList }" var="member">
											<div class="grid_5 alpha">
												<img title="点击可以浏览大图" style="height:320px;width:230px;"
													src="imageIO/memberImage.html?memberId=${member.id }"
													class="img-indent img2" alt="照片太帅，无法显示" /><br>
												${member.duty } , <strong class="txt">${member.name
													}</strong><br> 声部：
												<c:if test="${member.part.equals(\"S\") }">女高声部</c:if>
												<c:if test="${member.part.equals(\"A\") }">女低声部</c:if>
												<c:if test="${member.part.equals(\"T\") }">男高声部</c:if>
												<c:if test="${member.part.equals(\"B\") }">男低声部</c:if>
												<br>班级：${member.grade }级${member.major }<br />
												<br />
												<br />
											</div>
										</c:forEach>
									</div>
									（此页面排名不分先后） <br />
									<br />
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
	<div class="big_pic">
		<font color="white" size="5">点击图片关闭大图浏览</font><br />
		<br /> <img alt="无法查看原图" src="images/notfound.png" class="pic2">
	</div>
</body>
</html>
