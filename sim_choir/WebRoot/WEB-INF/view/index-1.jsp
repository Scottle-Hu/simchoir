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
<title>合唱团-君科沃特</title>
<meta charset="utf-8">
<link rel="icon" href="images/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->

</head>

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
								src="images/button.gif" /> </a><input type="text" class="input"
								value="Quick Search..."
								onBlur="if(this.value=='') this.value='Quick Search...'"
								onFocus="if(this.value =='Quick Search...' ) this.value=''" />
						</div>
					</div>
				</form>
				<div class="inside">
					<nav>
						<ul class="sf-menu">
							<li><a href="home.html" style="font-size:15px;">首页</a></li>
							<li><a href="choir.html" class="current"
								style="font-size:15px;">合唱团</a>
								<ul>
									<li><a href="introduction.html">简介</a></li>
									<li><a href="history.html">发展历史</a></li>
									<li><a href="member.html">现任成员</a></li>
									<li><a href="conductor.html">指挥特辑</a></li>
								</ul>
							</li>
							<li><a href="news.html" style="font-size:15px;">最新动态</a></li>
							<li><a href="song.html" style="font-size:15px;">我们的歌</a></li>
							<li><a href="picture.html" style="font-size:15px;">图片</a></li>
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
						<h2>
							<a href="member.html">现任成员</a>
						</h2>
						<div class="container_16">
							<div class="tail2">
								<div class="container">
									<c:forEach items="${memberList }" var="member">
										<div class="grid_5 alpha">
											<img style="height:320px;width:230px;"
												src="imageIO/memberImage.html?memberId=${member.id }"
												class="img-indent" alt="照片太帅，无法显示" /><br>
											${member.duty } , <strong class="txt">${member.name
												}</strong><br> 声部：
											<c:if test="${member.part.equals(\"S\") }">女高声部</c:if>
											<c:if test="${member.part.equals(\"A\") }">女低声部</c:if>
											<c:if test="${member.part.equals(\"T\") }">男高声部</c:if>
											<c:if test="${member.part.equals(\"B\") }">男低声部</c:if>
											<br>班级：${member.grade }级${member.major }<br>
										</div>
									</c:forEach>
								</div>
								<br /> <br /> <a href="member.html"><font size="5"
									color="black">→查看所有成员...</font> </a>
							</div>
							<div class="container">
								<div class="grid_8 alpha">
									<div class="suffix_1">
										<h2 class="h2">
											<a href="introduction.html">简介intro</a>
										</h2>
										<div class="container tail3">
											<img alt="" src="images/2page_img4.png" class="img-left1" />
											<div class="indent2">
												<c:if
													test="${introduction!=null && introduction.introdution.length()<90 }">
													${introduction.introdution }
												</c:if>
												<c:if
													test="${introduction!=null && introduction.introdution.length()>=90 }">
													${introduction.introdution.substring(0,90) }
												</c:if>
											</div>
										</div>
										<div class="container">
											<c:if
												test="${introduction!=null && introduction.introdution.length()<90 }">

											</c:if>
											<c:if
												test="${introduction!=null && introduction.introdution.length()>=90 }">
												<img alt="" src="images/2page_img5.png" class="img-left1" />
											</c:if>
											<div class="indent2">
												<c:if
													test="${introduction!=null && introduction.introdution.length()<90 }">

												</c:if>
												<c:if
													test="${introduction!=null && introduction.introdution.length()>=90 && introduction.introdution.length()<180 }">
													${introduction.introdution.substring(90,introduction.introdution.length()) }
												</c:if>
												<c:if
													test="${introduction!=null && introduction.introdution.length()>=180}">
													${introduction.introdution.substring(90,180) }......
												</c:if>

											</div>
										</div>
									</div>
								</div>
								<div class="grid_8 omega">
									<div class="pad">
										<h2 class="h2">
											<a href="history.html">发展历史</a>
										</h2>
										<h3>History of sim choir:</h3>
										<c:forEach items="${historyList }" var="history">
											<p>
												<strong class="txt1"> <c:if
														test="${history.sdate==null }">
														<%=new Date().toLocaleString().substring(0, 10).replace('-', '.')%> - <%=new Date().toLocaleString().substring(0, 10).replace('-', '.')%>
													</c:if> <c:if test="${history.sdate!=null }">
												${history.sdate.substring(0,10).replace('-','.') } - ${history.edate.substring(0,10).replace('-','.') }
											</c:if> </strong> -
												<c:if test="${history.content.length()<120 }">${history.content }</c:if>
												<c:if test="${history.content.length()>=120 }">${history.content.substring(0,65) }...（点击标题查看更多）</c:if>
											</p>
										</c:forEach>
									</div>
									<br /> <a href="#"><font size="5" color="black">→更多发展历史...</font>
									</a>
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
