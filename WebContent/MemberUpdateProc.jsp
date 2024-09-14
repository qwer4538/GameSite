<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<%
    boolean flag = regMgr.memberUpdate(regBean);
%>

<%
if(flag){
%>
		<script>
		 alert("성공적으로 수정하였습니다");
		 location.href="index.jsp";	
		</script>
<%
	}else{
%>
	    <script>
		alert("수정도중 에러가 발생하였습니다.");
		history.back();
		</script>

<%
	  }
%>


