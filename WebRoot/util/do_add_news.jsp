<%@page language="java" import="java.util.*,java.sql.*,com.jspsmart.upload.*,org.jbit.news.bean.*,org.jdit.news.bl.*" pageEncoding="gbk"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("gbk");
	//String tname = request.getParameter("tname");
	News n = new News();
	NewsManager nm = new NewsManager();
	SmartUpload su = new SmartUpload();
	//初始化SmartUpload对象
	su.initialize(pageContext);
	com.jspsmart.upload.File file = null;
	//允许上传类型
	String allowed = "gif,jpg,doc,rar,JPG,GIF,DOC,RAR";
	//不许上传类型
	String denied = "jsp,asp,php,aspx,html,htm,exe,bat";
	com.jspsmart.upload.Request req = null;
	//设置上传文件大小
	int file_size = 2 * 1024 * 1024;
	String exceptionMsg = null;
	int i = 0;
	// 定义允许上传文件类型   
	su.setAllowedFilesList(allowed);
	//不允许上传文件类型   
	su.setDeniedFilesList(denied);
	//单个文件最大限制   
	su.setMaxFileSize(file_size);
	//su.setCharset("GBK");
	//执行上传
	su.upload();
	//得到单个上传文件的信息
	file = su.getFiles().getFile(0);
	//设置文件在服务器的保存位置
	String filepath = "upload\\";
	filepath += file.getFileName();
	//文件另存为   
	//file.setCharset("gbk");
	file.saveAs(filepath, SmartUpload.SAVE_VIRTUAL);
	req = su.getRequest();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//获取添加新闻页面传递过来的参数	
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
	alert("已经成功添加新闻，点击确认返回新闻列表");
	open("../newspages/admin.jsp","_self");	
</script>
<%
	} else if (exceptionMsg
			.equals("The extension of the file is not allowed to be uploaded (1010).")) {
		out
				.print("<script type=\"text/javascript\">alert(\"你选择的文件类型不允许上传，文件上传类型只能是"
						+ allowed
						+ "类型！\");open(\"../newspages/news_add.jsp\",\"_self\");	</script>");
	} else if (exceptionMsg.contains("Size exceeded for this file")) {
		out
				.print("<script type=\"text/javascript\">alert(\"你选择的文件大小超过上限，上传文件大小限制为"
						+ file_size
						/ (1024 * 1024)
						+ "MB！\");open(\"../newspages/news_add.jsp\",\"_self\");	</script>");
	} else {
%>
					<script type="text/javascript">
						alert("添加新闻失败！请联系管理员查找原因！");
						open("../newspages/news_add.jsp","_self");	
					</script>
				<%
					}
				%>
