<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, JoinBean.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.MessageBean" id="msgBean" scope="session" />
<jsp:setProperty name="msgBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/msg.css?after">
<link rel="stylesheet" href="css/bootstrap.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>쪽지 읽기</title>
</head>
<style>
 display:flex;
 align-items:center;
</style>
<body>
<%@ include file="Top.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = (String)session.getAttribute("memberid");
	String idx = request.getParameter("idx");
	
	msgBean = new MessageBean();
	msgBean = regMgr.readmsg(idx);
	regMgr.msgCheck(idx);
	
	if(userid != null) {
%>
<div class="row text-center" style="width:100%; margin-top:100px;">
	<div style="width: 100%">
		<button type="button" class="btn btn-link"><img src="img/recvmsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgList.jsp">&nbsp;받은쪽지함</a></button>
		<button type="button" class="btn btn-link"><img src="img/sendmsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgSendList.jsp">&nbsp;보낸쪽지함</a></button>
		<button type="button" class="btn btn-link"><img src="img/writemsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgWrite.jsp">&nbsp;<b>쪽지쓰기</b></a></button>
	</div>
</div>
		<div class="col text-center" style="margin-left:120px; margin-top:30px;">
			<a href="reply_write.jsp?idx=<%=msgBean.getIdx()%>" class="btn btn-primary text-white">답장</a>
			<a href="recv_delete.jsp?idx=<%=msgBean.getIdx()%>" class="btn btn-danger text-white">삭제</a>
		</div>
		<div>
			<div id="user_info">
				<div id="no_ri_line"></div>
				<ul>
					<li><b>보낸사람</b>&nbsp;&nbsp;&nbsp;<%=msgBean.getSend_id()%></li>
					<li><b>받은시간</b>&nbsp;&nbsp;&nbsp;<%=msgBean.getSend_date()%></li>
					<li><b>제목</b>&nbsp;&nbsp;&nbsp;<%=msgBean.getTitle()%></li>
				</ul>
				<div id="no_ri_line"></div>
			</div>
			<div id="bo_content">
				<% out.println(msgBean.getContent()); %>
			</div>
			<div id="no_ri_line2"></div>
		</div>
<%} else { %>
<script type="text/javascript">alert('로그인이 필요합니다.'); location.href="Login.jsp";</script>
<% } %>
</body>
</html>