/**
 * 게시글 관련 자바스크립트 함수 구현
 */


//게시글 등록에 대한 자바스크립트 함수 구현
function fn_boardRegister() {
    
    let subject = $("#subject").val();
    let writer = $("#writer").val();
    let content = $("content").val();

    if($("#subject").val() == "") {
        alert("제목은 필수 입력 항목입니다.");
        $("#subject").focus();
        return false;
    }
    if($("#writer").val() == "") {
        alert("작성자는 필수 입력 항목입니다.");
        $("#writer").focus();
        return false;
    }
    if($("#content").val() == "") {
        alert("내용은 필수 입력 항목입니다.");
        $("#content").focus();
        return false;
    }
//ajax로 비동기 통신
$.ajax({
    type : "POST",
    url : "/board/boardRegisterForm",
    data : {subject:subject, writer:writer, content:content},
    success : function(data) {
        if(data == "Y"){
            alert("게시글 등록이 완료되었습니다.");
            location.href = "/board/notice";
        }
    },
    error : function() {
        alert("게시글을 등록하는데 실패하였습니다.");
    } 
});
}
//게시글 번호에 해당하는 수정 화면 불러오기 - 공지 게시판
function fn_boardUpdateFrom(bno) {
    var f = $("#frm");
    
    f.attr("action", "/board/boardUpdatenoticeForm?flag=1");
    f.attr("method", "POST");
    
    f.append($('<input/>', {type : 'hidden', name : 'bno', value : bno}));
    f.appendTo('body');

    f.submit();
}
//게시글 번호에 해당하는 게시글 삭제하기 - 공지 게시판

function fn_boardDelete(bno) {
    
    if(!confirm("\n게시글을 삭제하시겠습니까?\n\n 삭제하려면 [확인]버튼을 누르시고, 아니면 [취소]버튼을 누르십시오.")) {
    //취소 버튼을 눌렀을때?
    alert("게시글 삭제를 취소하셨습니다.");
    }
    
}