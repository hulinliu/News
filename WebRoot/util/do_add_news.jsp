<%@page language="java" import="java.util.*,java.sql.*,com.jspsmart.upload.*,org.jbit.news.bean.*,org.jdit.news.bl.*" pageEncoding="gbk"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("gbk");
	//String tname = request.getParameter("tname");
	News n = new News();
	NewsManager nm = new NewsManager();
	SmartUpload su = new SmartUpload();
	//��ʼ��SmartUpload����
	su.initialize(pageContext);
	com.jspsmart.upload.File file = null;
	//�����ϴ�����
	String allowed = "gif,jpg,doc,rar,JPG,GIF,DOC,RAR";
	//�����ϴ�����
	String denied = "jsp,asp,php,aspx,html,htm,exe,bat";
	com.jspsmart.upload.Request req = null;
	//�����ϴ��ļ���С
	int file_size = 2 * 1024 * 1024;
	String exceptionMsg = null;
	int i = 0;
	// ���������ϴ��ļ�����   
	su.setAllowedFilesList(allowed);
	//�������ϴ��ļ�����   
	su.setDeniedFilesList(denied);
	//�����ļ��������   
	su.setMaxFileSize(file_size);
	//su.setCharset("GBK");
	//ִ���ϴ�
	su.upload();
	//�õ������ϴ��ļ�����Ϣ
	file = su.getFiles().getFile(0);
	//�����ļ��ڷ������ı���λ��
	String filepath = "upload\\";
	filepath += file.getFileName();
	//�ļ����Ϊ   
	//file.setCharset("gbk");
	file.saveAs(filepath, SmartUpload.SAVE_VIRTUAL);
	req = su.getRequest();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//��ȡ�������ҳ�洫�ݹ����Ĳ���	
	String ntid = req.getParameter("ntid");
	String ntitle = req.getParameter("ntitle");
	String nauthor = req.getParameter("nauthor");
	String nsummary = req.getParameter("nsummary");
	String ncontent = req.getParameter("ncontent");
	String filePath = req.getParameter("file");
	n.setNtid(ntid);
	n.setNtitle(ntitle);
	n.setNauthor(nauthor);
	n.setNcreatedate(sdf.format(new java.util.Date()));
	n.setNpicpath(filePath);
	n.setNcontent(ncontent);
	n.setNmodifydate(sdf.format(new java.util.Date()));
	n.setNsummary(nsummary);
	i = nm.insertNews(n);
	if (i > 0) {
%>
<script type="text/javascript">
	alert("�Ѿ��ɹ�������ţ����ȷ�Ϸ��������б�");
	open("../newspages/admin.jsp","_self");	
</script>
<%
	} else if (exceptionMsg
			.equals("The extension of the file is not allowed to be uploaded (1010).")) {
		out
				.print("<script type=\"text/javascript\">alert(\"��ѡ����ļ����Ͳ������ϴ����ļ��ϴ�����ֻ����"
						+ allowed
						+ "���ͣ�\");open(\"../newspages/news_add.jsp\",\"_self\");	</script>");
	} else if (exceptionMsg.contains("Size exceeded for this file")) {
		out
				.print("<script type=\"text/javascript\">alert(\"��ѡ����ļ���С�������ޣ��ϴ��ļ���С����Ϊ"
						+ file_size
						/ (1024 * 1024)
						+ "MB��\");open(\"../newspages/news_add.jsp\",\"_self\");	</script>");
	} else {
%>
					<script type="text/javascript">
						alert("�������ʧ�ܣ�����ϵ����Ա����ԭ��");
						open("../newspages/news_add.jsp","_self");	
					</script>
				<%
					}
				%>
