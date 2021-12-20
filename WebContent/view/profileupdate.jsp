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
		<b><a class="gohome" href="minihome.do?u_idx=${user.idx }&v_idx=${user.idx}">${user.name}</a></b>(${user.email}) 님 &emsp;&emsp;&emsp;&emsp;&emsp;<span class="welcome"><span class="username">"${user.name}</span>&nbsp;님의 홈페이지입니다!"</span>
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
			</c:if>	         <!-- ================ 승준 10월25일 수정 시작 =============================== -->
		        <span>Title:${title}</span><br><!--승준 10월 25일 : 추가    -->
                <span>[짧은 자기소개]<br>${short_intro}</span><br>
         <!-- ================ 승준 10월25일 수정 시작 =============================== -->  
		<form action="profileUpdate.do?u_idx=${user.idx }&v_idx=${profile.idx}" method="post" enctype="multipart/form-data">	<!-- 액션부분은 비워뒀어요.. 액션은 백앤드! -->
		<div class="box2">	<!-- 페이지마다 달라지는 내용 -->
				<table>
			 	<tr><th width="25%">이름</th>
			 		<td><input type="text" name="name" size="70" value="${profile.name}" readonly></td>
			 	</tr>
			 	<tr><th>성별</th>
			 		<td>
			 			<input type="radio" value="M" name="gender" <c:if test="${profile.gender eq 'M'}">checked="checked"</c:if>>남자
                  		<input type="radio" value="F" name="gender" <c:if test="${profile.gender eq 'F'}">checked="checked"</c:if>>여자
						
			 	</tr>
			 	<tr><th>email</th>
			 		<td><input type="text" name="email" size="70" value="${profile.email}" readonly></td>
			 	</tr>
			 	<tr><th>생일</th>
			 		<td><input type="text" name="birth" size="70" value="${profile.birth}" placeholder="ex) 010314" readonly></td>
			 	</tr>
			 	<tr><th>취미</th>
			 		<td><input type="text" name="hobby" size="70" value="${profile.hobby}"></td>
			 	</tr>
			 	<tr><th>학교</th>
			 		<td><input type="text" name="school" size="70" value="${profile.school}"></td>
			 	</tr>
			 	<tr><th>직업</th>
			 		<td><input type="text" name="job" size="70" value="${profile.job}"></td>
			 	</tr>
			 	<tr><th>MBTI</th>
			 		<td><input type="radio" value="ISTJ" name="mbti" checked>ISTJ
						<input type="radio" value="ISTJ" name="mbti" <c:if test="${profile.mbti eq 'ISTJ'}">checked="checked"</c:if>>ISTJ
		               <input type="radio" value="ISFJ" name="mbti" <c:if test="${profile.mbti eq 'ISFJ'}">checked="checked"</c:if>>ISFJ
		               <input type="radio" value="INFJ" name="mbti" <c:if test="${profile.mbti eq 'INFJ'}">checked="checked"</c:if>>INFJ
		               <input type="radio" value="INTJ" name="mbti" <c:if test="${profile.mbti eq 'INTJ'}">checked="checked"</c:if>>INTJ<br>
		               <input type="radio" value="ISTP" name="mbti" <c:if test="${profile.mbti eq 'ISTP'}">checked="checked"</c:if>>ISTP
		               <input type="radio" value="ISFP" name="mbti" <c:if test="${profile.mbti eq 'ISFP'}">checked="checked"</c:if>>ISFP
		               <input type="radio" value="INFP" name="mbti" <c:if test="${profile.mbti eq 'INFP'}">checked="checked"</c:if>>INFP
		               <input type="radio" value="INTP" name="mbti" <c:if test="${profile.mbti eq 'INTP'}">checked="checked"</c:if>>INTP<br>
		               <input type="radio" value="ESTP" name="mbti" <c:if test="${profile.mbti eq 'ESTP'}">checked="checked"</c:if>>ESTP
		               <input type="radio" value="ESFP" name="mbti" <c:if test="${profile.mbti eq 'ESFP'}">checked="checked"</c:if>>ESFP
		               <input type="radio" value="ENFP" name="mbti" <c:if test="${profile.mbti eq 'ENFP'}">checked="checked"</c:if>>ENFP
		               <input type="radio" value="ENTP" name="mbti" <c:if test="${profile.mbti eq 'ENTP'}">checked="checked"</c:if>>ENTP<br>
		               <input type="radio" value="ESTJ" name="mbti" <c:if test="${profile.mbti eq 'ESTJ'}">checked="checked"</c:if>>ESTJ
		               <input type="radio" value="ESFJ" name="mbti" <c:if test="${profile.mbti eq 'ESFJ'}">checked="checked"</c:if>>ESFJ
		               <input type="radio" value="ENFJ" name="mbti" <c:if test="${profile.mbti eq 'ENFJ'}">checked="checked"</c:if>>ENFJ
		               <input type="radio" value="ENTJ" name="mbti" <c:if test="${profile.mbti eq 'ENTJ'}">checked="checked"</c:if>>ENTJ
			 				 	<!-- ================ 승준 10월26일 수정 시작 =============================== -->
			 	  <a href="javascript:ViewLayer();" style ="color:green;">[참고](클릭)</a>
			 	</tr>
			 	<Div id="Pop" style="position:absolute; left:300px; top:380px; width:100px; height:100px; z-index:1;display:none;">
  					 <img src="${pageContext.request.contextPath}/image/MBTI.jpg">
				</Div>
			<!-- ================ 승준 10월26일 밑에 javascript:ViewLayer();  =============================== -->

			 	<tr><th>프로필 사진</th>
			 		<td><input type="file" name="filename" accept="image/*" ></td>
			 					<!-- /img/는 url 경로, 이 경로와 c:\upload 매핑이 필요합니다. : server.xml -->
			 	</tr>
			 	<tr><th>자기소개</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
		 		<td><textarea  rows="10" cols="50" name="introduce" required="required">${profile.introduce}</textarea></td>
		 		</tr>
			 	<tr><td colspan="2" align="center">
			 	<input type="submit" value="저장">
			 	<input type="reset" value="다시쓰기">
			 	<input type="button" value="프로필" onclick="location.href='profileMain.do?u_idx=${user.idx}&v_idx=${profile.idx }'">
			 	</td></tr>
			 </table>
		</div>	<!-- box end -->
		</form>
	</div>	<!-- pagebox end -->
	<img src="${pageContext.request.contextPath}/image/logo.png" class="logo">
</body>
<!-- ================ 승준 10월26일 수정 시작 =============================== -->
	<script>  
     function ViewLayer(){
        //만일 Pop라는 녀석이 닫혀있다면??
        if(document.getElementById("Pop").style.display=="none"){
           //열어주어라
           document.getElementById("Pop").style.display='inline'
        //그렇지 않은 모든 경우라면??
        }else{
           //닫아주어라
           document.getElementById("Pop").style.display='none'
        }
     }
   </script> 
<!-- ================ 승준 10월26일 수정 끝=============================== -->
</html>