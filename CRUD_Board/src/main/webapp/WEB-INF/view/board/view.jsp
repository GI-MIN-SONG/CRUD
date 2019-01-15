<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>

<script type="text/javascript">
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			if(confirm("삭제 하시겠습니까?")){
				document.form1.action ="${pageContext.request.contextPath}/board/delete";
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
			document.form1.action="${pageContext.request.contextPath}/board/update"
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		})	;	
	});
</script>

<script>
//목록
function fn_cancel(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='/board/list'/>";
    form.submit();
    
}
 
//수정
function fn_update(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='/board/update'/>";
    form.submit();
}
 
//답변
function fn_relay(){
    
    var form = document.getElementById("viewForm");
    
    form.action = "<c:url value='/board/relayForm.do'/>";
    form.submit();
    
}
</script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<h2>게시글 보기</h2>
<div>
    <form id="viewForm" name="viewForm" method="post">
        <div>
            <h2>글쓰기</h2>
            <div>
                <table>
                    <tr>
                        <th>제목</th>
                        <td><input style="width: 500px" type="text" id="title" name="title" value="${result.title }"/></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea style="width: 500px" rows="10" cols="10" id="content" name="content"><c:out value="${result.content }"/></textarea></td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td><input style="width: 500px" type="text" id="writer" name="writer" value="${result.writer }"/></td>
                    </tr>
                </table>
                <div>
                    <a href='#' onClick='fn_update()'>수정</a>
                    <a href='#' onClick='fn_cancel()'>목록</a>
                    <a href='#' onClick='fn_relay()'>답변</a>                    
                </div>
            </div>
        </div>
        <input type='hidden' id='code' name='code' value='${result.code }' />
    </form>
</div>


</body>
</html>