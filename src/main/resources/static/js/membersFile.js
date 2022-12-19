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
