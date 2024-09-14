<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, JoinBean.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%

	String memberId = (String)session.getAttribute("memberid");

	RegisterMgr mgr = new RegisterMgr();
	RegisterBean regBean = mgr.getMember(memberId); 
	
%>
<html>
<head>
<title>회원수정</title>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
table, tr, th, td {
	padding: 10px;
	border: 1px solid #666666;
	margin-top: 100px;
}

</style>
</head>

<body>
	<%@ include file="Top.jsp" %>
<br>
	<form name="regForm" method="post" action="MemberUpdateProc.jsp">
		<table class="table w-auto" style="margin-left: auto; margin-right: auto";>
			<thead class="thead-dark" align="center">
				<th scope="col" colspan="2"><font color="#FFFFFF">
		<%=regBean.getMemberid()%>
		회원님의 정보를 수정합니다.</font> 
				</th>
			</thead>
		<tbody>
		<tr> 
			<th scope="row">아이디</th>
			<td><%=regBean.getMemberid()%></td>
		</tr>
		<tr> 
			<th scope="row">패스워드</th>
			<td><input type="text" name="password" value="<%=regBean.getPassword()%>"></td>
		</tr>
		<tr>
			<th scope="row">패스워드 확인</th>
			<td><input type="text" name="password2" value="<%=regBean.getPassword()%>"></td>
		</tr>
		<tr> 
			<th scope="row">이름</td>
			<td><input type="text" name="nicname" value="<%=regBean.getNicname()%>"></td>
		</tr>
		<tr> 
			<th scope="row">이메일</td>
			<td><input type="text" name="email" size="30" value="<%=regBean.getEmail()%>"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><button type="submit" class="btn btn-primary">수정완료</button> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<button type="reset" class="btn btn-secondary">다시쓰기</button> 
		</td>
		</tr>
		<input type="hidden" name="memberid" value="<%=regBean.getMemberid()%>" />
		</tbody>
		</table>
	</form>
</body>
</html>
