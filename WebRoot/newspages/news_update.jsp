<%@ page language="java" import="java.util.*,java.sql.*,org.jdit.news.bl.*" pageEncoding="gbk"%>
<%@page import="org.jbit.news.bean.Topic"%>
<jsp:include page="top.jsp" />
<%
	String nid=request.getParameter("nid");
	NewsManager nm = new NewsManager();
	Map tempNews=nm.getNewsByNid(nid);
	List list = nm.getAllTopics();
%>
<script type="text/javascript">
	function check(){
		var ntitle = document.getElementById("ntitle");
		var nauthor = document.getElementById("nauthor");
		var nsummary = document.getElementById("nsummary");
		var ncontent = document.getElementById("ncontent");
		if(ntitle.value == ""){
			alert("标题不能为空！！");
			ntitle.focus();
			return false;
		}else if(nauthor.value == ""){
			alert("作者不能为空！！");
			nauthor.focus();
			return false;
		}else if(nsummary.value == ""){
			alert("摘要不能为空！！");
			nsummary.focus();
			return false;
		}else if(ncontent.value == ""){
			alert("内容不能为空！！");
			ncontent.focus();
			return false;
		}		
		return true;
	}
</script>
<div id="main">
  <jsp:include page="left.html" />
  <div id="opt_area">
    <h1 id="opt_type"> 修改新闻：</h1>
    <form action="../util/do_update_news.jsp?nid=<%= nid %>" method="post" enctype="multipart/form-data" onsubmit="return check()">
      <p>
        <label> 主题 </label>
        <select name="ntid">
        <%
        //加载新闻主题的下拉列表，当前主题处于选中状态
        String ntopic=(String)tempNews.get("tname");
		Iterator iterator = list.iterator();
		Map tempTopic = null;
		while(iterator.hasNext()){
			tempTopic = (Map)iterator.next();
			if(ntopic.equals(tempTopic.get("tname"))){
%>
      	<option value='<%=tempTopic.get("tid")%>' selected='selected'><%=tempTopic.get("tname") %></option>
      	<%}else{%>
      	<option value='<%=tempTopic.get("tid")%>'><%=tempTopic.get("tname") %></option>          
        <%} }%>
        </select>
      </p>
      <p>
        <label> 标题 </label>
        <input name="ntitle" type="text" class="opt_input" value=<%=(String)tempNews.get("ntitle") %>/>
      </p>
      <p>
        <label> 作者 </label>
        <input name="nauthor" type="text" class="opt_input" value=<%=(String)tempNews.get("nauthor") %>/>
      </p>
      <p>
        <label> 摘要 </label>
        <textarea name="nsummary" cols="40" rows="3"><%=(String)tempNews.get("nsummary")%></textarea>
      </p>
      <p>
        <label> 内容 </label>
        <textarea name="ncontent" cols="70" rows="10"><%=(String)tempNews.get("ncontent")%></textarea>
      </p>
      <p>
        <label> 上传图片 </label>
        <input name="file" type="file" class="opt_input" value=<%=(String)tempNews.get("npicpath")%> />
      </p>
      <input type="submit" value="提交" class="opt_sub" />
      <input type="reset" value="重置" class="opt_sub" />
    </form>
  </div>
</div>
<jsp:include page="bottom.html" />
