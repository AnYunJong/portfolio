<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 댓글</title>
<link rel="stylesheet" href="css/view.css?v=3">
<link rel="stylesheet" href="css/freeboard.css?v=3">
</head>
<body style="background-color: white;">	<!-- (승준) 10월 23일 추가 파일 : 댓글 리스트 -->
	<ul id="main">
		<c:forEach var="cmt" items="${clist}">
			<li>
				<ul>
					<li style="background-color:rgb(231, 231, 231);">&nbsp;&nbsp;&nbsp;${cmt.name}<span style="color:black;margin-right:20px;font-size:13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cmt.wdate}</span></li>
					<li><pre style="color: tomato; fontsize:15px;">${cmt.content }</li>
					<!-- 댓글 삭제 : 글비밀번호 확인 X, 댓글 idx, 메인글 idx -->
					<c:if test="${cmt.u_idx == user.idx }"> <!--댓글 남겼던 사람이랑 로그인 한사람의 idx가 같다면 삭제가 보임  -->
					<li><a href="gbookCommentDelete.do?u_idx=${cmt.u_idx }&idx=${cmt.idx }&book_idx=${cmt.book_idx }" style="background-color: #F59B7A;">삭제</a></li>
					<br></c:if>
				</ul>
			</li>
		</c:forEach>
	</ul>
	
</body>
</html>