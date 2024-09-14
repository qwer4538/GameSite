
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>AdminLogIn</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <style>
.container {
	width: 385px;
	line-height: 50px;
	margin: 40px auto;
}

h5 {
	text-align: center;
}

h5 span {
	color: teal;
}

.login {
	background-color: skyblue;
	color: white;
	border-radius: 5px;
	border: 0;
	padding: 10px 172px;
}

#signup {
	background-color: white;
	color: teal;
	border: 0;
	font-size: 17px;
}

p {
	text-align: center;
}

i {
	color: lightgray;
}

#imail {
	position: absolute;
	top: 130px;
	margin: 170px 355px;
}

#ipw {
	position: absolute;
	top: 180px;
	margin: 173px 355px;
}

input {
	border: 1px solid lightgray;
	border-radius: 3px;
}
</style>
</head>

<body>
	<div style="text-align : center;"><img src="..\img\portfolio\Logo.PNG"  style="width:430px; height:160px;"/></div>
	<div class="container">
	
        
      	
        <div id="imail">
            <i class="material-icons">person_outline</i>
        </div>
        
        <div id="ipw">
            <i class="material-icons">lock_outline</i>
        </div>
        
        	<h5><span>관리자</span> 로그인 페이지입니다.</h5>
        <hr />
        <form action="adminLoginProc.jsp">
            <input type="text" placeholder="아이디" name="admin_id" required style="height:30px; width: 380px" /><br />
            <input type="password" placeholder="비밀번호" name="admin_passwd" required style="height:30px; width: 380px" /><br />
            <input type="submit" value="로그인" class="login" />
        </form>
        <hr />
    </div>
</body>
</html>