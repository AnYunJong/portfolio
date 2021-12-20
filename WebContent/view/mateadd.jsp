<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구신청</title>
<link rel="stylesheet" href="../css/view.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/view.css?v=3">
</head>
<body>
<c:if test="${sessionScope.user == null}">
	<input type="button" name="login" value="Login" class="login" onclick = "location.href='login.do'">
</c:if>
<c:if test="${sessionScope.user != null}">
		<input type="button" name="logout" value="Logout" class="logout" onclick = "location.href='logout.do'">
		<b><a class="gohome" href="minihome.do?u_idx=${user.idx }&v_idx=${user.idx}">${user.name}</a></b>(${user.email}) 님 &emsp;&emsp;&emsp;&emsp;&emsp;<span class="welcome"><span class="username">"${user.name}</span>&nbsp;님의 홈페이지입니다!"</span>
	</c:if>
    <div class="box">

		        <nav><!--의미(시맨틱)가 있는 태그-->
		            <ul class="container">
		             <li><a href="minihome.do?u_idx=${user.idx }&v_idx=${v_idx}">home</a></li>
		             <li><a href="profileMain.do?u_idx=${user.idx }&v_idx=${v_idx}">profile</a></li>
		             <li><a href="mateAction.do?u_idx=${user.idx }&v_idx=${v_idx}">mate</a></li>
		             <li><a href="guestbook.do?u_idx=${user.idx }&v_idx=${v_idx}">visitor</a></li>
		             <li><a href="gallery.do?u_idx=${user.idx }&v_idx=${v_idx}">gallery</a></li>
		             <li><a href="guguboard.do?u_idx=${user.idx }&v_idx=${v_idx}">board</a></li>
		            </ul>
		       </nav>
	    
      
		<!-- ================ 승준 10월25일 수정 시작 =============================== -->
			<c:if test="${profile.filename == null}">
				<img id="image" alt="filename" src="${pageContext.request.contextPath}/image/gugulogo.png" class="image" > 
			</c:if>	
			<c:if test="${profile.filename != null}">
				<img id="image" alt="filename" src="/img/${profile.filename }"  class="image"> 
			</c:if>	
		<!-- ================ 승준 10월25일 수정 시작 =============================== -->
               	<span>Title:${title}</span><br><!--승준 10월 25일 : 추가    -->
                <span>[짧은 자기소개]<br>${short_intro}</span><br>
         <!-- ================ 승준 10월25일 끝  =============================== --> 
               
        <form action="requestmateaction.do?u_idx=${u_idx }&v_idx=${v_idx}" method="post">
		<div class="box2">
		<b>친구신청</b><hr>
			${user.name}님 ${v_name}님에게 친구신청하시겠습니까?<br>
			&nbsp;&nbsp;&nbsp;&nbsp; 닉네임을 입력해주세요.<br>
			<div>
			 	<b>닉네임</b>
			 		<input type="text" name="nickname" size="30">
			 		<input class="accept" type="submit" value="친구신청">
					<input class="accept" type="button" value="취소" onclick="location.href='mateAction.do?v_idx=${u_idx}'">
			</div>
		</div>
	</form>
</div>	<!-- pagebox end -->
	<img src="${pageContext.request.contextPath}/image/logo.png" class="logo">
</body>
</html>