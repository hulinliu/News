<%@ page language="java" import="java.util.*,java.sql.*,org.jdit.news.bl.*" pageEncoding="gbk"%>
<%@page import="org.jbit.news.bean.Topic"%>
<jsp:include page="top.jsp" />
<%
	NewsManager nm = new NewsManager();
	List list = nm.getAllTopics();
%>
<script type="text/javascript">
	function check(){
		var ntitle = document.getElementById("ntitle");
		var nauthor = document.getElementById("nauthor");
		var nsummary = document.getElementById("nsummary");
		var ncontent = document.getElementById("ncontent");
		
		if(ntitle.value == ""){
			alert("���ⲻ��Ϊ�գ���");
			ntitle.focus();
			return false;
		}else if(nauthor.value == ""){
			alert("���߲���Ϊ�գ���");
			nauthor.focus();
			return false;
		}else if(nsummary.value == ""){
			alert("ժҪ����Ϊ�գ���");
			nsummary.focus();
			return false;
		}else if(ncontent.value == ""){
			alert("���ݲ���Ϊ�գ���");
			ncontent.focus();
			return false;
		}		
		return true;
	}
</script>
<div id="main">
  <jsp:include page="left.html" />
  <div id="opt_area">
    <h1 id="opt_type"> ������ţ� </h1>
    <form action="../util/do_add_news.jsp" method="post" enctype="multipart/form-data" onsubmit="return check()">
      <p>
        <label> ���� </label>
        <select name="ntid">
        <%
		Iterator iterator = list.iterator();
		Map tempTopic = null;
		while(iterator.hasNext()){
			tempTopic = (Map)iterator.next();
%>
      	<option value='<%=tempTopic.get("tid")%>'><%=tempTopic.get("tname") %></option>
      	<%}%>          
        </select>
      </p>
      <p>
        <label> ���� </label>
        <input name="ntitle" type="text" class="opt_input" />
      </p>
      <p>
        <label> ���� </label>
        <input name="nauthor" type="text" class="opt_input" />
      </p>
      <p>
        <label> ժҪ </label>
        <textarea name="nsummary" cols="40" rows="3"></textarea>
      </p>
      <p>
        <label> ���� </label>
        <textarea name="ncontent" cols="70" rows="10"></textarea>
      </p>
      <p>
        <label> �ϴ�ͼƬ </label>
        <input name="file" type="file" class="opt_input" />
      </p>
      <input type="submit" value="�ύ" class="opt_sub" />
      <input type="reset" value="����" class="opt_sub" />
    </form>
  </div>
</div>
<jsp:include page="bottom.html" />
