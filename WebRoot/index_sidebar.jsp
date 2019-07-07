<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="org.jdit.news.bl.NewsManager"%>
<div class="sidebar">
    <h1> <img src="Images/title_1.gif" alt="国内新闻" /> </h1>
    <div class="side_list">
      <ul>
      		<%
      			NewsManager nmg = new NewsManager();
      			List news_in_topic = nmg.getNewByTid("1");
				Iterator iterator = news_in_topic.iterator();
				Map tempNew = null;
				String tempNtname = "";
				int i = 0;
				while(i < 3 && iterator.hasNext()){
					tempNew = (Map)iterator.next();					
					i++;
			%>
			<li> <a href='news_read.jsp?nid=<%=tempNew.get("nid") %>'><b> <%=tempNew.get("ntitle") %> </b></a> </li>
	      <%}%>
      </ul>
    </div>
    <h1> <img src="Images/title_2.gif" alt="国际新闻" /> </h1>
    <div class="side_list">
      <ul>
       		<%
       			news_in_topic = nmg.getNewByTid("2");
       			iterator = news_in_topic.iterator();
				i = 0;
				while(i < 3 && iterator.hasNext()){
					tempNew = (Map)iterator.next();
					i++;
			%>
			<li> <a href='news_read.jsp?nid=<%=tempNew.get("nid") %>'><b> <%=tempNew.get("ntitle") %> </b></a> </li>
	      <%}%>
      </ul>
    </div>
    <h1> <img src="Images/title_3.gif" alt="娱乐新闻" /> </h1>
    <div class="side_list">
      <ul>
        <%
        		news_in_topic = nmg.getNewByTid("5");
        		iterator = news_in_topic.iterator();
				i = 0;
				while(i < 3 && iterator.hasNext()){
					tempNew = (Map)iterator.next();
					i++;
			%>
			<li> <a href='news_read.jsp?nid=<%=tempNew.get("nid") %>'><b> <%=tempNew.get("ntitle") %> </b></a> </li>
	      <%}%>
      </ul>
    </div>
  </div>
