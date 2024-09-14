<%@ page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<%
String no = request.getParameter("no");
String sql = "DELETE FROM members WHERE no=" + no;
					//table 경로 설정
Connection con = null;
Statement stmt = null;

String url = "jdbc:mysql://localhost:3306/webproject1";  //db경로 설정
String id = "root", pw="kdw990318!";				//mysql 아이디,비밀번호

try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, id, pw);
	stmt = con.createStatement();
	stmt.executeUpdate(sql);
%>
	<script>
		alert("삭제 되었습니다.");
		location.href="adminPage.jsp";
	</script>
<%
}catch(Exception e){
	System.out.println("modifySawon.jsp에서 오류 : " + e);  //에러 발생시 설명
}finally{
	if(stmt != null) stmt.close();
	if(con != null) con.close();
}
%>