<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<% 
	String id =(String)session.getAttribute("memberid");
	
	if(id != null) {
%>
	<script>
		alert("로그인 성공!");
		location.href="index.jsp";
	</script>
<% 
	}
%>
<body>
<%=id%>님 안녕하세요.
</body>
</html>