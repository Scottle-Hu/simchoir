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
<title>图片-君科沃特</title>
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
							<li><a href="picture.html" style="font-size:15px;"
								class="current">图片</a>
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
						<div class="container_16">
							<h2>最新相册</h2>
							<div class="container">
								<div class="grid_5 alpha">
									<c:if
										test="${latestAlbum.pics==null || latestAlbum.pics.size()==0}">
										<img src="images/notfound.png" height="355px;" width="240px" />
									</c:if>
									<c:if
										test="${latestAlbum.pics!=null && latestAlbum.pics.size()>0}">
										<img
											src="imageIO/picImage.html?picId=${latestAlbum.pics.get(0).id }"
											height="370px;" width="280px" />
									</c:if>
									<br>
								</div>
								<div class="grid_11 omega">
									<div class="box">
										<div class="indent-box">
											<h3>
												<a href="pics.html?albumId=${latestAlbum.id }"><font
													color="white">《${latestAlbum.name }》</font>
												</a>
											</h3>
											<br /> <strong>创建时间：</strong>${latestAlbum.date.substring(0,10)
											} <br />
											<br /> <strong>照片数量：</strong>${latestAlbum.pics.size() } <br />
											<br /> <strong>相册描述：</strong>${latestAlbum.description } <br />
											<br /> <a href="pics.html?albumId=${latestAlbum.id }"><font
												color="white">查看相册</font>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="container indent">
								<h2>所有相册</h2>
								<c:forEach items="${albumList }" var="album">
									<div class="grid_4 alpha" style="margin-top:10px;">
										<c:if test="${album.pics==null || album.pics.size()==0 }">
											<img src="images/notfound.png" height="325px;" width="220px" />
										</c:if>
										<c:if test="${album.pics!=null && album.pics.size()>0 }">
											<img
												src="imageIO/picImage.html?picId=${album.pics.get(0).id }"
												height="325px;" width="220px" />
										</c:if>
										<a href="pics.html?albumId=${album.id }" class="button1">
											<c:if test="${album.name.length()<=6 }">
	                                	${album.name }
	                                </c:if> <c:if test="${album.name.length()>6 }">
	                                	${album.name.substring(0,6) }...
	                                </c:if> (${album.pics.size() })</a>
									</div>
								</c:forEach>
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
