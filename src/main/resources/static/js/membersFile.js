console.log("membersFile");

let count = 0;

//파일을 첨부하고 취소 버튼을 누르면 삭제되는 <div>의 코드

$("#membersFileAddResult").on("click", ".del", function(){
    $(this).remove();  //자신을 눌렀을때 삭제
});


// $("#profileImg").click(function(e){

//     console.log("프로필 기본이미지 클릭");
//     e.preventDefault();
//     $("#proDiv").trigger('click');
//     //$("#proDiv").click();

// });

// $(function () {
 
//     $('#profileImg').click(function (e) {
     
//     e.preventDefault();
     
//     $('#proDiv').click();
     
//     });
     
//     });


function onClickUpload(e) {

    console.log("프로필 기본이미지 클릭");
    // e.preventDefault();
    $(".pro").trigger('click');

}

$("#memberFileAdd").change(function(){

    let pv = $("#profileImg").val();

    console.log("pv :: " , pv);
    console.log("이미지 들어갔는지 확인");

    if(pv != null){

        console.log("사진 들어감");

        $("#imgSpan").html("사진이 등록되었습니다.");
    }
});

$("#memberFileAdd").ready(function(){

    console.log("사진 준비");

    let pv = $("#memberFileAdd").val();

    // if(pv == null){

        console.log("아직 사진 없음");

        $("#imgSpan").html("아직 사진을 넣지 않았습니다.");
    // }

});
