<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<%-- 부트스트랩 이용하기 --%>
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script  src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/custom.css">

<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>

<title>회원제 서비스</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
			data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">SGM.COM</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${pageContext.request.contextPath}/">메인</a></li>
				<li><a href="${pageContext.request.contextPath}/board/listPaging">게시판</a></li>
			</ul>
				<c:if test="${loginmember eq null }">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li> <a href="${pageContext.request.contextPath}/member/login">로그인</a></li>
						<li><a href="${pageContext.request.contextPath}/member/signup">회원가입</a></li>
					</ul>
				</li>
			</ul>
			</c:if>
				<c:if test="${loginmember ne null }">
						<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원메뉴<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li> <a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
						<li><a href="${pageContext.request.contextPath}/member/mypage">내정보</a></li>
					</ul>
				</li>
			</ul>
	</c:if>
		</div>
	</nav>

</body>
</html>