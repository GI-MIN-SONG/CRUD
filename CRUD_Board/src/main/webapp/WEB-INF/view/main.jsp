<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>



<div class="container">
<h3>회원</h3>
<a href="${pageContext.request.contextPath}/member/signup.do" class="btn btn-primary">회원가입</a>
<a href="${pageContext.request.contextPath}/member/login.do" class="btn btn-primary">로그인</a>
</div>
<div class="container">
<h3>게시글 </h3>
<a href="${pageContext.request.contextPath}/board/list.do" class="btn btn-primary">게시글 목록보기</a>
</div>

</body>
</html>