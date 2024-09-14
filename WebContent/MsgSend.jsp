<%@ page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<jsp:useBean class="JoinBean.MessageBean" id="msgMgr" scope="session" />

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/join.css">
<link rel="stylesheet" type="text/css" href="css/msg.css">
<head><title>쪽지보내기</title></head>
<body>
<%@ include file="Top.jsp" %>
<form action="MsgSendProc.jsp" method="post" class="joinForm">
      
      <h2>쪽지 보내기</h2>
      <div class="textForm">
        <input type="text" name="recv_id" class="id" maxlength="20" value="<jsp:setProperty name="msgBean" property="recv_id" />" placeholder="받을 사람 ID를 입력하세요.">
      </div>
      <div class="textForm">
        <input type="password" name="title"  class="pw" maxlength="20" placeholder="제목을 입력하세요." value="<jsp:setProperty name="msgBean" property="title" />"required>
      </div>
       <div class="textForm">
        <input type="password" name="content"  class="pw" maxlength="20" placeholder="내용을 입력하세요." value="<jsp:setProperty name="msgBean" property="content" />"required>
      </div>
      <input type="submit" class="btn" value="쪽지 전송"/>
    </form>
</body>
</html>