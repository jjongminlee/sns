<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 상세</title>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/jsp/header/header.jsp"></jsp:include>
		</header>
		
		<input type="hidden" name="idx" value="${board.idx }"/>
		
		<table border='1' class="table table-bordered" style="margin-top: 100px; table-layout: fixed; width: 50%; margin-left:auto; 
	    		margin-right:auto; cellpadding: 0; cellspacing: 10;">
				
			<tr>
				<td colspan="2">[제목]<c:out value="${board.title }"/></td>
			</tr>
			
			<tr>
				<td><c:out value="${board.writerName }"/></td>
				<td style="text-align: right;"><c:out value="${board.registDate }"/></td>
			</tr>
			
			<tr>
				
				<td  style="height: 200px; text-align: center; vertical-align: middle;"><img src="images/apple.png" 
						 style="width: 200px;"/></td>
				<td>댓글 작성후 올라오는 부분</td>
			</tr>
			
			<tr>
				<td style="text-align: center; vertical-align: middle;"><c:out value="${board.content }"/></td>
				<td>댓글 작성 하는 부분</td>
			</tr>
			
			<tr>	
				<td colspan="2" style="text-align: center;">
					<button type="button" onclick="window.location.href='boardModifyPage.do?idx=${board.idx}'">수정</button>
					<button type="button">삭제</button></td>
			</tr>
	
		</table>
	</body>
</html>