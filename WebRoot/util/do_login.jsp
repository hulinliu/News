<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gbk"%>
<%
	String uname = request.getParameter("uname");
	String password = request.getParameter("upwd");
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	Class.forName("com.mysql.jdbc.Driver");
	//Connection con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:orcl","scott","tiger");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=gb2312","root","111111");
	String sql = "select * from userinfo where uname=? and upwd=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,uname);
	ps.setString(2,password);
	ResultSet rs = ps.executeQuery();
	if(!rs.next()){
	rs.close();
	ps.close();
	con.close();
%>
<script type="text/javascript">
	alert("用户名密码错误，请重新登录");
	open("../index.jsp","_self");	
</script>
<%
	}else{
		rs.close();
		ps.close();
		con.close();
		session.setAttribute("admin",uname);
		response.sendRedirect("../index.jsp");
	}
%>
