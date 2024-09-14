<%@ page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="css/join.css">
<head><title>회원가입</title></head>
<body>
<form action="Member_insert.jsp" method="post" class="joinForm">
      
      <a id="logo" href="index.jsp"><img src="img/NewLogo.PNG" style="width:300px; height:100px; vertical-align: text-top;" alt="로고"></a>                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
        <input type="text" name="memberid" class="id" maxlength="20" value="<jsp:setProperty name="regBean" property="memberid" />" placeholder="ID를 입력하세요.">
      </div>
      <div class="textForm">
        <input type="password" name="password"  class="pw" maxlength="20" placeholder="비밀번호를 입력하세요." value="<jsp:setProperty name="regBean" property="password" />"required>
      </div>
       <div class="textForm">
        <input type="password" name="password2"  class="pw" maxlength="20" placeholder="비밀번호 확인" value="<jsp:setProperty name="regBean" property="password2" />"required>
      </div>
      <div class="textForm">
        <input type="text" name="nicname"  class="nicname" placeholder="닉네임을 입력하세요." value="<jsp:setProperty name="regBean" property="nicname" />">
      </div>
       <div class="textForm">
        <input type="email" name="email"  class="email" placeholder="이메일을 입력하세요." value="<jsp:setProperty name="regBean" property="email" />">
      </div>
      <input type="submit" class="btn" value="J O I N"/>
    </form>
</body>
</html>