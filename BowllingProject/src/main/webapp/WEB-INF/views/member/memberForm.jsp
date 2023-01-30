<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${contextPath.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
</head>
<body>
	<!-- 비동기통신 이용(ajax) - 아이디 중복 확인 -->
	<!-- 상단 메뉴바 -->
	<jsp:include page="../common/topMenu.jsp" flush="false" />

	<div class="container">
		<form class="form-horizontal" method="post" name="memInsForm" action="${contextPath}/member/addMember.do">
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-2">
					<h2 align="center">회원 가입</h2>
				</div>
			</div>
			<div class = "form-group">
				<label for = "id" class = "col-sm-4 control-label">아이디</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "id" name = "id" maxlength = "20" placeholder = "아이디 입력"/>
				</div>
				<div class = "col-sm-2">
					<button class = "btn btn-warning idCheck" type = "button" id = "idCheck"
					onclick = "fn_idCheck();" value = "N">아이디 중복 검사</button>
				</div>
			</div>
			<div class = "form-group">
				<label for = "pwd" class = "col-sm-4 control-label">비밀번호</label>
				<div class = "col-sm-2">
					<input type = "password" class = "form-control" id = "pwd" name = "pwd" maxlength = "20"
					placeholder = "비밀번호 입력"/>
				</div>	
			</div>
			<div class = "form-group">
				<label for = "repwd" class = "col-sm-4 control-label">비밀번호 확인</label>
				<div class = "col-sm-2">
					<input type = "password" class = "form-control" id = "repwd" name = "repwd" maxlength = "20"
					placeholder = "비밀번호 입력"/>
				</div>	
			</div>
			<div class = "form-group">
				<label for = "name" class = "col-sm-4 control-label">이  름</label>
				<div class = "col-sm-2">
					<input type = "text" class = "form-control" id = "name" name = "name" maxlength = "20" placeholder = "이름 입력"/>	
				</div>
			</div>
			<!-- 주소 api 기입해서 주소 입력창 -->
			<div class = "form-group">
				<label for = "address" class = "col-sm-4" style = "text-align:right">우편 번호</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" name = "zipcode" id = "zipcode" readOnly/>
					<input type = "button" class = "form-control btn btn-danger" onclick = "daumZipCode()" value = "우편번호 검색"/>
					<!-- 자바스크립트로 api 처리하자 -->
				</div>
			</div>
			<div class = "form-group">
				<label for = "address" class = "col-sm-4" style = "text-align:right">주  소</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" id = "address_1" name = "address" readOnly/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "address" class = "col-sm-4" style = "text-align:right">상세 주소</label>
				<div class = "col-sm-4">
					<input type = "text" class = "form-control" id = "address_2" name = "address"/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "average" class = "col-sm-4 control-label">에버리지(3게임 평균)</label>
				<div class = "col-sm-2">
					<input type = "number" class = "form-control" id = "average" name = "average" maxlength = "3" placeholder = "에버리지 입력"
					 min = "0" max = "300" />
				</div>
			</div>
			<div class = "form-group">
				<label for = "pound" class = "col-sm-4 control-label">사용 볼링공 무게(파운드)</label>
				<div class = "col-sm-2">
					<input type = "number" class = "form-control" id = "pound" name = "pound" maxlength = "2" placeholder = "무게 입력"
					min = "10" max = "20"/>
				</div>
			</div>
			<div class = "form-group">
				<label for = "gender" class = "col-sm-4 control-label">성 별</label>
				<div class = "col-sm-2">
					<label class = "radio-inline">
						<input type = "radio" name ="gender" value = "F" checked/>여성
					</label>
					<label class = "radio-inline">
						<input type = "radio" name ="gender" value = "M" />남성
					</label>
				</div>
			</div>
			<div class = "form-group">
				<label for = "name" class = "col-sm-4 control-label">회원가입 동의</label>
				<div class = "col-sm-2">
					<label class = "radio-inline">
						<input type = "radio" id ="register_Y" name = "register_Yn" value = "Y" checked>동의&nbsp;&nbsp;
					</label>
					<label class = "radio-inline">
						<input type = "radio" id = "register_N" name = "register_Yn" value = "N" >동의안함
					</label>
				</div>
			</div>
			<div class="alert alert-info fade in col-sm-offset-2 col-sm-10">
				<strong>[Team-cover 클럽의 개인 정보 수집 및 이용 안내]</strong>
				<h5>
					개인 정보 제3자 제공 동의 <br>① 개인정보를 제공받는 자: Team-cover <br>② 개인정보를
					제공받는 자의 개인 정보 이용 목적 : 클럽 관리 및 운영에 관한 편리한 기능 제공 <br>③ 제공하는 개인정보항목 : 이름 외 여럿 <br>④
					개인정보를 제공받는 자의 개인 정보 보유 및 이용 기간 : 개인정보 취급 목적을 달성하여 더 이상 개인정보가 불 필요하게
					된 경우이거나 5년이 지나면 지체 없이 해당 정보를 파기할 것입니다. <br>귀하는 위와 같은
					Team-cover의 개인정보 수집 및 이용정책에 동의하지 않을 수 있으나, Team-cover으로부터 
					클럽 내 공지사항, 클럽 이벤트, 그 외 등의 유용한 정보를 제공받지 못 할 수 있습니다. <br> 개인 정보 보호에 대한 자세한
					내용은 홈페이지 공지사항을 참조바랍니다.
				</h5>
				<div class="checkbox" align="center">
					<label> <input type="checkbox" id="is_subscribed"
						name="is_subscribed" value="o" />
					</label> Team-cover의 개인정보 수집 및 이용에 동의합니다.
				</div>
			</div>
			<div class = "form-group">
				<div class = "col-sm-offset-5 col-sm-4">
					<button type = "reset" class = "btn btn-warning">다시 입력</button>
					<button type = "button" class = "btn btn-danger cancel">회원 가입 취소</button>
					<button type = "submit" onclick = "submit();" class = "btn btn-primary submit" id = "submit" disabled>회원 가입</button>
					<!--<button type = "submit" class = "btn btn-primary signOkBtn" disabled = "disabled">회원 가입</button> -->
				</div>
			</div>
		</form>
	</div>



	<!-- 하단 메뉴바 -->
	<jsp:include page="../common/footer.jsp" flush="flase" />
	
	<!-- 다음 지도 api 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script>
	// 아이디 중복 검사 버튼을 눌렀을 경우
	function fn_idCheck() {
	// alert(   $("#id").val()   );
	if($("#id").val() == "" || $("#id").val() == null){
		alert("아이디칸이 빈칸이므로 중복검사 할 수 없습니다. 아이디를 적어주세요.");
		$("#id").focus();
		return false;
	}
	// 아이디 중복검사를 위한 ajax(비동기 통신)
	$.ajax({
	    url:		"/member/idCheck",
	    type:		"post",
	    dataType:	"json",
	    data:		{ "id" :  $("#id").val() },
	    success:	function(data) {
	        if(data == 1) {	// 입력한 아이디가 이미 존재하는 경우
	            alert("이미 사용 중인 아이디입니다.\n\n다른 아이디를 입력하십시오.");
	        	$(".submit").attr("disabled", true);
	        } else if(data == 0) { // 입력한 아이디가 존재하지 않는 경우
	            // 버튼 id="idCheck"의 속성인 value의 값을 "Y"로 변경한다.
	            $("#idCheck").attr("value", "Y");
	            alert("사용 가능한 아이디입니다.");
	            $(".submit").attr("disabled", false);
	        }
	    },
	});
}
	$(document).ready(function() {

	    // 취소 버튼이 눌렸을 경우 로그인 화면으로 이동한다.
	    $(".cancel").on("click", function() {
	        location.href="/member/loginForm.do";
	    });

	    // 회원가입 버튼을 눌렀을 경우 (id="submit")
	    $("#submit").on("click", function() {
	        
	        if($("#id").val() == "") {
	            alert("아이디를 입력하셔야 합니다.");
	            $("#id").focus();
	            return false;
	        }
	        if($("#id").val().length < 4) {
	            alert("아이디는 최소 4자리 이상을 입력하셔야 합니다.");
	            $("#id").focus();
	            return false;
	        }
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
	            alert("비밀번호 확인칸을 입력하셔야 합니다.");
	            $("#repwd").focus();
	            return false;
	        }
	        if($("#repwd").val().length < 4) {
	        	alert("비밀번호 확인칸은 최소 4자리 이상 입력하셔야 합니다.");
	        	$("#repwd").focus();
	        	return false;
	        }
	        if($("#pwd").val() != $("#repwd").val()){
	        	alert("비밀번호와 비밀번호 확인칸의 내용이 일치하지 않습니다.");
	        	$("#pwd").focus();
	        	return false;
	        }
	        
	        if($("#name").val() == "") {
	            alert("이름은 필수입력항목 입니다.");
	            $("#name").focus();
	            return false;
	        }
	        
	        if($("#email").val() == "") {
	            alert("이메일은 반드시 입력하셔야 합니다.");
	            $("#email").focus();
	            return false;
	        }
	     	  
	     	if($('input[name="register_Yn"]:checked').val() != "Y") {
	     		alert("회원가입 미동의시 회원가입이 어렵습니다.");
	     		$("#register_Y").focus();
	     		return false;
	     	}
	    	if($('input[name="is_subscribed"]:checked').val() != "o") {
	     		alert("개인정보 취급 미동의시 회원가입이 어렵습니다. ");
	     		$("#is_subscribed").focus();
	     		return false;
	    	}
	      
	    });
	});
		
	
		//기본 형태를 잘 지키자
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