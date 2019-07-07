<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.*,org.jdit.news.bl.TopicManager" pageEncoding="gbk"%>
<jsp:include page="top.jsp" />
<%
TopicManager tm=new TopicManager();
List list=tm.getAllTopics();
%>
<div id="main">
  <jsp:include page="left.html" />
  <div id="opt_area">
    <ul class="classlist">
      <%
		Iterator iterator = list.iterator();
		Topic tempTopic = null;
		while(iterator.hasNext()){
			tempTopic = (Topic)iterator.next();
%>
      <li> &#160;&#160;&#160;&#160; <%=tempTopic.getTname() %> &#160;&#160;&#160;&#160; <a href='#'>ÐÞ¸Ä</a> &#160;&#160;&#160;&#160; <a href='#'>É¾³ý</a> </li>
      <%}%>
    </ul>
  </div>
</div>
<jsp:include page="bottom.html" />
