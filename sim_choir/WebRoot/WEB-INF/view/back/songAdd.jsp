<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 添加歌曲 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>添加歌曲-君科沃特</title>
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
			#whole-cover{
				width:350px;
				height:90px;
				background-color:gray;
				position:fixed;
				top:30%;
				left:35%;
				color:white;
				padding:20px;
				font-size:30px;
				border-radius:9px;
				-moz-border-radius:9px;
				-webkit-border-radius:9px;
				border:2px solid black;
				display:none;
			}
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
						
		});
	</script>
	<body id="body">
		
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
								<a href="identify.html">
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
			<div class="view-product" style="position:relative;">
				<div class="info-center">
		            <div class="manage-head">
		                <h6 class="padding-left manage-head-con">添加歌曲</h6>
		            </div>
		            <form action="addSong.html" method="post" enctype="multipart/form-data" id="form-id">
		            
		            <div class="song-name" id="song-name">
		            	<input name="name" type="text" id="song-name-text" placeholder=" 歌曲名称"
		            	style="width:1200px;height:50px;font-size:18px;border:dashed 1px gray;margin-left:20px;margin-top:20px;" />
		            </div>
		            
		            <div class="song-type" id="song-type" style="margin-left:20px;margin-top:20px;">
		            	<select name="type" id="song-type-select" onchange="selectType(this)"
		            	style="width:200px;height:35px;border:2px solid #e3e3e3;">
		            		<option value="0">------请选择歌曲文件类型------</option>
		            		<option value="1">音频</option>
		            		<option value="2">视频</option>
		            		<option value="3">链接</option>
		            	</select>
		            	<font size="3" color="gray">&nbsp;&nbsp;&nbsp;（*若歌曲为链接类型，则不需要上传文件,只要复制网页链接即可，但务必保证链接可用）</font>
		            </div>
		            
		            <div class="song-intro" id="song-intro">
		            	<textarea name="introduction" id="song-intro-text" placeholder=" 歌曲介绍" 
		            	style="margin-left:20px;margin-top:20px;width:1200px;height:300px;resize:none;font-size:15px;"></textarea>
		            </div>
		            
		            <div style="margin-left:20px;margin-top:20px;position:relative;">
		            	<input name="link" id="song-link-text" type="text" style="border:1px solid gray;width:1200px;height:40px;font-size:14px;" placeholder=" 歌曲链接"/>
		            	<!-- 灰色覆盖层 -->
		            	<div id="link-cover" style="position:absolute;top:-1px;left:0px;width:1200px;height:42px;background:gray;opacity:0.6;"></div>
		            </div>
		            
		            <div class="song-file" id="song-file" style="width:1200px;margin-left:20px;margin-top:10px;position:relative;border:1px dashed gray;padding:5px;">
		            	<font color="gray" size="3">上传歌曲预览：<span style="color:black;font-size:14px;" id="song-file-name"></span><br/></font>
		            	<video id="song-file-video" src="" controls poster="../images/disc.png" style="width:400px;height:300px;border:1px black solid;background-color:#e3e3e3;">
		            	</video>
		            	<input type="file" id="song-file2" name="file" onchange="selectFile()"/>
		            	<!-- 覆盖层 -->
		            	<div id="file-cover" style="background:gray;opacity:0.6;position:absolute;top:-1px;left:0px;width:1200px;height:340px;"></div>
		            </div>
		            
		            <div class="button-div" style="margin-left:20px;margin-top:30px;margin-bottom:50px;">
		            	<input type="button" value="返回" onclick="location.href='song.html'"
		            	style="width:100px;height:40px;background:green;color:white;font-size:15px;margin-right:50px;"/>
		            	
		            	<input type="button" value="添加" onclick="addSongSubmit()"
		            	style="width:100px;height:40px;background:blue;color:white;font-size:15px;"/>
		            </div>
		            
		            </form>
		            <div id="whole-cover">
						文件上传中。。。。。
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
			
			//判断下拉选框选择的值
			function selectType(e){
				//alert(e.value);
				if(e.value=="1" || e.value=="2"){
					document.getElementById('file-cover').style.display="none";
					document.getElementById('link-cover').style.display="inline";
				}else if(e.value=="3"){
					document.getElementById('file-cover').style.display="inline";
					document.getElementById('link-cover').style.display="none";
				}else{
					document.getElementById('file-cover').style.display="inline";
					document.getElementById('link-cover').style.display="inline";
				};		
			}
			
			//选择了歌曲文件,显示在旁边
			function selectFile(){
				var songFile=document.getElementById('song-file2').files[0];
				var fr = new FileReader();
				fr.onload=function(){
					document.getElementById('song-file-video').src=fr.result;
				};
				fr.readAsDataURL(songFile);
				document.getElementById('song-file-name').innerHTML=" 《"+songFile.name+"》";
			}
			
			//提交歌曲添加表单
			function addSongSubmit(){
				var name=document.getElementById('song-name-text').value;
				var intro = document.getElementById('song-intro-text').value;
				var type=document.getElementById('song-type-select').value;
				var link = document.getElementById('song-link-text').value;
				var file = document.getElementById('song-file2').value;
				//空值检查
				if(name==""){
					alert('歌曲名称不能为空！');
					return false;
				};
				if(intro==""){
					alert('歌曲介绍不能为空！');
					return false;
				};
				if(type=="0"){
					alert('请选择歌曲类型');
					return false;
				};
				if(type=="3" && link==""){
					alert('歌曲链接不能为空！');
					return false;
				};
				if((type=="1" || type=="2") && file==""){
					alert("请上传歌曲文件！");
					return false;
				};
				document.getElementById('form-id').submit(); //提交表单
				document.getElementById('whole-cover').style.display="inline";
				document.getElementById('body').style.opacity="0.6";
				
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