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
<title>首页-君科沃特</title>
<meta charset="utf-8">
<meta name="keyword" content="君科沃特,信管合唱团,武汉大学信息管理学院">
<meta name="description"
	content="武汉大学君科沃特合唱团，信息管理学院合唱团，欢迎您的访问，这里有我们的图片，歌曲，最新动态公告，成员展示。">
<link rel="icon" href="images/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="js/roundabout.js" type="text/javascript"></script>
<script src="js/roundabout_shapes.js" type="text/javascript"></script>
<!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->

</head>
<script type="text/javascript">
	$(document).ready(function() {
		//更新图片，清除缓存
		$('#img1').attr('src', $('#img1').attr('src') + "?" + Math.random());
		$('#img2').attr('src', $('#img2').attr('src') + "?" + Math.random());
		$('#img3').attr('src', $('#img3').attr('src') + "?" + Math.random());
		$('#img4').attr('src', $('#img4').attr('src') + "?" + Math.random());
		$('#img5').attr('src', $('#img5').attr('src') + "?" + Math.random());
	});
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
							<li><a href="home.html" class="current"
								style="font-size:15px;">首页</a></li>
							<li><a href="choir.html" style="font-size:15px;">合唱团</a>
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
	<aside>
		<div class="main">
			<a href="#" class="btnPrev"><img src="images/button-1.png" alt="">
			</a><a href="#" class="btnNext" id="btnNext"><img
				src="images/button-2.png" alt=""> </a>
			<div id="carousel">
				<ul id="myRoundabout">
					<li><img id="img1" src="images/15.jpg" alt="" /></li>
					<li><img id="img2" src="images/11.jpg" alt="" /></li>
					<li><img id="img3" src="images/13.jpg" alt="" /></li>
					<li><img id="img4" src="images/14.jpg" alt="" /></li>
					<li><img id="img5" src="images/12.jpg" alt="" /></li>
				</ul>
			</div>
		</div>
	</aside>
	<div class="bg_cont1">
		<div class="bg_cont">
			<section id="content">
				<div class="main">
					<div class="inside">
						<div class="container_16">
							<div class="tail">
								<div class="container">
									<c:forEach items="${songList }" var="song">
										<div class="grid_4 alpha">
											<h2>
												<c:if test="${song.name.length()>6 }">${song.name.substring(0,5) }...</c:if>
												<c:if test="${song.name.length()<=6 }">${song.name }</c:if>
											</h2>
											<p class="p2" style="height:100px;">
												<c:if test="${song.introduction.length()<=84 }">${song.introduction }</c:if>
												<c:if test="${song.introduction.length()>84 }">${song.introduction.substring(0,83) }...</c:if>
											</p>
											<div class="container">
												<c:if test="${song.id!=-1 }">
													<a href="thisSong.html?songId=${song.id }" class="link-1">去听听</a>
												</c:if>
												<c:if test="${song.id==-1 }">
													<a href="javascript:return false;" class="link-1"
														style="opacity:0.4;">去听听</a>
												</c:if>

											</div>
										</div>
									</c:forEach>

								</div>
							</div>
							<div class="container">
								<div class="grid_8 alpha">
									<h2 class="h2">最新动态</h2>
									<c:forEach items="${newsList }" var="news">
										<div class="container">
											<img style="height:110px;width:165px;"
												src="imageIO/newsImage.html?newsId=${news.id }"
												class="img-left" alt="没有图片" />
											<h4>
												<c:if test="${news.id==0 }">
													${news.tittle }
												</c:if>
												<c:if test="${news.id!=0 }">
													<a href="the-news.html?newsId=${news.id }"> <c:if
															test="${news.tittle.length()<=9 }">
														${news.tittle }
													</c:if> <c:if test="${news.tittle.length()>9 }">
														${news.tittle.substring(0,9) }...
													</c:if> </a>
												</c:if>
											</h4>
											<p>
												<c:if test="${news.content.length()<=75 }">
											${news.content }
										</c:if>
												<c:if test="${news.content.length()>75 }">
											${news.content.substring(0,68) }...(点击标题查看更多)
										</c:if>
											</p>
											<br class="clear" />
										</div>
									</c:forEach>
								</div>
								<div class="grid_8 omega">
									<h2 class="h2">最近公告</h2>
									<c:forEach items="${annoList }" var="anno">
										<div class="tail1">
											<div class="container">
												<div class="data">
													<c:if test="${anno.date!=null }">
													${anno.date.substring(8,10) }<span>${anno.date.substring(5,7)
															}月</span>
													</c:if>
													<c:if test="${anno.date==null }">
													0<span>0月</span>
													</c:if>

												</div>
												<div class="indent1">
													<h3>
														<c:if test="${anno.date==null }">
															${anno.tittle }
														</c:if>
														<c:if test="${anno.date!=null }">
															<a href="notice.html?annoId=${anno.id }">${anno.tittle
																}</a>
														</c:if>
													</h3>
													<c:if test="${anno.content.length()>45 }">${anno.content.substring(0,42) }...(点击标题查看更多)</c:if>
													<c:if test="${anno.content.length()<=45 }">${anno.content }</c:if>

												</div>
											</div>
										</div>
									</c:forEach>
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
	<script type="text/javascript">
		$(document).ready(function() {

			$('ul#myRoundabout').roundabout({
				shape : 'figure8'
			});

			var cnn = [];
			$('#myRoundabout li').each(function() {
				cnn.push(this);
			});

			var curr = 0;
			$('.btnPrev').live('click', function() {
				if (curr < 0)
					curr = cnn.length - 1;
				else
					curr--;
				$(cnn.slice(curr, curr + 1)).trigger('click');
				return false;
			});
			$('.btnNext').live('click', function() {
				if (curr < cnn.length)
					curr++;
				else
					curr = 0;
				$(cnn.slice(curr, curr + 1)).trigger('click');
				return false;
			});
			setInterval("document.getElementById('btnNext').click();", 2000);
		});
		//
	</script>
</body>
</html>
