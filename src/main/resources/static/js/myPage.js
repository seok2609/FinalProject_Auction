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

$("#updatePw").click(function(){

    console.log("내가 설정해놓은 h3태그 클릭 이벤트 콘솔");

    $("#exMd").trigger('click');

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


function nullCheck(data, dest, kind){
    if(data == null || data == ''){
        $(dest)
        return false;
    }else{
        return true;
    }
}

function equals (data, checkDate) {
    if(data == checkDate) {
        return true;
    } else {
        return false;
    }
}

let results = [false, false, false];

//발급받은 비밀번호 검증
$("#inputExPassWord").blur(function(){

    let result = nullCheck($("#inputExPassWord").val());

    const id = $("#hiddenId").val();
    const checkPassWord = $("#inputExPassWord").val();


    results[0] = result;

    if(result){
        $("#pwHelp1").html("");

        $.get("./setUpdatePassWord1?id="+id+"&checkPassWord="+checkPassWord, function(data){

            if(data){    //true가 넘어오면
                                    
                $("#pwHelp1").html("비밀번호가 일치합니다.");
            }else{

                $("#pwHelp1").html("일치하는 임시 비밀번호가 없습니다.");
            }

        });
        
    }else{
        $("#pwHelp1").html("발급받은 임시 비밀번호를 입력해주세요.");
        $("#inputExPassWord").focus();
    }

});

//passWord체크
$("#inputPassWord").on({
    blur:function(){
        let result = nullCheck($("#inputPassWord").val());
        results[1] = result;
        if(result){
            $("#pwHelp2").html("");
        }else{
            $("#pwHelp2").html("패스워드는 필수입니다.");
            $("#inputPassWord").focus();
        }
    },

    change:function(){
        let result = equals($("#inputPassWord").val(), $("#inputPassWordCheck").val());

        if(result){ //패스워드와 확인이 같다면,
            $("#pwHelp3").html("");
        }else{
            $("#pwHelp2").val("");   //비밀번호가 일치하지 않다면 비밀번호를 공백으로 바꾼다.
            $("#pwHelp3").html("비밀번호가 일치하지 않습니다.")
            $("inputPassWordCheck").focus();

            results[1] = result;
        }
    }
});

//패스워드 확인 검증
$("#inputPassWordCheck").blur(function(){

    let result = equals($("#inputPassWord").val(), $("#inputPassWordCheck").val());

    results[2] = result;

    if(result){
        $("#pwHelp3").html("패스워드가 일치합니다.");
        
    }else{
        $("#pwHelp3").html("패스워드가 불일치 합니다.");
    }

});



$("#updatePassWordBtn").click(function(){

    console.log("비밀번호 재설정 모달 완료버튼 클릭");

    if(results.includes(false)){
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '필수 입력 사항은 입력해주세요.',
		}
        )
    }else{

        $("#updatePassWordFrm").submit();
    }


});