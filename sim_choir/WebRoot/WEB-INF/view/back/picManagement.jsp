<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>图片管理-君科沃特</title>
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
			.float-left{
				float:left;
			}
			.scroll-div{
				overflow:scroll;
				height:450px;
				overflow-x:hidden;/*隐藏水平滚动条*/
			}
			.show-img{
				width:18%;
				height:180px;
				margin-right:-5px;
				margin-left:15px;
			}
			.file-bt{
				width:7%;
				height:60px;
				background-color:#2A94DE;
				color:white;
				margin-left:6%;
				margin-right:6%;
				font-size:20px;
			}
			.add-album-div{
				position:fixed;
				top:220px;
				left:450px;
				background-color:gray;
				width:600px;
				height:340px;
				padding:10px;
				/* display:none; */
			}
			/*悬浮层显示时下面模糊*/
			.hidden-lay{
				opacity:0.3;
			}
			.add-album:hover{
				cursor:pointer;
			}
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			//更新图片，清除缓存
			$('#img1').attr('src',$('#img1').attr('src')+"?"+Math.random());
			$('#img2').attr('src',$('#img2').attr('src')+"?"+Math.random());
			$('#img3').attr('src',$('#img3').attr('src')+"?"+Math.random());
			$('#img4').attr('src',$('#img4').attr('src')+"?"+Math.random());
			$('#img5').attr('src',$('#img5').attr('src')+"?"+Math.random());
			//过长就加上滚动条
			if($('.album-tab').height()>450){
				$('.noscroll-div').addClass('scroll-div');
			}
			
			$('.add-album-div').hide();
			//添加相册事件
			$('.add-album').click(function(){
				//显示悬浮层，同时下面变模糊
				$('.add-album-div').show();
				$('.back-lay').addClass('hidden-lay');
				
				
			});
			//点击撤销悬浮层
			$('.quit-add-album').click(function(){
				$('.add-album-div').hide();
				$('.back-lay').removeClass('hidden-lay');
			});
			
		});
	</script>
	<body>
		<div class="back-lay">
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
		                <h6 class="padding-left manage-head-con">图片管理</h6>
		            </div>
		            <br/>
		            <font style="margin-left:20px;color:gray;">
		            (*单个图片上传可点击“上传”按钮，多个图片上传请点击“编辑”按钮进行上传)
		            </font>
		            <!-- 单个图片上传表单，隐藏显示 -->
		            <form action="singlePicUpload.html" method="post" enctype="multipart/form-data" id="form-id" style="display:none;">
		            	<input type="text" name="albumId" id="album-id" value=""/>
		            	<input type="file" onchange="upload()" name="file" id="file-id" class="fileUpload"/>
		            </form>
		            <div class="offcial-table input-table table-margin clearfix album-tab">
		                <div class="tr-th clearfix">
		                    <div class="th w5 text-center"></div>
		                    <div class="th w20">相册ID</div>
		                    <div class="th w20">名称</div>
		                    <div class="th w15">创建时间</div>
		                    <div class="th w15">照片数量</div>
		                    <div class="th w20">相册封面</div>
		                    <div class="th w5">编辑</div>
		                </div>
		                <div class="tr  show border-bottom-none noscroll-div">
	                		<img src="images-back/add.png" class="add-album" style="width:18px;margin-top:20px;margin-left:45px;"/>
	            			<font size="4" class="add-album" color="gray">新建相册</font>
		                	<c:if test="${albumList==null || albumList.size()==0 }">
								<span>暂时还没有相册</span>		                	
		                	</c:if>
			            	<c:forEach items="${albumList }" var="album">
			            		<div class="pic-record" style="margin-top:10px;">
				            		<div class="w20 float-left">
				            			<center>
				            			<font size="4" face="黑体" style="margin-right:100px;color:gray;">${album.id }</font>
				            			</center>
				            		</div>
				            		<div class="w20 float-left">
				            			<font style="margin-left:40px;font-size:13px;">
				            			<c:if test="${album.name.length()<=10 }">
				            				${album.name }
				            			</c:if>
				            			<c:if test="${album.name.length()>10 }">
				            				${album.name.substring(0,9) }...
				            			</c:if>
				            			</font>
				            		</div>
				            		<div class="w15 float-left">
				            			<font style="margin-left:60px;font-size:13px;">${album.date.substring(0,10) }</font>
				            		</div>
				            		<div class="w15 float-left">
				            			<font style="margin-left:80px;font-size:15px;">${album.pics.size() }</font>
				            		</div>
				            		<div class="w20 float-left">
				            			<c:if test="${album.pics!=null && album.pics.size()>0 }">
				            				<img alt="找不到图片" src="imageIO/picImage.html?picId=${album.pics.get(0).id }" style="width:80px;height:60px;margin-left:50px;">
				            			</c:if>
				            			<c:if test="${album.pics==null || album.pics.size()==0 }">
				            				<img alt="找不到图片" src="../images/notfound.png" style="width:80px;height:60px;margin-left:50px;">
				            			</c:if>
				            			
				            		</div>
				            		<div class="w10 float-left">
				            			<div style="width:50;">
				            			<input type="button" onclick="deleteAlbum(${album.id })" value="删除" style="width:30%;color:white;background-color:red;"/>
				            			<input type="button" value="上传" onclick="selectFile(${album.id })" style="width:30%;color:white;background-color:green;"/>
				            			<input type="button" value="编辑" onclick="javascript:location.href='pic-edit.html?albumId=${album.id }';" style="width:30%;color:white;background-color:#2A94DE;"/>
				            			</div>
				            		</div>
				            	</div>
			            	</c:forEach>
			            	
			            </div>
			       </div><br/><br/>
			       <div class="manage-head">
		                <h6 class="padding-left manage-head-con">首页轮播图片设置</h6>
		            </div>
		            <br/>
		            <font style="margin-left:20px;color:gray;">
		            *若要替换图片，可点击相应图片下面的“替换”按钮选择本地图片替换，最后保存设置即可=>
		            </font>&nbsp;&nbsp;&nbsp;&nbsp;
		            <input type="button" value="保存设置" onclick="saveChange()" style="background-color:green;color:white;font-size:13px;width:80px;height:40px;"/>
		            <br/>
		            <div style="margin-top:10px;">
		            <img alt="若无法显示替换后的图片，直接保存即可" src="../images/11.jpg" class="show-img" id="img1">
		            <img alt="若无法显示替换后的图片，直接保存即可" src="../images/12.jpg" class="show-img" id="img2">
		            <img alt="若无法显示替换后的图片，直接保存即可" src="../images/13.jpg" class="show-img" id="img3">
		            <img alt="若无法显示替换后的图片，直接保存即可" src="../images/14.jpg" class="show-img" id="img4">
		            <img alt="若无法显示替换后的图片，直接保存即可" src="../images/15.jpg" class="show-img" id="img5">
		            </div>
		            <div style="display:none;">
		            	<!-- 修改首页轮播图片的提交表单 -->
		            	<form action="updateMainPagePic.html" method="post" enctype="multipart/form-data" id="form-id2">
		            	<input type="file" name="file1" id="file1" onchange="fileSelected(1)"/>
		            	<input type="file" name="file2" id="file2" onchange="fileSelected(2)"/>
		            	<input type="file" name="file3" id="file3" onchange="fileSelected(3)"/>
		            	<input type="file" name="file4" id="file4" onchange="fileSelected(4)"/>
		            	<input type="file" name="file5" id="file5" onchange="fileSelected(5)"/>
		            	</form>
		            </div>
		            <div style="margin-top:10px;width:100%;height:70px;">
		            	<input type="button" onclick="openFile(1)" value="替换" id="bt1" class="file-bt"/>
		            	<input type="button" onclick="openFile(2)" value="替换" id="bt2" class="file-bt"/>
		            	<input type="button" onclick="openFile(3)" value="替换" id="bt3" class="file-bt"/>
		            	<input type="button" onclick="openFile(4)" value="替换" id="bt4" class="file-bt"/>
		            	<input type="button" onclick="openFile(5)" value="替换" id="bt5" class="file-bt"/>
		            </div>
		            <br/><br/><br/>
		            
		        </div>
		        <div class="show-page padding-big-right hidden">
					<div class="page">
					</div>
		        </div>
			</div>
		</div>
		</div>
		
		<!-- 添加相册的悬浮层 -->
		<div class="add-album-div">
			<font color="white" size="5">新建相册</font>
			<div style="background-color:black;padding-left:5px;padding-top:15px;">
			<form id="form-id3" action="addAlbum.html" method="post">
			<table>
				<tr>
					<td>
					<font color="white" size="4">相册名称：</font><br/><br/>
					</td>
					<td>
						<input id="album-name" name="name" type="text" style="width:450px;height:30px;"/>
					</td>
				</tr>
				<tr>
					<td valign="top">
					<font color="white" size="4">相册描述：</font>
					</td>
					<td>
						<textarea id="desc" name="description" style="width:450px;height:150px;resize:none;"></textarea>
						<br/><br/>
					</td>
				</tr>
				
				<tr>
					<td align="center">
						
					</td>
					<td align="center">
						<input type="button" onclick="addAlbumCheck()" value="创建" style="width:60px;height:40px;background-color:green;color:white;margin-left:200px;"/>
						<input type="button" class="quit-add-album" value="取消" style="width:60px;height:40px;background-color:red;color:white;margin-left:125px;"/>
						<br/><br/>
					</td>
				</tr>
			</table>
			</form>
			</div>
		</div>
		<!-- 添加相册的悬浮层结束 -->
		
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
			//删除相册函数
			function deleteAlbum(id){
				var isDelete = confirm("确认删除该相册吗？");
				if(isDelete){
					location.href="deleteAlbum.html?albumId="+id;
				}else{
					return false;
				};
			}
			//单张图片上传函数
			function selectFile(id){
				document.getElementById('album-id').value=id;
				//自动点击图片上传
				document.getElementById('file-id').click();
			}
			//图片上传表单提交,file改变时触发
			function upload(){
				//提交
				document.getElementById('form-id').submit();
			}
			/*
				以下函数属于首页轮播图片管理
			*/
			//替换图片时打开文件选择的函数
			function openFile(num){
				//自动点击隐藏的对应file输入项
				document.getElementById('file'+num).click();
			}
			//选择好文件后修改相应图片的函数
			function fileSelected(num){
				var imgFile = document.getElementById('file'+num).files[0];
			    var fr = new FileReader();
			    fr.onload = function() {
			        document.getElementById('img'+num).src = fr.result;
			    };
			    fr.readAsDataURL(imgFile);
			}
			//保存设置
			function saveChange(){
				//判断是否改变
				var file1 = document.getElementById('file1').value;
				var file2 = document.getElementById('file2').value;
				var file3 = document.getElementById('file3').value;
				var file4 = document.getElementById('file4').value;
				var file5 = document.getElementById('file5').value;
				if((file1==null || file1=="") 
					&& (file2==null || file2=="") 
					&& (file3==null || file3=="") 
					&& (file4==null || file4=="") 
					&& (file5==null || file5=="")){
					alert('您未修改图片，无需保存');
				}else{
					//提交表单
					document.getElementById('form-id2').submit();
					alert('保存成功');
				};
			}
			
			/*
			以下函数处理新建相册的表单提交
			*/
			function addAlbumCheck(){
				var name=document.getElementById('album-name').value;
				var desc=document.getElementById('desc').value;
				if(name==null || name==""){
					alert('相册名称不能为空！');
					return false;
				};
				if(desc==null || desc==""){
					alert('相册描述不能为空！');
					return false;
				};
				//提交表单
				alert('新建相册成功');
				document.getElementById('form-id3').submit();
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