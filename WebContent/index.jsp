<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/menu.css">
<title>함께해서 즐거운 게임 세상!</title>
</head>
<body>
	<%@ include file="Top.jsp" %>
    <!--header -->
    <section id="main">
    <a><jsp:include page="slider.jsp" flush="true"/></a>
  	    <section id="notice">
  		    <div id="notice_title">
  			   공지사항
  		</div>
  		<br>
  		<ul>
  			<li class="name"><a href=""><u>회원 필독! 게시판 이용 규정 안내.</u></a></li>
          <br>
          <li class="name"><a href=""><u>게시글 열람 관련 공지 입니다.</u></a></li>
          <br>
          <li class="name"><a href=""><u>사이트 정기 점검 안내</u></a></li>
          <br>
          <li class="name"><a href=""><u>회원가입 관련 문의 안내입니다.</u></a></li>
  		</ul>
  	</section> <!-- section notice -->
  	
  	<section id="game_board">
  		<div id="game_board_title">
  			게임게시판
  		</div>
  		<br>
		<ul>
			<li class="name"><a href=""><u>게임 스크린샷 입니다.</u></a></li>
          <br>
          <li class="name"><a href=""><u>팬아트 입니다.</u></a></li>
          <br>
          <li class="name"><a href=""><u>게임 플레이 영상 입니다.</u></a></li>
          <br>
          <li class="name"><a href=""><u>알면 좋은 게임 공략!</u></a></li>
		</ul>
  	</section> <!-- section game_board -->
  	
  	<section id="shareinfo">
  		<div id="shareinfo_title">
  			정보공유게시판
  		</div>
  		<br>
		<ul>
		  <li class="name"><a href=""><u>11월의 무료배포 게임</u></a></li>
          <br>
          <li class="name"><a href=""><u>2021 12월 출시예정 게임</u></a></li>
          <br>
          <li class="name"><a href=""><u>2022 기대되는 신작게임</u></a></li>
		</ul>
  	</section> <!-- section shareinfo -->
  	
  	<section id="qna">
  		<div id="qna_title">
  			Q&A
  		</div>
  		<br>
		<ul>
		<li class="name"><a href=""><u>이 게임 버그 해결방법 아시는 분 있나요?</u></a></li>
          <br>
          <li class="name"><a href=""><u>이번 신작 관련 질문</u></a></li>
          <br>
          <li class="name"><a href=""><u>신규 콘솔 가격 언제쯤 떨어질가요?</u></a></li>
          <br>
          <li class="name"><a href=""><u>모드 적용법 아시는 분?</u></a></li>
		</ul>
  	</section> <!-- section game_board -->
  	
  	<section id="gamebanner">
  	<img src="img/gamebanner.png" alt="alt 텍스트">
  	</section>
  	
  	<section id="gamemachine1">
  	<section id="game1">
  	<iframe id="minigame1"
    title="mini_game1" width=389px height=260px mute=1
    src="http://ellisonleao.github.io/clumsy-bird/">
	</iframe>
  	</section>
  	</section>
  	
  	<section id="gamemachine2">
  	<section id="game2">
  	<iframe id="minigame2"
    title="mini_game1" width=470px height=490px
    src="https://play2048.co/">
	</iframe>
  	</section>
  	</section>
  	 	
  </section> <!-- section main -->
  
   <footer>
    <section id="footer">
<ul class="pagination">
<li>
<a href="#">^
</a>
</li>
</ul>
</section>
	<nav id="footerbanner">
	<a target='_blank'><img src="img/footerbanner.png" alt="alt 텍스트"></a>
	</nav>
        <section id="footer_menu_box">			
            <nav id="footer_menu">
            <ul>
              <li><a href="#">홈</a></li>
              <li><a href="#">이용약관</a></li>
              <li><a href="#">개인정보취급방침</a></li>
              <li><a href="#">이용안내</a></li>
            </ul>
          </nav>
        </section> <!-- section footer_menu_box -->

        <section id="footer_address">
            <p>게임닷컴 | 서울특별시 구로구 경인로 445 | 등록번호 아73782 | 발행조 8조 | 등록일 2021.11.05</p>
</section> <!-- section footer_address -->
</footer>
</body>
</html>

