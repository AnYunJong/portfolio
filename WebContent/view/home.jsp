<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈</title>
    <style>
    /*
   10/24_이서현_수정사항 : 홈 화면 : 338번째줄에 아이프레임에 공공데이터 추가
    */
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

*{
	font-family: 'Nanum Gothic', sans-serif;
}
@media screen and (max-width:768px) {
    .container {
        flex-direction: column;
    }
    .container > li {
        text-align: center;
    }
}

body{
	background-color: rgb(231, 231, 231);
}
.logo{ /*프젝 로고*/
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
input[type=submit]{
margin-top:-25px;
margin-bottom:-50px;
}
.box{ /*미니홈피 창*/
	background-color: ivory;
	width:900px;
	height: 500px;
	padding:20px;
	padding-top:0px;
	margin:10px;
	border: 1px dashed #F59B7A;
	background-color:ivory;
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
.image{ /*프로필에 있는 로고이미지.임의로 지정*/
    width:159px;
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
.box2{ /*미니홈피 창 안에 있는 박스*/
	border-radius: 9px;
	background-color: white;
	opacity:80%;
	border:1px dotted #99CEB5;
	position:absolute;
	width: 670px;
	height:378px;
	top: 130px;
	left:240px;
	bottom:5px; 
	right:40.5px;
	display:flex;
	padding:12px;
} 
input[type=button]{ /*버튼들 전체*/
	background-color:#F59B7A;
	border: 1px solid ivory;
	    
	color:white;
	padding-right:5px;
	cursor:pointer;
	left:240.5px;
	bottom:53.5px;
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
/*이서현(10/24) : 입력창이 너무 내려온것같아서 위로 좀 올렸습니다 */
input[type=text]{
	margin-bottom: 10px;
	margin-top: -15px;
	width:170px;
	border:1px solid rgb(233, 233, 233);
	color:#f1845c;
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
} */
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
	width:175px;
	height:59px;
	margin-left:6px;
	margin-right: -4px;
	font-size: 20px;
}
.preview5{
    width:175px;
    height:59px;
    margin-left: 6px;
    margin-right: -4px;
    font-size: 20px;
}
.preview4:hover{
   		width:175px;
	height:59px;

	background-color: #99CEB5;
}
.preview5:hover{
    		width:175px;
	height:59px;

    background-color: #99CEB5;
}
.login{
    width:50px;
    margin-left:11px;
}
b>mark{
    background-color: white;
    color:#f1845c;
    margin-bottom: 12px;
}
.box2>img{
    margin-left:13px;
    margin-right:3px;
    width:500px;
    height:123px;
    margin-top:9px;
    margin-bottom:9px;
}
.preview2{
   margin-left:12px;
    margin-right:3px;
    margin-top:10px;
     width:647px;
    height:210px;
    
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
<script>
    
</script>
</head>
<body>
<c:if test="${sessionScope.user == null}">
	<input type="button" name="login" value="Login" class="login" onclick = "location.href='login.do'">
</c:if>
<c:if test="${sessionScope.user != null}">
	<input type="button" name="logout" value="Logout" class="logout" onclick = "location.href='logout.do'">
	<b><a class="gohome" href="minihome.do?u_idx=${user.idx }&v_idx=${user.idx}">${user.name}</a></b>(${user.email}) 님 &emsp;&emsp;&emsp;&emsp;&emsp;<span class="welcome"><span class="username">"${name}</span>&nbsp;님의 홈페이지입니다!"</span>
</c:if> 							<!--&emsp;는 3칸 띄어쓰기  -->
    <div class="box">

		        <nav><!--의미(시맨틱)가 있는 태그-->
		            <ul class="container">
		             <li><a href="minihome.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}">home</a></li>
		             <li><a href="profileMain.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}">profile</a></li>
		             <li><a href="mateAction.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}">mate</a></li>
		             <li><a href="guestbook.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}">visitor</a></li>
		             <li><a href="gallery.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}">gallery</a></li>
		             <li><a href="guguboard.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}">board</a></li>
		            </ul>
		       </nav>
	
            <form action="titleUpdate.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}" method="post">  
            	<span>Title:${title}</span><br><!--승준 10월 25일 : 추가    -->
	               <c:if test="${user.idx == homeuser.u_idx }"> <!--로그인(세션) 유저와 홈 유저가 같아야 수정 할 수 있다  -->
	               		 <input type="text" name="title" placeholder="홈의 타이틀을 입력하세요">
	            	<br><input type="submit" name="save" value="save"> 
	                           
	               </c:if>
            </form>
              <div class="visitors">
             <p>today : <span>${homeuser.todayCount}</span> &nbsp;&nbsp;|&nbsp;&nbsp;
               total : <span>${homeuser.totalCount }</span></p>
             <p class="mate">Total mate : <span>${count}</span></p>  
            </div>
            <section>
			<!-- ================ 승준 10월25일 수정 시작 =============================== -->
				<c:if test="${profile.filename == null}">
					<img calss="image" alt="filename" src="${pageContext.request.contextPath}/image/gugulogo.png" class="image" > 
				</c:if>	
				<c:if test="${profile.filename != null}">
					<img calss="image" alt="filename" src="/img/${profile.filename }"  class="image"> 
				</c:if>	                
            <!-- ================ 승준 10월25일 수정 시작 =============================== -->
                <span>${short_intro}</span><br>
              <form action="shortUpdate.do?u_idx=${user.idx }&v_idx=${homeuser.u_idx}" method="post">  
	               <c:if test="${user.idx == homeuser.u_idx }"> <!--로그인(세션) 유저와 홈 유저가 같아야 수정 할 수 있다  -->
			               <input type="text" name="short_intro" placeholder="자기소개를 입력하세요"> <br>
	                      	<input type="submit" name="save" value="save">         
	               </c:if>
               </form>
                <!-- ================ 승준 10월25일 수정  끝 =================================  -->  
              
               <br>
           
            </section>
            
           <div class="box2">
          
            <!--  <iframe src="boardlist.jsp"  class="preview3"></iframe><br> -->
             <img src="${pageContext.request.contextPath}/image/banner2.jpg" alt="배너">
             
            <div class="button">
            <input type="button" name="visitor" value="최저,최고온도" class="preview4" > 
            <iframe src="https://api.openweathermap.org/data/2.5/weather?q=incheon,{state%20code}&appid=11aa2a3fbc28cb968d2ed52762d3a361&units=metric" class="preview5" style="overflow: auto;"></iframe>
            </div> 
             <!-- 이서현(10/24) 수정. 아이프레임 추가 -->
             <iframe src="https://corona-live.com/" class="preview2" style="overflow: auto;"></iframe><br>
           
        </div>
       
            
    </div>
   <img src="${pageContext.request.contextPath}/image/logo.png" class="logo"> 
   
</body>
</html>