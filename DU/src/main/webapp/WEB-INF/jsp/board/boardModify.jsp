<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 수정</title>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/jsp/header/header.jsp"></jsp:include>
		</header>
		
		<form action="boardModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="idx" value="${board.idx }"/>
			<input type="hidden" name="attIdx" value="${board.attIdx }"/>
			<input type="hidden" name="writerId" value="${board.writerId }"/>
			<fieldset border: double; style="border: groove; margin: auto; margin-right: auto;
			 margin-bottom: auto; width: 620px; height: 600px;">
			
				<table class="table table-bordered table-striped">
					<tr style="height: 100px; width: 575px;">
						<th style="text-align: center; vertical-align: middle;">제목</th>
						<td style="padding-top: 5%;"><input type="text" name="title" value="${board.title }"
							 style="width: 530px; "/></td>
					</tr>
					<tr style="height: 400px;">
						<th style="text-align: center; vertical-align: middle;">내용</th>
						<td style="width: 555px;"><textarea name="content"
							style="width: 530px; height: 350px; resize: none;">${board.content }</textarea></td>
					</tr>
					
					<tr>
							<td colspan="5" style="text-align: center;"><c:out value="${board.attFilename }"></c:out></td>
					</tr>
					<tr>
						<td colspan="5" style="text-align: center;">
							<input type="radio" name="handleType" value="fix" checked="checked"/><c:out value="고정"/>
							<input type="radio" name="handleType" value="chg" /><c:out value="변경"/>
							<input type="radio" name="handleType" value="del" /><c:out value="삭제"/>
						</td>
					</tr>
					<tr>
						<td colspan="5" style="text-align: center;"><input type="file" name="attFile" /></td>
						
					</tr>
					<tr>
						<td colspan="5" style="text-align: center;"><button type="submit">수정</button>
						
					</tr>
				</table>
			</fieldset>
			
		</form>
	</body>
</html>