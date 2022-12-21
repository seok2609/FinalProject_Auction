console.log("modify.js");





        
$("#memberFileAdd").change(function(){

    let mv = $("#memberFileAdd").val();
    console.log("mv : " , mv);
    console.log("확인");
    if(mv != null){
        console.log("사진이 있따");
    
        $("#spa").html("사진이 등록되었습니다.");
    }else if(mv == null){
        console.log("현재 없음");
        $("#spa").html("현재 첨부파일이 존재하지 않습니다.")
    }
});

$("#memberFileAdd").blur(function(){

    let mv = $("#memberFileAdd").val();

    if(mv == null){
        console.log("현재 없음")
        $("#spa").html("현재 첨부파일이 존재하지 않습니다.")
    }

});

// $("#membrerFileAdd").ready(function(){

//     let mv = $("#memberFileAdd").val();

//     if(mv == null){
//         console.log("현재 없음")
//         $("#spa").html("현재 첨부파일이 존재하지 않습니다.")
//     }

// })



$("#amd").click(function(){

    console.log("엘렐레렐레레레레");
    $("#md").trigger('click');

});





//마이페이지에서 수정쪽을 누르면 비밀번호 일치해야 수정페이지가 나오게 해주는 ajax

// $('#successBtn').click(function() {
//     const checkPassWord = $('#inputPassWord2').val();
//     const id = $("#thisId").val();
//     console.log("checkPassWord :", checkPassWord);
//     console.log("id: ", id);
//     if(checkPassWord == ""){
//         alert("비밀번호를 입력하세요.");
//     } else{
//         $.ajax({
//             type: 'GET',
//             url: '/members/modify1?id='+id+'&checkPassWord='+checkPassWord
            
//         }).done(function(check){
//             console.log(check);
//             if(check){  //비밀번호 비교가 true라면
//                 console.log("비밀번호 일치");
//                 alert("비밀번호가 일치하여 회원수정 페이지로 이동합니다..");
//                 // swal({
//                 //     title: "비밀번호 일치!",
//                 //     text: "수정 페이지로 넘어갑니다.",
//                 //     icon: "success",
//                 //     button: "확인",
//                 //   });
//                 window.location.href="./modify";
//             } else{
//                 console.log("비밀번호 틀림");
//                 // 비밀번호가 일치하지 않으면
//                 alert("비밀번호가 맞지 않습니다.");
//                 /* window.location.href="/"; */
//             }
//         }).fail(function(error){
//             alert(JSON.stringify(error));
//         })
//     }
// });



