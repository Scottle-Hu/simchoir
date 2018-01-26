<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>简介和历史-君科沃特</title>
		<link rel="icon" href="images-back/logo.png" type="image/x-icon"/>
		
		<link rel="stylesheet" type="text/css" href="css-back/identify.css" />
		<link rel="stylesheet" type="text/css" href="css-back/layout.css" />
		<link rel="stylesheet" type="text/css" href="css-back/account.css" />
		<link rel="stylesheet" type="text/css" href="css-back/style.css" />
		<link rel="stylesheet" type="text/css" href="css-back/control_index.css" />
		<link href="umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
	    <script type="text/javascript" src="umeditor/third-party/jquery.min.js"></script>
	    <script type="text/javascript" src="umeditor/third-party/template.min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="umeditor/umeditor.min.js"></script>
	    <script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>
		<!-- <script type="text/javascript" src="js-back/jquery-1.7.2.min.js"></script> -->
		<script type="text/javascript" src="js-back/layer/layer.js"></script>
		<script type="text/javascript" src="js-back/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="js-back/select.js"></script>
		<script type="text/javascript" src="js-back/haidao.validate.js"></script>
		<style type="text/css">
		  	.intro{
		  		float:left;
		  		border:1px dashed gray;
		  		margin-left:20px;
		  		margin-top:20px;
		  		padding:10px;
		  		width:50%;
		  	}
		  	.history{
		  		float:left;
		  		margin-top:20px;
		  		padding:10px;
		  		margin-left:10px;
		  		width:45%;
		  		border:1px dashed gray;
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
		                <h6 class="padding-left manage-head-con">简介和历史管理</h6>
		            </div>
		            <div class="intro">
		            	<h3>合唱团简介<span style="color:gray;">（*修改后保存即可）</span></h3><br/>
	            		<script type="text/plain" id="myEditor" style="width:600px;height:420px;">
							${introduction.presentation }
						</script> 	
						<br/>
						<input type="button" value="返回控制台" onclick="location.href='main.html'" 
		            	style="margin-top:20px;background-color:green;color:white;font-size:17px;width:100px;height:40px;border-radius:8px;"/>
		            	<input type="button" value="保存修改" onclick="saveIntro()"
		            	style="background-color:blue;color:white;font-size:17px;width:100px;height:40px;margin-left:100px;border-radius:8px;"/>
		            </div>
		            <div class="history">
		            	<h3>发展历史:<a href="add-history.html"><span style="color:green;font-size:15px;float:right;">添加历史事件</span></a></h3><br/>
		            	<c:forEach items="${historyList }" var="history">
		            		<div class="history-record">
		            			<label style="color:gray;">${history.edate.substring(0,10) } 至 ${history.edate.substring(0,10) }</label>
		            			<p style="font-size:15px;">
		            				<c:if test="${history.content.length()<=30 }">
		            					${history.content }
		            				</c:if>
		            				<c:if test="${history.content.length()>30 }">
		            					${history.content.substring(0,29) }...
		            				</c:if>
		            			</p>
		            			<a href="javascript:deleteHistory(${history.id });" style="color:red;">删除</a>
		            			<br/><br/>
		            		</div>
		            	</c:forEach>
		            </div>
		        </div>
			</div>
		</div>
		</div>
		
		<form action="saveIntro.html" method="post" id="intro-form">
			<input type="hidden" id="introdution" name="introdution"/>
			<input type="hidden" id="presentation" name="presentation"/>
		</form>
		
		
		
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
			
			//实例化编辑器
		    var um = UM.getEditor('myEditor');
		    
		    function saveIntro(){
		    	alert("保存成功");
		    	document.getElementById('presentation').value=document.getElementById('myEditor').innerHTML;
		    	document.getElementById('introdution').value=UM.getEditor('myEditor').getContentTxt();
		    	document.getElementById('intro-form').submit();
		    }
		    
		    //删除历史记录
		    function deleteHistory(id){
		    	var yes = confirm("确认删除此历史事件吗？");
		    	if(yes){
		    		location.href="deleteHistory.html?id="+id;
		    	}
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