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
// 게시글 번호에 해당하는 게시글 내용 수정하기 - 공지 게시판
// 차후에 이미지 이름,이미지 경로 넣어줄 예정
function fn_boardUpdate() {

    let bno = $("#bno").val();

    let subject = $("#subject").val();
    let content = $("#content").val();

    // 차후에 이미지 업로드 기능 구현시 사용하자
    //let imagePath = $("#imagePath").val();
    //let imageName = $("#imageName").val();

    $.ajax({
        type : "POST",
        url : "/board/boardUpdatenotice",
        data : {bno:bno, subject:subject, content:content},
        
        success : function(data){
            if(data == "Y") {
                alert("게시글 수정이 완료되었습니다.");
                fn_boardDetail(bno);
            } else {
                alert("게시글 수정이 실패하였습니다.");
            }
        },
        error : function(data) {
            alert("비동기 통신 실패");
            console.log(data);
        }
    });
}

//게시글 번호에 해당하는 게시글 삭제하기 - 공지 게시판

function fn_boardDelete(bno) {
    
    if(!confirm("\n게시글을 삭제하시겠습니까?\n\n 삭제하려면 [확인]버튼을 누르시고, 아니면 [취소]버튼을 누르십시오.")) {
    //취소 버튼을 눌렀을때?
    alert("게시글 삭제를 취소하셨습니다.");
    
    } else {

        $.ajax({
            type : "POST",
            url : "/board/boardDeletenotice",
            data : {bno:bno},
            success : function(data) {
                if(data == "Y") {
                    alert("게시글의 삭제가 완료되었습니다.");
                    location.href = "/board/notice";
                }
            },
            error : function(data) {
                // data == "N"
                alert("게시글 삭제에 오류가 발생하였습니다.");
            }
        });

    }
}
//
//게시글 수정 후 나타낼 게시글 상세 페이지 이동 - 공지 게시판

function fn_boardDetail(bno) {
    // readCount(조회수)가 증가되지 않게 flag값을 1로 준다.
    location.href = "/board/boardDetailnotice?bno" + bno +"&flag=1"
}