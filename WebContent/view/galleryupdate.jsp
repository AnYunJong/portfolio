<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 수정</title>
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
		             <li><a href="minihome.do?u_idx=${user.idx }&v_idx=${v_idx}">home</a></li>
		             <li><a href="profileMain.do?u_idx=${user.idx }&v_idx=${v_idx}">profile</a></li>
		             <li><a href="mateAction.do?u_idx=${user.idx }&v_idx=${v_idx}">mate</a></li>
		             <li><a href="guestbook.do?u_idx=${user.idx }&v_idx=${v_idx}">visitor</a></li>
		             <li><a href="gallery.do?u_idx=${user.idx }&v_idx=${v_idx}">gallery</a></li>
		             <li><a href="guguboard.do?u_idx=${user.idx }&v_idx=${v_idx}">board</a></li>
		            </ul>
		       </nav>
	    	<%-- </c:if>
    	</c:if> --%>
		<form action="galleryUpdate.do?u_idx=${user.idx }&v_idx=${v_idx}" method="post">	<!-- 액션부분은 비워뒀어요.. 액션은 백앤드! -->
		<div class="box2">
            <!-- <p class="typo">GuGu board</p> -->
      		<input type ="hidden" name="idx" value= ${gallery.idx }>
            <table>
                <tr><th>제목</th>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="title" size="50" value="${gallery.title}"></td>
                </tr>
                
                <tr><th>카테고리</th>
                    <td>
					<select name="category">
				       <!--option태그안에 문자열은 화면에 보이는 것
				      value안에 문자열은 서버로 전송되는 값-->
				        <c:forEach var ="category" items="${categorylist }">
					       <option value="${category }" <c:if test=" ${category } == ${gallery.category}"> selected </c:if>>${category }</option>
						</c:forEach>
				    </select>
					</td>
                </tr>
                <tr><th>사진</th>
			 		<!-- <td><input type="file" name="pic" accept="image/*" placeholder="이미지 파일을 선택하세요."></td> -->
			 		<td><input type="text" name="filename"  value="${gallery.filename}" disabled></td>
			 	</tr>
                <tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  rows="8" cols="80" name="gcontent">${gallery.gcontent}</textarea>
                    <!--textarea 는 multi line 입력이 됩니다.  --></td>
                </tr>
                <tr><td colspan="2">
               <hr>
                <input type="submit"  value="저장" class="btn">
                <input type="reset" value="초기화">
                <input type="button" value="갤러리" class="btn3" onclick="location.href='gallery.do?u_idx=${user.idx}&v_idx=${v_idx}'">
                </tABLE>
            </div>
            </form>
            </div>
            <img src="${pageContext.request.contextPath}/image/logo.png" class="logo"> 

</body>
</html>