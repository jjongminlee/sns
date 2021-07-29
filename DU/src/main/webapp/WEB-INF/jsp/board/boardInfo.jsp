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
				<td style="display: block; max-height: 200px; overflow-y: scroll;">
					<c:forEach items="${replyList }" var="item" varStatus="status" >
							<div data-idx="${item.idx }"  class="dropdown">
								[<c:out value="${item.writerName }"></c:out>] : 
								<span id="contentSpan_${item.idx }"><c:out value="${item.content }"></c:out></span>
								<c:if test="${item.writerId == USER.userId }">
									<button onclick="myFunction(${item.idx })" class="dropbtn" id="dropBtn_${item.idx }">. . .</button>
									<div id="myDropdown_${item.idx }" class="dropdown-content">
										<a href="#" onclick="replyModify(${item.idx});">수정</a>
										<a href="#" onclick="replyDelete(${item.idx});">삭제</a>
									</div>
								</c:if>
								<form action="replyModify.do" method="post">
									<input type="hidden"name="boardIdx" value="${item.boardIdx }" />
									<input type="hidden" id="contentInput_${item.idx}" name="content" placeholder="댓글 수정">
									<input type="hidden" name="idx" value="${item.idx }" />
									<button type="submit" style="display: none;" id="modifyBtn_${item.idx }">댓글 수정</button>
								</form>
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
						<button type="submit">댓글 작성</button>
					</form>
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
		
		function post(path, params) {
			const form = document.createElement('form');
			form.method = 'post';
			form.action = path;
			
			for(const key in params) {
				if(params.hasOwnProperty(key)) {
					const hiddenField = document.createElement('input');
					hiddenField.type = 'hidden';
					hiddenField.name = key;
					hiddenField.value = params[key];
					
					form.appendChild(hiddenField);
				}
			}
			
			document.body.appendChild(form);
			form.submit();
		}
		
		function replyDelete(idx) {
			if(confirm("댓글을 삭제하시겠습니까?") == true) {
				var path = "replyDelete.do";
				var params = {
						"idx": idx,
						"boardIdx": "${board.idx}"
				};
				post(path, params)
			} else {
				return;
			}
		}
		

		
		function replyModify(idx) {
			console.log(idx);
			var contentInput = document.getElementById("contentInput_" + idx);
			var contentSpan = document.getElementById("contentSpan_" + idx);
			var dropBtn = document.getElementById("dropBtn_" + idx);
			var modifyBtn = document.getElementById("modifyBtn_" + idx);
			
			contentInput.type = "text";
			contentSpan.style.display = "none";
			dropBtn.style.display = "none";
			modifyBtn.style.display = "";
		}
		
		
		
		// 토글메뉴
		function myFunction(idx) {
		  document.getElementById("myDropdown_" + idx).classList.toggle("show");
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