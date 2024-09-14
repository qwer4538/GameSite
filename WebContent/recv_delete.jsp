<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, JoinBean.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.MessageBean" id="msgBean" scope="session" />
<jsp:setProperty name="msgBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 삭제</title>
</head>
<body>
<%
String idx = request.getParameter("idx");

regMgr.msgdele(idx);

%>
	<script>
		alert("삭제 되었습니다.");
		location.href="MsgList.jsp";
	</script>
</body>
</html>