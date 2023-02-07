<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 액션(코어)태그 --%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- EL태그로 쓸것을 미리 만들어놓는 좋은 습관 기억하자 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
</head>
<body>
	<!-- 상단 메뉴 -->
	<jsp:include page = "../common/topMenu.jsp" flush = "false"/>

	<div class = "container">
		<div align = "center">
			<h2>공지사항 게시판</h2>
			<br/>
		</div>
		<div align = "left">
			<button class = "btn btn-primary" onclick = "location.href = '/board/boardRegisterForm'">게시글 쓰기</button>
			<hr/>
		</div>
		<table class = "table table-bordered table-striped table-hover">
			
			<thead>
				<tr class = "warning">
					<th class = "col-sm-1  text-center">번  호</th>
					<th class = "col-sm-4  text-center">제  목</th>
					<th class = "col-sm-1  text-center">글쓴이</th>
					<th class = "col-sm-3  text-center">작성일자</th>
					<th class = "col-sm-1  text-center">조회수</th>				
				</tr>
			</thead>
			<tbody>
			<!-- 
				private int bno;
				private String subject;
				private String writer;
				private String reg_date;
				private String content;
				private int readCount;
				
				아래 두개는 신경 ㄴ
				private String imageName;
				private String imagePath;
			-->
				<c:forEach var = "notice" items = "${boardListnotice}">
				<tr>
					<td align = "right">${notice.bno}</td>
					<td align = "center"><a href = "${contextPath}/board/boardDetail?bno=${notice.bno}&flag=0">${notice.subject}</a></td>
					<td class = "hidden">${notice.content}</td>
					<td align = "center">${notice.writer}</td>
					<td><fmt:formatDate value = "${notice.reg_date}" pattern = "yyyy년 MM월 dd일 a hh시 mm분 ss초"/></td>
					<td align = "right"><fmt:formatNumber value = "${notice.readCount}" pattern = "#,###"/></td>
					<!-- 나중 사용을 위해서 이미지 이름과 경로 히든 처리 -->
					<td class = "hidden">${notice.imageName}</td>
					<td class = "hidden">${notice.imagePath}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div align = "center">
			<div class = "form-group">
				<div class = "col-sm-offset-4 col-sm-2">
					<select id = "searchType" class = "form-control">
						<option>검색 종류</option>
						<option value = "s" <c:if test = "${searchType == 's'}">selected</c:if>>제목</option>	
						<option value = "c" <c:if test = "${searchType == 'c'}">selected</c:if>>내용</option>	
						<option value = "w" <c:if test = "${searchType == 'w'}">selected</c:if>>글쓴이</option>	
					</select>
				</div>
				
				<div class = "col-sm-2">
					<input type = "text" id = "searchKeyword" value = "${keyword}"/>
				</div>
				<div class = "col-sm-1">
					<button id = "searchBtn" class = "btn btn-danger">검색</button>
				</div>
			</div>
		</div>
	
		<div class = "" align = "center">
			<ul class = "btn-group pagination">
				<c:if test = "${pageMaker.prev}">
					<li>
						<a href = '<c:url value = "/board/notice?page=${pageMaker.startPage-1}&searchType=${searchType}&keyword=${keyword}"/>'>
						<span class = "glyphicon glyhicon-chevron-left"></span></a>
					</li>
				</c:if>
				<c:forEach begin = "${pageMaker.startPage}" end = "${pageMaker.endPage}" var = "pageNum">
				 	<li>
				 		<a href = '<c:url value = "/board/notice?page=${pageNum}&searchType=${searchType}&keyword=${keyword}"/>'>
				 		<i>${pageNum}</i></a>
				 	</li>
				 </c:forEach>
				 <c:if test = "${pageMaker.next}">
				 	<li>
				 		<a href = '<c:url value = "/board/notice?page=${pageMaker.endPage+1}&searchType=${searchType}&keyword=${keyword}"/>'>
				 		<span class = "glyphicon glyphicon-chevron-right"></span></a>
				 	</li>
				 </c:if>
			</ul>
		</div>
		
		<form id = "formList" action = "/board/notice" method = "get">
			<input type = "hidden" name = "searchType" value = "${searchType}"/>
			<input type = "hidden" name = "keyword" value = "${keyword}"/>
		</form>
</div>


	<!-- 하단 메뉴 -->
	<jsp:include page = "../common/footer.jsp" flush = "false"/>
	
	
</body>
</html>