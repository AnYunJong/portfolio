<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구수락/거절</title>
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
         <!-- ================ 승준 10월25일 수정 시작 =============================== --> 
               
        <form action="newmate.do?u_idx=${u_idx }&v_idx=${v_idx}" method="post">
		<div class="box2">
		<h3>친구 닉네임</h3>
			${user.name}님<br>
			${v_name}님이 친구요청하셨습니다.
			<table>
			 	<tr><th width="25%">닉네임</th>
			 		<td><input type="text" name="nickname" size="30"></td>
			 	</tr>
			 	<tr>
			 		<td colspan="2" align="center">
			 		<input class="accept" type="submit" value="수락">
			 		<input class="accept" type="button" value="거절" onclick="location.href='deletefriend.do?u_idx=${u_idx}&v_idx=${v_idx}'">
					<input class="accept" type="button" value="취소" onclick="location.href='mateAction.do?u_idx=${u_idx}&v_idx=${u_idx}'">
			 		</td>
			 	</tr>
			</table>
		</div>
	</form>
</div>	<!-- pagebox end -->
	<img src="${pageContext.request.contextPath}/image/logo.png" class="logo">
</body>
</html>