<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "Board.*" %>
<%@ include file="Top.jsp" %>

<% 
    
	Board board = new Board();

	String board_type = request.getParameter("board_type");
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	
	//게시판명
	String board_name = board.getBoardName(board_type);
	
	//게시판뷰
	BoardBean bean = board.getBoardView(board_type,board_no);
	String sessionUser ="";
	try{
		sessionUser = (String)session.getAttribute("memberid");
	}catch(Exception e){
		sessionUser = null;
	} 
	String boardWriteUser = bean.getBoard_id();
	
	String board_secretChk = bean.getBoard_secret();
	if(level.equals("1")){  
	    if(board_secretChk.equals("1")){
		   if(!boardWriteUser.equals(sessionUser)){ 
			  out.print("<Script>alert('비밀글은 본인만 볼 수 있습니다.');history.back();</script>");

		   }else{ 
			   
			  board.boardUpdateVisit(board_no);
		   }
		
        }else{
		   board.boardUpdateVisit(board_no);
	    }
	    
	}else{
		   board.boardUpdateVisit(board_no);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=board_name %> - 함께해서 즐거운 게임 세상!</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/menu.css">
	<link rel="stylesheet" type="text/css" href="css/board.css">
</head>

<body>
  
  	<section id="main">
		<div class="board">
			<table>
				<!-- 
				<tr>
					<th>글번호</th><td><%=bean.getBoard_no() %></td>
				</tr>
				 -->
				<tr>
					<th>작성자</th><td><%=bean.getBoard_id() %></td>
				</tr>
				<tr> 
					<th>제목</th><td><%=bean.getBoard_title() %></td>
				</tr>
				<tr>
					<th>내용</th><td><%=bean.getBoard_content() %></td>
				</tr>
				<tr>
					<th>업로드파일</th><td><%=bean.getBoard_file() %> <a href=/upload/<%=bean.getBoard_rename_file()%> ">[다운로드]</a></td>
				</tr>
				<tr>
					<th>작성일자</th><td><%=bean.getBoard_date() %></td>
				</tr>
			</table>	
		</div>
		<div class="board_btn">
			<% if(bean.getBoard_id().equals(id)){%>
			    <a href="boardModify.jsp?board_no=<%=board_no%>&board_type=<%=board_type%>">수정</a>
				<a href="javascript:del('<%=board_no%>','<%=board_type%>')">삭제</a>
			<%}else{ %>
			<% if(level.equals("10")){ %>
			     <a href="boardModify.jsp?board_no=<%=board_no%>&board_type=<%=board_type%>">수정</a>
				 <a href="javascript:del('<%=board_no%>','<%=board_type%>')">삭제</a>
			<%} %>
			<%} %>
				     
			<a href="boardList.jsp?board_type=<%=board_type%>">목록</a>
		</div>
	</section>
</body>

<script>
function del(board_no,board_type){
var delConfirm = confirm('저장하시겠습니까?');
   if (delConfirm) {
	   location.href='boardDel.jsp?board_no='+board_no+"&board_type="+board_type;
   }else{
	   return false;
   }
	
}

</script>

</html>