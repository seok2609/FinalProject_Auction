console.log("login.js");

$("#pwConfirm").click(function(){

    console.log("비밀번호 찾기 클릭~");

    $("#pb").click();

});

$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
    $(this).find('form')[0].reset()
});

// let results = [false, false]

// function nullCheck(data, dest, kind){
//     if(data == null || data == ''){
//         $(dest)
//         return false;
//     }else{
//         return true;
//     }
// }

// function equals (data, checkDate) {
//     if(data == checkDate) {
//         return true;
//     } else {
//         return false;
//     }
// }

// $("#id").blur(function(){

//     let result = nullCheck(($("#id").val()));

//     const inputId = ($("#id").val());

//     results[0] = result;

//     if(result){

//         $.get("./idCheck?id="+id, function(data){

//             // 자바스크립트에서 ==는 들어오는 데이터값만 같으면 되고
//             // === 3개를 쓰면 들어오는 값, 타입도 같아야 성립됨
//             if(data == '0'){

//                 $("#idHelp").html("사용가능한 ID 입니다!!");
//                 results[0] = true;
//             }else{
//                 $("#idHelp").html("죄송합니다. 이미 사용중인 ID 입니다");
//                 $("#inputId").focus();
//                 results[0] = result;    //false
//             }
//         });

//     }else{
//         // ID가 중복도 안되고 입력도 하지 않으면.
//         $("#idHelp").html("ID는 필수입니다.");
//         $("#inputId").focus();
//     }

// });

// $("#passWord").blur(function(){

//     let result = nullCheck($("#inputPassWord").val());
//         results[1] = result;


//     if(result){
//         $("#pwHelp").html("정상");
//     }else{
//         $("#pwHelp").html("패스워드는 필수입니다.");
//         $("#inputPassWord").focus();
//     }

// });

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
