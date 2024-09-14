<%@ page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<%
request.setCharacterEncoding("UTF-8");

String no = request.getParameter("no");
String s_memberid = request.getParameter("memberid");
String s_password = request.getParameter("password");
String s_nicname = request.getParameter("nicname");
String s_email = request.getParameter("email");


String sql="UPDATE members set memberid='"+s_memberid+"' , password='"+s_password+"', password2='"+s_password+"',email='"+s_email+"', nicname='"+s_nicname+"' where no=" +no;
				  //table 위치
			
Connection con = null;
Statement stmt = null;

String url = "jdbc:mysql://localhost:3306/webproject1?useUnicode=true&characterEncoding=utf-8";  //db 경로
String id = "root", pw="kdw990318!";				   //mysql 아이디,비밀번호

try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, id, pw);
	stmt = con.createStatement();
	stmt.executeUpdate(sql);
%>
	<script>
		alert("수정 되었습니다.");
		location.href="adminPage.jsp";
	</script>
<%
}finally{
	if(stmt != null) stmt.close();
	if(con != null) con.close();
}
%>