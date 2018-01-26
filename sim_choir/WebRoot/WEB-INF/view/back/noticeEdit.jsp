<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--公告管理 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>公告编辑-君科沃特</title>
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
		  	.anno-record{
		  		float:left;
		  		font-size:15px;
		  	}
		  	
		  	.add-anno{
		  		cursor:pointer;
		  	}
		  	.edit{
		  		cursor:pointer;
		  		color:red;
		  		font-size:13px;
		  	}
		  	.edit:hover{
		  		cursor:pointer;
		  		text-decoration:underline;
		  	}
		  	.update-tittle{
		  		position:fixed;
		  		top:20%;
		  		left:25%;
		  		width:300px;
		  		background-color:black;
		  		color:white;
		  		padding:10px;
		  	}
		  	.update-content{
		  		position:fixed;
		  		top:20%;
		  		left:30%;
		  		width:300px;
		  		background-color:black;
		  		color:white;
		  		padding:10px;
		  	}
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.update-tittle').hide();	
			$('.update-content').hide();		
			
			//点击修改标题
			$('.update-tittle-span').click(function(){
				$('.update-tittle').show();
				$('.back').css('opacity','0.3');
			});	
			//点击取消
			$('.update-tittle-quit').click(function(){
				$('.update-tittle').hide();
				$('.back').css('opacity','');
			});
			//确认修改名称
			$('.update-tittle-confirm').click(function(){
				if($('#update-tittle-text').val()==""){
					alert('公告名称不能为空！');
					return false;
				}else{
					$('#form-id1').submit();
				}
			});
			
			//点击修改内容
			$('.update-content-span').click(function(){
				$('.update-content').show();
				$('.back').css('opacity','0.3');
			});	
			//点击取消
			$('.update-content-quit').click(function(){
				$('.update-content').hide();
				$('.back').css('opacity','');
			});
			//确认修改名称
			$('.update-content-confirm').click(function(){
				if($('#update-content-text').val()==""){
					alert('公告内容不能为空！');
					return false;
				}else{
					$('#form-id2').submit();
				}
			});
			
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
		                <h6 class="padding-left manage-head-con">公告编辑-《${anno.tittle }》</h6>
		            </div>
		            <div style="width:1000px;">
		            <div style="margin-left:20px;margin-top:20px;font-size:15px;margin-bottom:20px;">
		            	<b>发布时间：</b>
		            	${anno.date.substring(0,10) }
		            </div>
		            <div style="margin-left:20px;margin-top:20px;font-size:15px;margin-bottom:20px;">
	                	<b>发布者：</b>
	                	${anno.admin.username }
	                </div>
	                <div style="margin-left:20px;margin-top:20px;font-size:15px;margin-bottom:20px;">
	                	<b>标题：</b>
	                	${anno.tittle }
	                	<span class="edit update-tittle-span">修改</span>
	                </div>
	                <div style="margin-left:20px;font-size:15px;margin-bottom:20px;">
	                	<b style="float:left;">内容：</b>
	                	<p style="margin-left:50px;">${anno.content }<br/><span class="edit update-content-span">编辑</span></p>
	                	
	                </div>
	                <input type="button" value="返回" onclick="location.href='notice.html'" 
	                style="margin-left:20px;width:100px;height:40px;background-color:green;color:white;"/>
	                <input type="button" value="删除" onclick="location.href='deleteAnno.html?annoId=${anno.id }'" 
	                style="margin-left:80px;width:100px;height:40px;background-color:red;color:white;"/>
		        	</div>
		        </div>
			</div>
		</div>
		</div>
		
		<!-- 修改公告名稱悬浮层 -->
		<div class="update-tittle" >
			<form action="updateNoticeTittle.html" method="post" id="form-id1">
				<font size="3">修改名称：</font>
				<input name="tittle" type="text" id="update-tittle-text" value="${anno.tittle }"
				style="width:190px;height:25px;" />
				<input type="hidden" name="id" value="${anno.id }"/>
			</form>
			<input type="button" value="确定" class="update-tittle-confirm"
			style="width:80px;height:30px;margin-top:10px;margin-left:100px;background-color:blue;color:white;"/>
			<input type="button" class="update-tittle-quit" value="取消" 
			style="width:80px;height:30px;margin-left:10px;background-color:red;color:white;"/>
		</div>
		<!-- 修改公告名稱悬浮层结束 -->
		
		<!-- 修改公告内容悬浮层 -->
		<div class="update-content" >
			<form action="updateNoticeContent.html" method="post" id="form-id2">
				<font size="3">编辑内容：</font><br/>
				<textarea id="update-content-text" name="content" style="width:275px;height:300px;resize:none;" >${anno.content }</textarea>
				<input type="hidden" name="id" value="${anno.id }"/>
			</form>
			<input type="button" value="确定" class="update-content-confirm"
			style="width:80px;height:30px;margin-top:10px;margin-left:100px;background-color:blue;color:white;"/>
			<input type="button" class="update-content-quit" value="取消" 
			style="width:80px;height:30px;margin-left:10px;background-color:red;color:white;"/>
		</div>
		<!-- 修改公告内容悬浮层结束 -->
		
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
			
			//删除公告
			function deleteAnno(id){
				var yes = confirm('确定删除此公告？');
				if(yes){
					location.href="deleteAnno.html?annoId="+id;
				}else{
					return false;
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