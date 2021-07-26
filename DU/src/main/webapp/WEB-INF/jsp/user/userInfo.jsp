<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<body>
	<form action="userModify.do" method="post" id="userModifyForm">
	<table>
	<tr>
			<th>이름</th>
			<td><input type="text" name="name" required></td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>
				<input type="hidden" name="userId" value="${USER.userId }">			
				<c:out value="${USER.userId }"></c:out></td>
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
	<div>
		<button type="button" id="okbtn" >등록</button>
		<button type="reset">초기화</button>
		<button type="button" id="backbtn" onclick="history.back(); return false;">이전</button>
		<button type="button" id="delbtn">회원 탈퇴</button>
	</div>
</form>
<form action="userDelete.do" method="post" id="deleteForm">
	<input type="hidden" name="id" value="${USER.userId }">
</form>
</body>

<script>
		window.onload = function(){
			var okbtn = document.getElementById('okbtn');
			var delbtn = document.getElementById('delbtn');
		
				okbtn.onclick = function(){
					var pwd = document.getElementById("pwdInput").value;
					var pwdCheck = document.getElementById("pwdCheckInput").value;
					
					if (pwd == pwdCheck){
						document.getElementById("userModifyForm").submit();
					} else{
						alert("비밀번호를 확인해주세요.")
					}
				}
				
				delbtn.onclick = function(){
					if(confirm("회원탈퇴하시겠습니까 ? ")){
						document.getElementById("deleteForm").submit();
					}else{
						return ;
					}
				}
			}

</script>
</html>