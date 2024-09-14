<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "Board.*" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께해서 즐거운 게임 세상!</title>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	
<% 
	Board board = new Board();

	String board_type = request.getParameter("board_type");
	String board_no = request.getParameter("board_no");
	
	//게시판뷰
	BoardBean bean = board.getBoardView(board_type,Integer.parseInt(board_no));
	
	
	//업로드 파일제거
	if(bean.getBoard_rename_file() !=null){
		String fileName = bean.getBoard_rename_file(); //지울 파일명
		out.print(fileName);
		String realPath = "C:/Myweb/WebContent/upload";
	
	
	    File f = new File(realPath + "/" + fileName); // 파일 객체생성
	    if( f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.

	}
	
	//게시판삭제
	board.boardDelete(board_type,board_no);

	//게시글이 삭제됬으므로 리스트페이지로 리다이렉트
	response.sendRedirect("boardList.jsp?board_type="+board_type);
	
%>
</body>

</html>