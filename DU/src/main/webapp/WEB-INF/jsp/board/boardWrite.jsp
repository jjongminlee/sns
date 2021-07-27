<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 </title>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/header/header.jsp"></jsp:include>
	</header>
	<form action="boardWrite.do" method="post">
	<input type="hidden" name="writerId" value="${USER.userId }">
	
	
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;
			 margin-left: auto; margin-right: auto; margin-top: 80px; margin-bottom: auto; width: 600px; height: 600px;">
					<thead>
						<tr>
							<th colspan="5" style="background-color: #eeeee; text-align: center;"><h1>게시판 글쓰기 양식</h1></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5" ><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50" style="width: 450px;"></td>
						</tr>
					
						<tr>
							<td colspan="5" ><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height:400px; width: 450px"></textarea></td>
						</tr>
						<tr>
							<td colspan="5" ><input type="file" name="fileName"></td>
						</tr>
						
						<tr>
							<td colspan="5" ><button type="submit">작성</button>
							<button type="button" onclick="history.back(); return false;">이전</button></td>
						</tr>
					</tbody>
						
				</table>

	
	
	</form>
</body>
</html>