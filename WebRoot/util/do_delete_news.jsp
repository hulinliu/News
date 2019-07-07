<%@ page language="java" import="java.util.*,org.jdit.news.bl.*" pageEncoding="gbk"%>
<%
	String nid=request.getParameter("nid");
	NewsManager nm=new NewsManager();
	int res=nm.deleteNewsByNid(nid);
	if (res>0){
%>
<script type="text/javascript">
	alert("已经成功删除一条新闻，点击确认返回新闻列表");
	open("../newspages/admin.jsp","_self");	
</script>
<%
    }else{
%>
<script type="text/javascript">
	alert("添加新闻失败！请联系管理员查找原因！");
	open("../newspages/news_add.jsp","_self");	
</script>
<%
    }
%>