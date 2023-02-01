<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${contextPath.request.contextPath }"/>
<!-- 대표 경로 설정 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<!--  상단 메뉴 -->
<jsp:include page = "../common/topMenu.jsp" flush = "flase"/>

	<div class = "container">
		<form class = "form-horizontal" method = "post" name = "memModifyForm"
		action = "${contextPath}/member/modifyMember.do">
			<div class = "form-group">
				<div class = "col-sm-offset-2 col-sm-5">
					<h2 align = "center">회원 정보 수정</h2>
				</div>
			</div>
			<div class = "form-group">
				<label for = "id" class = "col-sm-3 control-label">아이디</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "id" name = "id" maxlength = "20" value = "${member.id}" readonly />
				</div>
			</div>
			<div class = "form-group">
				<label for = "pwd" class = "col-sm-3 control-label">비밀번호</label>
				<div class = "col-sm-2">
					<input type = "password" class = "form-control" id = "pwd" name = "pwd" maxlength = "20" value = "${member.pwd}" />
				</div>
			</div>
			<div class = "form-group">
				<label for = "repwd" class = "col-sm-3 control-label">비밀번호 확인</label>
				<div class = "col-sm-2">
					<input type = "password" class = "form-control" id = "repwd" name = "repwd" maxlength = "20" />
				</div>
			</div>
			<div class = "form-group">
				<label for = "name" class = "col-sm-3 control-label">이  름</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "name" name = "name" maxlength = "10" value = "${member.name}" />
				</div>
			</div>
			<!-- 주소 api 기입해서 주소 입력창 -->
			<div class = "form-group">
				<label for = "address" class = "col-sm-3" style = "text-align:right">우편 번호</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "zipcode" id = "zipcode" readOnly/>
					<input type = "button" class = "form-control btn btn-danger" onclick = "daumZipCode()" value = "우편번호 검색"/>
					<!-- 자바스크립트로 api 처리하자 -->
				</div>
			</div>
			<div class = "form-group">
				<label for = "address" class = "col-sm-3" style = "text-align:right">주  소</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" id = "address_1" name = "address" readOnly/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "address" class = "col-sm-3" style = "text-align:right">상세 주소</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" id = "address_2" name = "address" />
					<input type = "hidden" class = "form-control" id = "adress" name = "adress" value = "${member.address}"/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "average" class = "col-sm-3 control-label">에버리지</label>
				<div class = "col-sm-1">
					<input type = "text" class = "form-control" id = "average" name = "average" maxlength = "3" value = "${member.average}" />
				</div>
			</div>
			<div class = "form-group">
				<label for = "pound" class = "col-sm-3 control-label">공 무게(파운드)</label>
				<div class = "col-sm-1">
					<input type = "text" class = "form-control" id = "pound" name = "pound" maxlength = "2" value = "${member.pound}" />
				</div>
			</div>
			<div class = "form-group">
				<label for = "gender" class = "col-sm-3 control-label">성  별</label>
				<div class = "col-sm-2">
					<label class = "radio-inline">
						<input type = "radio" name = "gender" value = "F" checked/> 여성
					</label>
					<label class = "radio-inline">
						<input type = "radio" name = "gender" value = "M" /> 남성
					</label>
				</div>
			</div>
			<div class = "form-group">
				<div class = "col-sm-offset-3 col-sm-5">
					<button type = "reset" class = "btn btn-warning">다시 입력</button>
					<button type = "reset" class = "btn btn-danger cancel">회원 정보 수정 취소</button>
					<button type = "submit" class = "btn btn-primary" id ="submit">회원 정보 수정</button>
				</div>
			</div>
		</form>
	</div>



<!-- 하단 메뉴  -->
<jsp:include page = "../common/footer.jsp" flush = "false"/>
<!-- 다음 지도 api 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	
	//회원 정보 수정이 가능할때
	$(document).ready(function(){

		$(".cancel").on("click", function(){
			location.href = "/member/listMembers.do";
		});
		
		//회원 정보 수정 버튼 눌렀을 경우
		$("#submit").on("click", function() {
		 
			if($("#pwd").val() == "") {
	            alert("비밀번호를 입력하셔야 합니다.");
	            $("#pwd").focus();
	            return false;
	        }
		
	     if($("#pwd").val().length < 4) {
	            alert("비밀번호는 최소 4자리 이상을 입력하셔야 합니다.");
	            $("#pwd").focus();
	            return false;
	        }
	     if($("#repwd").val() == "") {
	            alert("비밀번호 확인을 입력하셔야 합니다.");
	            $("#repwd").focus();
	            return false;
	        }
	     if($("#repwd").val().length < 4) {
	            alert("비밀번호 확인은 최소 4자리 이상을 입력하셔야 합니다.");
	            $("#repwd").focus();
	            return false;
	        }
	     if($("#pwd").val() != $("#repwd").val()) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				$("#repwd").focus();
			return false;
			}
	     if($("#name").val() == "" || $("#name").val().length < 3) {
	    	 alert("이름은 최소 3자리 이상을 입력하셔야 합니다.");
	    	 $("#name").focus();
	    	 return false;
	     }
	     if($("#average").val() == "" || $("#average").val().length < 3) {
	    	 alert("에버리지는 0부터 300 사이를 입력하셔야 합니다.");
	    	 $("#average").focus();
	    	 return false;
	     }
	     if($("#pound").val() == "" || $("#pound").val().length < 2) {
	    	 alert("공 무게(파운드)는 2자리수 이상을 입력하셔야 합니다.");
	    	 $("#pound").focus();
	    	 return false;
	    	}
		});
	});

	// 다음 지도 API
		function daumZipCode() {
			new daum.Postcode ({
				oncomplete: function(data) {
					// 팝업창에서 검색한 결과에서 항목을 클릭하였을 경우에 실행할 코드를 이곳에 작성한다.
					
					// 각 주소의 노출 규칙에 따라서 주소를 조합해야 한다.
					// 내려오는 변수가 값이 없을 경우에는 공백('') 값을 가지므로 이름을 참고하여 분기한다.
					var fullAddr = ''; //최종 주소값을 저장할 변수
					var subAddr = ''; //조합형 주소값을 저장할 변수
					
					
					// 사용자가 선택한 주소의 타입에 따라서 해당 주소 값을 가져온다.
					// (data)에 값이 다들어있다. 이걸 분배
					// 다음에서 만든 메서드 userSelectedType을 사용하고 R은 도로명 주소
					// 시 군 구 를 가져온것이다.
					if(data.userSelectedType == 'R') { //도로명 주소를 선택한 경우
						fullAddr = data.roadAddress;
					
					} else { //지번 주소를 선택한 경우
						fullAddr = data.jibunAddress;
					}
					
					//사용자가 선택한 주소가 도로명 타입일 때 조합한다.(조합을 위한 식)
					if(data.userSelectedType == 'r') {
						// 법정동명이 있을 경우에 추가한다.
						if(data.bname != '') { //not빈칸이면 내용이있다면
							subAddr += data.bname;
						}
						// 건물명이 있을 경우에 추가한다.
						// 값이 들어가있는 경우와 없는 경우가 있는데 3항연산자로 검사해준다.
						if(data.buildingName != '') {
							subAddr += (subAddr != '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형 주소의 유무에 따라서 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (subAddr != '' ? '(' + subAddr + ')' : '');
						//subaddr이 채워져있다면 ? 참 : 거짓
					}
					// 우편번호와 주소정보를 화면의 해당 필드에 출력시킨다.
					// 복수의 데이터를 붙일때는 Element"s"
					document.getElementById('zipcode').value = data.zonecode; // 5자리의 새 우편번호
					document.getElementById('address_1').value = fullAddr; // 주소칸에 주소를 넣어준다. 
					//fullAddr을 가져오는거다, data아님
					
					//커서를 상세 주소 입력란으로 이동시킨다.
					document.getElementById('address_2').focus();
				}	
			}).open({  
			//우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 작성
			popupName:  'postcodePopup'
				
			});
		}

	</script>


</body>
</html>