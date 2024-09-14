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
	
	if(userid != null) {
%>
<div class="row text-center" style="width:100%; margin-top:100px;">
	<div style="width: 100%">
		<button type="button" class="btn btn-link"><img src="img/recvmsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgList.jsp">&nbsp;받은쪽지함</a></button>
		<button type="button" class="btn btn-link"><img src="img/sendmsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgSendList.jsp">&nbsp;보낸쪽지함</a></button>
		<button type="button" class="btn btn-link"><img src="img/writemsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgWrite.jsp">&nbsp;<b>쪽지쓰기</b></a></button>
	</div>
	<div id="write_note_in">
	<form action="MsgWriteOk.jsp" method="post">
        <div id="write_t">답장하기</div>
        <div id="write_form">
            <div class="wr_ip"><input type="text" name="recv_id" value="<%=msgBean.getSend_id()%>" readonly/></div>
            <div class="wr_ip wr_ip_top"><input type="text" name="title" value="RE: " required/></div>
            <div class="wr_ip wr_ip_top"><textarea name="content" placeholder="내용" required></textarea></div>
            <button type="submit" class="btn btn-primary">보내기</button>
        </div>
    </form>
    </div>
</div>
<%} else { %>
<script type="text/javascript">alert('로그인이 필요합니다.'); location.href="Login.jsp";</script>
<% } %>
</body>
</html>