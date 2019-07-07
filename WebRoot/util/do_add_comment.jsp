<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.jdit.news.bl.CommentsManager"%>
<%
	request.setCharacterEncoding("gbk");
	CommentsManager cm = new CommentsManager();
	String cauthor = request.getParameter("cauthor");
	String cnid = request.getParameter("nid");
	String cip = request.getParameter("cip");
	String ccontent = request.getParameter("ccontent");
	java.util.Date date = new java.util.Date();
	Timestamp cdate = new Timestamp(date.getTime());
	List list  = new ArrayList();
	list.add(0,cnid);
	list.add(1,ccontent);
	list.add(2,cdate);
	list.add(3,cip);
	list.add(4,cauthor);
	
	int i = cm.addComment(list);
	if(i > 0){	
%>
<script type="text/javascript">
	alert("已经成功添加评论，点击确认返回原来页面");
	open("../news_read.jsp?nid=<%=cnid%>","_self");	
</script>
<%
	}else{
%>
<script type="text/javascript">
	alert("添加评论失败！请联系管理员查找原因！点击确认返回原来页面");
	open("../news_read.jsp?nid=<%=cnid%>","_self");	
</script>
<%	
	}
%>
