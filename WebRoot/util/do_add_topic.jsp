<%@ page language="java" import="java.util.*,java.sql.*,org.jbit.news.bean.Topic,org.jdit.news.bl.TopicManager" pageEncoding="gbk"%>
<%
	request.setCharacterEncoding("gbk");
	String tname = request.getParameter("tname");
    TopicManager tm=new TopicManager();
    Map topic=tm.getTopicByTname(tname);
    if (topic!=null){
%>
<script type="text/javascript">
	alert("��ǰ�����Ѵ��ڣ������벻ͬ�����⣡");
	open("../newspages/topic_add.jsp","_self");	
</script>
<%
	}else{
	    Topic t=new Topic();
        t.setTname(tname);
        int r=tm.insertTopic(t);
        if (r>0){
%>
<script type="text/javascript">
	alert("��ǰ���ⴴ���ɹ������ȷ�Ϸ��������б�");
	open("../newspages/topic_list.jsp","_self");	
</script>
<%
	}}
%>
