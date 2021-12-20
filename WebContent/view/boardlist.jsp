<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
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
.login{
    width:52px;
    height:25px;
    margin-left:11px;
}
.login:hover{
	    width:52px;
    height:25px;
    margin-left:11px;
}
input[type=button],input[type=submit], input[type=reset]{ /*버튼들 전체*/
	background-color:#F59B7A;
	border: 1px solid ivory;
	color:white;
	padding-right:5px;
	cursor:pointer;
	left:240.5px;
	bottom:57.5px;
	right:40.5px;
	margin-top:7px;
}
input[type=button]:hover{ /*버튼들 hover*/
	background-color:#99CEB5;
	border: 1px solid ivory;
	    
	color:white;
	padding-right:5px;
	cursor:pointer;
	left:240.5px;
	bottom:53.5px;
	right:40.5px;
	margin-top:7px;
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
.list{
	width:805px;
	height: 210px;
	padding:20px;
	padding-top:0px;
	       
	margin-top: 13px;
	margin-left:-28px;
	margin-right: 8px;
	background-color:#e6e6e6;
	
	overflow: auto;

}
.container > li { /*메뉴글자*/
    /* border:1px solid yellow; */
    list-style:none;
    font-size: 15px;
}
a { /*메뉴글자 링크*/
    text-decoration:none;
    color:white;
}

.container{ /*메뉴바*/
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
.container>li:hover{ /*메뉴글자 hover*/
    background-color: #F59B7A;
    color: white;
    border-radius: 4px;
}


input[type=image]{
    width:20%;
    height:15%;
    top: 116.5px;
	left:240.5px;
	bottom:53.5px;
	right:40.5px;
	display:flex;
	padding:12px;
	padding-left:5px;
	background-color: white;
	border:1px solid #caf1df;
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
	/* display:flex; */
	padding:12px;
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
    width:170px;
    border:1px solid rgb(233, 233, 233);
}
.preview{
    width:150%;
    height:20%;
    font-size: 13px;
    color:#99CEB5;
    cursor:pointer;
}
.preview2{
    position:absolute;
	top: 150.5px;
	margin-right: 13px;
	margin-left: 8px;
	bottom:40.5px;
}
section>.buddies{
    width:20%;
    height:10%;
    left:13.5px;
}

/* .visitors{
    background-color: white;
    border-radius: 11px;
    border:1px solid #99CEB5;
    width:19%;
    height:12%;
    font-size: 13px;
    padding-right: 19px;
    padding-left: 10px;
    padding:12px 15px;
    margin-top: 8px;
    

    */ 
/* } */
.visitors{
    margin-bottom:10px;
}
.visitors>p{
font-size:13px;
padding-left:5px;
}
.mate>p{
font-size:13px;
padding-left:4px;
}
p>span{
    color:#F59B7A;
}
section>.edit{
    left:240.5px;
	bottom:53.5px;
	margin-bottom: 2px;
	
	background-color: #F59B7A;
}
.mate{
    background-color: white;
   
    width:169px;
    color:rgb(20, 20, 20);
    border: 1px dotted #99CEB5;
    padding:1px;
    margin-left:1px;
    text-align: center;
}
.preview3{
    margin-right: 13px;
    margin-left: 8px;
    margin-top:8px;
    width:800px;
    height:115px;
}
.preview4{
    width:80px;
    height:56px;
    margin-left:-1px;
    margin-right: -4px;
    font-size: 20px;
  
}
.preview5{
    width:80px;
    height:58px;
    margin-left: -1px;
    font-size: 20px;
   

}
.preview4:hover{
    width:80px;
    height:58px;
   background-color: #99CEB5;
}
.preview5:hover{
    width:80px;
    height:58px;
    background-color: #99CEB5;

}
b>mark{
    background-color: white;
    color:#f1845c;
    margin-bottom: 12px;
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
    background-color: #F59B7A;
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
    font-size: 15px;
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
    margin-left: 80px;
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
.insert[type=button] {
    margin-left: -29px;
    width:80px;
    height:30px;
}
.insert[type=button]:hover {
    margin-left: -29px;
    width:80px;
    height:30px;
    background-color: #99CEB5;
}
.login[type=button]:hover {
    width:50px;
    margin-left:11px;
    background-color: #99CEB5;
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
            <!-- <p class="typo">GuGu board</p> -->
                <ul id="main">
                  <li>
                        <ul class="row">
	                        <li>번호</li>
	                        <li>제목</li>
	                        <li>작성자</li>
	                        <li>좋아요</li>
	                        <li>작성일</li>
                        </ul>
                        <div class="list">
							<c:set var="i" value="${pageDto.totalCount}"></c:set>
                            <c:forEach var="vo" items="${list}">	<!-- 친구 목록을 받아오는 리스트 -->
								<ul id="list" class="row">				
									<li>${i-(pageDto.currentPage- 1) *5}</li>
									<li><a href="boarddetail.do?u_idx=${user.idx }&v_idx=${v_idx}&idx=${vo.idx}" style="color: black;">${vo.subject}</a> </li>
									<li>${user.name }</li>
									<li>${vo.heart }</li>
									<li><fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" var="wdate"/>
										<!-- 오늘 작성한 글은 시간로  표시 -->
										<c:if test='${wdate == today }'>
										<fmt:formatDate value="${vo.wdate }" type ="time"/>
										</c:if>
										<!-- 오늘 이전에 작성한 글은 날짜로  표시 -->
										<c:if test='${wdate != today }'>
										<fmt:formatDate value="${vo.wdate }"  pattern="yyyy-MM-dd"/>
										</c:if>
									</li>
								</ul>
								<c:set var="i" value="${i-1}"></c:set> <!--26일 승준  : 증감식 추가 -->
							</c:forEach>
                        </div>
                        <c:if test="${user.idx==v_idx }">
                        <input type="button" value="insert" name="insert" class="insert" onclick="location.href='newboard.do?u_idx=${user.idx}&v_idx=${v_idx }'">
                  		</c:if>
                  		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a style ="color : black;">작성글 총 개수 : ${pageDto.totalCount }</a>
                   </li>
                 </ul>
            <div style="text-align: center;">
            <!-- ==========아래로는 << <  > >>  동작에 관한 소스 ============== -->
			<c:if test="${pageDto.startPage != 1 }">
				<a class="pagenum" href="?u_idx=${user.idx }&v_idx=${v_idx }&page=1">&lt;&lt;</a>
				<a class="pagenum" href="?u_idx=${user.idx }&v_idx=${v_idx }&page=${pageDto.startPage-1}">&lt;</a>
				<!-- 현재페이지를 startPage값에서 -1 로 변경하면 요청이 변경되면서 자동계산. -->
			</c:if>
			
			<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }">
				<a class="pagenum  
					<c:if test="${pageDto.currentPage == i }">current</c:if>
				" href="?u_idx=${user.idx }&v_idx=${v_idx }&page=${i }">${i }</a>
			</c:forEach>
			
			<c:if test="${pageDto.endPage != pageDto.totalPage }">
				<a class="pagenum" href="?u_idx=${user.idx }&v_idx=${v_idx }&page=${pageDto.endPage+1}">&gt;</a> 
			 	<!-- 현재페이지를 endPage값에서 +1 로 변경하면 요청이 변경되면서 자동계산. -->
			 
				<a class="pagenum" href="?u_idx=${user.idx }&v_idx=${v_idx }&page=${pageDto.totalPage }">&gt;&gt;</a>  <!-- 마지막페이지  -->
			</c:if>
			</div>	
            </div>
            
            
            
            </div>
            <img src="${pageContext.request.contextPath}/image/logo.png" class="logo"> 
</body>
</html>