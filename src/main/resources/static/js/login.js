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
    // let userName = $("#userName").val();

    console.log("확인버튼 누름");
    console.log("userEmail ::: ", userEmail);

    // $.ajax({
    //     type: "GET",
    //     url: "mailConfirm",
    //     data: {
    //         "userEmail": userEmail,
    //     },
    //     success: function (res) {
            // if (res['check']) {
            //     swal("발송 완료!", "입력하신 이메일로 임시비밀번호가 발송되었습니다.", "success").then((OK) => {
            //         if(OK) {
            //             $.ajax({
            //                 type: "POST",
            //                 url: "setUpdatePassWord",
            //                 data: {
            //                     "userEmail": userEmail,
            //                     // "userName": userName
            //                 }
            //             })
            //             window.location = "/login";
            //         }


            //     }
            // )
            //     $('#checkMsg').html('<p style="color:darkblue"></p>');
            // } else {
            //     $('#checkMsg').html('<p style="color:red">일치하는 정보가 없습니다.</p>');
            // }
    //     }
    // })

        $.ajax({
           type : "POST",
           url : "mailConfirm",
           data : {
              "userEmail": userEmail,
           },
           success : function(data){
            //   alert("해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.")
              Swal.fire({
	                     title: "인증 성공!",
	                     text: "해당 이메일로 인증번호 발송이 완료되었습니다. \n 확인부탁드립니다.",
	                     icon: "success",
	                     button: "확인",
	                   });         
              console.log("data : "+data);
            //   chkEmailConfirm(data, $memailconfirm, $memailconfirmTxt);
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