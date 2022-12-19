console.log("header.js");

$("#kakao").click(function(){
    $.get("https://developers.kakao.com/logout", function(){
        location.reload();
    }
)});

$("#logout").click(function(){
    $("outForm").submit();
});