<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제 하시겠습니까?")){
				document.form1.action ="${pageContext.request.contextPath}/board/delete.do";
				document.form1.submit();
			}
		});
		
		$("#btnUpdate").click(function(){
			var title = $("#b_title").val();
			var detail = $("#b_detail").val();
			var writer = $("#b_writer").val();
			if(title == "") {
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(detail == "") {
				alert("내용을 입력하세요");
				document.form1.detail.focus();
				return;
			}
			if(writer == "") {
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			}
			document.form1.action="${pageContext.request.contextPath}/board/update.do"
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		})	;	
	});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>게시글 보기</h2>
<form name="form1" method="post">
	<div>
		작성일자 : <fmt:formatDate value="${board.b_date}" pattern="yyyy-MM-dd a HH:mm:ss" />
	</div>
	<div>
		조회수 : ${board.b_count }
	</div>
	<div>
		제목
		<input name="b_title" id ="b_title" size="80" value="${board.b_title }" placeholder="제목을 입력해주세요">
	</div>
	<div>
		내용
		<textarea name="b_detail" id="b_detail" rows="4" cols="80" placeholder="내용을 입력해주세요">${board.b_detail }</textarea>
	</div>
	<div>
		이름
		<input name="b_writer" id ="b_writer" value="${board.b_writer}" placeholder="이름을 입력해주세요">
	</div>
	<div style="width: 650px; text-align: center;">
		<input type="hidden" name="b_no" value="${board.b_no }">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>
	</div>
</form>


</body>
</html>