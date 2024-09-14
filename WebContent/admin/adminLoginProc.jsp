<%@ page contentType="text/html;charset=UTF-8" %>

<%
	String id = (String)session.getAttribute("memberid");
	String level = "1";
	level = (String)session.getAttribute("level");
	
    if(level.equals("10")) {
	    session.setAttribute("adminKey", id);
%>

   <script>
   location.href="adminPage.jsp";
   </script>

<%}else{%>

   <script>
   alert("입력한 정보가 정확하지 않습니다.");
   location.href="adminLogin.jsp";
   </script>

<%}%>