console.log("login.js");

$("#pwConfirm").click(function(){

    console.log("비밀번호 찾기 클릭~");

    $("#pb").click();

});

$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
    $(this).find('form')[0].reset()
});

$("#checkEmail").click(function () {
    let userEmail = $("#userEmail").val();
    let userName = $("#userName").val();

    $.ajax({
        type: "GET",
        url: "/check/findPw",
        data: {
            "userEmail": userEmail,
            "userName": userName
        },
        success: function (res) {
            if (res['check']) {
                swal("발송 완료!", "입력하신 이메일로 임시비밀번호가 발송되었습니다.", "success").then((OK) => {
                    if(OK) {
                        $.ajax({
                            type: "POST",
                            url: "/check/findPw/sendEmail",
                            data: {
                                "userEmail": userEmail,
                                "userName": userName
                            }
                        })
                        window.location = "/login";
                    }


                }
            )
                $('#checkMsg').html('<p style="color:darkblue"></p>');
            } else {
                $('#checkMsg').html('<p style="color:red">일치하는 정보가 없습니다.</p>');
            }
        }
    })
})

function blackMem(){
    let id = $("#id").val();
    console.log("아이디:",id);
    $.ajax({
        type : "POST",
        url : "/members/black",
        data : {
            "id" : id
        },
        success : function(result){
            if(result == 2){
                alert("블랙회원은 로그인이 불가합니다.");
            }else{
              $("#frm").submit();  
            }
        }

    })
        
}