//role.js

//제조업자 클릭했을때 roleNum이 파라미터로 넘어가서 get메서드로 submit
$("#rdc").click(function(){

    $("#rd1").checked = true;
    
    $("#getC").submit();
});

//도매업자 클릭했을때 roleNum이 파라미터로 넘어가서 get메서드로 submit
$("#rdd").click(function(){

    $("#rd2").checked = true;
    
    $("#getD").submit();
});

//경매사 클릭했을때 roleNum이 파라미터로 넘어가서 get메서드로 submit
$("#rdg").click(function(){

    $("#rd3").checked = true;
    
    $("#getG").submit();
});

//소매업자 클릭했을때 roleNum이 파라미터로 넘어가서 get메서드로 submit
$("#rds").click(function(){

    $("#rd4").checked = true;
    
    $("#getS").submit();
});

//일반회원 클릭했을때 roleNum이 파라미터로 넘어가서 get메서드로 submit
$("#rdm").click(function(){

    $("#rd5").checked = true;
    
    $("#getM").submit();
});
