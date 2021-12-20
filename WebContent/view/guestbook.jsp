<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
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
			<%-- </c:if>
    	</c:if> --%>
      <div class="box2">
      <div>
      	<c:if test="${user.idx != v_idx}">  <!--로그인(세션) 유저와 홈 유저가 같아야 사진을 올 릴 수 있다  -->
		 <input type="button" value="방명록 작성" onclick="location.href='guestbookadd.do?u_idx=${user.idx}&v_idx=${v_idx }'">
		</c:if>
		<hr>
		</div>
		<table>
			<c:forEach var="vo" items="${list}">	<!-- 리스트 가져오는거니까 반복문... -->
                
                <tr><th>작성자</th>
                    <td>${vo.name }&emsp;&emsp;&emsp;&emsp;<fmt:formatDate value="${vo.wdate}" type="both"/>
                    <c:if test="${user.idx == v_idx or user.idx==vo.v_idx}">
	               	 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type="button" value="삭제" class="btn3" onclick="location.href='guestbookdelete.do?u_idx=${user.idx}&v_idx=${v_idx }&idx=${vo.idx}'">
	                </c:if>
                    </td>
                </tr>
                <tr><th>내용</th> 
                	<td> <pre>${vo.content }</pre> </td>
                </tr>
                <tr><td colspan="2">
                <br>
                
              <!-- 댓글 시작 --><!--10월23일 승준 추가부분 시작  -->
                <form action="gbookCommentInsert.do?u_idx=${user.idx }&v_idx=${v_idx }" method="post" name="frmCmt">
                <div class="gugucomment">
 				<input type="hidden" name="idx" value= ${vo.idx }><!--방명록 자체의 고유의 idx  -->  
				<hr class="line">
				<ul id="main">
					<li>
					<iframe src="gbookCommentList.do?idx=${vo.idx}" style= "overflow-y; width: 100%; height: auto; margin-left:-40px; margin-top:10px;"></iframe>
						<ul class="row">
							 <div class="writer">
								<li><input type="text" name="name" style="width: 100px;" class="input1" readonly value= "${user.name }"><span style="color:tomato;">님,댓글을 달아보세요!</span>
										</div>
						</ul>
					</li>
					<li>
						<ul class="row-2">
							<li>
							<textarea rows="5"
								cols="80" name="content" style="resize: none;"
								placeholder="댓글을 작성하세요." class="input1" required></textarea>
							</li>
							<li>
								<input type="submit" value="저장" class="button small">
								<input type="reset" value="취소" class="button small">
							</li>
						</ul>
					</li> 
              		  </ul>
                	
                </div>
                </form><!--10월23일 승준 추가부분 끝       -->
                <hr class="line">
			</c:forEach>
          </table>
		<div style="text-align: center;">
			<!-- href="listAction.jsp?page=1" 요청 url은 현재와 같을 때 생략하고 ? 뒤에 파라미터값만 변경합니다. -->
			<c:if test="${pageDto.startPage != 1}">
			<a class="pagenum" href="?page=1">&lt;&lt;</a>
			<a class="pagenum" href="?page=${pageDto.startPage - 1}">&lt;</a>
			<!-- 현재 페이지를 startPage 값에서 -1 로 변경하면 요청이 변경되면서 자동 계산. -->
			</c:if>
				
			<c:forEach var="i" begin="${pageDto.startPage}" end="${pageDto.endPage}">
				<a class="pagenum
					<c:if test="${pageDto.currentPage == i}">current</c:if>
				" href="?page=${i}">${i}</a>
			</c:forEach>
				
			<c:if test="${pageDto.endPage != pageDto.totalPage}">
			<a class="pagenum" href="?page=${pageDto.endPage + 1}">&gt;</a>
			<!-- 현재 페이지를 endtPage 값에서 +1 로 변경하면 요청이 변경되면서 자동 계산. -->
			<a class="pagenum" href="?page=${pageDto.totalPage}">&gt;&gt;</a>	<!-- 마지막 페이지 -->
			</c:if>
		</div>
	</div>
</div>	<!-- pagebox end -->
<img src="${pageContext.request.contextPath}/image/logo.png" class="logo">
</body>
</html>