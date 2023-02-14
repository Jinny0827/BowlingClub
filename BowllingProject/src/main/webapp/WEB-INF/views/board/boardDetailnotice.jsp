<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }"/>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시글 상세 정보</title>
	<!-- 이 페이지의 자바 스크립트 구현을 board.js파일에 몰아놓는다. -->
	<script src = "${contextPath}/resources/js/board.js"></script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<jsp:include page="../common/topMenu.jsp" flush="false" />
	
	<div class = "container">
		<form class = "form-horizontal" id = "frm">
			<div class = "form-group">
				<div>
					<h2 align = "center">공지 게시글 상세 정보</h2>
				</div>
			</div>
			<div class = "form-group">
				<label for = "bno" class = "col-sm-2 control-label">게시글 번호</label>
				<div class = "col-sm-1">
					<input type = "text" class = "form-control" id = "bno" name = "bno"
					maxlength = "200" value = "${NoticeDetail.bno}" readOnly/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "subject" class = "col-sm-2 control-label">제  목</label>
				<div class = "col-sm-10">
					<input type = "text" class = "form-control" id = "subject" name = "subject"
					maxlength = "200" value = "${NoticeDetail.subject}" readOnly>
				</div>
			</div>
			<div class = "form-group">
				<label for = "reg_date" class = "col-sm-2 control-label">작성일자</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" id = "reg_date" name = "reg_date"
					maxlength = "200" value = "<fmt:formatDate value = '${NoticeDetail.reg_date}' pattern = 'yyyy년 MM월 dd일 a dd시 mm분 ss초'/>" readOnly/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "writer" class = "col-sm-2 control-label">작성일자</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "writer" name = "writer"
					maxlength = "200" value = "${NoticeDetail.writer}" readOnly/>
				</div>
			</div>
			<div class = "form-group">
			<label for = "content" class = "col-sm-2 control-label">내  용</label>
				<div class = "col-sm-10">
					<textarea rows = "10" cols = "160" class = "form-control" id = "content" name = "content" readOnly>${NoticeDetail.content}</textarea>
				</div>
			</div>
			<div class = "form-group">
				<label for = "imageName" class = "col-sm-2 coltrol-label">이미지 이름</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "imageName" name = "imageName" maxlength = "200" value = "${NoticeDetail.imageName}" readOnly>
				</div>
			</div>
			<div class = "form-group">
				<label for = "imagePath" class = "col-sm-2 coltrol-label">이미지 경로</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" id = "imagePath" name = "imagePath" maxlength = "200" value = "${NoticeDetail.imagePath}" readOnly>
				</div>
			</div>
			<div class = "form-group">
				<p align = "center">
					<button type = "button" class = "btn btn-primary" onclick = "location.href = '${contextPath}/board/notice'">
					<span class = "glyphicon glyphicon-list-alt">게시글 목록 이동</span></button>
					<button type = "button" class = "btn btn-warning" onclick = "fn_boardUpdateFrom(${NoticeDetail.bno})">
					<span class = "glyphicon glyphicon-pencil">게시글 수정</span></button>
					<button type = "button" class = "btn btn-danger" onclick = "fn_boardDelete(${NoticeDetail.bno})">
					<span class = "glyphicon glyphicon-erase">게시글 삭제</span></button>
			</div>
		</form>
	</div>
	
	
	
	
	<!-- 하단 메뉴 -->
	<jsp:include page="../common/footer.jsp" flush = "false"/>
</body>
</html>