console.log("agree.js");

$(".check").click(function(){

    console.log("일반동의 클릭");
    

    $(".check").each(function(index, item){


        let check = $(item).prop("checked");

        //만약 일반동의 prop값이 false면 전체동의도 해제(false)
        if(!check){
            $("#all").prop("checked", false);
            return false;
        }
        console.log(check);

        // 일반동의의 prop값 전체가 true라면 전체동의도 true
        $("#all").prop("checked", true);
    });

});

$("#all").click(function(){
    console.log("전체동의 버튼 클릭");

    // prop(상태가 변할때 값도 변하는 속성)
    let check = $(this).prop("checked");
    console.log("전체동의 : ", check);

    // "#all"을 눌렀을때 속성값이 "checked"인 것들을 모두 true(클릭)해라
    $(".check").prop("checked", check);
});

$("#agreeBtn").click(function(){

    console.log("다음 버튼 클릭");

    let flag = $("#all").prop("checked");

    console.log(flag);

    if(!flag){  //약관을 모두 동의하지 않았다면
        alert("필수약관을 모두 동의하셔야 합니다.");
    }else{
        location='./signUpHead';
    }

});
