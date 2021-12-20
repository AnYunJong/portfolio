<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 등록</title>
<link rel="stylesheet" href="../css/updateview.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateview.css">
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
		<form action="guestbooksave.do?u_idx=${u_idx }&v_idx=${v_idx}" method="post">	<!-- 액션부분은 비워뒀어요.. 액션은 백앤드! -->
		<div class="box2">
            <!-- <p class="typo">GuGu board</p> -->
			   <input type ="hidden" name ="u_name" value="${u_name}">
            <table>
                <tr>
                <tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  rows="8" cols="80" name="content" required></textarea>
                    <!--textarea 는 multi line 입력이 됩니다.  --></td>
                </tr>
                <tr><td colspan="2">
               <hr>
                <input type="submit"  value="저장" class="btn">
                <input type="reset" value="초기화">
                <input type="button" value="방명록" class="btn3" onclick="location.href='guestbook.do?u_idx=${u_idx}&v_idx=${v_idx }'">
                </tABLE>
            </div>
            </form>
            </div>
            <img src="${pageContext.request.contextPath}/image/logo.png" class="logo"> 

</body>
</html>