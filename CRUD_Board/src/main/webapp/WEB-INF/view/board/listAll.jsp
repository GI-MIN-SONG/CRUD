<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page session="false" %>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!DOCTYPE html>
<html>

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
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			// 페이지 주소 이동
			location.href ="${pageContext.request.contextPath}/board/write.do";
		});
	});

</script>
</head>
<body>

<%@ include file="../include/menu.jsp" %>
<h2> 게시글 목록</h2>
<button type="button" id="btnWrite">글쓰기</button>
<table border="1" width="600px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>작성일</th>
		<th>조회수</th>
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
<%-- <table class="table table-board" border="1px" width="80%" align="center">
	<tr>
		<th style="width:10%">글 번호</th>	
		<th style="width:30%">제목</th>	
		<th style="width:20%">작성자</th>	
		<th style="width:20%">날짜</th>	
		<th style="width:20%">조회수</th>	
	</tr>	
	
	 <c:choose>
	<c:when test="${fn:length(boardList) > 0}"> 
	<c:forEach items="${boardList}" var="board">
		<tr>
			<td>${board.b_no}</td>
			<td><a href="${pageContext.request.contextPath}/board/detail?b_no=${board.b_no }">${board.b_title }</a></td>
			<td>${board.b_writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.b_date }"/> </td>
			<td><span>${board.b_count }</span></td>
		</tr>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="4">조회된 결과가 없습니다. </td>
		</tr>
	</c:otherwise>
	</c:choose> 
</table> --%>


</body>
</html>