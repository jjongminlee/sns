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
			
			<tr style=" height:200px; ">
				
				<td  style=" text-align: center; vertical-align: middle;"><c:out value="${board.content }"/></td>
				
				<td style="display: block; max-height: 200px; overflow-y: scroll;">
					<c:forEach items="${replyList }" var="item" varStatus="status">
						<div data-idx="${item.idx }"  class="dropdown"  >
							[<c:out value="${item.writerName }"></c:out>] : 
							<c:out value="${item.content }"></c:out>
							<c:if test="${item.writerId == USER.userId }">
								<button onclick="myFunction()" class="dropbtn">. . .</button>
								<div id="myDropdown" class="dropdown-content">
									<a href="#" onclick="replyModify();">수정</a>
									<a href="#" onclick="replyDelete(${item.idx});">삭제</a>
								</div>
							</c:if>
						</div>
					</c:forEach>
				</td>
			</tr>
			
			<tr>
				<td style=" vertical-align: middle;">[첨부파일]</td>
				<td id="replyTd">
				
					<!-- form 부분  script에 있는 post함수를 이용할 수 있게끔 바꿔야함 -->
					<form action="replyWrite.do" method="post">
					
						<input type="hidden" name="boardIdx" value="${board.idx }" />
						<input type="text" name="content" placeholder="댓글 작성" style="width: 80%;">
						<button type="submit">댓글 작성</button>
					</form>
				</td>
			</tr>
		</table>
		<form id="hiddenForm" style="display: none;" action="replyModify.do" method="post">
			<input type="text" name="content" placeholder="댓글 수정"/>
			<input type="hidden" name="idx" />
			<input type="hidden" name="boardIdx" value="${board.idx }" />
			<button type="submit">댓글 수정</button>
		</form>
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
		

		
		function replyModify() {
			var replyTd = document.getElementById("replyTd");
			var dropdown = document.getElementsByClassName("dropdown");
			
			// +++++++++++고쳐야 할 부분++++++++++++++
			var content = td.getElementsByTagName('span')[0].innerHTML;
			
			replyTd.append(makeReplyUpdateForm(dropdown.getAttribute('date-idx'), content));
		}
		
		function makeReplyUpdateForm(idx, content) {
			console.log("-----------");
			var form = document.getElementById('hiddenForm').cloneNode(true);
			form.style.display = '';
			
			var contentInput = form.getElementsByTagName("input")[0];
			contentInput.value = content;
			
			var idxInput = form.getElementsByTagName("input")[1];
			idxInput.value = idx;
			
			return form;
			
		}
		
		
		
		// 토글메뉴
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