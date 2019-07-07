<%@page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.*,org.jdit.news.bl.*" pageEncoding="gbk"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<jsp:include page="top.jsp" />
<%
	NewsManager nm = new NewsManager();
	List list = nm.getAllnews();
%>
<div id="main">
  <jsp:include page="left.html" />
  <div id="opt_area">
    <script language="javascript">
		function clickdel(){
			return confirm("删除请点击确认");
		}	
	</script>
    <ul class="classlist">
      <%
		Iterator iterator = list.iterator();
		Map tempNew = null;
		String tempNtname = "";
		while(iterator.hasNext()){
			tempNew = (Map)iterator.next();
			//先显示新闻主题的名字，相同的主题只显示一次
			if(!tempNtname.equals(tempNew.get("tname"))){
				tempNtname = (String)tempNew.get("tname");
%>
      <li class='space'><strong><%=tempNew.get("tname") %></strong></li>
      <%	}%>
      <li><%=tempNew.get("ntitle") %><span> 作者：<%=tempNew.get("nauthor") %> &#160;&#160;&#160;&#160; <a href='news_update.jsp?nid=<%= tempNew.get("nid") %>'>修改</a> &#160;&#160;&#160;&#160; <a href='../util/do_delete_news.jsp?nid=<%=tempNew.get("nid")%>' onclick='return clickdel()'>删除</a> </span> </li>
      <%}%>
    </ul>
  </div>
</div>
<jsp:include page="bottom.html" />
