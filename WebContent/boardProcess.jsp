<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "Board.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
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
	
		
		BoardBean bean = new BoardBean();
		Board board = new Board();
		
		//파일 업로드 기본 셋팅
		int sizeLimit = 100*1024*1024;
		String realPath = "C:/Myweb/WebContent/upload";
	    File dir = new File(realPath);
		MultipartRequest multipartRequest = null;
		multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		String filename = multipartRequest.getFilesystemName("board_file");

		
		Enumeration e = multipartRequest.getFileNames();  // 폼의 이름 반환
		String originFileName = null;
		String fileTempName = null;
		while(e.hasMoreElements()) {
		  String eleName = (String) e.nextElement();
		  String fileName = multipartRequest.getFilesystemName(eleName);
		  if (fileName != null) {
		    // 이름 바꿔 업로드
		    File originFile = new File(realPath + "/" + fileName);
		    originFileName = originFile.getName();
		    String ext = originFileName.substring(originFileName.lastIndexOf("."));
		    fileTempName = System.currentTimeMillis() + ext;
		    long fileSize = originFile.length();
		    File tempFile = new File(realPath + "/" + fileTempName);

		    if(!originFile.renameTo(tempFile)) {
		        System.out.println("파일명변경 실패");
		    }
		  }
		}
		
		String boardSecretChk = "";
		boardSecretChk = multipartRequest.getParameter("board_secret") != null ? multipartRequest.getParameter("board_secret") : "0";
	
		//게시글을 생성하기위한 bean 객체에 데이터 담음
		bean.setBoard_id(multipartRequest.getParameter("board_id"));
		bean.setBoard_title(multipartRequest.getParameter("board_title"));
		bean.setBoard_content(multipartRequest.getParameter("board_content"));
		bean.setBoard_id(multipartRequest.getParameter("board_id"));
		bean.setBoard_type(multipartRequest.getParameter("board_type"));
		bean.setBoard_secret(boardSecretChk);
		bean.setBoard_file(originFileName);
		bean.setBoard_rename_file(fileTempName);
		
		//게시글 insert
		board.boardInsert(bean);

		//게시글 작성 후 리스트페이지로 이동
		response.sendRedirect("boardList.jsp?board_type="+multipartRequest.getParameter("board_type"));
		
	   
	%>
</body>
</html>