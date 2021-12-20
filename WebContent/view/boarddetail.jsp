<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link rel="stylesheet" href="../gugulogo.png">
<style>
/*
3)boarddetail.jsp 
-미니홈피 창(.box2) 오버플로 auto로 적용. 스크롤바 생기게 함.
-div클래스 writer로 배경색깔 회색 적용.
-아이프레임 너비,높이 조정
*/
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
*{
	font-family: 'Nanum Gothic', sans-serif;
}
body{
	background-color: rgb(231, 231, 231);
}
.logo{
	opacity: 40%;
	position:absolute;
	right:50px;
	bottom:50px;
	width: 30%; 
}
.box{
	background-color: ivory;
	width:900px;
	height: 500px;
	padding:20px;
	padding-top:0px;
	margin:10px;
	border: 1px dashed #F59B7A;
	background-color:ivory;          
}
.container > li {
    /* border:1px solid yellow; */
    list-style:none;
    font-size: 15px;
}
a {
    text-decoration:none;
    color:white;
}
.container{
    border-radius: 9px;
    background-color:#99CEB5;
    margin-left: -1px;
    margin-right:5px;
    
    display:flex;
    height:20px;
    justify-content: space-between;
    padding:12px 15px;
    position:static;
    border:2px solid #ffe4db;   
}
.container>li:hover{
    background-color: #F59B7A;
    color: white;
    border-radius: 4px;
}
section{
    width:auto;
}
.box2{
	border-radius: 9px;
	background-color: white;
	opacity:80%;
	border:1px dotted #99CEB5;
	position:absolute;
	width: 868px;
	height:380px;
	top: 130px;
	left:42px;
	margin-top:1px; 
	right:40.5px;
	display:flex;
	padding:12px;
overflow: auto;
} 
/* input[type=button]{
    background-color:#F59B7A;
    border: 1px solid ivory;
    
    color:white;
    padding-right:5px;
    cursor:pointer;
    left:240.5px;
	bottom:53.5px;
	right:40.5px;
	margin-top:7px;
} */
input[type=text]{
    margin-bottom: 10px;
    margin-top: 9px;
    margin-left:10px;
    margin-right:20px;
    width:100px;
    border:2px dotted #F59B7A;
}
.login{
    width:50px;
    margin-left:-11px;
}
/* .typo{
	font-size:35px;
	text-align:center;
	font-family: 'Bangers', cursive;
    margin-left: 250px;
    margin-top:-3px;
	color: #f1845c;
	letter-spacing:3px;
	text-shadow:3px 1px 0px #cae6d9;
} */
ul {
	list-style: none;
    margin-right: 1px;
}
div{
    background-color: rgb(255, 255, 255);
}
ul #main{
	display:flex;
	flex-direction:column;
	list-style: none;
	line-height:1px;
    width:51px;
    height: 10px;
    margin-left: 13px;
    margin-right: 5px;
    margin-top: 12px;
    color:white;
    width:100%;
}
ul #main,ul .row,ul.row>li {
	display: flex;
	flex-direction:row;
	text-align:center;
	padding-top:3px;
    margin-right: 11px;
}
.row{
    margin-bottom: 15px;
    margin-right: 10px;
}
.row > li{
	padding: 3px 0px;
	text-decoration:none;
    margin-right: 25px;
    margin-left: 20px;
    margin-bottom:10px;
    font-size: 12px;
    width:100px;
    height:8px;

}
.row > li:nth-child(1){
	flex-basis:10%;
	color:tomato;
    margin-left: -20px;
}	
.row > li:nth-child(2){
	flex-basis:35%;
    margin-left: 90px;
}
.row > li:nth-child(3){
	flex-basis:25%;
}
.row > li:nth-child(4){
	flex-basis:10%;
    margin-left: 15px;
}
.row > li:nth-child(5){
	flex-basis:20%;
    margin-left: 40px;
}

p{
    margin-bottom:12px;
}
h4{
    margin-top: -58px;
    text-align: center;
}
input[type=button] {
    margin-left: 9px;
    background: #F59B7A;
    color:white;
}
input[type=button]:hover {
    margin-left: 9px;
    background: #99CEB5;
    color:white;
}
table{
    width:100%;
    height: 90%;
    margin-top: 0px;
    margin-left:2px;
}
th {
	text-align: center;
	background-color:lightgray;
	font-size:80%;
	color: rgb(31, 30, 30);
	width: 70px;
    height:17px;
	border-radius : 3px;
}

input,textarea{
	padding: 6px;
	border-radius: 4px;
	border: 1px solid #e6e6e6;
	box-sizing: border-box;
    margin-left: 19px;
	margin-right:-17px;
	color:#160001;
}
.btn1 {
	width: 70px;
	cursor : pointer;
	background-color:#99CEB5;
	color:white;
}
.btn2 {
	width: 70px;
	cursor : pointer;
	background-color:#99CEB5;
	color:white;
}
.btn3 {
	width: 70px;
	cursor : pointer;
	background-color:#99CEB5;
	color:white;
}
body{
	font-family: 'Nanum Gothic', sans-serif;
}
h3{
	font-size:60px;
	text-align:center;
	font-family: 'Bangers', cursive;
	color:tomato;
	letter-spacing:3.5px;
	text-shadow:5px 2px 0px #cae6d9;
}
input[type=submit]{
    background-color: #F59B7A;
    margin-top:4px;
    color:white;
}
input[type=reset]{
    background-color: #F59B7A;
    color:white;
}
input[type=submit]:hover{
    background-color: #99CEB5;
}
input[type=reset]:hover{
    background-color: #99CEB5;
}
hr{
    border: 1px dotted #99CEB5;
    opacity:40%;
}
.main{
    width: 80px;
}
.gugucomment{
    margin-left: -15;
 
}

.row-2{
    margin-left: -85px;
}
.row-2>li{
 margin-left: 16px;
	margin-right:-20px;
color:tomato;
margin-right:30px;
margin:10px;

}
.writer{
background-color:rgb(231, 231, 231);
opacity:70%;
}
.welcome{

font-size:25px;
font-family: 'Nanum Pen Script', cursive;
}
.username{
font-family: 'Nanum Pen Script', cursive;
color:tomato;
}
.gohome {
	color: black;
}
.gohome:hover {
	color: tomato;
}
</style>
</head>
<body style="background-color: rgb(231, 231, 231); ">
<c:if test="${sessionScope.user == null}">
	<input type="button" name="login" value="Login" class="login" onclick = "location.href='login.do'">
</c:if>
<c:if test="${sessionScope.user != null}">
		<input type="button" name="logout" value="Logout" class="logout" onclick = "location.href='logout.do'">
		&emsp;<b><a class="gohome" href="minihome.do?u_idx=${user.idx }&v_idx=${user.idx}">${user.name}</a></b>(${user.email}) 님 &emsp;&emsp;&emsp;&emsp;&emsp;<span class="welcome"><span class="username">"${name}</span>&nbsp;님의 홈페이지입니다!"</span>
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
            <!-- <p class="typo">GuGu board</p> -->
      
            <table>
                <tr><th>제목</th>
                    <td>${board.subject }</td>
                </tr>
                <tr>
                    <th>좋아요</th>
                    <td>${board.heart}</td>
                    <c:if test="${user.idx != v_idx}">
                   	<td><input type="button" value="좋아요" onclick="location.href='BoardHeartupdate.do?u_idx=${user.idx }&v_idx=${v_idx}&idx=${board.idx }'"></td>
                    </c:if>
                </tr>
                <tr>
                   <th>작성자</th>
                   <td>${user.name }</td>
                </tr>
                <tr><th>날짜</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
                	<td><fmt:formatDate value="${board.wdate}" pattern="yyyy-MM-dd" /></td>
                </tr>
                <tr><th>내용</th>
                	<td><pre>${board.content}</pre></td>
                </tr>
                <tr><td colspan="2">
                <br>
                <hr>
                <c:if test="${user.idx==v_idx }">
                <input type="button"  value="수정" class="btn1" onclick="location.href='boardupdate.do?u_idx=${user.idx}&v_idx=${v_idx}&idx=${board.idx}'">
                <input type="button" value="삭제" class="btn3" onclick="location.href='boarddelete.do?u_idx=${user.idx}&v_idx=${v_idx }&idx=${board.idx }'">
                </c:if>
                <input type="button" value="목록" class="btn2" onclick="location.href='guguboard.do?u_idx=${user.idx}&v_idx=${v_idx}'">
                <!-- 댓글 시작 --><!--10월23일 승준 추가부분 시작  -->
                <hr class="line">
                <iframe src="boardCommentList.do?idx=${board.idx}" frameborder="0" style= "overflow-y; width: 100%; height: auto; margin-left:5px; margin-top:10px;"></iframe>
                <form action="boardCommentInsert.do?u_idx=${user.idx }&v_idx=${v_idx }" method="post" name="frmCmt">
					<input type="hidden" name="idx" value= ${board.idx }>                        
                        <div class="gugucomment">                     
                            <ul id="main">                        
                                <li>
                                    <ul class="row-2">
                                        <div class="writer">
										<li><input type="text" name="name" class="input1" readonly value= "${user.name }"><span style="color:tomato;">님,댓글을 달아보세요!</span>
										</div>
                          
										</li>
										
                                      <li>
                                        <textarea rows="1"
                                       		cols="50" name="content" style="resize: none;"
                                            placeholder="댓글을 작성하세요." class="input" required></textarea>
                                      </li>
                                      <li>
                                           <input type="submit" value="저장" class="button small">
                                            <input type="reset" value="취소" class="button small">
                                      </li>
                                      <hr>
                                    </ul>
                            	</li>
                            </ul>
                           
                        </div>
                </form> 
                <!--10월23일 승준 추가부분 끝 -->             
                </table>  
                
            </div>
            </div>
            <img src="${pageContext.request.contextPath}/image/logo.png" class="logo">  
</body>
</html>