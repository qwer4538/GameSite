<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "Board.*" %>

<%!
int paging = 1;
int box = 5;
int limit = 12; 
String order = " ";
%>
<%  
 
if(request.getParameter("paging")!=null) { 
	//받아온 pg값이 있을때, 다른페이지일때 
		paging = Integer.parseInt(request.getParameter("paging")); // pg값을 저장 
	}
int start = (paging*limit) - (limit-1); // 해당페이지에서 시작번호(step2) 
int end = (paging*limit); // 해당페이지에서 끝번호(step2) 
int allPage = 0; // 전체 페이지수 
int startPage = ((paging-1)/box*box)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6) 
int endPage = ((paging-1)/box*box)+box; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)


	order = request.getParameter("order") != null ? request.getParameter("order") : "";

	
	Board board = new Board();

	//게시판은 MYSQL 테이블 board 에 정의 타입별 고유키로 해당 게시판의 데이터를 가져옴
	//게시판은 파라미터로 구분
	String board_type = request.getParameter("board_type");
	
	//게시판명
	String board_name = board.getBoardName(board_type); 
	
	//게시판리스트
	ArrayList<BoardBean> list = board.getBoardList(board_type,paging,limit,order);
	
	//게시판리스트
	int totalCnt = board.getBoardTotal(board_type);
	
	allPage = (int)Math.ceil(totalCnt/(double)limit);
	
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
	<%@ include file="Top.jsp" %>
  
  	<section id="main">
  		
		<div class="board">
			
			<div class="searchBox">
				<select class="orderBy" onchange="order(this.value)">
					<option value="">정렬</option> 
					<option <% if(order.equals("board_date")) {out.print(" selected ");} %> value="board_date">작성일자 내림차순</option>
					<option <% if(order.equals("board_visit")) {out.print(" selected ");} %> value="board_visit">조회수 내림차순</option>
				</select>
			</div>
			
			<div>
			Total : <%=totalCnt %> 
  			</div>
  			
  			<% if(board_type.equals("2")){ %>
  			
  			<div class="gallayBoard">
	  			<%
				for(int i=0; i< list.size();i++){
					
					String img = list.get(i).getBoard_rename_file();
					if(img == null){
						img ="default.png";  
					}
				%>
				
					<div class="photoBox">
					
		  				<a href="boardView.jsp?board_type=<%=list.get(i).getBoard_type() %>&board_no=<%=list.get(i).getBoard_no() %>">
		  				<div class="imgBox" style="background:url(/upload/<%=img %> ) no-repeat;background-size: 100% auto"></div>
		  				
					<span class="title">
					<% 
					String secret = list.get(i).getBoard_secret(); 
					
					//비밀글일 경우
					if(secret.equals("1")){ 
						out.print("[비밀글]"); 
					}
					%>
					<%=list.get(i).getBoard_title() %></span>
		  				<span><%=list.get(i).getBoard_id() %></span>
		  				
		  				<span class="visit">조회수 <%=list.get(i).getBoard_visit() %></span>
		  				</a>
		  			</div>
		  		 
				<%
				}
				%>  
  			</div>
  			<%}else{ %>
  			
  			<!-- 일반게시판 s -->
			<table> 
				  <colgroup>
				    <col width="100px"  />
				    <col width="*"  />
				    <col width="100px"/>
				    <col width="80px"/>
				    <col width="200px" />
				  </colgroup>
				<tr> 
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>작성일자</th>
				</tr>
				<%
				
				for(int i=0; i< list.size();i++){
				
				%>  
				<tr> 
					<td class="center"><%=totalCnt - ((paging-1)*limit)  -i %></td>
					<td>
					<% 
					String secret = list.get(i).getBoard_secret(); 
					
					//비밀글일 경우
					if(secret.equals("1")){ 
						out.print("[비밀글]"); 
					}
					%>
					<a href="boardView.jsp?board_type=<%=list.get(i).getBoard_type() %>&board_no=<%=list.get(i).getBoard_no() %>"><%=list.get(i).getBoard_title() %></a>
					</td>
					<td class="center"><%=list.get(i).getBoard_id() %></td>
					<td class="center"><%=list.get(i).getBoard_visit() %></td>
					<td class="center"><%=list.get(i).getBoard_date() %></td>
				</tr>
				<%
				}
				%>
			</table>	
			<!-- 일반게시판 e -->
			
			<%} %>
			
		</div>
		<div class="board_paging">
			<%
			if(paging>box) {
		%>
			
			<a href="?board_type=<%=board_type %>&paging=<%=startPage-1%>&order=<%=order%>"><</a>
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= Math.min(endPage,allPage); i++){ 
				if(i==paging){
		%>
					<span class="nowpage" ><%=i %></span>  
		<%
				}else{
		%>
					<a href="?board_type=<%=board_type %>&paging=<%=i %>&order=<%=order%>"><%=i %></a>
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			<a href="?board_type=<%=board_type %>&paging=<%=endPage+1%>&order=<%=order%>">></a>
			
		<%
			}
		%>

			
		
			
		</div>
		
		<div class="board_btn">	
			<%  if(board_type.equals("1")){ %> 
				<% if(level.equals("10")){ %>
					<a href="boardWrite.jsp?board_type=<%=board_type%>">글쓰기</a>
				<% } %> 
			<%}else{ %>
			
				<a href="boardWrite.jsp?board_type=<%=board_type%>">글쓰기</a>
			<%} %>
		</div>
		
	</section>
</body>

<script>
function order(value){
	location.href="?board_type=<%=board_type%>&order="+value;
}
</script>

</html>