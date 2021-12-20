<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">

div { /* 로그인 창*/
	border: 2px dotted #f5b49c; 
	width: 200px;
	height: 316px;
	background-color: ivory;
	padding: 50px;  /*안쪽여백*/
	margin: 100px auto; /*바깥쪽여백*/
	
}
form{
	width: 200px;
	height: 325px;


}
input{ 	padding: 7px; /*입력창 전체*/
		margin: 15px auto; 
		
	
	}

input[type=submit], input[type=button] {/*아이디,비번 입력창*/
	padding: 7px 15px;
	margin: 7px 10px;
	background: #99CEB5; 
	color: white;
	border: none;
	cursor: pointer;
	width:35%;
}
input[type=submit]:hover{ /*로그인버튼*/
	background:#F59B7A;
}
input[type=button]:hover{/*홈버튼*/
	background:#F59B7A;
}

img{
	opacity: 55%; /*투명도*/
}
a{
	text-decoration: none; /*계정(아이디,비번)찾기 링크*/
	color: tomato;
	margin-top: 40px;
}
hr{ 
	border: 1px dotted #f5b49c;
	margin-top:9px;
}

b>mark{ /*계정찾기*/
	background-color: white;
	width:50px;
	color:#F59B7A;
	
}
/*  input[type="password"] {
	padding-top:10em;
} */
input[type="password"] { /*비번 입력창*/
	margin-top:6px;
}  
input[type="button"]{ /*로그인/회원가입 버튼*/
	margin-top:6px;
	width:77px;
}





</style>
<script>
function loginCheck(){
var guguLogin = document.guguLogin;
var userid = guguLogin.userid.value;
var password = guguLogin.password.value;

if(!userid || !password){
	alert("아이디와 비밀번호는 필수입력입니다.");
 return;
	
}else{
	guguLogin.submit();
}
}
</script>
</head>
<body style="text-align:center;">
<div>
	
	<form name="guguLogin" action="loginAction.do" method="post">		          
		<img src="${pageContext.request.contextPath}/image/logo.png" width=100%>
	   
		<input type="text" name="email" class="text-field" placeholder="아이디(이메일) 입력하세요.">
		<input type="password" name="password" class="text-field" placeholder="비밀번호 입력하세요.">
		<input type="submit" value="Login">
		<input type="button" value="JOIN" onclick = "location.href='member.do'">
		<hr>														<!--회원가입파일명 삽입-->
		<a href="lostEmail.do"><b><mark>계정찾기</mark></b></a>
		
		<!--여기에 아이디/비번찾기 링크 삽입-->
	</form>

</div>
</body>
</html>