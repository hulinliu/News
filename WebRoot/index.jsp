<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.*" pageEncoding="gbk"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.jdit.news.bl.NewsManager"%>
<jsp:include page="index_top.jsp"></jsp:include>
<%
	NewsManager nm = new NewsManager();
	int total_news = nm.countNews();  //����������
	int page_news = 15;                           //ÿһҳ��ʾ��������
	int total_page = total_news/page_news + 1;   //��ҳ��
	String page_no_str = request.getParameter("page_no");     //��ǰ�ڼ�ҳ
	int page_no = 1;      //Ĭ�ϵ�ǰ��ʾ��һҳ
	if(page_no_str != null)
		page_no = Integer.valueOf(page_no_str);
	String tid = request.getParameter("tid");
	List news_list;
	if(tid == null)
	    //��ʾ�������������·����ĵ�һҳ����
		news_list = nm.getAllnewsByPage(page_news, page_no); 
	else
	    //��ʾѡ�����������·����ĵ�һҳ����
		news_list = nm.getAllnewsByPageAndTid(page_news, page_no,tid);
	List topic_list = nm.getAllTopics();	
%>
<div id="container">
<jsp:include page="index_sidebar.jsp" />
  <div class="main">
    <div class="class_type"> <img src="Images/class_type.gif" alt="��������" /> </div>
    <div class="content">
      <ul class="class_date">
      	<li id='class_month'>
      	<%
			Iterator iterator = topic_list.iterator();
			Map tempTopic = null;
			int i = 0;
			while(iterator.hasNext()){
				tempTopic = (Map)iterator.next();
				if(i != 0 && i%11 == 0){
		%>
					<li id='class_month'>
		<%
				}
		%>
				<a href="index.jsp?tid=<%=tempTopic.get("tid") %>"><b><%=tempTopic.get("tname") %> </b></a> 
		<%				
				if(i != 0 && i%11 == 0){
				
		%>
					</li>
		<%
				}
				i++;
		%>
      		
      <%}%>
      
      </ul>
      <ul class="classlist"> 
		    <%
				iterator = news_list.iterator();
				Map tempNew = null;
				while(iterator.hasNext()){
					tempNew = (Map)iterator.next();
			%>
	      <li><a href="news_read.jsp?nid=<%=tempNew.get("nid") %>"> <%=tempNew.get("ntitle") %> </a><span> <%=tempNew.get("ncreatedate") %> </span></li>
	      <%}%>
			<%
				if(tid == null){
				if(page_no == 1){
			%>
	     	<p align="right"> ��ǰҳ��:[<%=page_no %>/<%=total_page %>]&nbsp; <a href="index.jsp?page_no=2">��һҳ</a> <a href="index.jsp?page_no=<%=total_page %>">ĩҳ</a> </p>
			<%
				}else if(page_no == total_page){
			%>
			<p align="right"> ��ǰҳ��:[<%=total_page %>/<%=total_page %>]&nbsp; <a href="index.jsp?page_no=1">��ҳ</a><a href="index.jsp?page_no=<%=page_no-1 %>">��һҳ</a></p>
			<%
				}else{
			%>
				<p align="right"> ��ǰҳ��:[<%=page_no %>/<%=total_page %>]&nbsp; <a href="index.jsp?page_no=1">��ҳ</a><a href="index.jsp?page_no=<%=page_no-1 %>">��һҳ</a><a href="index.jsp?page_no=<%=page_no+1 %>">��һҳ</a> <a href="index.jsp?page_no=<%=total_page %>">ĩҳ</a></p>
			<%
				}
				}
			%>      
       </ul>
    </div>
    <jsp:include page="index_rightbar.html" />
  </div>
</div>
<jsp:include page="index_bottom.html" />
