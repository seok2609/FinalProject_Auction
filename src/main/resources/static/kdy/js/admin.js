let frm = document.getElementById("frm");
function nullCheck(data){
    if(data == null || data == ''){
        return false;
    }else{
        return true;
    }
}

//  memberDetail.jsp
$("#bl").click(function(){
   alert("블랙처리되었습니다. 리스트로 돌아갑니다.")
})
$("#blc").click(function(){
    alert("블랙을 성공적으로 해제하였습니다. 리스트로 돌아갑니다.")
 })

//  inquiryRequest.jsp
function inquryNullCheck(){
    let result = nullCheck($("#inquiry_contents").val());
    if(result){
        alert("문의글이 성공적으로 등록되었습니다.")
        frm.submit();
    }else{
        alert("문의 내용을 작성하세요.");
    }
}
// inquiryResponse.jsp
function inquiryResponseNullCheck(){
    let result = nullCheck($("#inquiry_response_contents").val());
    if(result){
        alert("답변이 전송되었습니다.")
        frm.submit();
    }else{
        alert("답변을 작성해주세요");
    }
}

//  reportRequest.jsp
function reportNullCheck(){
    let result = nullCheck($("#report_contents").val());
    if(result){
        alert("신고글이 등록되었습니다.")
        frm.submit();
    }else{
        alert("신고 사유를 작성하세요.");
    }
}
// reportDetail.jsp
$("#inquiryAddBtn1").click(function(){
    alert("신고요청을 거절합니다. 리스트로 돌아갑니다.")
})
$("#inquiryAddBtn2").click(function(){
    alert("신고요청을 승인합니다. 리스트로 돌아갑니다.")
})

//blackDetail.jsp
$("#inquiryAddBottonST").click(function(){
    alert("블랙을 해제하였습니다. 리스트로 돌아갑니다.")
})

//cNotice.jsp
function cNoticeNullCheck(){
    let notice = nullCheck($("#notice_title").val());
    let notice2 = nullCheck($("#notice_contents").val());
    if(notice&&notice2){
        alert("공지사항을 정상적으로 등록하였습니다.")
        frm.submit();
    }else{
        alert("제목, 내용은 필수입니다.")
    }
}
$("#noticeB").click(function(){
    alert("메인 관리자페이지로 돌아갑니다.")
    $("#noticeB").submit();
})

//noticeDetail.jsp
$("#nD").click(function(){
    alert("공지사항이 성공적으로 삭제되었습니다.")
})

//noticeUpdate.jsp
function noticeUpdate(){
    let notice = nullCheck($("#notice_titleU").val());
    let notice2 = nullCheck($("#notice_contentsU").val());
    if(notice&&notice2){
        alert("공지사항을 정상적으로 수정하였습니다.")
        frm.submit();
    }else{
        alert("제목, 내용은 필수입니다.")
    }
}
$("#noticeUpdateC").click(function(){
    alert("수정을 취소합니다.")
})



