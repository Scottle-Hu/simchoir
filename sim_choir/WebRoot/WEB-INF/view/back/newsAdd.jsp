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
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
		<title>添加新闻-君科沃特</title>
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
		<script type="text/javascript" src="js-back/layer.js"></script>
		<script type="text/javascript" src="js-back/haidao.offcial.general.js"></script>
		<script type="text/javascript" src="js-back/select.js"></script>
		<script type="text/javascript" src="js-back/haidao.validate.js"></script>
		<style type="text/css">
		  	.gray-tittle{
			  	color:gray;
			  	font-size:15px;
			  	margin-left:20px;
			  }	
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
	<body>
		<div class="back" id="back">
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
		                <h6 class="padding-left manage-head-con">添加新闻</h6>
		            </div>
		            <br/>
		            <font class="gray-tittle">发布时间：20<%=(new Date()).getYear()%100 %>-<%=(new Date()).getMonth()+1%>-<%=(new Date()).getDate() %></font>
		            <font class="gray-tittle">发布人：${admin.username }</font>
		            <form action="addNews.html" method="post" id="form-id" enctype="multipart/form-data">
		            <div class="tittle " style="font-size:18px;margin-top:10px;margin-left:20px;">
		            	<input type="text" name="tittle" placeholder=" 新闻标题" id="add-tittle" style="width:1200px;height:50px;border:dashed 1px gray"/>
		            </div>
		            <div class="pic" 
		            style="margin-top:20px;margin-left:20px;width:1200px;height:200px;border:1px solid gray;padding:10px;">
		            	<img src="../images/notfound.png" alt="找不到图片" id="pic-img"
		            	style="width:220px;height:165px;background-color:gray;" />
		            	<input type="file" name="pic" id="pic-file" onchange="showPic()" 
		            	style="display:none;"/>
		            	&nbsp;&nbsp;&nbsp;&nbsp;
		            	<input type="button" value="选择封面图片"  onclick="javascript:document.getElementById('pic-file').click();"
		            	style="width:120px;height:40px;padding:10px;background-color:green;border-radius:9px;color:white;font-size:17px;"/>
		            	<font color="gray" size="3" style="margin-left:30px;">*该图片将展示在动态的封面上，尽量选择高宽比为3:4的图片。</font>
		            </div>
		            <div class="content" 
		            style="padding:10px;margin-left:20px;margin-top:20px;width:1200px;height:500px;border:1px solid gray;overflow:scroll;">
		            	<font color="gray" size="4">编辑新闻内容：</font>(*点击编辑器右上角可进入全屏编辑)<br/>
		            	<script type="text/plain" id="myEditor" style="width:1150px;height:420px;">
						</script> 	
						<input type="hidden" id="content" name="content" />
						<input type="hidden" id="presentation" name="presentation"/>
		            </div>
		            <input type="hidden" value=${admin.id } name="adminId"/>
		            </form>
		            <div style="margin-top:20px;margin-left:20px;">
		            	<input type="button" value="返回" onclick="location.href='news.html'"
		            	style="border-radius:9px;width:100px;height:40px;background-color:green;color:white;font-size:15px;"/>
		            	<input type="button" value="发布" class="add-news-button" onclick="addNewsSubmit()"
						style="border-radius:9px;width:100px;height:40px;background-color:blue;color:white;font-size:15px;margin-left:50px;"/>
		            </div>
		        </div>
			</div>
		</div>
		</div>
		
		<div id="whole-cover">
			文件上传中。。。。。
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
			
			//显示选择的图片
			function showPic(){
				var imgFile = document.getElementById('pic-file').files[0];
				var fr = new FileReader();
				fr.onload=function(){
					document.getElementById('pic-img').src=fr.result;
				};
				fr.readAsDataURL(imgFile);
			}
			
			//发布新闻
			function addNewsSubmit(){
				var tittle=document.getElementById('add-tittle').value;
				var picFile = document.getElementById('pic-file').value;
				var content = document.getElementById('content').value=getContentTxt();
				var pre=document.getElementById('presentation').value=document.getElementById('myEditor').innerHTML;
				if(tittle==""){
					alert("标题不能为空！");
					return false;
				};
				if(picFile==""){
					alert("封面图片不能为空！");
					return false;
				};
				if(presentation == ""){
					alert("内容不能为空！");
					return false;
					
				};
				document.getElementById('form-id').submit();
				document.getElementById('whole-cover').style.display="inline";
				document.getElementById('back').style.opacity="0.6";
				
			};
			
			//实例化编辑器
		    var um = UM.getEditor('myEditor');
		    //编辑器操作函数
		    function insertHtml() {
		        var value = prompt('插入html代码', '');
		        um.execCommand('insertHtml', value)
		    }
		    function isFocus(){
		        alert(um.isFocus());
		    }
		    function doBlur(){
		        um.blur();
		    }
		    function createEditor() {
		        enableBtn();
		        um = UM.getEditor('myEditor');
		    }
		    function getAllHtml() {
		        alert(UM.getEditor('myEditor').getAllHtml())
		    }
		    function getContent() {
		        return UM.getEditor('myEditor').getContent();
		    }
		    function getPlainTxt() {  //带格式纯文本
		        /* var arr = [];
		        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
		        arr.push("内容为：");
		        arr.push(UM.getEditor('myEditor').getPlainTxt());
		        alert(arr); */
		        return UM.getEditor('myEditor').getPlainTxt();
		    }
		    function setContent(isAppendTo) {
		        var arr = [];
		        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
		        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
		        alert(arr.join("\n"));
		    }
		    function setDisabled() {
		        UM.getEditor('myEditor').setDisabled('fullscreen');
		        disableBtn("enable");
		    }
		
		    function setEnabled() {
		        UM.getEditor('myEditor').setEnabled();
		        enableBtn();
		    }
		
		    function getText() {
		        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
		        var range = UM.getEditor('myEditor').selection.getRange();
		        range.select();
		        var txt = UM.getEditor('myEditor').selection.getText();
		        alert(txt)
		    }
		
		    function getContentTxt() {  //纯文本
		        
		        return UM.getEditor('myEditor').getContentTxt();
		    }
		    function hasContent() {
		        var arr = [];
		        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
		        arr.push("判断结果为：");
		        arr.push(UM.getEditor('myEditor').hasContents());
		        alert(arr.join("\n"));
		    }
		    function setFocus() {
		        UM.getEditor('myEditor').focus();
		    }
		    function deleteEditor() {
		        disableBtn();
		        UM.getEditor('myEditor').destroy();
		    }
		    function disableBtn(str) {
		        var div = document.getElementById('btns');
		        var btns = domUtils.getElementsByTagName(div, "button");
		        for (var i = 0, btn; btn = btns[i++];) {
		            if (btn.id == str) {
		                domUtils.removeAttributes(btn, ["disabled"]);
		            } else {
		                btn.setAttribute("disabled", "true");
		            }
		        }
		    }
		    function enableBtn() {
		        var div = document.getElementById('btns');
		        var btns = domUtils.getElementsByTagName(div, "button");
		        for (var i = 0, btn; btn = btns[i++];) {
		            domUtils.removeAttributes(btn, ["disabled"]);
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


