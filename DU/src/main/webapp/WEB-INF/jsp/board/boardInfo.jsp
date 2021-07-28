<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>게시글 상세</title>
		<style>
			.dropbtn {
			  background-color: white;
			  color: black;
			  border: none;
			  cursor: pointer;
			}
			
			.dropbtn:hover, .dropbtn:focus {
			  background-color: white;
			}
			
			.dropdown {
			  position: relative;
			  display: inline-block;
			}
			
			.dropdown-content {
			  display: none;
			  position: absolute;
			  background-color: #f1f1f1;
			  min-width: 160px;
			  overflow: auto;
			  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			  z-index: 1;
			}
			
			.dropdown-content a {
			  color: black;
			  padding: 12px 16px;
			  text-decoration: none;
			  display: block;
			}
			
			.dropdown a:hover {background-color: #ddd;}
			
			.show {display: block;}
		</style>
	</head>
	<body>
		<header>
			<jsp:include page="/WEB-INF/jsp/header/header.jsp"></jsp:include>
		</header>
		
		<input type="hidden" name="idx" value="${board.idx }"/>
		
		<table border='1' class="table table-bordered" style="margin-top: 100px; table-layout: fixed; width: 70%; margin-left:auto; 
	    		margin-right:auto; cellpadding: 0; cellspacing: 10;">
				
			<tr>
				<td colspan="2">
					[제목]<c:out value="${board.title }"/>
					<div style="text-align: right;">
	                <c:if test="${board.writerId == USER.userId}">
						<button type="button" id="okBtn" onclick="window.location.href='boardModifyPage.do?idx=${board.idx}'">수정</button>
						<button type="button" id="delBtn" >삭제</button>
					</c:if>
                </div>
				</td>
				
			</tr>
			
			<tr>
				<td><c:out value="${board.writerName }"/></td>
				<td style="text-align: right;"><c:out value="${board.registDate }"/></td>
			</tr>
			
			<tr>
				
				<td  style="height: 200px; text-align: center; vertical-align: middle;"><c:out value="${board.content }"/></td>
				<td>
					<c:forEach items="${replyList }" var="item" varStatus="status">
						<div data-idx="${item.idx }">
							[<c:out value="${item.writerName }"></c:out>] : 
							<c:out value="${item.content }"></c:out>
						</div>
						<div class="dropdown">
							<button onclick="myFunction()" class="dropbtn">. . .</button>
							<div id="myDropdown" class="dropdown-content">
								<a href="#">수정</a>
								<a href="#">삭제</a>
							</div>
						</div>
					</c:forEach>
				</td>
			</tr>
			
			<tr>

				<td style=" vertical-align: middle;">[첨부파일]</td>
				<td>
					<form action="replyWrite.do" method="post">
						<input type="hidden" name="boardIdx" value="${board.idx }" />
						<input type="text" name="content" placeholder="댓글 작성">
						<button type="submit">작성</button>
					</form>
				</td>
			</tr>

				<td style=" vertical-align: middle;">[첨부파일]</td>
				<td>댓글 작성 하는 부분</td>


			</tr>
			
				<tr>	
					<td colspan="2" style="text-align: center;">
						<button type="button" id="okBtn" onclick="window.location.href='boardModifyPage.do?idx=${board.idx}'">수정</button>
						<button type="button" id="delBtn" >삭제</button>
					</td>
				</tr>	
			
	
		</table>
	</body>
	<script>
		window.onload = function() {
			var okBtn = document.getElementById("okBtn");
			var delBtn = document.getElementById("delBtn");
			
			delBtn.onclick = function() {
				if(confirm("삭제하시겠습니까?")) {
					window.location.href = "boardDelete.do?idx=${board.idx}"
				} else {
					return;
				}
			}
		}
		
		function myFunction() {
		  document.getElementById("myDropdown").classList.toggle("show");
		}
		
		window.onclick = function(event) {
		  if (!event.target.matches('.dropbtn')) {
		    var dropdowns = document.getElementsByClassName("dropdown-content");
		    var i;
		    for (i = 0; i < dropdowns.length; i++) {
		      var openDropdown = dropdowns[i];
		      if (openDropdown.classList.contains('show')) {
		        openDropdown.classList.remove('show');
		      }
		    }
		  }
		}
	</script>
</html>