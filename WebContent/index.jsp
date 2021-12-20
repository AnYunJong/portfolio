<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>99World</title>
<link rel="stylesheet" href="./css/main.css?v=3">
</head>
<body>
	<div class="menu">
		<h1 class="logo">
			<a href="./">
				<img alt="logo" src="./image/logo.png" width="50px" height="50px">
			</a>
		</h1>
		<ul class="navlist">
			<li>
			<c:if test="${sessionScope.user == null}">
				<b><a href="login.do" class="minihome">미니홈피</a></b>
			</c:if>
			<c:if test="${sessionScope.user != null}">
				<b><a href="minihome.do?u_idx=${user.idx}&v_idx=${user.idx}" class="minihome">미니홈피</a></b>
			</c:if>
			</li>
		</ul>
	</div>
	<div class="logbutton">
		<div class="loginout">
			<c:if test="${sessionScope.user == null}">
				<b><a href="login.do">로그인</a></b>
			</c:if>
			<c:if test="${sessionScope.user != null}">
				${user.name}(${user.email}) 님 &nbsp;
				<b><a href="logout.do">로그아웃</a></b>
			</c:if>
		</div>
	</div>
	<div class="image">
		<img alt="banner" src="./image/mainbanner.jpg" id="banner">
		<img alt="banner" src="./image/mainbanner2.jpg" id="banner2">
	</div>
	<div class="info">
		<span class="gugu"><b>99</b></span><b>World</b>에서 <br>
		자신만의 <span class="gugu"><b>Unique</b></span>한 공간을 만들어보세요! <br>
		<img alt="homepage" src="./image/homepage.jpg" id="homepage">
	</div>
	<div class="info2">
		<span class="gugu"><b>99</b></span><b>World</b>에서 <br>
		자신만의 <span class="gugu"><b>Unique</b></span>한 공간을 만들어보세요! <br>
		<img alt="homepage" src="./image/homepage.jpg" id="homepage2">
	</div>
	<hr>
	<%@ include file="./bottom.jsp" %>
</body>
</html>