<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<form action="boardModify.do" method="post">
		<input type="hidden" name="idx" value="${board.idx }"/>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${board.title }"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content">${board.content }</textarea></td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>