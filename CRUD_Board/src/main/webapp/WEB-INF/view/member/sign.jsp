<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>


<jsp:include page="../include/header.jsp"/>

<div class="panel-body">
    <div class="row">
        <div class="col-lg-6">
            <form role="form" action="/register/step3" method="post">
                <div class="form-group input-group">
                    <span class="input-group-addon"><i class="fa fa-check"></i></span>
                    <input type="text" class="form-control" placeholder="ID" />
                </div>
                <div class="form-group input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" placeholder="Password" />
                </div>
                <div class="form-group input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" placeholder="Password Check"/>
                </div>
                <div class="form-group input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                    <input type="email" class="form-control" placeholder="Email" />
                </div>
                <div class="form-group input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" placeholder="Name" />
                </div>
                <button type="submit" class="btn btn-default">가입하기</button>
                <button type="reset" class="btn btn-default">취소하기</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>

</body>
</html>