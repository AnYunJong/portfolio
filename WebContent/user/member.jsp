<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">

div {
	border: 2px dotted #f5b49c; 
	width: 250px;
	height: 540px;
	background-color: IVORY;
	padding: 50px;
	margin: 100px auto;

	
}
form{ /*회원가입 폼*/
    width: 50px;
	height: 520px;

  


}
input{ 	padding: 7px; 
		margin: 15px auto; 
	
	}
input[type=text],input[type=password]{
	border-radius: 4px; border: 2px solid #ccc;
}
input[type=submit],input[type=reset] { /*가입하기,다시쓰기*/
	padding: 7px 15px;
	margin: 7px 10px;
	background: #99CEB5; 
	color: white;
	border: none;
	cursor: pointer;
	width:35%;
}
input[type=submit]:hover{ 
	background:#F59B7A;
}
input[type=button]:hover{
	background:#F59B7A;
}
input[type=reset]:hover{
	background:#F59B7A;
}

img{
	opacity: 65%;
}
a{
	text-decoration: none;
	color: tomato;
}
hr{
	border: 1px dotted #f5b49c;
}
a{
  color:w#F59B7A;
}
a>mark{
	background-color: #fdbba3;
	opacity: 50%;

}
ul{
    list-style-type: none;
}
h3{
    text-align: center;
    color:#F59B7A;
    font-size: 29PX;
}


</style>
</head>
<body>
	<div>
		<h3>JOIN ME</h3>
        <HR>
	            <!--액션링크 삽입-->
		  <form method="POST" name="frmReg" action="member_save.do" > 
			<table style="width: 50%">
				<tr> <!--이름 입력-->
					<td><label><b>name</b></label></td>  <!--  required 필수 입력  , readonly : 읽기만.-->
					<td><input type="text" name="name"  placeholder="이름 입력 필수"  required></td>
				</tr>
				<tr><!--이메일 입력-->
					<td><label><b>email</b></label></td>
					<td><input type="email" name="email" ></td>
				</tr>
				<tr><!--패스워드 입력-->
					<td><label><b>password</b></label></td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td><label><b>birth</b></label></td>
					<td><input type="number" name="birth" placeholder="ex)990101"></td> 
				</tr>
				<tr><!--성별 입력-->
					<td><label><b>gender</b></label></td>
					<td>&nbsp;<input type="radio" value="M" name="gender">&nbsp;남자&nbsp;&nbsp;
						<input type="radio" value="F" name="gender" checked>&nbsp;여자   <!-- checked  는 기본 선택 -->
					</td>
				</tr>
				<tr><!--연락처 입력-->
					<td><label><b>tel</b></label></td>
					<td><input type="text" name="phone_number" placeholder="'-'없이 입력해주세요"  required></td>			
				</tr>
              
				<tr>
					<td colspan="2" style="text-align: center">
                        <HR>
						<input 	type="submit" value="가입하기">   
						<input type="reset"	value="다시쓰기">
					</td>
				</tr>	

			</table>
		</form>
	</div>
</body>
</html>




