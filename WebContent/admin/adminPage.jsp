<%@ page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, JoinBean.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	RegisterMgr mgr = new RegisterMgr();
	ArrayList<RegisterBean> list = mgr.getMemberList(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/admin.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>관리자페이지</title>

<script type="text/javascript">
	function fnDel(no) {
		var result = confirm("데이터를 정말로 삭제하시겠습니까?");
		if(result == true){
			location.href="dele.jsp?no=" + no;
		}
	}
</script>
</head>
<body>
   <div id="gamesite">
      <div id="header">
        <a href=../index.jsp><img src="..\img\portfolio\Logo2.png"  style="width:150px; height:120px; vertical-align: text-top;"/></a>
        <span class="btn btn-outline-primary" style="float: right;"><a href=../LogOut.jsp>로그아웃</a></span>
      </div>

      <div id="menu">
        <a><b>관리자페이지</b></a>
      </div>
      
      <hr style="border: solid 1px black;">
      
      <br>    
      <div id="pre">
        <br>
        <ul>
        </ul>
        <%
			request.setCharacterEncoding("UTF-8");
			String search = request.getParameter("search");
			String searchText = request.getParameter("searchText");
		%>

		<h1>회원정보 리스트</h1>
		
		<table  border= 1  width="900px">
			<tr class="tbl" bgcolor="skyblue" align="center">
				<th>아이디</th><th>비밀번호</th><th>닉네임</th>
				<th>이메일</th><th>수정하기</th>
				<th>삭제하기</th>
			</tr>	
	
			<% for(int i=0; i< list.size();i++){ %>
			<tr align="center">
				<th><%=list.get(i).getMemberid()%></th>
				<th><%=list.get(i).getPassword()%></th>
				<th><%=list.get(i).getNicname()%></th> 
				<th><%=list.get(i).getEmail()%></th>
				<th><a href="change.jsp?no=<%=list.get(i).getNo()%>">수정</a></th>
				<th><a href="javascript:fnDel(<%=list.get(i).getNo()%>)">삭제</a></th>
			</tr>
			<%} %>
			
				 				
		</table>
      </div>
    </div>       
</body>
</html>