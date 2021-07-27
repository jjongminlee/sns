<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<form action="boardModify.do" method="post">
	
	<fieldset border: double; style="border: groove; margin: auto; margin-right: auto;
		 margin-bottom: auto; width: 620px; height: 555px;">
		<input type="hidden" name="idx" value="${board.idx }"/>
		
			<table class="table table-bordered">
				<tr style="height: 100px; width: 575px;">
					<th style="text-align: center; vertical-align: middle;">제목</th>
					<td style="padding-top: 5%;"><input type="text" name="title" value="${board.title }"
						 style="width: 530px; "/></td>
				</tr>
				<tr style="height: 400px;">
					<th style="text-align: center; vertical-align: middle;">내용</th>
					<td style="width: 555px;"><textarea name="content"
						style="width: 530px; height: 350px;">${board.content }</textarea></td>
				</tr>
				
				<tr>
					<td colspan="5" style="text-align: center;"><button type="submit">수정</button>
					
				</tr>
			</table>
		</fieldset>
		
	</form>
</body>
</html>