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