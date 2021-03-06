<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.News" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="cn">
<head>
<title>新闻动态-君科沃特</title>
<meta charset="utf-8">
<link rel="icon" href="images/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/grid.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<!--[if lt IE 7]><script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script><![endif]-->
<!--[if lt IE 9]><script type="text/javascript" src="js/html5.js"></script><![endif]-->

</head>
<script type="text/javascript">
	$(document).ready(function(){
		//点击点赞
		$('.likeImg').click(function(){
			$('.likeImg').attr('src',"images/like.png");
			//ajax请求修改点赞数
			$.ajax({
				url:"updateNewsPraise.html?newsId=<%=((News) request.getAttribute("news")).getId()%>",
				async:false
			});	
			//页面显示点赞数加一
			var a = document.getElementById("likeNum");
			a.innerHTML=(parseInt)(a.innerHTML)+1;	
			//设置不可再点击
			$('.likeImg').unbind();
		});
		
		//发表评论
		$('#remarkBt').click(function(){
			if($('#remark').val()==""){
				alert('评论内容不能为空！');
				return false;
			};
			//提交ajax
			$.ajax({
				type:'POST',
				url:"addNewsRemark.html",
				data:{
					ip:$('#ip').html(),
					newsId:$('#newsId').val(),
					remark:$('#remark').val()
				}
			});
			//修改页面内容 （并不重新加载页面因为体验不好）
			var newRemark = "<font color='gray' style='font-size:15px;'>IP_"
								+$('#ip').html()+
								"( "+(new Date().getFullYear()+"-"
								+(new Date().getMonth()+1)+"-"
								+new Date().getDate())+")</font><br/><font color='black'>:"+
								$('#remark').val()
								+"</font><br/><br/>";
			$('#tittle').after(newRemark);
			$('#noRemark').remove();
			$('#remark').val("");
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
								<li><a href="news.html" style="font-size:15px;" class="current">最新动态</a>
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
							当前位置：<a href="home.html">首页</a>-<a href="news.html">最新动态</a>-<a
								href="#">新闻《${news.tittle }》</a><br />
							<br />
							<br />
							<div class="container_16">
								<div class="tail2">
									<div class="container">
										<center>
											<h2>${news.tittle }</h2>
											<h4>发布者：${news.admin.username }
												&nbsp;&nbsp;&nbsp;日期：${news.date.substring(0,10) }
												&nbsp;&nbsp;&nbsp;浏览：${news.scanNum }&nbsp;&nbsp;点赞：<span id="likeNum">${news.praiseNum }</span>&nbsp;&nbsp;&nbsp;&nbsp;
												<img class="likeImg" src="images/like2.png"
													style="width:20px;height:20px;" alt="找不到图片了" />点个赞
											</h4>
										</center>
										<br />
										<div style="margin-left:80px;margin-right:100px;">
											<p>${news.presentation }</p>
										</div>
									</div>
									<br/><br/>
									<div class="container">
										<font color="black" style="font-size:20px;"><b>所有评论</b>
										</font>
										<hr />
										<div>
											<input type="hidden" id="newsId" value="${news.id }" /> <span
												id="ip" style="display:none;"><%=request.getRemoteAddr()%></span>
											<textArea id="remark"
												style="width:800px;height:60px;;border:gray 1px solid;float:left;resize:none;"
												placeholder="输入评论内容..."></textArea>
											<input type="button" id="remarkBt" value="发表评论"
												style="float:none;width:100px;height:74px;background-color:black;color:white;font-size:18px;font-style:bold;" />
										</div>
										<br />
										<h3>All Remarks:</h3>
										<br />
										<c:if test="${news.remarkList==null || news.remarkList.size()==0 }">
											<center id="noRemark">还没有人来评论哦~快来做第一个吧</center>
										</c:if>
										<span id="tittle" style="height:0px;"></span>
										<c:forEach items="${news.remarkList }" var="remark">
											<font color="gray" style="font-size:15px;"<%-- <c:if test="${song.remarkList.indexOf(remark)==0 }">
	                         		id="firstRemark"
	                         		</c:if> --%>
	                         		>IP_${remark.ip
												} (${remark.date.substring(0,10) })</font>
											<br />
											<font color="black">:${remark.content }</font>
											<br />
											<br />
										</c:forEach>
									</div>
									<br /><hr/>
									<br /> 上一个动态：
									<c:if test="${priorNews==null }">
		                            	没有了
		                            </c:if>
									<c:if test="${priorNews!=null }">
										<a href="the-news.html?newsId=${priorNews.id }">${priorNews.tittle }</a>
									</c:if>
									<br /> 下一个动态：
									<c:if test="${nextNews==null }">
		                            	没有了
		                            </c:if>
									<c:if test="${nextNews!=null }">
										<a href="the-news.html?newsId=${nextNews.id }">${nextNews.tittle }</a>
									</c:if>

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
