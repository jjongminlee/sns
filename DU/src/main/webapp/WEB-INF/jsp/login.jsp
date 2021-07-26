<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<div style='text-align: center;'>
		<h1>이름이름</h1>
	</div>
	<form action="login.do" method="post" style='display: flex;'>
	
		<div class="logoDiv">

			<img alt="로고" src="${pageContext.request.contextPath }/images/apple.png" style='height: 515px; margin-left: 220px;'>
				

		</div>
		
		<fieldset style='width: 350px; height: 250px; margin: auto; margin-right: 365px; margin-top: 165px;'>
			<legend style='text-align: center;'>Login</legend>
			<table style='text-align: center; margin: auto; margin-top: 50px;'>
				<tr>
					<th>ID</th>
					<td><input type="text" id="user_id" name="userId" placeholder="ID를 입력해주세요"></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" id="user_pw" name="pwd" placeholder="비밀번호를 입력해주세요"></td>
				</tr>
			</table>
			<br>
			<div style='text-align: center;'>
				<button type="button" onclick="window.location.href='signUpPage.do'">회원가입</button>
				<button type="submit" >로그인</button>
				<button type="reset">reset</button>
			</div>
		</fieldset>
	</form>
	
</body>
</html>