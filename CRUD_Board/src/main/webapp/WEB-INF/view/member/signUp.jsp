<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!-- 서버에서 전달해준 BindingResult 객체를 사용하기 위해서는
	아래의 태그 라이브러리를 추가해야 한다. -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>


<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<!--autoload=false 파라미터를 이용하여 자동으로 로딩되는 것을 막습니다.-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
         /*   $("[name=member_address.member_postcode]").val(data.zonecode);
           $("[name=member_address.member_address]").val(fullRoadAddr);
           */
           
           document.getElementById('member_postcode').value = data.zonecode;
           document.getElementById('member_address').value = fullRoadAddr;
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
}
</script>



<script language="javascript">

var idck = 0;
   function validate(){
       var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       // 이메일이 적합한지 검사할 정규식
		
        var member_id = $("#member_id").val();
		var member_pwd = $("#member_pwd").val();
		var userpwdcheck = $("#userpwdcheck").val();
		var member_name = $("#member_name").val();
		var member_email = $("#member_email").val();
		var member_postcode = $("#member_postcode").val();
		var member_address = $("#member_address").val();
		var member_detail = $("#member_detail").val();

       var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
       var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

       // ------------ 이메일 까지 -----------

       
       if(member_id.length == 0 || member_id.length == 0) {
    	   alert("아이디를 입력해주세요.")
    	   join.member_id.focus();
    	   return false;
       }
       
       if(!check(re,member_pwd,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return false;
       }
       
       if(join.member_pwd.length == 0) {
    	   alert("비밀번호를 입력해주세요.")
    	   join.member_pwd.focus();
    	   return false;
       }
       

       if(join.member_pwd.value != join.userpwdcheck.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           join.userpwdcheck.value = "";
           join.userpwdcheck.focus();
           return false;
       }

       if(join.member_name.value=="" || join.member_name.length == 0) {
           alert("이름을 입력해 주세요");
           join.member_name.focus();
           return false;
       }
       

       if(join.member_email.value=="" || join.member_email.length ==0) {
           alert("이메일을 입력해 주세요");
           join.member_email.focus();
           return false;
       }
/* 
       if(!check(re2,member_email, "적합하지 않은 이메일 형식입니다.")) {
           return false;
       }

   	 */
		if(member_postcode.length == 0 || member_address.length == 0 || member_detail.length == 0){
			alert("주소를 입력해주세요.");
			$("#member_detail").focus();
			return false;
		}


       if(confirm("회원가입을 하시겠습니까?")){
    	  	if(idck==0){
    	  		alert("아이디 중복체크를 해주세요");
    	  		return false;
    	  		
    	  	}else{
    	   alert("회원가입을 축하합니다");
    	   document.join.submit()
    	  	}
       }else{
    	   alert("취소 버튼을 누르셨습니다.")
    	   return false;
       }
       
      
   }

   
   

   
   
 //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
  
   $(function() {
       //idck 버튼을 클릭했을 때 
       $("#btn_idcheck").click(function() {
           
           //userid 를 param.
           var member_id =  $("#member_id").val(); 
           var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
           
        	   if(!check(re,member_id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
                   return false;
               }
           
           $.ajax({
               async: true,
               type : 'POST',
               data : member_id,
               url : "idcheck",
               dataType : "json",
               contentType: "application/json; charset=UTF-8",
               success : function(data) {
                   if (data.cnt > 0) {
                       
                       alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                       //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                       $("#divInputId").addClass("has-error")
                       $("#divInputId").removeClass("has-success")
                       $("#member_id").focus();
                       
                   
                   } else {
                       alert("사용가능한 아이디입니다.");
                       //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                       $("#divInputId").addClass("has-success")
                       $("#divInputId").removeClass("has-error")
                       $("#member_pwd").focus();
                       //아이디가 중복하지 않으면  idck = 1 
                       idck = 1;
                       
                   }
               },
               error : function(error) {
                   
                   alert("아이디를 입력해 주세요. " );
               }
           });
       });
   });
 
   function check(re, what, message) {
       if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       return false;
   }
    
</script>

<script type="text/javascript">
	function goPage(){
		alert("회원가입을 취소 하셨습니다.");
		location.href="${pageContext.request.contextPath}";
	}
</script>

<meta charset="UTF-8">
<title>회원 가입 페이지</title>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<div class="row"> 
<div class="col-md-6">

<h1>회원가입</h1>

 <%-- <form action="${pageContext.request.contextPath}/member/signup.do" method="post" name="join" onsubmit="return validate();"> --%>
<form name="join" onsubmit="return validate();" action="${pageContext.request.contextPath}/member/signup" method="post"  >
	
	
	<div class="form-group" id="divInputId">
	    <label>아이디</label> <br />
    	<input class="form-control" style="width: 40%; display: inline;" placeholder="아이디를 입력해주세요." name="member_id" id="member_id" type="text"  />
		<button type="button" class="btn btn-default" id="btn_idcheck"><i class="fa fa-search"></i> 중복확인</button>
		<span id="idCheckMsg" style="color:red; font-size:small;"></span>
	</div>
	
	
	<div class="form-group">
	<label>비밀번호</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="비밀번호를 입력해주세요." name="member_pwd" id="member_pwd" type="password"  />
		
</div>

	<div class="form-group">
	<label>비밀번호 확인</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="비밀번호 확인" name="userpwdcheck" id="userpwdcheck" type="password" />
</div>
	
	
		<div class="form-group">
	<label>이름</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="이름" name="member_name" id="member_name" type="text"  />
</div>

	<div class="form-group">
	<label>성별</label> <br />		
					<input type = "radio" name = "member_gender" value = "남자" checked = "checked">남자
					<input type = "radio" name = "member_gender" value = "여자">여자
</div>
	
	<div class="form-group">
	<label>이메일</label> <br />
    <input class="form-control" style="top: 5px;" placeholder="ex)abc@abc.com" name="member_email" id="member_email" type="text"  />
</div>
	
	<div class="form-group"> 
	<label>주소</label> <br />                 
<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="member_address.member_postcode" id="member_postcode" type="text" readonly="readonly" >
    <button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
</div>
<div class="form-group">
    <input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="member_address.member_address" id="member_address" type="text" readonly="readonly" />
</div>
<div class="form-group">
    <input class="form-control" placeholder="상세주소" name="member_address.member_detail" id="member_detail" type="text"  />
</div>
	<div class="form-group" style="text-align: center;">
		<input type="submit" class="btn btn-default" value="회원가입" >
		<input type="button" class="btn btn-default" value="취소" onclick="goPage();">
	</div>
</form>
	
</div>
</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>