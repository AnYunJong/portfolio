<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
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
		             <li><a href="minihome.do?u_idx=${user.idx }&v_idx=${profile.idx}">home</a></li>
		             <li><a href="profileMain.do?u_idx=${user.idx }&v_idx=${profile.idx}">profile</a></li>
		             <li><a href="mateAction.do?u_idx=${user.idx }&v_idx=${profile.idx}">mate</a></li>
		             <li><a href="guestbook.do?u_idx=${user.idx }&v_idx=${profile.idx}">visitor</a></li>
		             <li><a href="gallery.do?u_idx=${user.idx }&v_idx=${profile.idx}">gallery</a></li>
		             <li><a href="guguboard.do?u_idx=${user.idx }&v_idx=${profile.idx}">board</a></li>
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
           <c:if test="${user.idx == profile.idx}"> <!--로그인(세션) 유저와 홈 유저가 같아야 수정 할 수 있다  -->  
                  <div>
					<input type="button" value="프로필 등록 및 수정" onclick="location.href='profileModify.do?u_idx=${user.idx}&v_idx=${profile.idx }'">
                  </div>
			</c:if>      
		<div class="box2">	<!-- 페이지마다 달라지는 내용 -->
				<ul class="main">
					<li>
						<ul class="row">
							<li>이름</li>	
							<li>${profile.name}</li>
						</ul>
					</li>
					<li>
						<ul class="row">
							<li>성별</li>	
							<li>${profile.gender}</li>
						</ul>
					</li>
					<li>
						<ul class="row">
							<li>나이</li>
								<li>${profile.age}</li>
						</ul>
					</li>
						<li>
							<ul class="row">
								<li>email</li>
								<li>${profile.email}</li>
							</ul>
						</li>
						<li>
							<ul class="row">
								<li>직업</li>	
								<li>${profile.job}</li>
							</ul>
						</li>
						<li>
							<ul class="row">
								<li>학교</li>	
								<li>${profile.school}</li>
							</ul>
						</li>
						<li>
							<ul class="row">
								<li>취미</li>
								<li>${profile.hobby}</li>
							</ul>
						</li>
						<li>
							<ul class="row">
								<li>MBTI</li>
								<li>${profile.mbti}</li>
							</ul>
						</li>
						<li>
							<ul class="row-2">
								<li>
									<pre>${profile.introduce}</pre>
								</li>					
							</ul>
						</li>
					</ul>
		</div>
	</div>	<!-- box end -->
	<img src="${pageContext.request.contextPath}/image/logo.png" class="logo">
</body>
</html>