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




<!-- <script type="text/javascript">
	var result = '${msg}';
	
	if(result == '성공'){
		alert(result+'입니다.');
	}else{
		alert(result+'게시판등록 실패입니다.');
	}
</script> -->

<head>
<meta charset="UTF-8">
<title>전체 목록 페이지</title>


</head>
<body>
<jsp:include page="../include/header.jsp"/>

<%-- <%@ include file="../include/menu.jsp" %> --%>
<h2> 게시글 목록</h2>
<!-- <button type="button" id="btnWrite" class="btn btn-default" >글쓰기</button> -->
<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
	<tr>
		<th style="background-color: #eeeeee; text-align: center;">번호</th>
		<th style="background-color: #eeeeee; text-align: center;">제목</th>
		<th style="background-color: #eeeeee; text-align: center;">이름</th>
		<th style="background-color: #eeeeee; text-align: center;">작성일</th>
		<th style="background-color: #eeeeee; text-align: center;">조회수</th>
	</tr>
		<c:forEach items="${list}" var="board">
		<tr>
			<td>${board.b_no}</td>
			<td><a href="${pageContext.request.contextPath}/board/view?b_no=${board.b_no }">${board.b_title }</a></td>
			<td>${board.b_writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.b_date }"/> </td>
			<td><span>${board.b_count }</span></td>
		</tr>
	</c:forEach>
</table>
	
	<a href="${pageContext.request.contextPath}/board/write" class="btn btn-primary pull-right">글쓰기</a>
	
	<div class="box-footer">
    <div class="text-center">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li><a href="${path}/board/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                    <a href="${path}/board/listPaging?page=${idx}">${idx}</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li><a href="${path}/board/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
            </c:if>
        </ul>
    </div>
</div>


</body>
</html>