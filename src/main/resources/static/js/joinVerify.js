console.log("joinVerify.js");

function nullCheck(data, dest, kind){
    if(data == null || data == ''){
        $(dest)
        return false;
    }else{
        return true;
    }
}

function equals (data, checkDate) {
    if(data == checkDate) {
        return true;
    } else {
        return false;
    }
}

// function focus (data){
//     if(data == null || data == ''){

//     }
// }

// id, passWord, passWordCheck, realName, nickName, email, birth, phone
let results = [false, false, false, false, false, false, false, false]

//id 공백 체크
$("#inputId").blur(function(){
    let result = nullCheck(($("#inputId").val()));

    const id = ($("#inputId").val());

    console.log("result : " , result);

    results[0] = result;

    if(result){

        $.get("./idCheck?id="+id, function(data){

            // 자바스크립트에서 ==는 들어오는 데이터값만 같으면 되고
            // === 3개를 쓰면 들어오는 값, 타입도 같아야 성립됨
            if(data == '0'){

                $("#idHelp").html("사용가능한 ID 입니다!!");
                results[0] = true;
            }else{
                $("#idHelp").html("죄송합니다. 이미 사용중인 ID 입니다")
                results[0] = result;    //false
            }
        });
    }else{
        // ID가 중복도 안되고 입력도 하지 않으면.
        $("#idHelp").html("ID는 필수입니다.");
    }
});

//passWord체크

$("#inputPassWord").on({
    blur:function(){
        let result = nullCheck($("#inputPassWord").val());
        results[1] = result;
        if(result){
            $("#pwHelp").html("정상");
        }else{
            $("#pwHelp").html("패스워드는 필수입니다.");
            $("#inputPassWord").focus();
        }
    },

    change:function(){
        let result = equals($("#inputPassWord").val(), $("#inputPassWordCheck").val());

        if(result){ //패스워드와 확인이 같다면,
            $("#pwCheckHelp").html("");
        }else{
            $("#pwCheckHelp").html("비밀번호가 일치하지 않습니다.")
            $("#pwHelp").val("");   //비밀번호가 일치하지 않다면 비밀번호를 공백으로 바꾼다.

            results[1] = result;
        }
    }
});

//패스워드 확인 검증
$("#inputPassWordCheck").blur(function(){

    let result = equals($("#inputPassWord").val(), $("#inputPassWordCheck").val());

    results[2] = result;

    if(result){
        $("#pwCheckHelp").html("패스워드가 일치합니다.");
        
    }else{
        $("#pwCheckHelp").html("패스워드가 불일치 합니다.");
    }

});

//실명 검증
$("#inputRealName").blur(function(){

    let result = nullCheck($("#inputRealName").val());

    results[3] = result;

    if(result){
        $("#realNameHelp").html("정상입니다.");
    }else{
        $("#realNameHelp").html("실명 입력은 필수입니다.");
    }

});

//닉네임 검증
$("#inputNickName").blur(function(){

    let result = nullCheck($("#inputNickName").val());

    results[4] = result;

    if(result){
        $("#nickNameHelp").html("정상입니다.");
    }else{
        $("#nickNameHelp").html("닉네임 입력은 필수입니다.");
    }

});

//이메일 검증
$("#inputEmail").blur(function(){

    let result = nullCheck($("#inputEmail").val());

    results[5] = result;

    if(result){
        $("#emailHelp").html("정상입니다.")
    }else{
        $("#emailHelp").html("이메일 입력은 필수입니다.");
    }


});

//생년월일 검증
$("#inputBirth").blur(function(){

    let result = nullCheck($("#inputBirth").val());

    results[6] = result;

    if(result){
        $("#birthHelp").html("정상입니다.")

    }else{
        $("#birthHelp").html("생년월일 입력은 필수입니다.")
    }

});


//전화번호 검증
$("#inputPhone").blur(function(){

    let result = nullCheck($("#inputPhone").val());

    results[7] = result;

    if(result){
        $("#phoneHelp").html("정상입니다.")
    }else{
        $("#phoneHelp").html("전화번호 입력은 필수입니다.");
    }

});

$("#signUpBtn").click(function(){

    if(results.includes(false)){    //배열에 해당 (data)가 존재하는지 여부 판단
        alert("필수 입력 사항은 입력해주세요.")
    }else{
        //필수입력사항을 다 입력했다면 회원가입 폼으로 전송
        $("#signUpForm").submit();
    }

});

