<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "JoinBean.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%
	String id = request.getParameter("memberid");
	String password = request.getParameter("password");
	try{
		RegisterMgr mgr = new RegisterMgr();
		RegisterBean bean = mgr.loginCheck(id, password);

		String memberId = bean.getMemberid();
	
	
		if(memberId != null){
			session.setAttribute("memberid",bean.getMemberid());
			session.setAttribute("level",bean.getLevel());
			response.sendRedirect("Logincheck.jsp");
		}else{
		   out.println("<script>");
		   out.println("alert('아이디와 비밀번호를 다시 확인해주세요.')");
		   out.println("history.back()");
		   out.println("</script>");
		}
	
	} catch(Exception e){
		out.print(e);
	}
%>
	
</body>
</html>