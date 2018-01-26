<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--成员管理页面 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>成员管理-君科沃特</title>
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
		  	.member-edit{
		  		width:1300px;
		  		margin-left:10px;	
		  	}
		  	.member-pic{
		  		float:left;
		  		width:205px;
		  		font-size:13px;
		  		margin:20px;
		  	}
		  	.add-member , .delete-member, .update-preview-quit{
		  		cursor:pointer;
		  	}
		  	.clickable, .big-pic-button{
		  		cursor:pointer;
		  	}
		  	.clickable:hover{
		  		text-decoration:underline;
		  	}
		  	.add-member2{
		  		position:absolute;
		  		top:20%;
		  		left:35%;
		  		width:500px;
		  		height:375px;
		  		background-color:gray;
		  		color:white;
		  		font-size:15px;
		  		padding:10px;
		  		
		  	}
		  	#form-id2{
		  		background-color:black;
		  		padding:5px;
		  	}
		  	.disable{
		  		opacity:0.3;
		  	}
		  	#update-member-name2{
		  		position:absolute;
		  		top:30%;
		  		left:35%;
		  		width:370px;
		  		padding:15px;
		  		background-color:black;
		  		font-size:20px;
		  		color:white;
		  	}
		  	#update-member-duty{
		  		position:absolute;
		  		top:30%;
		  		left:35%;
		  		width:340px;
		  		padding:15px;
		  		background-color:black;
		  		font-size:15px;
		  		color:white;
		  	}
		  	#update-member-class{
		  		position:absolute;
		  		top:30%;
		  		left:35%;
		  		width:500px;
		  		padding:15px;
		  		background-color:black;
		  		font-size:20px;
		  		color:white;
		  	}
		  	#update-member-part{
		  		position:absolute;
		  		top:30%;
		  		left:35%;
		  		width:300px;
		  		padding:15px;
		  		background-color:black;
		  		font-size:20px;
		  		color:white;
		  	}
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
		  	.img-show{
				float:left;
				margin-left:2%;
			}
			.update-preview{
				padding:10px;
				position:fixed;
				top:8%;
				left:35%;
				width:400px;
				background-color:gray;
				color:white;
				font-size:20px;
				/* display:none; */
			}
			
		</style>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.big_pic').hide();
			$('.img-cover').hide();
			$('.add-member2').hide();
			$('#update-member-name2').hide();
			$('#update-member-duty').hide();
			$('#update-member-class').hide();
			$('#update-member-part').hide();
			$('.update-preview').hide();
			
			//点击缩略图显示大图以及修改图片
			/* $('.img2').click(function(e){
				var src = $(e.target).attr('src');
				$('.pic2').attr('src',src);
				$('.big_pic').show();
				$('.back').addClass('disable');
			}); */
			//点击大图恢复
			$('.big-pic-exit').click(function(){
				$('.big_pic').hide();
				$('.back').css('opacity','');
				$('#big-pic-confirm').css('display','none');
			});
			//点击修改图片
			$('.big-pic-update').click(function(){
				$('#big-pic-file').click();
			});
			
			//点击删除成员
			$('.delete-member').click(function(){
				$('.img-cover').show();
			});
			//点击取消
			$('.delete-member-quit').click(function(){
				$('.img-cover').hide();
			});
			
			//点击添加成员
			$('.add-member').click(function(){
				$('.add-member2').show();
				$('.back').addClass('disable');
			});
			//点击取消
			$('.add-member-quit').click(function(){
				$('.add-member2').hide();
				$('.back').removeClass('disable');
			});
			
			//点击取消修改姓名
			$('.update-name-quit').click(function(){
				$('#update-member-name2').hide();
				$('.back').css('opacity','');
			});
			
			//点击取消修改职务
			$('.update-duty-quit').click(function(){
				$('#update-member-duty').hide();
				$('.back').css('opacity','');
			});
			
			//点击取消修改班级
			$('.update-class-quit').click(function(){
				$('#update-member-class').hide();
				$('.back').css('opacity','');
			});
			
			//点击取消修改声部
			$('.update-part-quit').click(function(){
				$('#update-member-part').hide();
				$('.back').css('opacity','');
			});
			
			//点击取消
			$('.update-preview-quit').click(function(){
				$('.update-preview').hide();
				$('.back').css('opacity','');
				//清空数据
				$('#update-preview-id2').val("");
				$('#set-preview-id2').val("");
			});		
		});
	</script>
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
		                <h6 class="padding-left manage-head-con">成员管理</h6>
		            </div>
		            <font color="gray" style="font-size:13px;margin-left:20px;">
		            	(*点击成员的相应数据即可修改，点击图片可查看大图或修改)
		            </font><br/>
		            <img src="images-back/add.png" class="add-member" style="width:21px;margin-top:20px;margin-left:38px;"/>
	            	<font size="5" class="add-member" color="gray">添加成员</font>
	            	<img src="images-back/minus.png" class="delete-member" style="width:21px;margin-top:20px;margin-left:38px;"/>
	            	<font size="5" class="delete-member" color="gray">删除成员</font>
	            	<input class="img-cover delete-member-confirm" type="button" value="确定删除" onclick="deleteSubmit()" style="width:80px;height:30px;background-color:red;margin-left:20px;color:white"/>
	            	<input class="img-cover delete-member-quit" type="button" value="取消" style="width:80px;height:30px;background-color:blue;margin-left:20px;color:white"/>
		            <c:forEach items="${memberList }" var="member">
		            	<div class="member-edit">
		            		<div class="member-pic" style="position:relative">
		            			<img alt="加载失败" class="img2" onclick="showBigPic(this,${member.id })" src="imageIO/memberImage.html?memberId=${member.id }" style="width:200px;height:300px;">
		            			<br/>
		            			<b>职务：</b><span class="clickable update-duty" onclick="updateDuty(${member.id })">${member.duty }</span><br/>
		            			<b>姓名：</b><span class="clickable update-name" onclick="updateName(this,${member.id })">${member.name }</span><br/>
		            			<b>声部：</b>
		            			<span class="clickable update-part" onclick="updatePart(${member.id })">
		            			<c:if test="${member.part.equals(\"S\") }">女高声部</c:if>   
                               	<c:if test="${member.part.equals(\"A\") }">女低声部</c:if>
                               	<c:if test="${member.part.equals(\"T\") }">男高声部</c:if>
                               	<c:if test="${member.part.equals(\"B\") }">男低声部</c:if>                                     
                               	</span>
                               <br>
                               <b>班级：</b><span class="clickable update-class" onclick="updateClass(${member.id })">${member.grade }级${member.major }</span>
		            			<!-- 覆盖层 -->
		            			<div class="img-cover" style="position:absolute;width:200px;height:375px;background-color:gray;top:0px;opacity:0.8;">
		            				<input type="checkbox" onclick="addDelete(this,${member.id })" style="margin-left:177px;width:25px;height:25px;"/>
		            			</div>
		            		</div>
		            	</div>
		            </c:forEach>
		            <div style="width:145px;">
			        	<input type="button" onclick="location.href='main.html'" value="返回" 
			        	style="width:100px;height:40px;background-color:green;color:white;font-size:15px;margin-top:20px;margin-left:35px;margin-bottom:30px;"/>
			        </div>
			        
			        <div class="manage-head">
		                <h6 class="padding-left manage-head-con">成员预览设置</h6>
		            </div>
		            <font color="gray" style="font-size:13px;margin-left:20px;">
		            	(*点击预览位置，选择相应的成员)<br/>
		            </font><br/>
		            <c:if test="${previewMember.size()>=3 }">
			            <c:forEach items="${previewMember }" var="member">
				            <div class="img-show add-img">
		            			<img alt="点击更换" title="点击更换" onclick="updatePreview(${member.id })" src="imageIO/memberImage.html?memberId=${member.id }" onclick="" style="width:200px;height:300px;">
		            		</div>
	            		</c:forEach>
            		</c:if>
            		<c:if test="${previewMember.size()==2 }">
            			<c:forEach items="${previewMember }" var="member">
				            <div class="img-show add-img">
		            			<img alt="点击更换" title="点击更换" onclick="updatePreview(${member.id })" src="imageIO/memberImage.html?memberId=${member.id }" onclick="" style="width:200px;height:300px;">
		            		</div>
	            		</c:forEach>
	            		<div class="img-show add-img">
	            			<img alt="点击更换" title="点击更换" onclick="setPreview(3)" src="images-back/big-add.png"  onclick="" style="width:200px;height:300px;border:dashed gray 1px;">
	            		</div>
            		</c:if>
            		<c:if test="${previewMember.size()==1 }">
            			<c:forEach items="${previewMember }" var="member">
				            <div class="img-show add-img">
		            			<img alt="点击更换" title="点击更换" onclick="updatePreview(${member.id })" src="imageIO/memberImage.html?memberId=${member.id }" onclick="" style="width:200px;height:300px;">
		            		</div>
	            		</c:forEach>
	            		<div class="img-show add-img">
	            			<img alt="点击更换" title="点击更换" onclick="setPreview(2)" src="images-back/big-add.png"  onclick="" style="width:200px;height:300px;border:dashed gray 1px;">
	            		</div>
	            		<div class="img-show add-img">
	            			<img alt="点击更换" title="点击更换" onclick="setPreview(3)" src="images-back/big-add.png"  onclick="" style="width:200px;height:300px;border:dashed gray 1px;">
	            		</div>
            		</c:if>
            		<c:if test="${previewMember.size()==0 }">
	            		<div class="img-show add-img">
	            			<img alt="点击更换" title="点击更换" onclick="setPreview(1)" src="images-back/big-add.png"  onclick="" style="width:200px;height:300px;border:dashed gray 1px;">
	            		</div>
	            		<div class="img-show add-img">
	            			<img alt="点击更换" title="点击更换" onclick="setPreview(2)" src="images-back/big-add.png"  onclick="" style="width:200px;height:300px;border:dashed gray 1px;">
	            		</div>
	            		<div class="img-show add-img">
	            			<img alt="点击更换" title="点击更换" onclick="setPreview(3)" src="images-back/big-add.png"  onclick="" style="width:200px;height:300px;border:dashed gray 1px;">
	            		</div>
            		</c:if>
		        </div>
			</div>
		</div>
		</div>
		
		<!-- 删除成员的表单 -->
		<form action="deleteMember.html" method="post" id="form-id1">
			<input type="hidden" name="deleteIds" id="delete-id"/>
		</form>
		<!-- 删除成员的表单结束 -->
		
		<!-- 添加成員悬浮层 -->
		<div class="add-member2">
			<font style="font-size:20px;">添加成员</font>
			<form action="addMember.html" method="post" id="form-id2" enctype="multipart/form-data">
				<table style="padding:5px;">
					<tr>
						<td>成员姓名：</td>
						<td><input type="text" id="member-name" name="name" style="width:300px;height:25px;"/></td>
					</tr>
					<tr>
						<td>成员职务：</td>
						<td>
							<select id="member-duty" name="duty" >
								<option value="0">-----请选择-----</option>
								<option value="1">团长</option>
								<option value="2">副团长</option>
								<option value="3">支书</option>
								<option value="4">宣传委员</option>
								<option value="5">组织委员</option>
								<option value="6">男高声部长</option>
								<option value="7">男低声部长</option>
								<option value="8">女高声部长</option>
								<option value="9">女低声部长</option>
								<option value="10">团员</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>成员班级：</td>
						<td>
							<select id="member-grade" name="grade">
								<option value="0">-----请选择-----</option>
								<option value="1">20<%=((new Date()).getYear())%100 %></option>
								<option value="2">20<%=((new Date()).getYear())%100-1 %></option>
								<option value="3">20<%=((new Date()).getYear())%100-2 %></option>
								<option value="4">20<%=((new Date()).getYear())%100-3 %></option>
								<option value="5">20<%=((new Date()).getYear())%100-4 %></option>
							</select>
							级
							<select id="member-major" name="major">
								<option value="0">------------请选择------------</option>
								<option value="1">信息管理与信息系统</option>
								<option value="2">电子商务</option>
								<option value="3">档案学</option>
								<option value="4">图书馆学</option>
								<option value="5">编辑出版学</option>
								<option value="6">数字出版学</option>
								<option value="7">编辑出版学数字出版方向</option>
								<option value="8">管理科学与工程类</option>
								<option value="9">信息管理类</option>
							</select>
							专业
						</td>
					</tr>
					<tr>
						<td>成员声部：</td>
						<td>
							<select id="member-part" name="part">
								<option value="0">-----请选择-----</option>
								<option value="1">女高声部</option>
								<option value="2">女低声部</option>
								<option value="3">男高声部</option>
								<option value="4">男低声部</option>
							</select>
						</td>
					</tr>
					<tr>
						<td valign="top">
							成员照片:
						</td>
						<td>
							<img src="../images/notfound.png" id="member-pic" style="width:200px;height:150px;background-color:white;"/>
							<br/>
							<input type="file" id="member-pic-file" name="pic" onchange="showInImg()"/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="button" onclick="addMemberSubmit()" value="确认添加" style="width:100px;height:30px;background-color:blue;color:white;margin-top:10px;margin-right:30px;"/>
							<input type="button" class="add-member-quit" value="取消" style="width:100px;height:30px;background-color:red;color:white;margin-top:10px;margin-right:30px;"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 添加成员悬浮层结束 -->
		
		<!-- 修改成员姓名的悬浮层 -->
		<div id="update-member-name2">
			<form action="updateMemberName.html" method="post" id="form-id3">
				修改姓名：
				<input type="text" name="name" id="update-member-name"/>
				<br/>
				<input type="button" onclick="updateNameSubmit()" value="修改" style="width:80px;height:30px;background-color:blue;color:white;margin-top:10px;margin-right:30px;margin-left:135px;"/>
				<input type="button" class="update-name-quit" value="取消" style="width:80px;height:30px;background-color:red;color:white;margin-top:10px;"/>
				<!-- 隐藏项，存储成员id -->
				<input type="hidden" name="id" id="update-name-id" />
			</form>
		</div>
		<!-- 修改成员姓名的悬浮层 -->
		
		<!-- 修改成员职务的悬浮层 -->
		<div id="update-member-duty">
			<form action="updateMemberDuty.html" method="post" id="form-id4">
				修改职务：
				<select id="update-duty-text" name="duty">
					<option value="0">-------------请选择-------------</option>
					<option value="1">团长</option>
					<option value="2">副团长</option>
					<option value="3">支书</option>
					<option value="4">宣传委员</option>
					<option value="5">组织委员</option>
					<option value="6">男高声部长</option>
					<option value="7">男低声部长</option>
					<option value="8">女高声部长</option>
					<option value="9">女低声部长</option>
					<option value="10">团员</option>
				</select>
				<br/>
				<input type="button" onclick="updateDutySubmit()" value="修改" style="width:60px;height:25px;background-color:blue;color:white;margin-top:10px;margin-right:30px;margin-left:100px;"/>
				<input type="button" class="update-duty-quit" value="取消" style="width:60px;height:25px;background-color:red;color:white;margin-top:10px;"/>
				<!-- 隐藏项，存储成员id -->
				<input type="hidden" name="id" id="update-duty-id" />
			</form>
		</div>
		<!-- 修改成员职务的悬浮层 -->
		
		<!-- 修改成员班级的悬浮层 -->
		<div id="update-member-class">
			<form action="updateMemberClass.html" method="post" id="form-id5">
				修改班级：
				<select id="update-grade-text" name="grade">
					<option value="0">---请选择---</option>
					<option value="1">20<%=((new Date()).getYear())%100 %></option>
					<option value="2">20<%=((new Date()).getYear())%100-1 %></option>
					<option value="3">20<%=((new Date()).getYear())%100-2 %></option>
					<option value="4">20<%=((new Date()).getYear())%100-3 %></option>
					<option value="5">20<%=((new Date()).getYear())%100-4 %></option>
				</select>
				级
				<select id="update-major-text" name="major">
					<option value="0">---------请选择---------</option>
					<option value="1">信息管理与信息系统</option>
					<option value="2">电子商务</option>
					<option value="3">档案学</option>
					<option value="4">图书馆学</option>
					<option value="5">编辑出版学</option>
					<option value="6">数字出版学</option>
					<option value="7">编辑出版学数字出版方向</option>
					<option value="8">管理科学与工程类</option>
					<option value="9">信息管理类</option>
				</select>
				专业
				<br/>
				<input type="button" onclick="updateClassSubmit()" value="修改" style="width:60px;height:25px;background-color:blue;color:white;margin-top:10px;margin-right:30px;margin-left:288px;"/>
				<input type="button" class="update-class-quit" value="取消" style="width:60px;height:25px;background-color:red;color:white;margin-top:10px;"/>
				<!-- 隐藏项，存储成员id -->
				<input type="hidden" name="id" id="update-class-id" />
			</form>
		</div>
		<!-- 修改成员班级的悬浮层 -->
		
		<!-- 修改成员声部的悬浮层 -->
		<div id="update-member-part">
			<form action="updateMemberPart.html" method="post" id="form-id6">
				修改声部：
				<select id="update-part-text" name="part">
					<option value="0">---------请选择---------</option>
					<option value="1">女高声部</option>
					<option value="2">女低声部</option>
					<option value="3">男高声部</option>
					<option value="4">男低声部</option>
				</select>
				<br/>
				<input type="button" onclick="updatePartSubmit()" value="修改" style="width:60px;height:25px;background-color:blue;color:white;margin-top:10px;margin-right:30px;margin-left:94px;"/>
				<input type="button" class="update-part-quit" value="取消" style="width:60px;height:25px;background-color:red;color:white;margin-top:10px;"/>
				<!-- 隐藏项，存储成员id -->
				<input type="hidden" name="id" id="update-part-id" />
			</form>
		</div>
		<!-- 修改成员声部的悬浮层 -->
		
		<!-- 大图悬浮层 -->
		<div class="big_pic" id="big-pic">
			<font color="white"size="5" class="big-pic-button big-pic-update" >修改图片</font>
			<font color="red"size="5" class="big-pic-button  big-pic-exit" style="float:right;">退出</font><br/><br/>
			<form id="form-id7" action="updateMemberPic.html" method="post" enctype="multipart/form-data" >
			<input type="file" name="photo" id="big-pic-file" onchange="showUpdateImg()" style="display:none;"/>
			<!-- 隐藏项，存储成员id -->
			<input type="hidden" name="id" id="update-pic-id" />
			</form>
			<img alt="无法查看原图" id="pic2" src="images/notfound.png" class="pic2"><br/>
			<input type="button" value="确认更换" onclick="updatePicSubmit()" id="big-pic-confirm" style="width:80px;height:30px;background-color:blue;color:white;font-size:15px;display:none;"/>
		</div> 
		<!-- 大图悬浮层结束 -->
		
		<!-- 修改预览成员悬浮层 -->
		<div class="update-preview" id="update-preview">
			<span style="margin-left:10px;">选择成员</span><span class="update-preview-quit" style="color:red;float:right;margin-right:40px;">取消</span><br/>
			<div style="overflow:auto;height:540px;">
			<c:forEach items="${memberList }" var="member">
				<c:if test="${member.previewOrder==0 }">
				<div style="float:left;margin-left:10px;margin-right:10px;margin-bottom:10px;">
					<img onclick="updatePreviewSubmit(${member.id })" src="imageIO/memberImage.html?memberId=${member.id }" style="width:150px;height:225px;background-color:white;"/>
					<br/>${member.name }<br/>
				</div>
				</c:if>
			</c:forEach>
			</div>
			<form action="updatePreview.html" method="post" style="display:none;" id="form-id8">
				<input type="hidden" id="update-preview-id" name="selectId"/>
				<input type="hidden" id="update-preview-id2" name="id"/>
			</form>
			<form action="setPreview.html" method="post" style="display:none;" id="form-id9">
				<input type="hidden" id="set-preview-id" name="selectId"/>
				<input type="hidden" id="set-preview-id2" name="previewOrder"/>
			</form>
		</div>
		<!-- 修改预览成员悬浮层结束 -->
		
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
			
			/*以下是删除成员的函数*/
			//多选框选择事件
			function addDelete(checkbox,id){
				if(checkbox.checked==true){//选中删除
					var ids = document.getElementById('delete-id').value;
					document.getElementById('delete-id').value = ids+"("+id+")";
					//alert(document.getElementById('delete-id').value);
				}else{ //撤销选中
					var ids = document.getElementById('delete-id').value;
					document.getElementById('delete-id').value = 
					ids.substring(0,ids.indexOf("("+id+")"))
					+ids.substring(ids.indexOf(")",ids.indexOf("("+id+")"))+1,ids.length);
					//alert(document.getElementById('delete-id').value);
				};
			}
			//确认删除
			function deleteSubmit(){
				var ids = document.getElementById('delete-id').value;
				if(ids==""){
					alert("您未选中任何成员");
					return false;
				}else{
					document.getElementById('delete-id').value=ids.substring(1,ids.length)+"(";
					//alert('提交删除');
					document.getElementById('form-id1').submit();
				}; 
			}
			
			
			/*
			以下是添加成员函数
			*/
			//选择文件加载到图片上
			function showInImg(){
				var imgFile = document.getElementById('member-pic-file').files[0];
				var fr = new FileReader();
				fr.onload=function(){
					document.getElementById('member-pic').src=fr.result;
				};
				fr.readAsDataURL(imgFile);
			}
			//提交添加成员的表单
			function addMemberSubmit(){
				var name=document.getElementById("member-name").value;
				var duty=document.getElementById("member-duty").value;
				var grade=document.getElementById("member-grade").value;
				var major=document.getElementById("member-major").value;
				var part=document.getElementById("member-part").value;
				var pic=document.getElementById("member-pic-file").value;
				if(name==""){
					alert("成员姓名不能为空");
					return false;
				}
				if(duty==0){
					alert("成员职务不能为空");
					return false;
				}
				if(grade==0){
					alert("成员年级不能为空");
					return false;
				}
				if(major==0){
					alert("成员专业不能为空");
					return false;
				}
				if(part==0){
					alert("成员声部不能为空");
					return false;
				}
				if(pic==""){
					alert("成员照片不能为空");
					return false;
				}
				document.getElementById('form-id2').submit();
			}
			
			/*
			以下是修改成员属性的函数
			*/
			//显示修改姓名表单
			function updateName(span,id){
				document.getElementById('update-member-name').value=span.innerHTML;
				document.getElementById('update-name-id').value=id;//设置成员id
				document.getElementById('update-member-name2').style.display="inline";
				document.getElementById('back').style.opacity="0.3";
				
			}
			//提交修改姓名
			function updateNameSubmit(){
				var name=document.getElementById("update-member-name").value;
				if(name==""){
					alert('姓名不能为空！');
					return false;
				};
				document.getElementById('form-id3').submit();
			}
			
			//显示修改职务表单
			function updateDuty(id){
				document.getElementById('update-member-duty').style.display="inline"; //显示表单
				document.getElementById('back').style.opacity="0.3"; //底层透明
				document.getElementById('update-duty-id').value=id;
				
			}
			//提交修改职务表单
			function updateDutySubmit(){
				var duty=document.getElementById('update-duty-text').value;
				if(duty==0){
					alert("职务不能为空！");
					return false;
				};
				document.getElementById('form-id4').submit();
			}
			
			//显示修改班级表单
			function updateClass(id){
				document.getElementById('update-member-class').style.display="inline"; //显示表单
				document.getElementById('back').style.opacity="0.3"; //底层透明
				document.getElementById('update-class-id').value=id;
			}
			//提交修改班級的表单
			function updateClassSubmit(){
				var grade=document.getElementById('update-grade-text').value;
				var major=document.getElementById('update-major-text').value;
				
				if(grade==0){
					alert("年级不能为空！");
					return false;
				};			
				if(major==0){
					alert("专业不能为空！");
					return false;
				};	
				document.getElementById('form-id5').submit();
			}
			
			//显示修改声部表单
			function updatePart(id){
				document.getElementById('update-member-part').style.display="inline"; //显示表单
				document.getElementById('back').style.opacity="0.3"; //底层透明
				document.getElementById('update-part-id').value=id;
			}
			//提交修改声部表单
			function updatePartSubmit(){
				var part=document.getElementById('update-part-text').value;
				if(part==0){
					alert("声部不能为空！");
					return false;
				};
				document.getElementById('form-id6').submit();
			}
			
			//显示大图
			function showBigPic(img,id){
				document.getElementById('big-pic').style.display="inline"; //显示表单
				document.getElementById('pic2').src=img.src;
				document.getElementById('back').style.opacity="0.3"; //底层透明
				document.getElementById('update-pic-id').value=id;
			}
			//实时显示更换的图片
			function showUpdateImg(){
				document.getElementById('big-pic-confirm').style.display="inline";//显示确认按钮
				//设置文件读取器
				var imgFile=document.getElementById('big-pic-file').files[0];
				var fr= new FileReader();
				//读取文件的回调
				fr.onload=function(){
					document.getElementById('pic2').src=fr.result;
				};
				fr.readAsDataURL(imgFile);
			}
			//提交更换图片
			function updatePicSubmit(){
				document.getElementById('form-id7').submit();
			}
			
			//选择替换预览成员
			function updatePreview(id){
				document.getElementById('update-preview').style.display="inline";
				document.getElementById('back').style.opacity="0.3";
				document.getElementById('update-preview-id2').value=id;
			}
			function setPreview(id){
				document.getElementById('update-preview').style.display="inline";
				document.getElementById('back').style.opacity="0.3";
				document.getElementById('set-preview-id2').value=id;
			}
			
			//提交替换预览成员
			function updatePreviewSubmit(id){
				var yes=confirm("确认替换？");
				if(yes){
					if(document.getElementById('update-preview-id2').value!=""){
						document.getElementById('update-preview-id').value=id;
						document.getElementById('form-id8').submit();	
					};
					if(document.getElementById('set-preview-id2').value!=""){
						document.getElementById('set-preview-id').value=id;
						document.getElementById('form-id9').submit();	
					};
					
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