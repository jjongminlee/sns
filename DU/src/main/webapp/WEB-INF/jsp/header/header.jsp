<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap.bundle.min.js" ></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="header.do" style='display: flex;'>
	<div class="logoDiv">

			<img alt="로고" src="${pageContext.request.contextPath }/images/apple.png" style='width: 130px; height: 100px;'
			onclick="window.location.href='${pageContext.request.contextPath }/mainBoard.do'">
				

	</div>
		
	<table style='margin: auto;'>
			<tr>
				
				<td><input type="text" id="searchName" placeholder="사용자를 검색하세요!!!"
					value="${name }" style='width: 230px; text-align: center;'></td>
				<td><button type="button" id="searchBtn" class="btn btn-light" style='border-radius: 150px; background-color: chartreuse;'>검색</button></td>
			</tr>
				
	</table>
	
	<button type="button" style='width: 45px; height: 45px; margin-top: 35px; border-radius: 150%;'
		onclick="window.location.href='boardWritePage.do'">+</button>
		
	<div class="userInfoDiv" style='margin: auto; margin-right: 60px; margin-left: 60px;'>

		    <button type="button" onClick="window.location.href='${pageContext.request.contextPath }/userInfo.do'"
		      style='width: 65px; height: 65px; background-image:url("${pageContext.request.contextPath }/images/apple.png");
   				border-radius: 150px; display: table-cell; vertical-align: middle; color: #ffffff; font-weight: bold;
    			text-align: center;' >내정보</button>

		</div>
	</form>
</body>
</html>