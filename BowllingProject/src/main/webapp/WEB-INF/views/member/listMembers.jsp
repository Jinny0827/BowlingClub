<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var = "contextPath" value = "${contextPath.request.contextPath }"/>
<!-- 대표 경로 설정 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록</title>
</head>
<body>
	<!-- 회원에 대한 체크(로그인 여부) -->
	<%
	if(session.getAttribute("isLogOn") == null || session.getAttribute("isLogOn").equals("")) {
		response.sendRedirect("/member/loginForm.do");
	}
	// 비로그인시 센드다이렉트(경로로 보낸다.)
	%>
	<!-- 상단 메뉴바 -->
	<jsp:include page = "../common/topMenu.jsp" flush = "false"/>
	
	<div class = "container">
		<h1 align = "center">회원 전체 목록</h1>
		<a href = "${contextPath}/member/logout.do" class = "btn btn-danger"><span class = "glyphicon glyphicon-log-out">로그아웃</span></a>
		
		<table class = "table table-bordered table-stripe table-hover" style = "width:1200px; margin:auto;">
			<tr class = "info">
				<!-- 한줄짜리 메뉴표(매개항목 설명, 테이블표) -->
				<td align = "center" width = "80"><b>아이디</b></td>
				<td align = "center" width = "80"><b>비밀번호</b></td>
				<td align = "center" width = "80"><b>이  름</b></td>
				<td align = "center" width = "200"><b>주  소</b></td>
				<td align = "center" width = "80"><b>에버리지</b></td>
				<td align = "center" width = "80"><b>파운드</b></td>
				<td align = "center" width = "50"><b>성  별</b></td>
				<td align = "center" width = "120"><b>가입일자</b></td>
				<td align = "center" width = "60"><b>수정</b></td>
				<td align = "center" width = "100"><b>삭제(YES/NO)</b></td>
			</tr>
			<!-- 데이터 분출 반복문 시작 -->
			<c:forEach var = "member" items = "${memberLists}">
				<tr>
					<td align = "center">${member.id}</td>
					<td align = "center">${member.pwd}</td>
					<td align = "center">${member.name}</td>
					<td align = "center">${member.address}</td>
					<td align = "center">${member.average}</td>
					<td align = "center">${member.pound}</td>
					<td align = "center">${member.gender}</td>
					<td align = "center"><fmt:formatDate value="${member.joinDate}" pattern = "yyyy년 MM월 dd일"/></td>
					<td align = "center"><a class = "btn btn-primary"
					href = "${contextPath}/member/updateMemberForm.do?id=${member.id}">수정</a></td>
					<td align = "center"><a class = "btn btn-danger"
					href = "javascript:removeMember('${member.id}');">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 하단 메뉴 -->
	<jsp:include page = "../common/footer.jsp" flush = "false"/>	
	
	<script>
	//회원 정보를 삭제하기 전에 삭제 여부 확인
	function removeMember(id) {
		
		if(!confirm("회원 정보를 삭제하시겠습니까?\n\n삭제를 하시려면 [확인]버튼을 누르시고, 아니면 [취소]버튼을 누르십시오!")){
			alert("회원 정보 삭제를 취소하셨습니다.");
		}else { //삭제를 동의하면 삭제에 대한 url요청을 한다.
			alert("진짜로 회원 정보를 삭제합니다.");
			location.href = "/member/removeMember.do?id=" + id;
		}
		
		
	}
	</script>
	
</body>
</html>