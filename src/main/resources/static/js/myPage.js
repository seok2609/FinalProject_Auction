//myPage.js

console.log("myPage.js");

$("#inquiryListDiv").click(function(){

    console.log("div클릭");

    $("#inquiryForm").submit();
})


$("#upBtn").click(function(){

    console.log("a태그 클릭");

    $("#md").click();

});

$("#modifyBtn").click(function(){

    console.log("수정 a태그 클릭");

    location.href="./modify?id=${membersVO.id}"
});


let flag = true;
/// 글 수정시 첨부파일 삭제
$(".deleteMemberFile").click(function(){
    //DB, HDD에 파일 삭제
    let check = confirm("삭제가 되면 되돌리기가 불가능합니다.");
    if(flag){
        let size = $("#membersFileAddResult").attr("data-file-size");
        if(size==undefined){
            size = 0;
        }
        count = size;
        flag = false;
    }

    if(check){
        //post
        // /qna/fileDelete
        //파라미터 fileNum
        let fileNum = $(this).attr("data-file-id");
        console.log("Before Result This", $(this));
        const btn = $(this);
        $.ajax({
            type:"POST",
            url :"fileDelete",
            data:{
                fileNum:fileNum
            },
            success:function(result){
                console.log("Result : ",result)
                console.log("After Result This", $(this));
                $(btn).parent().remove();
                count --;
            },
            error:function(){
                console.log("Error 발생");
            }

        });

    }

});