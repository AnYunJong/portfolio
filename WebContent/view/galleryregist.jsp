<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 올리기</title>
<link rel="stylesheet" href="../css/updateview.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateview.css">
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
		             <li><a href="minihome.do?u_idx=${user.idx }&v_idx=${user.idx}">home</a></li>
		             <li><a href="profileMain.do?u_idx=${user.idx }&v_idx=${user.idx}">profile</a></li>
		             <li><a href="mateAction.do?u_idx=${user.idx }&v_idx=${user.idx}">mate</a></li>
		             <li><a href="guestbook.do?u_idx=${user.idx }&v_idx=${user.idx}">visitor</a></li>
		             <li><a href="gallery.do?u_idx=${user.idx }&v_idx=${user.idx}">gallery</a></li>
		             <li><a href="guguboard.do?u_idx=${user.idx }&v_idx=${user.idx}">board</a></li>
		            </ul>
		       </nav>
	    	<%-- </c:if>
    	</c:if> --%>
		<form action="galleryInsert.do?u_idx=${user.idx }&v_idx=${user.idx}" method="post" enctype="multipart/form-data">
		<div class="box2">
            <!-- <p class="typo">GuGu board</p> -->
            <table>
                
                <tr><th>제목</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" size="50" required></td>
                </tr>
                <tr><th>카테고리</th>
                    <td>
					<select name="category">
				       <!--option태그안에 문자열은 화면에 보이는 것
				      value안에 문자열은 서버로 전송되는 값-->
				        <c:forEach var ="category" items="${categorylist }">
					       <option value="${category }">${category }</option>
						</c:forEach>
				    </select>

					</td>
                </tr>
                <tr><th>사진</th>
			 		<td><input type="file" name="filename" accept="image/*"></td>
			 	</tr>
                <tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  rows="8" cols="80" name="gcontent" required></textarea>
                    <!--textarea 는 multi line 입력이 됩니다.  --></td>
                </tr>
                <tr><td colspan="2">
               <hr>
                <input type="submit" value="저장" class="btn">
                <input type="reset" value="초기화">
                <input type="button" value="갤러리" class="btn3" onclick="location.href='gallery.do?u_idx=${user.idx}&v_idx=${user.idx }'">
                </tABLE>
            </div>
            </form>
            </div>
            <img src="${pageContext.request.contextPath}/image/logo.png" class="logo"> 

</body>
</html>