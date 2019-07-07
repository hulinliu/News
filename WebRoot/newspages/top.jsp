<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<%
	String loginUser = (String)session.getAttribute("admin");
	if(loginUser == null){
%>
<script type="text/javascript">
	alert("当前页面访问受限，请重新登录管理账户！");
	open("../index.jsp","_self");	
</script>
<%		
	} 
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>新闻发布系统管理后台</title>
<link href="../CSS/admin.css" rel="stylesheet" type="text/css" />
<div id="header">
  <div id="welcome">欢迎使用新闻管理系统！</div>
  <div id="nav">
    <div id="logo"><img src="../Images/logo.jpg" alt="新闻中国" /></div>
    <div id="a_b01"><img src="../Images/a_b01.gif" alt="" /></div>
  </div>
</div>
<div id="admin_bar">
  <div id="status">管理员： 登录  &#160;&#160;&#160;&#160; <a href="../util/do_logout.jsp">login out</a></div>
  <div id="channel"> </div>
</div>
</head>
<body>
