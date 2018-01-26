<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--相册编辑页面，实现批量上传图片，删除图片，修改相册名称、相册描述等功能 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>相册编辑-君科沃特</title>
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
			.album-show{
				margin-left:30px;
				margin-top:10px;
				width:1300px;
				font-size:15px;
				
			}
			.img-show{
				float:left;
				margin:1%;
				width:255px;
				height:205px;
			}
			.add-img{
				border:1px dashed black;
			}
			.add-img:hover{
				border:1px dashed black;
				background-color:#e3e3e3;
			}
			.img2:hover{
		  		width:253px;
		  		height:203px;
		  		border:black solid 1px;
		  	}
		  	/* .img2{
		  		height:280px;
		  		width:200px;
		  	} */
		  	.disable{
		  		opacity:0.3;
		  	}
		  	/*大图原图悬浮层的样式*/
		  	.big_pic{
		  		position:fixed;
		  		top:15%;
		  		left:25%;
		  		background-color:gray;
		  		padding:10px;
		  	}
		  	.pic2{
		  		height:450px;
		  	}
		  	.change-album-name{
		  		position:fixed;
		  		top:30%;
		  		left:30%;
		  		padding:5px;
		  		background-color:gray;
		  	}
		  	.change-album-desc{
		  		position:fixed;
		  		top:20%;
		  		left:30%;
		  		padding:5px;
		  		background-color:gray;
		  	}
		  	.link{
		  		cursor:pointer;
		  	}
		  	
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.big_pic').hide();
			$('.change-album-name').hide();
			$('.change-album-desc').hide();
			$('.img-cover').hide();
			$('.delete-show-button').hide();
			$('.delete-show-button2').hide();
			
			//点击缩略图显示大图
			$('.img2').click(function(e){
				var src = $(e.target).attr('src');
				$('.pic2').attr('src',src);
				$('.big_pic').show();
				$('.back').addClass('disable');
			});
			//点击大图恢复
			$('.big_pic').click(function(){
				$('.big_pic').hide();
				$('.back').removeClass('disable');
			});
			
			//点击显示修改相册名称
			$('.change-album-name-a').click(function(){
				$('.change-album-name').show();
				$('.back').addClass('disable');
			});
			//点击取消
			$('.change-album-name-quit').click(function(){
				$('.change-album-name').hide();
				$('.back').removeClass('disable');
			});
			
			//点击显示修改相册描述
			$('.change-album-desc-a').click(function(){
				$('.change-album-desc').show();
				$('.back').addClass('disable');
			});
			//点击取消
			$('.change-album-desc-quit').click(function(){
				$('.change-album-desc').hide();
				$('.back').removeClass('disable');
			});
			//点击删除图片显示覆盖层
			$('.delete-pic').click(function(){
				$('.img-cover').show();
				$('.delete-show-button').show();
				$('.delete-show-button2').show();
			});
			//点击取消删除
			$('.delete-show-button').click(function(){
				$('.delete-show-button').hide();
				$('.delete-show-button2').hide();
				$('.img-cover').hide();
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
		                <h6 class="padding-left manage-head-con">图片管理-编辑相册《${album.name }》</h6>
		            </div>
		            <br/>
		            <div class="album-show">
		            	<em><b>相册名称：</b></em>${album.name }&nbsp;&nbsp;
		            	<font class="change-album-name-a link" style="color:red;font-size:14px;text-decoration:underline;">修改</font>
		            	<br/><br/>
		            	<em><b>相册描述：</b></em>${album.description }&nbsp;&nbsp;
		            	<font class="change-album-desc-a link" style="color:red;font-size:14px;text-decoration:underline;">修改</font>
		            	<br/><br/>
		            	<em><b>图片数量：</b></em>${album.pics.size() }
		            	<br/><br/>
		            	<em><b>相册图片：</b></em>&nbsp;&nbsp;
		            	<font class="delete-pic link" style="color:red;font-size:14px;text-decoration:underline;">批量删除</font>
		            	<br/>
		            	<font color="gray" style="font-size:13px;">
		            	&nbsp;&nbsp;(*点击“批量删除”后勾选想要删除的图片，点击“确定删除”即可删除图片)
		            	</font>
		            	<input class="delete-show-button2" type="button" value="确定删除" onclick="deletePics()" style="width:80px;height:30px;background-color:red;margin-left:20px;color:white"/>
		            	<input class="delete-show-button" type="button" value="取消" style="width:80px;height:30px;background-color:blue;margin-left:20px;color:white"/>
		            	<br/>
		            	<c:forEach items="${album.pics }" var="pic">
		            		<div class="img-show" style="position:relative;">
		            			<img alt="图片加载出错" title="点击查看大图" class="img2" src="imageIO/picImage.html?picId=${pic.id }" style="width:250px;height:200px;">
		            			<div class="img-cover" style="opacity:0.8;background-color:gray;position:absolute;top:0px;width:251px;height:201px;">
		            				<input id="checkbox1" onclick="addDelete(this,${pic.id })" type="checkbox" style="width:30px;height:30px;margin-left:220px;"/>
		            			</div>
		            		</div>
		            	</c:forEach>
		            	<div class="img-show add-img">
	            			<img alt="添加图片" title="添加图片" src="images-back/big-add.png" onclick="multipleFileUpload()" style="width:250px;height:200px;">
	            		</div>
		            </div>
		        </div>
		        <div style="width:145px;">
		        	<input type="button" onclick="location.href='picture.html'" value="返回" style="width:100px;height:40px;background-color:green;color:white;font-size:15px;margin-top:30px;margin-left:45px;"/>
		        </div>
		        <div style="display:none;">
		        	<form action="multiplePicUpload.html" method="post" id="form-id4" enctype="multipart/form-data"> 
		        	<!-- 多文件选择器 -->
		        	<input type="file" multiple id="multiple-file" name="multipleFile" onchange="multiFileChange()" />
		        	<input type="hidden" name="id" value="${album.id }"/>
		        	</form>
		        	
		        	<input type="hidden" id="request-album-name" value="${album.name }"/>
		        	<input type="hidden" id="request-album-desc" value="${album.description }"/>
		        </div>
		        <!-- 要删除的pic的id集合 -->
		        <form action="deletePics.html" id="form-id3" method="post">
		        <input type="hidden" name="id" value="${album.id }"/>
		        <input type="hidden" name="pics" id="delete-pic-value"/>
				</form>
			</div>
		</div>
		</div>
		
		<!-- 大图悬浮层 -->
		<div class="big_pic">
			<font color="white"size="5">点击图片关闭大图浏览</font><br/><br/>
			<img alt="无法查看原图" src="images/notfound.png" class="pic2">
		</div> 
		<!-- 大图悬浮层结束 -->
		
		<!-- 修改相册名称的悬浮层 -->
		<div class="change-album-name">
			<font color="white" size="5">修改相册名</font>
			<div style="background-color:black;padding-left:5px;padding-top:15px;">
			<form id="form-id1" action="changeAlbumName.html" method="post">
			<table>
				<tr>
					<td>
					<font color="white" size="4">输入修改名称：</font><br/><br/>
					</td>
					<td>
						<input id="album-name" name="name" type="text" style="width:450px;height:30px;" value="${album.name }"/>
					</td>
					<td>
						<input  name="id" type="hidden" value="${album.id }"/>
					</td>
				</tr>
				
				<tr>
					<td align="center">
						
					</td>
					<td align="center">
						<input type="button" onclick="changeAlbumName()" value="确定" style="width:60px;height:40px;background-color:green;color:white;margin-left:200px;"/>
						<input type="button" class="change-album-name-quit" value="取消" style="width:60px;height:40px;background-color:red;color:white;margin-left:125px;"/>
						<br/><br/>
					</td>
				</tr>
			</table>
			</form>
			</div>
		</div>
		<!-- 修改相册名称的悬浮层结束 -->
		
		
		<!-- 修改相册描述的悬浮层 -->
		<div class="change-album-desc">
			<font color="white" size="5">修改相册描述</font>
			<div style="background-color:black;padding-left:5px;padding-top:15px;">
			<form id="form-id2" action="changeAlbumDesc.html" method="post">
			<table>
				<tr>
					<td valign="top">
					<font color="white" size="4">输入修改描述：</font><br/><br/>
					</td>
					<td>
						<textarea  id="album-desc" name="desc" style="height:250px;width:450px;resize:none;">${album.description }</textarea>
					</td>
					<td>
						<input  name="id" type="hidden" value="${album.id }"/>
					</td>
				</tr>
				
				<tr>
					<td align="center">
						
					</td>
					<td align="center">
						<input type="button" onclick="changeAlbumDesc()" value="确定" style="width:60px;height:40px;background-color:green;color:white;margin-left:200px;"/>
						<input type="button" class="change-album-desc-quit" value="取消" style="width:60px;height:40px;background-color:red;color:white;margin-left:125px;"/>
						<br/><br/>
					</td>
				</tr>
			</table>
			</form>
			</div>
		</div>
		<!-- 修改相册描述的悬浮层结束 -->
		
		
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
			//修改相册名称表单提交
			function changeAlbumName(){
				var albumName=document.getElementById('album-name').value;
				var oldAlbumName=document.getElementById('request-album-name').value;
				if(albumName==""){
					alert('相册名称不能为空！');
					return false;
				}
				if(albumName==oldAlbumName){
					alert('您未修改相册名！');
					return false;
				}
				alert('修改成功！');
				document.getElementById('form-id1').submit();
			}
			
			//修改相册描述表单提交
			function changeAlbumDesc(){
				var albumDesc=document.getElementById('album-desc').value;
				var oldAlbumDesc=document.getElementById('request-album-desc').value;
				if(albumDesc==""){
					alert('相册描述不能为空！');
					return false;
				}
				if(albumDesc==oldAlbumDesc){
					alert('您未修改相册描述！');
					return false;
				}
				alert('修改成功！');
				document.getElementById('form-id2').submit();
			}
			
			//批量删除选择图片事件
			function addDelete(checkbox,id){
				if(checkbox.checked==true){
					//将要删除的图片id写入隐藏项中
					document.getElementById('delete-pic-value').value=document.getElementById('delete-pic-value').value+"("+id+")";
					//alert(document.getElementById('delete-pic-value').value);
				}else{
					//删除撤销的id
					var pics=document.getElementById('delete-pic-value').value;
					//alert(pics.substring(0,pics.indexOf("("+id+")")));
					//alert(pics.substring(pics.indexOf(")",pics.indexOf("("+id+")"))+1,pics.length));
					document.getElementById('delete-pic-value').value=
					pics.substring(0,pics.indexOf("("+id+")"))
					+pics.substring(pics.indexOf(")",pics.indexOf("("+id+")"))+1,pics.length);
					//alert(document.getElementById('delete-pic-value').value);
				}
			}
			//批量删除的提交
			function deletePics(){
				var pics=document.getElementById('delete-pic-value').value;
				if(pics==""){
					alert('您未选择任何图片');
					return false;
				}
				document.getElementById('delete-pic-value').value=pics.substring(1,pics.length)+"(";
				document.getElementById('form-id3').submit();
			}
			/*以下函数属于多图片上传*/
			//多文件上传显示文件选择器
			function multipleFileUpload(){
				document.getElementById('multiple-file').click();
			}
			//文件选择后出发事件
			function multiFileChange(){
				/* var files = document.getElementById('multiple-file').files;
				for(var i = 0;i<files.length;i++){
					alert(files[i].name);
				}; */
				//提交多文件表单
				document.getElementById('form-id4').submit();
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