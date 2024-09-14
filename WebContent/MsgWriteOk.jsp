<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*, java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import="java.util.*, JoinBean.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="JoinBean.MessageBean" id="msgBean" scope="session" />
<jsp:setProperty name="msgBean" property="*"/>
<jsp:useBean class="JoinBean.RegisterMgr" id="regMgr" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 전송</title>
</head>
<body>
<%  
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	String send_date = sf.format(nowTime);
	
	msgBean = new MessageBean();
	String send_id = (String)session.getAttribute("memberid");
	String recv_id = request.getParameter("recv_id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	msgBean.setSend_id(send_id);
	msgBean.setRecv_id(recv_id);
	msgBean.setTitle(title);
	msgBean.setContent(content);
	msgBean.setSend_date(send_date);
	boolean flag = regMgr.writeMsg(msgBean);
	
	if (send_id != null) {
		if(flag){
%>			
			<script>
				alert("쪽지 전송 성공!");
				location.href="MsgSendList.jsp";
			</script>	
<%		}else{ %>
			<script>
			alert("쪽지 전송에 실패하였습니다.");
			history.back();
			</script>	
<% 
			}
	}
	else { %>
	<script type="text/javascript">alert('로그인이 필요합니다.'); location.href="Login.jsp";</script>
<% } %>
</body>
</html>