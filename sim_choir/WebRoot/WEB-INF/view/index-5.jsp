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
<title>公告-君科沃特</title>
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
							<li><a href="picture.html" style="font-size:15px;">图片</a>
							</li>
							<li><a href="announcement.html" style="font-size:15px;"
								class="current">公告</a>
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
							<h2>所有公告(${page }/${pageNum })</h2>
							<br />
							<div class="container">
								<c:forEach items="${annoList }" var="anno">
									<div class="grid_8 alpha">
										<div class="container" style="height:150px;">
											<div class="data" style="width:80px;height:100px;">
												${anno.date.substring(8,10) }<span>${anno.date.substring(5,7)
													}月</span>
											</div>
											<a href="notice.html?annoId=${anno.id }"><h3>
													<b>${anno.tittle }</b>
												</h3>
											</a><br />
											<c:if test="${anno.content.length()<=48 }">
	                                    	${anno.content }
	                                    </c:if>
											<c:if test="${anno.content.length()>48 }">
	                                    	${anno.content.substring(0,48) }...
	                                    </c:if>
											<br class="clear" />
										</div>
									</div>
								</c:forEach>
							</div>
							<br />
							<br />
							<hr />
							<!-- 以下是分页的页码模块 -->
							<div style="padding:10px;margin-left:220px;;mergin-right:auto;">

								<c:if test="${pageNum==1 }">
									<a href="javascript:return false;"><div
											style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
											<font color="white">上一页</font>
										</div>
									</a>
									<a href="#"><div
											style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
											<font color="white">1</font>
										</div>
									</a>
									<a href="javascript:return false;"><div
											style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
											<font color="white">下一页</font>
										</div>
									</a>
								</c:if>

								<c:if test="${pageNum==2 }">
									<c:if test="${page==1 }">
										<a href="javascript:return false;"><div
												style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">上一页</font>
											</div>
										</a>
										<a href="#"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
												<font color="white">1</font>
											</div>
										</a>
										<a href="announcement.html?page=2"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">2</font>
											</div>
										</a>
										<a href="announcement.html?page=2"><div
												style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">下一页</font>
											</div>
										</a>
									</c:if>
									<c:if test="${page==2 }">
										<a href="announcement.html?page=1"><div
												style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">上一页</font>
											</div>
										</a>
										<a href="announcement.html?page=1"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">1</font>
											</div>
										</a>
										<a href="#"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
												<font color="white">2</font>
											</div>
										</a>
										<a href="javascript:return false;"><div
												style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">下一页</font>
											</div>
										</a>
									</c:if>
								</c:if>

								<c:if test="${pageNum==3 }">
									<c:if test="${page==1 }">
										<a href="javascript:return false;"><div
												style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">上一页</font>
											</div>
										</a>
										<a href="#"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
												<font color="white">1</font>
											</div>
										</a>
										<a href="announcement.html?page=2"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">2</font>
											</div>
										</a>
										<a href="announcement.html?page=3"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">3</font>
											</div>
										</a>
										<a href="announcement.html?page=2"><div
												style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">下一页</font>
											</div>
										</a>
									</c:if>
									<c:if test="${page==2 }">
										<a href="announcement.html?page=1"><div
												style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">上一页</font>
											</div>
										</a>
										<a href="announcement.html?page=1"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">1</font>
											</div>
										</a>
										<a href="#"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
												<font color="white">2</font>
											</div>
										</a>
										<a href="announcement.html?page=3"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">3</font>
											</div>
										</a>
										<a href="announcement.html?page=3"><div
												style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">下一页</font>
											</div>
										</a>
									</c:if>
									<c:if test="${page==3 }">
										<a href="announcement.html?page=2"><div
												style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">上一页</font>
											</div>
										</a>
										<a href="announcement.html?page=1"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">1</font>
											</div>
										</a>
										<a href="announcement.html?page=2"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">2</font>
											</div>
										</a>
										<a href="#"><div
												style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
												<font color="white">3</font>
											</div>
										</a>
										<a href="javascript:return false;"><div
												style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
												<font color="white">下一页</font>
											</div>
										</a>
									</c:if>
								</c:if>

								<c:if test="${pageNum>3 }">
									<c:choose>
										<c:when test="${page==1 }">
											<a href="javascript:return false;"><div
													style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">上一页</font>
												</div>
											</a>
											<a href="#"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
													<font color="white">1</font>
												</div>
											</a>
											<a href="announcement.html?page=2"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">2</font>
												</div>
											</a>
											<div
												style="float:left;width:20px;height:20px;padding:8px;margin:5px;">
												<font>......</font>
											</div>
											<a href="announcement.html?page=${pageNum }"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">${pageNum }</font>
												</div>
											</a>
											<a href="announcement.html?page=2"><div
													style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">下一页</font>
												</div>
											</a>
										</c:when>
										<c:when test="${page==2 }">
											<a href="announcement.html?page=1"><div
													style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">上一页</font>
												</div>
											</a>
											<a href="announcement.html?page=1"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">1</font>
												</div>
											</a>
											<a href="#"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
													<font color="white">2</font>
												</div>
											</a>
											<div
												style="float:left;width:20px;height:20px;padding:8px;margin:5px;">
												<font>......</font>
											</div>
											<a href="announcement.html?page=${pageNum }"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">${pageNum }</font>
												</div>
											</a>
											<a href="announcement.html?page=3"><div
													style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">下一页</font>
												</div>
											</a>
										</c:when>
										<c:when test="${page==pageNum }">
											<a href="announcement.html?page=${pageNum-1 }"><div
													style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">上一页</font>
												</div>
											</a>
											<a href="announcement.html?page=1"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">1</font>
												</div>
											</a>
											<a href="announcement.html?page=2"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">2</font>
												</div>
											</a>
											<div
												style="float:left;width:20px;height:20px;padding:8px;margin:5px;">
												<font>......</font>
											</div>
											<a href="#"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
													<font color="white">${pageNum }</font>
												</div>
											</a>
											<a href="javascript:return false;"><div
													style="opacity:0.4;float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">下一页</font>
												</div>
											</a>
										</c:when>
										<c:otherwise>
											<a href="announcement.html?page=${page-1 }"><div
													style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">上一页</font>
												</div>
											</a>
											<a href="announcement.html?page=1"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">1</font>
												</div>
											</a>
											<a href="announcement.html?page=2"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">2</font>
												</div>
											</a>
											<div
												style="float:left;width:20px;height:20px;padding:8px;margin:5px;">
												<font>...</font>
											</div>
											<a href="#"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:black;margin:5px;">
													<font color="white">${page }</font>
												</div>
											</a>
											<div
												style="float:left;width:20px;height:20px;padding:8px;margin:5px;">
												<font>...</font>
											</div>
											<a href="announcement.html?page=${pageNum }"><div
													style="float:left;width:20px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">${pageNum }</font>
												</div>
											</a>
											<a href="announcement.html?page=${page+1 }"><div
													style="float:left;width:50px;height:20px;padding:8px;background-color:gray;margin:5px;">
													<font color="white">下一页</font>
												</div>
											</a>
										</c:otherwise>
									</c:choose>
								</c:if>
							</div>
							<!-- 分页的页码模块结束 -->
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
