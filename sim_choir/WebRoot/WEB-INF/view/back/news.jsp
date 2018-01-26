<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 新闻管理 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>新闻管理-君科沃特</title>
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
		  	.news-record{
		  		font-size:15px;
		  		padding:10px;
		  		margin-left:10px;
		  		float:left;
		  	}
		  	.add-news:hover{
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
		                <h6 class="padding-left manage-head-con">新闻管理</h6>
		            </div>
		            <div class="offcial-table input-table table-margin clearfix album-tab" style="width:1320px;">
		                <div class="tr-th clearfix">
		                    <div class="th w5 text-center"></div>
		                    <div class="th w10">新闻ID</div>
		                    <div class="th w20">标题</div>
		                    <div class="th w10">发布时间</div>
		                    <div class="th w20">
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    &nbsp;&nbsp;&nbsp;摘要</div>
		                    <div class="th w20">
		                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                    &nbsp;封面图片</div>
		                    <div class="th w15">操作</div>
		                </div>
		                <div class="tr  show border-bottom-none scroll-div">
	                		<img src="images-back/add.png" class="add-album" style="width:18px;margin-top:20px;margin-left:45px;"/>
	            			<font size="4" class="add-news" color="gray" onclick="location.href='add-news.html'">发布新闻</font><hr/>
		                	<c:if test="${newsList==null || newsList.size()==0 }">
								<span style="margin-left:20px;">暂时还没有新闻</span>		                	
		                	</c:if>
			            	<c:forEach items="${newsList }" var="news">
			            		<div class="w10 news-record">
			            			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            			${news.id }
			            		</div>
			            		<div class="w20 news-record">
			            			<c:if test="${news.tittle.length()<=12 }">
			            				${news.tittle }
			            			</c:if>
			            			<c:if test="${news.tittle.length()>12 }">
			            				${news.tittle.substring(0,11) }...
			            			</c:if>
			            		</div>
			            		<div class="w10 news-record">
			            			${news.date.substring(0,10) }
			            		</div>
			            		<div class="w20 news-record">
			            			<c:if test="${news.content.length()<=15 }">
			            				${news.content }
			            			</c:if>
			            			<c:if test="${news.content.length()>15 }">
			            				${news.content.substring(0,14) }...
			            			</c:if>
			            		</div>
			            		<div class="w20 news-record">
			            			<img src="imageIO/newsImage.html?newsId=${news.id }" alt="图片无法加载" style="width:100px;height:75px;margin-top:-10px;"/>
			            		</div>
			            		<div class="w15 news-record" style="height:100px;">
			            			<input type="button" value="删除" onclick="deleteNews(${news.id })"
			            			style="margin-left:-50px;width:65px;height:40px;background-color:red;color:white;border-radius:8px;"/>
			            			<input type="button" value="编辑" 
			            			style="margin-left:30px;width:65px;height:40px;background-color:blue;color:white;border-radius:8px;"/>
			            			
			            		
			            		</div>
			            	</c:forEach>
			            </div>
			       </div>
		            
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
			
			//删除新闻
			function deleteNews(id){
				var yes = confirm("确认删除该新闻动态？");
				if(yes){
					location.href="deleteNews.html?newsId="+id;
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