<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
	String id = (String)session.getAttribute("memberid");
    String level = (String)session.getAttribute("level");
    if(level == null){
	level = "1";
   }
    
	String log="";
	if(id == null) log ="<a href=Login.jsp> 로그인 </a>";
	else log = "<a href=LogOut.jsp> 로그아웃 </a>";

	String mem="";
	if(id == null) mem ="<a href=MemberJoin.jsp> 회원 등록 </a>";
	else mem = "<a href=MemberUpdate.jsp> 회원 수정 </a>";
%>
  <header>
    <section id="top">
      <a id="logo" href="index.jsp"><img src="img/NewLogo.PNG" style="width:250px; height:63px; vertical-align: text-top;" alt="로고"></a>
<%
		if(id != null){
%>
		<div align="right" style="margin-top:5px;"><b><%=id%>님 안녕하세요.</b></div>
	<%}else{%>
		<div align="right" style="margin-top:5px;"><b>로그인 하신 후 이용해 주세요</b></div>
		<%}%>
	      
      <nav id="top_menu">
        <ul>
          <% if(level.equals("10")){ %>
          <li><a href="admin/adminLoginProc.jsp">관리자</a></li>
          <%} %>
          
          <% if(id != null){ %>
          <li><a href="MsgList.jsp">쪽지</a></li>
          <li><a href="#">마이페이지</a></li>
          <% } %>
          <li><%=log%></a></li>
          <li><%=mem%></a></li>
        </ul>
      </nav> <!-- top_menu -->

          <div class="clear"></div>
     </section> <!-- section top -->
     
      <% 
	  	String pageLinkType = "";
	  pageLinkType = request.getParameter("board_type");
	  	
	  %>

      <nav id="main_menu">
        <ul>
          <li><a href="boardList.jsp?board_type=1"><b>공지사항</b></a></li>
          <li><a href="boardList.jsp?board_type=2"><b>게임게시판</b></a></li>
          <li><a href="boardList.jsp?board_type=3"><b>정보공유</b></a></li>
          <li><a href="boardList.jsp?board_type=4"><b>Q&A</b></a></li>
        </ul>
      </nav>
    </header>