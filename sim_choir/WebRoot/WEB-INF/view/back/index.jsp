<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>控制台管理-君科沃特</title>
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
	</head>

	<body>
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
		<div class="view-body">
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
			<div class="view-product background-color">
				<div class="padding-big background-color">
					<div class="account-info clearfix">
						<div class="text-box-main min-width-300 fl">
							<dl>
								<dt class="padding-big-left lists-border-list clearfix">
									<div class="title fl padding-big-top padding-big-bottom">
										<p>HI,${admin.username }</p>
										<p class="margin-small-top clearfix">
											<span class="fl">账户安全级别：<em class="text-blue-deep">高</em></span>
											<!--没有实名认证-->
											<!-- <a class="button bg-blue-deep icon icon-button-blue fl margin-left" href="#">立即实名认证</a> -->
											<!--通过实名认证-->
											<a class="button bg-green-deep icon icon-button-green fl margin-left" href="#">欢迎您登录</a>
										</p>
									</div>
									<span class="fr icon-head">
										<img src="http://user.haidao.la/avatar.php?uid=1504&type=virtual&size=middle" alt="账户头像">
									</span>
								</dt>
								<dd class="padding-big clearfix">
									<p class="w50 fl">
										<i class="fl icon icon-mobile"></i>

										<span class="fl margin-left">君科沃特合唱团</span>
									</p>
									<p class="w50 fl">
										<i class="fl icon icon-email"></i>

										<span class="fl margin-left">SIM CHOIR</span>
									</p>
								</dd>
							</dl>
						</div>
						<div class="text-box-main min-width-360 fl">
							<dl style="margin-left:50px;">
								<dt class="padding-big lists-border-list clearfix">
									<div class="fl w50 title">
										<p>今日访问量</p>
										<p class="margin-small-top clearfix">
											<span class="fl"><em class="h3 text-red-deep" style="font-size:27px;">${todayNum }</em></span>
										</p>
									</div>
									<div class="fl w50 padding-left title">
										<p>本周访问量</p>
										<p class="margin-small-top clearfix">
											<span class="fl"><em class="h3 text-blue-deep" style="font-size:27px;">${weekNum } </em></span>
										</p>
									</div>
								</dt>
								<dd class="padding-big">
									<div class="fl w50 title">
										<p>本月访问量</p>
										<p class="margin-small-top clearfix">
											<span class="fl"><em class="h3 text-red-deep" style="color:green;font-size:27px;">${monthNum }</em></span>
										</p>
									</div>
									<div class="fl w50 padding-left title">
										<p>总访问量</p>
										<p class="margin-small-top clearfix">
											<span class="fl"><em class="h3 text-blue-deep" style="color:orange;font-size:27px;">${totalNum }</em></span>
										</p>
									</div>
								</dd>
							</dl>
						</div>
						<div class="text-box-main min-width-300 fl margin-right-none">
							<dl>
								<dt class="padding-big lists-border-list clearfix">
									<div class="fl title">
										<p>网站管理员：</p>
										<p class="text-sliver text-default margin-small-top">
											<em class="h3 text-golden margin-big-right">QQ：</em>2477889605
										</p>
									</div>
									<div class="fr">
										<a class="button btn-orange text-white" href="tencent://message/?uin=2477889605">点击咨询</a>
									</div>
								</dt>
								<dd class="padding-big">
									<div class="account-class text-hidden">
										<p>您好，我是此网站的管理员，在使用中有任何问题，欢迎随时联系！</p>
									</div>
								</dd>
							</dl>
						</div>
					</div>

					<div class="account-product margin-big-top clearfix">
						<div class="text-box-main padding-big fl mine-product">
							<h2 class="h6 margin-big-bottom"><b>内容统计</b></h2>
							<div class="mine-product-content clearfix">
								<ul class="w50 fl lists">
									<li class="w70 lists-border-list">
										<p class="border-list-text">相册数量： <em class="orange">${albumNum+1 }</em> 个
											<a class="text-main fr" href="picture.html">查看</a>
										</p>
									</li>
									<li class="w70 lists-border-list">
										<p class="border-list-text">公告数量： <em class="orange">${noticeNum }</em> 个
											<a class="text-main fr" href="notice.html">查看</a>
										</p>
									</li>
									<li class="w70 lists-border-list">
										<p class="border-list-text">成员数量： <em class="orange">${memberNum }</em> 位
											<a class="text-main fr" href="member.html">查看</a>
										</p>
									</li>

								</ul>
								<ul class="w50 fl lists">
									<li class="w80 lists-border-list">
										<p class="border-list-text">歌曲数量： <em class="orange">${songNum }</em> 首
											<a class="text-main fr" href="song.html">查看</a>
										</p>
									</li>
									<li class="w80 lists-border-list">
										<p class="border-list-text">新闻数量： <em class="orange">${newsNum }</em> 篇
											<a class="text-main fr" href="news.html">查看</a>
										</p>
									</li>
									<li class="w80 lists-border-list">
										<p class="border-list-text">消息数量： <em class="orange">${messageNum }</em> 条
											<a class="text-main fr" href="message.html">查看</a>
										</p>
									</li>
								</ul>
							</div>
						</div>
						<div class="text-box-main padding-big fl w25">
							<a href="remark.html"><h2 class="h6 margin-big-bottom"><b>最近评论</b></h2></a>
							<ul class="lists">
								<c:forEach items="${latestRemark }" var="remark">
									<li class="lists-list">
										${remark.content }
									</li>
								</c:forEach>
							</ul>
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