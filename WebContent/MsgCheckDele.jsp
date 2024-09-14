<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, JoinBean.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.MessageBean" id="msgBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:setProperty name="msgBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/msg.css">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>받은 쪽지함</title>
</head>
<style>
 display:flex;
 align-items:center;
</style>
<body>
<%@ include file="Top.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String[] check_no = request.getParameterValues("RowCheck");

	int res = regMgr.multiDelete(check_no);
	
%>
	<script type="text/javascript">
		alert("체크된 글 모두 삭제 성공!");
		location.href = "MsgList.jsp";
	</script>

</body>
</html>