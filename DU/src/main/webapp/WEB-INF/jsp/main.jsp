<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인화면</title>
	</head>
	<body>
	
		<header>
			<jsp:include page="/WEB-INF/jsp/header/header.jsp"></jsp:include>
		</header>
		
		<table border='1' class="table table-bordered" style="margin-top: 100px; table-layout: fixed; width: 50%; margin-left:auto; 
	    		margin-right:auto; cellpadding: 0; cellspacing: 10;">
			<c:forEach items="${boardList }" var="item">
				
				<tr>
					<td colspan="2">[제목] <c:out value="${item.title }"/></td>
				</tr>
				
				<tr>
					<td>[작성자] <c:out value="${item.writerName }"/></td>
					<td style="text-align: right;"><c:out value="${item.registDate }"/></td>
				</tr>
				
				<tr>
					
					<td  style="height: 200px; text-align: center; vertical-align: middle;">
						<button type="button" class="btn btn-light" 
							onclick="window.location.href='boardInfoPage.do?idx=${item.idx}'"
							 style="width: 100%; height: 100%;"><c:out value="${item.content }"/></button>
					</td>
					
					
					<td style="text-align: center; vertical-align: middle;">reply place
						
					</td>
					
					
				</tr>
				
			</c:forEach>
	
		</table>

	</body>
</html>