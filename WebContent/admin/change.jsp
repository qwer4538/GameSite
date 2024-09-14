<%@ page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<html>
<head>
<title>관리</title>
</head>
<body>
<%
	String no = request.getParameter("no");
	String sql = "select * from members where no=" + no; //table 경로 설정
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String url = "jdbc:mysql://localhost:3306/webproject1?useUnicode=true&characterEncoding=utf-8";
	String id = "root", pw="kdw990318!";
	
	String s_memberid = null, s_password = null, s_password2 = null, s_nicname = null, s_email = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection(url, id, pw);
		
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			s_memberid = rs.getString("memberid");
			s_password = rs.getString("password");
			s_password = rs.getString("password2");
			s_nicname = rs.getString("nicname");
			s_email = rs.getString("email");
		}
	}finally{
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
		if(con != null) con.close();
	}
%>
	<form action="change_proc.jsp" method="post">
		<input type="hidden" name="no" value="<%=no%>">
		
		<div align="center">
			<h1>회원수정</h1>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberid" value="<%=s_memberid%>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="password" value="<%=s_password%>"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="text" name="password2" value="<%=s_password%>"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nicname" value="<%=s_nicname%>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" value="<%=s_email%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원수정">&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" value="원래대로">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>