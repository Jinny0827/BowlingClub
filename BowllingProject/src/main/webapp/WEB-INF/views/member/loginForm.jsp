<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<c:set var="contetPath" value="${pageContext.request.contextPath }" />
<c:set var="result" value="${param.result}"/>
<!-- 정상적으로 로그인이 되었는지 확인할수있는 파라미터값 = result -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>로그인 화면</title>
<!-- 로그인 여부 체크 -->
<!-- 멤버컨트롤러에서 만들어놓은 여러가지 아이디실패 경우의수 -->
<c:choose>
	<c:when test = "${result == 'loginIdEmpty'}">
	<!-- id칸이 비었을때, 아이디를 입력하지 않았을때 -->
		<script>
			window.onload = function() {
				alert("\n아이디를 입력하셔야 합니다");	
			}
		</script>
	</c:when>
	<c:when test = "${result == 'loginFailed'}">
	<!-- loginFailed의 경우, 아이디가 맞지 않을경우 -->
		<script>
		window.onload = function() {
			alert("\n아이디를 잘못 입력하셨습니다. \n 다시 로그인해주십시오.");	
		}
		</script>
	</c:when>
	<c:when test = "${result == 'PasswordFailed'}">
	<!-- PasswordFailed가 뜬다면? 비밀번호가 맞지않을경우 -->
		<script>
		window.onload = function() {
			alert("\n비밀번호를 잘못 입력하셨습니다.\n 다시 로그인 해주십시오.");
		}
		</script>
	</c:when>
</c:choose>

</head>
<body>
 


	<!-- 상단 메뉴바 -->
	<jsp:include page="../common/topMenu.jsp" flush="false" />

	<div class="container">
		<form class="form-horizontal" method="post" action="${contextPath}/member/login.do">
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-3">
					<h2 align = "center">로그인</h2>
				</div>
			</div>
			<div class="form-group">
				<label for="id" class="col-sm-offset-3 col-sm-2 control-label">아이디</label> 
				<div class="col-sm-3">
					<input type="text" class="form-control" id= "id" name="id" maxlength="20" placeholder="아이디"/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "id" class = "col-sm-offset-3 col-sm-2 control-label">비밀번호</label>
				<div class = "col-sm-3">
					<input type = "password" class = "form-control" id = "pwd" name = "pwd" maxlength = "20" placeholder = "비밀번호"/>
				</div>
			</div>
			<div class  = "form-group">
				<div class = "col-sm-offset-5 col-sm-2">
					<button type = "reset" class = "btn btn-danger">다시 입력</button>
					<button type = "submit" class = "btn btn-primary">로그인</button>
				</div>
			</div>
		</form>
	</div>

	<!-- 하단 메뉴바 -->
	<jsp:include page="../common/footer.jsp" flush="false" />

<%
	//form의 action이 실행되기 전에(/body전에) 아이디, 비밀번호에 값이 입력되었는지,
	//자리수가 맞는지 검사한다.
%>

<script>
// topMenu의 부트스트랩, 제이쿼리를 가져왔으므로 부트스트랩을 사용한다.
$(document).ready( function() {
	// 로그인 버튼이 눌렷을 경우 -> submit이 넘어가면 안된다.
	// 로그인 조건확인이 되어야 submit이 시작되어야한다.
	$("#submit").on("click", function(){
		
		if($("#id").val() == "") {
		// id칸이 비었을경우
			alert("아이디를 입력하셔야 합니다.");
			$('#id').focus();
			//알럿창의 확인버튼을 누른후에 **입력칸으로 다시 돌아간다**
			return false;
		}
		
		if($("#id").val().length < 3) {
			//아이디를 3자 아래로 적었을경우
			alert("아이디는 최소 3자리 이상을 입력하셔야 합니다.");
			$("#id").focus();
			return false;
		}
		if($("#pwd").val() == "") {
			// pwd칸이 비었을경우
				alert("비밀번호를 입력하셔야 합니다.");
				$('#pwd').focus();
				//알럿창의 확인버튼을 누른후에 **입력칸으로 다시 돌아간다**
				return false;
			}
		if($("#pwd").val().length < 3) {
			// pwd칸이 비었을경우
			alert("비밀번호는 최소 3자리 이상을 입력하셔야 합니다.");
			$('#pwd').focus();
			//알럿창의 확인버튼을 누른후에 **입력칸으로 다시 돌아간다**
			return false;
			}
		
		
	});
});
</script>

</body>
</html>