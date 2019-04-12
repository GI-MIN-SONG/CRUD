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

<%-- <%@ include file="../include/menu.jsp" %> --%>

<!-- <button type="button" id="btnWrite" class="btn btn-default" >글쓰기</button> -->
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
<div class="box-footer">
    <div class="text-center">
        <ul class="pagination">
            <c:if test="${pageMaker.prev}">
                <li><a href="${pageContext.request.contextPath}/board/listPaging?page=${pageMaker.startPage - 1}">이전</a></li>
            </c:if>
            <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                <li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
                    <a href="${pageContext.request.contextPath}/board/listPaging?page=${idx}">${idx}</a>
                </li>
            </c:forEach>
            <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                <li><a href="${pageContext.request.contextPath}/board/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
            </c:if>
        </ul>
    </div>
</div>


</body>
</html>