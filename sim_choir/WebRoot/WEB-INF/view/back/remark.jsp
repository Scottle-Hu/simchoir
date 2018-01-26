<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 评论管理 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>评论管理-君科沃特</title>
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
		  	.remark-record{
		  		float:left;
		  		padding-left:65px;
		  		height:50px;
		  		margin-top:5px;
		  	}
		  	.song-intro{
		  		position:absolute;
		  		background-color:black;
		  		color:white;
		  		font-size:14px;
		  		padding:10px;
		  		width:300px;
		  		display:none;
		  		border-radius:9px;
		  		-moz-border-radius:9px;
		  		-webkit-border-radius:9px;
		  	}
		  	.song-over-intro:hover{
		  		cursor:pointer;
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
		                <h6 class="padding-left manage-head-con">评论管理</h6>
		            </div>
		            <div class="info-center-con">
						<div class=" info-center-title h5 margin-big-top clearfix">
							<span class="fl padding-large-right manage-title"><a href="javascript:return false;">全部评论</a></span>
							<span class="fl padding-large-right"><a href="remark-song.html">歌曲评论</a></span>
							<span class="fl"><a href="remark-news.html">动态评论</a></span>
						</div>
						<p style="width: 56px; left: 20px;" class="solid-slider">
						</p>
					</div>
					<div class="offcial-table input-table table-margin clearfix">
						<div class="tr-th clearfix">
							<div class="th w5 text-center">
							</div>
							<div class="padding-left-15 th w45">
								评论内容
							</div>
							<div class="th w15">
								评论时间
							</div>
							<div class="th w20">
								评论歌曲/新闻
							</div>
							<div class="th w15">
								删除评论
							</div>
						</div>
						<c:forEach items="${remarkList }" var="remark">
							<div class="clearfix">
								<div class="w5 text-center">
								</div>
								<div class="padding-left-15 w45 remark-record">
									<c:if test="${remark.content.length()<=40 }">
										${remark.content }
									</c:if>
									<c:if test="${remark.content.length()>40 }">
										<span id="song-over-intro" 
										onmousemove="showCompleteIntro(${remark.id })" onmouseout="hideIntro()">
										${remark.content.substring(0,33) }...(悬浮查看更多)
										</span>
										<span style="display:none" id="hide${remark.id }">${remark.content }</span>
									</c:if>
								</div>
								<div class="w15 remark-record">
									${remark.date.substring(0,10) }
								</div>
								<div class="w20 remark-record">
									<c:if test="${remark.isNews==0 }">
										歌曲《
										<c:if test="${remark.songName.length()<=8 }">
											${remark.songName }
										</c:if>
										<c:if test="${remark.songName.length()>8 }">
											${remark.songName.substring(0,7) }...
										</c:if>
										》
									</c:if>
									<c:if test="${remark.isNews==1 }">
										新闻《
										<c:if test="${remark.newsTittle.length()<=8 }">
											${remark.newsTittle }
										</c:if>
										<c:if test="${remark.newsTittle.length()>8 }">
											${remark.newsTittle.substring(0,7) }...
										</c:if>
										》
									</c:if>
								</div>
								<div class="w15 remark-record">
									<input type="button" value="删除" onclick="deleteRemark(${remark.id })"
									style="width:80px;height:35px;background-color:red;border-radius:9px;color:white;font-size:14px;"/>
								</div>
							</div>
						</c:forEach>
						<!-- <div class="non-info">
							<span>没有任何评论</span>
						</div> -->
					</div>
		            
		        </div>
			</div>
		</div>
		</div>
		
		<!-- 详细信息悬浮层 -->
		<div class="song-intro" id="song-intro">
			
		</div>
		<!-- 详细信息悬浮层结束 -->
		
		
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
			
			//删除评论
			function deleteRemark(id){
				var yes=confirm('确认删除该评论？');
				if(yes){
					location.href="deleteRemark.html?id="+id;
				};
			}
			
			//鼠标经过不全的介绍
			function showCompleteIntro(id){
				var ev =  window.event;
				var mousePos = mousePosition(ev);
				document.getElementById('song-intro').style.display="inline";
				document.getElementById('song-intro').style.top=mousePos.y+"px";
				document.getElementById('song-intro').style.left=mousePos.x+"px";
				document.getElementById('song-intro').innerHTML=
					document.getElementById('hide'+id).innerHTML;
			}
			//鼠标移走
			function hideIntro(){
				document.getElementById('song-intro').style.display="none";
			}
			
			//工具函数：获取鼠标位置
			function mousePosition(ev){
		    	if(ev.pageX || ev.pageY){//firefox、chrome等浏览器
					return {x:ev.pageX,y:ev.pageY};
				}
				return {// IE浏览器
				   x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
				   y:ev.clientY + document.body.scrollTop - document.body.clientTop
			  	};
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