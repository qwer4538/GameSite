<%@ page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 완료!</title>
</head>
<body>
<% session.removeAttribute("memberid"); %>
<% session.removeAttribute("level"); %>
<script>
	alert("로그아웃 되었습니다!");
	location.href="index.jsp";
</script>

</body>
</html>