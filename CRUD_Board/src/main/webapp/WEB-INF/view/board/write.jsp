<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>게시글 작성</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btnSave").click(function(){
			var title = $("#b_title").val();
			var detail = $("#b_detail").val();
			var writer = $("#b_writer").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(detail == ""){
				alert("내용을 입력하세요");
				document.form1.detail.focus();
				return;
			}
			if(writer == ""){
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			}
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
	});
</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2> 게시글 작성</h2>
	<form name="form1" method="post" action="${pageContext.request.contextPath}/board/insert.do">
		<div>
			제목
			<input name="b_title" id="b_title" size = "80" placeholder="제목을 입력하세요.">
		</div>
		<div>
			내용
			<textarea name="b_detail" id="b_detail" rows="4" cols="80"placeholder="내용을 입력하세요."></textarea>
		</div>
		<div>
			이름
			<input name="b_writer" id="b_writer" placeholder="이름을 입력해주세요">
		</div>
		<div style="width: 650px; text-align: center;">
				<button type="button" id="btnSave"> 확인</button>
				<button type="reset">취소</button>
		</div>	
	</form>

	

</body>
</html>