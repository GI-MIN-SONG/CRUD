<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<title>게시글 작성</title>


<script type="text/javascript">
function goPage(){
	location.href="${pageContext.request.contextPath}/board/list";
	
	}

</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btnSave").click(function(){
			var title = $("#b_title").val();
			var detail = $("#b_detail").val();
			var writer = $("#b_writer").val();
			if(title == ""){
				alert("제목을 입력하세요");
				document.form1.title.focus();
				return;
			}
			if(detail == ""){
				alert("내용을 입력하세요");
				document.form1.detail.focus();
				return;
			}
			if(writer == ""){
				alert("이름을 입력하세요");
				document.form1.writer.focus();
				return;
			}
			// 폼에 입력한 데이터를 서버로 전송
			document.form1.submit();
		});
		
	});
</script>
</head>
<body>
<%-- <%@ include file="../include/menu.jsp" %> --%>
<jsp:include page="../include/header.jsp"/>

	<div class="col-lg-12">
    <form role="form" id="form1" name="form1" method="post" action="${pageContext.request.contextPath}/board/write">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">게시글 작성</h3>
            </div>
            <div class="box-body">
                <div class="form-group">
                    <label for="title">제목</label>
                    <input class="form-control" id="b_title" name="b_title" placeholder="제목을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="b_content" name="b_content" rows="30"
                              placeholder="내용을 입력해주세요" style="resize: none;"></textarea>
                </div>
                  
            </div>
            <div class="box-footer">
                <button type="button"  onclick="goPage();" class="btn btn-primary"><i class="fa fa-list" ></i> 목록</button>
                <div class="pull-right">
                    <button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button>
                    <button type="button" class="btn btn-success" id="btnSave"><i class="fa fa-save"></i> 저장</button>
                </div>
            </div>
        </div>
          <input type="hidden" id="b_writer" name="b_writer" value="${loginmember.member_name}">
    </form>
</div>
	
	
	

</body>
</html>