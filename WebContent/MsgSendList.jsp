<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, JoinBean.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.RegisterBean" id="regBean" scope="session" />
<jsp:useBean class="JoinBean.MessageBean" id="msgBean" scope="session" />
<jsp:setProperty name="regBean" property="*"/>
<jsp:setProperty name="msgBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<link rel="stylesheet" type="text/css" href="css/msg.css">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>보낸 쪽지함</title>
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
	Vector vResult= regMgr.sendMsg(userid);

	if(userid != null) {
%>
<script type="text/javascript">
	function allChk(obj){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i=0; i<=rowCnt; i++) {
				if(chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i=0; i<=rowCnt; i++) {
				if(chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}
</script>
<div class="row text-center" style="width:100%; margin-top:100px;">
	<div style="width: 100%">
		<button type="button" class="btn btn-link"><img src="img/recvmsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgList.jsp">&nbsp;받은쪽지함</a></button>
		<button type="button" class="btn btn-link"><img src="img/sendmsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgSendList.jsp"><b>&nbsp;보낸쪽지함</b></a></button>
		<button type="button" class="btn btn-link"><img src="img/writemsg.png" width="20" height="20" alt="recv" title="recv" /><a href="MsgWrite.jsp">&nbsp;쪽지쓰기</a></button>
	</div>
	<form action="MsgCheckDele.jsp" method="post">
	<table class="list-table" style="margin-left: auto; margin-right: auto; margin-top:50px">
    <thead>
      <tr>
        <input type="submit" class="btn btn-danger text-white" style="width: 50px; height: 30px; font-size: 9pt; float:right; margin-right:30px;" value="삭제"/>
        <th width="50" class="tc"><input type="checkbox" onclick="allChk(this);"/></th>
        <th width="150" class="tl">받는사람</th>
        <th width="450" class="tl">내용</th>
        <th width="200" class="tc">날짜</th>
        <th width="100" class="tc">수신여부</th>
      </tr>
    </thead>
    <tbody class="text-left">
    <%
		for(int i=0; i<vResult.size(); i++){
		msgBean = (MessageBean)vResult.get(i);
	%>
    <tr>
      	<td class="tc"><input type="checkbox" name="RowCheck" value="<%=msgBean.getIdx()%>" /></td>
      	<td><%=msgBean.getRecv_id()%></td>
      	<td style="text-overflow:ellipsis;"><a href="MsgSendRead.jsp?idx=<%=msgBean.getIdx()%>"><%=msgBean.getContent()%></a></td>
      	<td class="tc"><%=msgBean.getSend_date()%></td>
      	<td class="tc">
      		<% if(msgBean.getRecv_chk().equals("0"))
      			{
      				out.println("읽지않음");
      			} else {
      				out.println("읽음");
      			}%>
      	</td>
    </tr>
    <%}%>
    </tbody>	
	</table>
	</form>
</div>
<%} else { %>
<script type="text/javascript">alert('로그인이 필요합니다.'); location.href="Login.jsp";</script>
<% } %>
</body>
</html>