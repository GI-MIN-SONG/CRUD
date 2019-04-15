<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<%-- 부트스트랩 이용하기 --%>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>


<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">

<%-- 
  
  부트스트랩 이용하기
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text.javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css">

<!-- html 메인화면 적용시킨 것  -->
부트스트랩 이용하기
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<meta charset="UTF-8">
<title>메인 페이지</title>
	 --%>
</head>
<body>
<%@ include file="include/header.jsp" %>
<%@ include file="include/footer.jsp" %>
<%-- 
<div class="container">
<h3>회원</h3>
<a href="${pageContext.request.contextPath}/member/signup.do" class="btn btn-primary">회원가입</a>
<a href="${pageContext.request.contextPath}/member/login.do" class="btn btn-primary">로그인</a>
</div>
<div class="container">
<h3>게시글 </h3>
<a href="${pageContext.request.contextPath}/board/list.do" class="btn btn-primary">게시글 목록보기</a>
</div>
 --%>
 
</body>
</html>