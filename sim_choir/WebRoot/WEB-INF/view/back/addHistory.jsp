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
		<title>添加历史-君科沃特</title>
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
		  	.grid{
		  		width:20px;
		  		height:25px;
		  		border:1px solid black;
		  		font-size:20px;
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
		                <h6 class="padding-left manage-head-con">添加历史事件</h6>
		            </div>
		            <div style="margin-left:20px;margin-top:20px;">
		            <form action="addHistory.html" method="post" id="form-id">
		            	<label style="color:gray;font-size:17px;">历史起始时间：</label>
		            	<input type="text" name="syear1" id="syear1" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="syear2" id="syear2" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="syear3" id="syear3" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="syear4" id="syear4" class="grid" onkeypress="check(this)"/>
		            	-
		            	<input type="text" name="smonth1" id="smonth1" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="smonth2" id="smonth2" class="grid" onkeypress="check(this)"/>
		            	-
		            	<input type="text" name="sdate1" id="sdate1" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="sdate2" id="sdate2" class="grid" onkeypress="check(this)"/>
		            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            	<span style="color:red;">(*时间格式为yyyy-mm-dd，例如：1970-01-01)</span>
		            	<br/>
		            	<br/>
		            	<label style="color:gray;font-size:17px;">历史结束时间：</label>
		            	<input type="text" name="eyear1" id="eyear1" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="eyear2" id="eyear2" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="eyear3" id="eyear3" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="eyear4" id="eyear4" class="grid" onkeypress="check(this)"/>
		            	-
		            	<input type="text" name="emonth1" id="emonth1" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="emonth2" id="emonth2" class="grid" onkeypress="check(this)"/>
		            	-
		            	<input type="text" name="edate1" id="edate1" class="grid" onkeypress="check(this)"/>
		            	<input type="text" name="edate2" id="edate2" class="grid" onkeypress="check(this)"/>
		            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            	<span style="color:red;">(*时间格式为yyyy-mm-dd，例如：1970-01-01)</span>
		            	<br/><br/>
		            	<label style="color:gray;font-size:17px;">编辑历史事件：</label><br/><br/>
		            	<script type="text/plain" id="myEditor" style="width:1150px;height:420px;">
						</script>
						<input type="hidden" id="presentation" name="presentation"/>
						<input type="hidden" id="content" name="content"/>
						<br/><br/>
						<input type="button" value="取消"  onclick="location.href='intro-his.html'"
						style="width:100px;height:40px;color:white;background-color:red;font-size:18px;border-radius:9px;"/>
						<input type="button" value="添加"  onclick="add()"
						style="width:100px;height:40px;color:white;background-color:blue;font-size:18px;border-radius:9px;margin-left:100px;"/>
		            </form>
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
			
			//实例化编辑器
		    var um = UM.getEditor('myEditor');
			
			function check(e){
				var txt = e.value;
				if(txt.length>0){
					e.value='';
				}
			
				if(e.id=="syear1"){
					document.getElementById('syear2').focus();				
				}
				if(e.id=="syear2"){
					document.getElementById('syear3').focus();				
				}
				if(e.id=="syear3"){
					document.getElementById('syear4').focus();				
				}
				if(e.id=="syear4"){
					document.getElementById('smonth1').focus();				
				}
				if(e.id=="smonth1"){
					document.getElementById('smonth2').focus();				
				}
				if(e.id=="smonth2"){
					document.getElementById('sdate1').focus();				
				}
				if(e.id=="sdate1"){
					document.getElementById('sdate2').focus();				
				}
				if(e.id=="sdate2"){
					document.getElementById('eyear1').focus();				
				}
				if(e.id=="eyear1"){
					document.getElementById('eyear2').focus();				
				}
				if(e.id=="eyear2"){
					document.getElementById('eyear3').focus();				
				}
				if(e.id=="eyear3"){
					document.getElementById('eyear4').focus();				
				}
				if(e.id=="eyear4"){
					document.getElementById('emonth1').focus();				
				}
				if(e.id=="emonth1"){
					document.getElementById('emonth2').focus();				
				}
				if(e.id=="emonth2"){
					document.getElementById('edate1').focus();				
				}
				if(e.id=="edate1"){
					document.getElementById('edate2').focus();				
				}
				if(e.id=="edate2"){
					document.getElementById('myEditor').focus();				
				}

			}
			
			function add(){
				document.getElementById('content').value=UM.getEditor('myEditor').getContentTxt();
				document.getElementById('presentation').value=document.getElementById('myEditor').innerHTML;
				
				document.getElementById('form-id').submit();
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