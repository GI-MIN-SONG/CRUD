<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<!DOCTYPE html>
<html>

<%-- 부트스트랩 이용하기 --%>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<script type="text/javascript">
function goPage(){
	location.href="${pageContext.request.contextPath}/board/write";
	}

</script>


 <script type="text/javascript">

	
	var result = "${msg}";
if (result == "regSuccess") {
    alert("게시글 등록이 완료되었습니다.");
} else if (result == "modSuccess") {
    alert("게시글 수정이 완료되었습니다.");
} else if (result == "delSuccess") {
    alert("게시글 삭제가 완료되었습니다.");
}
</script>

<head>
<meta charset="UTF-8">
<title>전체 목록 페이지</title>


</head>
<body>
<jsp:include page="../include/header.jsp"/>
<div class="col-lg-12">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">게시글 목록</h3>
        </div>
        <div class="box-body">
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <th style="width: 30px">#</th>
                    <th>제목</th>
                    <th style="width: 150px">작성자</th>
                    <th style="width: 250px">작성시간</th>
                    <th style="width: 60px">조회</th>
                </tr>
                <c:forEach items="${list}" var="board">
                <tr>
                    <td>${board.b_no}</td>
                    <td><a href="${pageContext.request.contextPath}/board/view?b_no=${board.b_no}">${board.b_title}</a></td>
                    <td>${board.b_writer}</td>
                    <td><fmt:formatDate value="${board.b_date}" pattern="yyyy-MM-dd a HH:mm"/></td>
                    <td><span class="badge bg-red">${board.b_count}</span></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="box-footer">
            <div class="pull-right">
                <button type="button" class="btn btn-success btn-flat" onclick="goPage();">
                    <i class="fa fa-pencil"></i> 글쓰기
                </button>
            </div>
        </div>
    </div>
</div>

</body>
</html>