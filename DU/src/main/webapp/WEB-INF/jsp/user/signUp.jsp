<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<h1 style="text-align: center;">회원가입</h1>
<form action="signUp.do" method="post" id="signUpForm">
	<fieldset style='width: 750px; height: 350px; margin: auto; margin-right: 365px; margin-top: 165px;'>
		<legend style='text-align: center;'>SignUP</legend>
	<table style="margin: auto; margin-top: 45px;">
	<tr>
			<th>이름</th>
			<td><input type="text" name="name" required></td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td><input type="text" name="userId" required></td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd" id="pwdInput" required></td>
		</tr>
		
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" id="pwdCheckInput" required></td>
		</tr>
		
		<tr>
			<th>연락처</th>
			<td><input type="text" name="phone"></td>
		</tr>
		
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email"></td>
		</tr>
	</table>	
	<div style="margin: auto; margin-left: 305px; margin-top: 30px;">
		<button type="button" id="okbtn" >등록</button>
		<button type="reset">초기화</button>
		<button type="button" id="backbtn" onclick="history.back(); return false;">이전</button>
	</div>
	</fieldset>
</form>

</body>

<script>
	window.onload = function(){
		var okbtn = document.getElementById('okbtn');
		
		okbtn.onclick = function(){
			var pwd = document.getElementById("pwdInput").value;
			var pwdCheck = document.getElementById("pwdCheckInput").value;
			
			if (pwd == pwdCheck){
				document.getElementById("signUpForm").submit();
			} else{
				alert("비밀번호를 확인해주세요.")
			}
		}
	}

</script>
</html>