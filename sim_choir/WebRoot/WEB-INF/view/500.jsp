<%@ page language="java" import="java.util.*" import="com.sim_choir.entity.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!doctype html>
<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>500 - 对不起，服务器出错！-君科沃特</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="icon" href="images/logo.png" type="image/x-icon" />
<!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>
<div id="wrapper"><a class="logo" href="/"></a>
  <div id="main">
    <header id="header">
      <h1><span class="icon">!</span>500<span class="sub">error in server</span></h1>
    </header>
    <div id="content">
      <h2>服务器出现了问题！</h2>
      <p>当您看到这个页面,表示服务器端出现了异常,请联系站长进行处理。</p>
    </div>
  </div>
</div>
</html>