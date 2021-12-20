<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Nanum+Gothic+Coding&display=swap');
a{
text-decoration : none;
height:35px;
width : 160px;
margin:30px;
color:gray;
border:1px solid gray;
padding: 10px 20px;
}
.center{
margin:30px auto;
text-align:center;
}
h1{
color:ivory;
text-align:center;
font-size:60px;
}
img{
text-align:center;
}
h2{
font-family: 'Nanum Gothic', sans-serif;
}


</style>
</head>
<body>
<div style="width:50% margin:auto;padding-top:30px;">
<div style="text-align:center;">
	<img src="../image/errorImage.png" alt="404status"><!-- alt는 이미지 안보일때 출력테스트 -->
</div>
<div style="background-color:tomato; width:auto">
<H1>404 Error</H1>
</div>
<h2 class="center">이런.....요청한 페이지를 찾을수 없어요!</h2>
<div style="margin:20px;text-align:center;padding: 10px 20px;">

<a href="${pageContext.request.contextPath}">HOME</a>
<a href="javascript:history.back()">BACK</a>
<!-- 상대경로 : 현재 위치를 기준으로../또는 ./ 또는 경로명/
	 절대경로 : 이 애플리케이션의 context 기준으로 합니다.
 -->
 </div>
 </div>
</body>
</html>