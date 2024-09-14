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
		
		
		//파일업로드 기본 셋팅
		int sizeLimit = 100*1024*1024;
		String realPath = "C:/Myweb/WebContent/upload";
	    File dir = new File(realPath);
		MultipartRequest multipartRequest = null;
		multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		String filename = multipartRequest.getFilesystemName("board_file");
		
		
		
		//게시판의 고유코드
		String board_type = multipartRequest.getParameter("board_type");
		int board_no = Integer.parseInt(multipartRequest.getParameter("board_no"));
		
		
		
		//게시판뷰
		BoardBean updateBean = board.getBoardView(board_type,board_no);
		
		//기본적으로 이전의 파일명을 가지고 있다가 파일 교체가 없을 경우 그대로 유지하기 위함.
		String originFileName = updateBean.getBoard_file();
		String fileTempName = updateBean.getBoard_rename_file();
		
		//업로드 파일이 있으면 업로드 진행
		if(filename != null){
			
			//이전 파일 제거
			if(updateBean.getBoard_rename_file() !=null){
				String delfileName = bean.getBoard_rename_file(); //지울 파일명

			    File f = new File(realPath + "/" + delfileName); // 파일 객체생성
			    if( f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.

			}
			
			
			Enumeration e = multipartRequest.getFileNames();  // 폼의 이름 반환
			
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
			
		}
		
		String boardSecretChk = "";
		boardSecretChk = multipartRequest.getParameter("board_secret") != null ? multipartRequest.getParameter("board_secret") : "0";
	
		//업데이트할 파라미터 bean에 추가
		bean.setBoard_no(multipartRequest.getParameter("board_no"));
		bean.setBoard_id(multipartRequest.getParameter("board_id"));
		bean.setBoard_title(multipartRequest.getParameter("board_title"));
		bean.setBoard_content(multipartRequest.getParameter("board_content"));
		bean.setBoard_id(multipartRequest.getParameter("board_id"));
		bean.setBoard_type(multipartRequest.getParameter("board_type"));
		bean.setBoard_secret(boardSecretChk);
		bean.setBoard_file(originFileName);
		bean.setBoard_rename_file(fileTempName);
		
		//업데이트 처리
		board.boardUpdate(bean);
	
		//업데이트 후 뷰페이지로 리다이렉트
		response.sendRedirect("boardView.jsp?board_type="+multipartRequest.getParameter("board_type")+"&board_no="+multipartRequest.getParameter("board_no"));
		
	   
	%>
</body>
</html>