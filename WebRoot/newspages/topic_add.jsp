<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<jsp:include page="top.jsp" />
<script type="text/javascript">
	function check(){
		var tname = document.getElementById("tname");
		if(tname.value == ""){
			alert("�������������ƣ���");
			tname.focus();
			return false;
		}		
		return true;
	}
</script>
<div id="main">
  <jsp:include page="left.html" />
  <div id="opt_area">
    <h1 id="opt_type"> ������⣺ </h1>
    <form action="../util/do_add_topic.jsp" method="post" onsubmit="return check()">
      <p>
        <label> �������� </label>
        <input name="tname" type="text" class="opt_input" />
      </p>
      <input name="action" type="hidden" value="addtopic">
      <input type="submit" value="�ύ" class="opt_sub" />
      <input type="reset" value="����" class="opt_sub" />
    </form>
  </div>
</div>
<jsp:include page="bottom.html" />
