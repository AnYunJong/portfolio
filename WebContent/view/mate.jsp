<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구</title>
<link rel="stylesheet" href="../css/view.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/view.css?v=3">
</head>
<body>
<c:if test="${sessionScope.user == null}">
	<input type="button" name="login" value="Login" class="login" onclick = "location.href='login.do'">
</c:if>
<c:if test="${sessionScope.user != null}">
		<input type="button" name="logout" value="Logout" class="logout" onclick = "location.href='logout.do'">
		<b><a class="gohome" href="minihome.do?u_idx=${user.idx }&v_idx=${user.idx}">${user.name}</a></b>(${user.email}) 님 &emsp;&emsp;&emsp;&emsp;&emsp;<span class="welcome"><span class="username">"${name}</span>&nbsp;님의 홈페이지입니다!"</span>
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
				<img id="image"alt="filename" src="${pageContext.request.contextPath}/image/gugulogo.png" class="image" > 
			</c:if>	
			<c:if test="${profile.filename != null}">
				<img id="image"alt="filename" src="/img/${profile.filename }"  class="image"> 
			</c:if>			
			 <!-- ================ 승준 10월25일 수정 시작 =============================== -->
		 		<span>Title:${title}</span><br><!--승준 10월 25일 : 추가    -->
                <span>[짧은 자기소개]<br>${short_intro}</span><br>
         <!-- ================ 승준 10월25일 수정 시작 =============================== --> 

	<div class="box2">	<!-- 페이지마다 달라지는 내용 -->
		<div class="matelist">
		<h5>친구</h5>
			<c:forEach var="mate" items="${matelist}">	<!-- 친구 목록을 받아오는 리스트 -->
				<ul id="list">
				<li>
					<ul class="listview">
						<li>${mate.nickName}</li>
						<li>
							<input type="button" value="미니홈피" onclick="location.href='minihome.do?u_idx=${user.idx}&v_idx=${mate.v_idx }'">
						<c:if test="${user.idx == v_idx}">
							<input type="button" value="삭제" onclick="location.href='deletefriend.do?u_idx=${user.idx}&v_idx=${mate.v_idx}'">
						</c:if>
						</li>
					</ul>
				</li>
				<li><hr></li>
			</ul>
			</c:forEach>
		</div>
		<c:if test="${user.idx == v_idx}"> <!-- 자신의 홈피일때만 보이는 항목 시작 -->
			<div class="matelist">
			<h5>내가 넣은 친구 신청</h5>
				<c:forEach var="notmate" items="${addmate}">
					<ul id="list">
					<li>
						<ul class="listview">
							<li>${notmate.name}</li>
							<li>
								<input type="button" value="취소" onclick="location.href='deletefriend.do?u_idx=${user.idx}&v_idx=${notmate.idx}'">
							</li>
						</ul>
					</li>
					<li><hr></li>
				</ul>
				</c:forEach>
			</div>
			<div class="matelist">
			<h5>받은 친구 신청</h5>
				<c:forEach var="notmate" items="${waitingmate}">	<!-- 친구신청을 받은 목록 -->
					<ul id="list">
					<li>
						<ul class="listview">
							<li>${notmate.name}</li>
							<li>
								<input type="button" value="수락" onclick="location.href='newfriend.do?u_idx=${user.idx}&v_idx=${notmate.idx}'">
								<input type="button" value="거절" onclick="location.href='deletefriend.do?u_idx=${user.idx}&v_idx=${notmate.idx}'">
							</li>
						</ul>
					</li>
					<li><hr></li>
				</ul>
				</c:forEach>
			</div>
		</c:if><!-- 자신의 홈피일때만 보이는 항목 끝 -->
		
		<div class="matelist">
		<h5>추천 친구</h5>
			<c:forEach var="notmate" items="${randommate}">	<!-- 친구신청을 받은 목록 -->
				<ul id="list">
				<li>
					<ul class="listview">
						<li>${notmate.name}</li>
						<li>
							<c:if test="${user.idx == v_idx}">
							<input type="button" value="친구신청" onclick="location.href='requestfriendaction.do?u_idx=${user.idx}&v_idx=${notmate.idx}'">
							</c:if>
						</li>
					</ul>
				</li>
				<li><hr></li>
			</ul>
			</c:forEach>
		</div>
		
	</div>
</div>	<!-- pagebox end -->
<img src="${pageContext.request.contextPath}/image/logo.png" class="logo">
</body>
</html>