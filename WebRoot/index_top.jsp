<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.*" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>�����й�</title>
<link href="CSS/main.css" rel="stylesheet" type="text/css" />
<script language="javascript">
	function check(){
		var login_username = document.getElementById("uname");
		var login_password = document.getElementById("upwd");
		if(login_username.value == ""){
			alert("�û�������Ϊ�գ����������룡");
			login_username.focus();	
			return false;
		}else if(login_password.value == ""){
			alert("���벻��Ϊ�գ����������룡");
			login_password.focus();
			return false
		}
		return true;
	}
	
	function focusOnLogin(){
		var login_username = document.getElementById("uname");
		login_username.focus();	
	}
</script>
</head>
<body onload="focusOnLogin()">
<div id="header">
  <div id="top_login">
<%
	String user = (String)session.getAttribute("admin");
	if(user == null){
%>
    <form action="util/do_login.jsp" method="post" onsubmit="return check()">
      <input type="text" name="uname" value="" class="login_input" />
      <label> ��&#160;&#160;�� </label>
      <input type="password" name="upwd" value="" class="login_input" />
      <input type="submit" class="login_sub" value="��¼" />
      <label id="error"> </label>
      <img src="Images/friend_logo.gif" alt="Google" id="friend_logo" />
    </form>
<% 
	}else{
%>
	��ӭ����<%=user %> &nbsp; &nbsp; &nbsp;<a href="newspages/admin.jsp">��¼����̨</a> &nbsp; <a href="util/do_logout.jsp">�˳�</a>
<%	}%>
  </div>
  <div id="nav">
    <div id="logo"> <img src="Images/logo.jpg" alt="�����й�" /> </div>
    <div id="a_b01"> <img src="Images/a_b01.gif" alt="" /> </div>
    <!--mainnav end-->
  </div>
</div>

