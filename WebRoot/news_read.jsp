<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="org.jdit.news.bl.NewsManager"%>
<%@page import="org.jdit.news.bl.CommentsManager"%>
<%@page import="org.jbit.news.bean.Comment"%>
<jsp:include page="index_top.jsp" />
<script type="text/javascript">
	function checkComment(){
		var cauthor = document.getElementById("cauthor");
		var content = document.getElementById("ccontent");
		if(cauthor.value == ""){
			alert("�û�������Ϊ�գ���");
			return false;
		}else if(content.value == ""){
			alert("�������ݲ���Ϊ�գ���");
			return false;
		}
		return true;
	}
</script>
<link href="CSS/read.css" rel="stylesheet" type="text/css" />
<%
	NewsManager nm = new NewsManager();
	String nid = request.getParameter("nid");
	Map map = nm.getNewsByNid(nid);
	String cip = request.getRemoteAddr();
	CommentsManager cmr = new CommentsManager();
	List comments = cmr.getCommentsByNid(nid);
%>
<div id="container">
  <jsp:include page="index_sidebar.jsp"></jsp:include>
  <div class="main">
    <div class="class_type"> <img src="Images/class_type.gif" alt="��������" /> </div>
    <div class="content">
      <ul class="classlist">
        <table width="80%" align="center">
          <tr width="100%">
            <td colspan="2" align="center"><%=map.get("ntitle") %></td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
          <tr>
            <td colspan="2" align="center">���ߣ�<%=map.get("nauthor") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              ���ͣ�<a href="index.jsp?tid=<%=map.get("ntid")%>"><%=map.get("tname") %></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             ����ʱ�䣺<%=map.get("ncreatedate") %>
             </td>
          </tr>
          <tr>
            <td colspan="2" align="center"><strong>ժҪ��<%=map.get("nsummary") %></strong></td>
          </tr>
          <tr>
            <td colspan="2" align="center"></td>
          </tr>
          <tr>
            <td colspan="2"><%=map.get("ncontent") %></td>
          </tr>
          <tr>
            <td colspan="2"><hr />
            </td>
          </tr>
        </table>
      </ul>
      <ul class="classlist">
        <table width="80%" align="center">
        <% 
        	if(comments.size() <= 0){
        %>
	          <td colspan="6"> �������ۣ� </td>
	          <tr>
	            <td colspan="6"><hr />
	            </td>
	          </tr>
         <%
         	 }else{
         	 Iterator iterator = comments.iterator();
         	 Comment comment = null;
         	 while(iterator.hasNext()){
         	 comment = (Comment)iterator.next();
         %>
         	<tr>
            <td> �����ˣ� </td>
            <td><%=comment.getCauthor() %></td>
            <td> IP�� </td>
            <td><%=comment.getCip() %></td>
            <td> ����ʱ�䣺 </td>
            <td><%=comment.getCdate() %></td>
          </tr>
          <tr>
            <td colspan="6"><%=comment.getCcontent() %></td>
          </tr>
          <tr>
            <td colspan="6"><hr />
            </td>
          </tr>
         <% 
         		}
         	}
         %>
        </table>
      </ul>
      <ul class="classlist">
        <form action="util/do_add_comment.jsp?nid=<%=map.get("nid")%>" method="post" onSubmit="return checkComment()">
          <table width="80%" align="center">
            <tr>
              <td> �� �� </td>
            </tr>
            <tr>
              <td> �û����� </td>
              <td><input id="cauthor" name="cauthor" value="��һ����ʲôҲû����"/>
                IP��
                <input name="cip" value="<%=cip %>" readonly="readonly"/>
              </td>
            </tr>
            <tr>
              <td colspan="2"><textarea name="ccontent" cols="70" rows="10"></textarea>
              </td>
            </tr>
            <td><input name="submit" value="��  ��" type="submit"/>
              <a href="index.jsp">����</a>
              </td>
          </table>
        </form>
      </ul>
    </div>
  </div>
</div>
<jsp:include page="index_bottom.html" />
