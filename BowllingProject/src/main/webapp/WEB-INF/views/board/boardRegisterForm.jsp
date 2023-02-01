<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 화면</title>
	<!--  게시판 CRUD를 위한 자바스크립트 파일을 따로 생성해놓는다. (자바 스크립트 식 전부 대입) -->
	<script src = "${contextPath}/resources/js/board.js"></script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<jsp:include page = "../common/topMenu.jsp" flush = "flase"/>
	
	<div class = "container">
		<form class = "form-horizontal" name = "boardRegisterForm" enctype = "multipart/form-data"
		method = "post">
			<!-- form-action은 타이틀 밑의 js파일에서 구현 예정 -->
			<div class = "form-group">
				<div class = "col-sm-12">
					<h2 align = "center">게시글 쓰기</h2>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">제  목</label>
				<div class = "col-sm-8">
					<input type = "text" class = "form-control" id = "subject" name = "subject" maxlength = "200" placeholder = "제목 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">글쓴이</label>
				<div class = "col-sm-3">
					<input type = "text" class = "form-control" id = "writer" name = "writer" maxlength = "20" placeholder = "글쓴이 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<label class = "col-sm-2 control-label">내  용</label>
				<div class = "col-sm-8">
					<textarea class = "form-control" id = "content" name = "content" rows = "10" cols = "160" placeholder = "내용 입력"></textarea>
				</div>
			</div>
			<!-- 이미지 업로드하고 보여줄 곳 -->
			<div class = "form-group">
				<label class = "col-sm-2 control-label">이미지 업로드</label>
				<div class = "col-sm-8">
					<input type = "file" class = "form-control" id = "subject" name = "subject" maxlength = "200" placeholder = "제목 입력"/>
				</div>
			</div>
			<div class = "form-group">
				<div class = "col-sm-offset-4 left">
					<button type = "reset" class = "btn btn-warning">다시 입력</button>
					<button type = "submit" class = "btn btn-primanry" onClick = "fn_boardRegister();">게시글 등록</button>
					<button type = "reset" class = "btn btn-danger" onClick = "location.href = /main">메인페이지 이동</button>
				</div>
			</div>
		</form>
	</div>
	
	
	
	
	
	<!-- 하단 메뉴 -->
	<jsp:include page = "../common/footer.jsp" flush = "false"/>
</body>
</html>