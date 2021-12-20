<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<!-- 
10/24_갤러리 댓글 틀 맞추기, 이 파일에서는 아이프레임 높이,너비 수정했습니다-->

<link rel="stylesheet" href="../css/listview.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/listview.css">
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
      <div class="box2">
      <div class="upload">
      	<c:if test="${user.idx == v_idx}">  <!--로그인(세션) 유저와 홈 유저가 같아야 사진을 올 릴 수 있다  -->
			<input type="button" value="사진 올리기" onclick="location.href='galleryRegist.do?u_idx=${user.idx}&v_idx=${v_idx }'">
		</c:if>
		</div>
		
		<hr>
		<!-- FE -->
		<div class="dropdown">
            <a class="dropdown-button" href="gallery.do?u_idx=${user.idx }&v_idx=${v_idx}">카테고리 전체보기</a>
            <div class="dropdown-content">
                <c:forEach var ="category" items="${categorylist }">
					<a href="gallerycategory.do?u_idx=${user.idx }&v_idx=${v_idx}&category=${category }">${category}</a> <br>
				</c:forEach>
				<c:if test="${user.idx == v_idx}">
				<form action="categoryadd.do?u_idx=${user.idx}&v_idx=${v_idx }" method="post">
					<input type="text" name="categoryname" size="50">
					<input type="submit" value="추가하기">
				</form>
				</c:if>
          	 </div>
         </div>
		<hr class="line">
			<table>
		<c:forEach var="vo" items="${glist}">	<!-- 리스트 가져오는거니까 반복문... -->
                
                <tr><th>제목</th>
                    <td>${vo.title} &emsp;&emsp;&emsp;&emsp;<fmt:formatDate value="${vo.gdate}" type="both"/>    
                   	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<c:if test="${user.idx == v_idx}">  <!--로그인(세션) 유저와 홈 유저가 같아야 수정 삭제가능  -->
		                <input type="button"  value="수정" class="btn1" onclick="location.href='galleryUpdateView.do?u_idx=${user.idx }&v_idx=${v_idx}&idx=${vo.idx }&category=${vo.category }'">
		                <!--갤러리테이블 자체의 idx  -->
		                <input type="button" value="삭제" class="btn3" onclick="location.href='galleryDelete.do?u_idx=${user.idx }&v_idx=${v_idx}&idx=${vo.idx }'">
                </c:if></td>
                </tr>
                
                 <tr>
                    <th>좋아요</th>
                    <td>${vo.heart}</td>
                    <c:if test="${user.idx != v_idx}">
                    <td><input type="button" value="좋아요" onclick="location.href='galleryheartupdate.do?u_idx=${user.idx }&v_idx=${v_idx}&idx=${vo.idx }'"></td>
                    </c:if>
                </tr>
                <tr>
                <!-- FE -->
                	<td><del><img alt="gallery" src="/img/${vo.filename}" width="800%" height="800%"></del></td>
                </tr>
                <tr>
                	<td>${vo.gcontent}</td>
                </tr>
                <tr><td colspan="2">
                <br>
                
                <!-- 댓글 시작 -->
                <form action="galleryCommentInsert.do?u_idx=${user.idx }&v_idx=${v_idx }" method="post" name="frmCmt">
                <div class="gugucomment">
 				<input type="hidden" name="idx" value= ${vo.idx }><!--사진 자체의 고유의 idx  -->  
				<hr class="line">
				<ul id="main">
					<li>
					<iframe src="galleryCommentList.do?gallery_idx=${vo.idx}" frameborder="0" style= "overflow-y; width: 100%; height: auto; margin-left:-40px; margin-top:10px;"></iframe>
						<ul class="row">
							<div class="writer">
										<li><input type="text" name="name" class="input1" style="width: 100px;" readonly value= "${user.name }"><span style="color:tomato;">님,댓글을 달아보세요!</span>
										</div>
						</ul>
					</li>
					<li>
						
							
							<textarea rows="1"
								cols="50" name="content" style="resize: none;"
								placeholder="댓글을 작성하세요." class="input1" required></textarea>
							</li>
							<li>
								<input type="submit" value="저장" class="button small">
								<input type="reset" value="취소" class="button small">
							</li>
						</ul>
					</li> 
              		  </ul>
              		  		<hr>
                	
                </div>
                </form>
			</c:forEach>
	        </table>
		
	</div>
</div>	<!-- pagebox end -->
<img src="${pageContext.request.contextPath}/image/logo.png" class="logo">

</body>
</html>