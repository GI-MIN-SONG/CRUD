<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<title>로그인</title>

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

<script type="text/javascript">
function loginBtn(){

	
	if(member_id.value =="" && member_pwd.value==""){
		alert("정보를 입력해주세요");
		document.getElementById('member_id').focus();
	}else if(member_id.value.length>0 && member_pwd.value==""){
		alert("정보를 입력해주세요");
		document.getElementById('member_pwd').focus();
	}else if(member_id.value==""&&member_pwd.value.length>0){
		alert("정보를 입력해주세요");
		document.getElementById('member_id').focus();
	}else if (true){
		
		document.loginForm.submit();
	}
	
}
</script>

</head>
<body>

	<jsp:include page="../include/header.jsp"/>

    <div class="container">
    <div class="col-lg-4"> </div>
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 20px; margin-top: 20px;">
      	  <form action="${pageContext.request.contextPath}/member/login" method="post" id="loginForm" name="loginForm">
          
                <h3 style="text-align: center;">로그인</h3>
                <div class="form-group">
                    <input type="text" id="member_id" name="member_id" class="form-control" placeholder="아이디" 
                            maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" name="member_pwd" id="member_pwd" class="form-control" placeholder="비밀번호" 
                            maxlength="20" >
                </div>
                <input type="button" class="btn btn-primary form-control" value="로그인" onclick="loginBtn()">
            </form>
        </div>
    </div>
    <div class="col-lg-4"></div>
    </div>
	
	

	
</body>
</html>