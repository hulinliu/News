<%@ page language="java" import="java.util.*,org.jdit.news.bl.*" pageEncoding="gbk"%>
<%
	String nid=request.getParameter("nid");
	NewsManager nm=new NewsManager();
	int res=nm.deleteNewsByNid(nid);
	if (res>0){
%>
<script type="text/javascript">
	alert("�Ѿ��ɹ�ɾ��һ�����ţ����ȷ�Ϸ��������б�");
	open("../newspages/admin.jsp","_self");	
</script>
<%
    }else{
%>
<script type="text/javascript">
	alert("�������ʧ�ܣ�����ϵ����Ա����ԭ��");
	open("../newspages/news_add.jsp","_self");	
</script>
<%
    }
%>