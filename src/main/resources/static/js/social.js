console.log("social.js");

function nullCheck(data, dest, kind){
    if(data == null || data == ''){
        $(dest)
        return false;
    }else{
        return true;
    }
}


let results = [false, false, false]


//실명 검증
$("#inputRealName").blur(function(){

    let result = nullCheck($("#inputRealName").val());

    results[0] = result;

    if(result){
        $("#realNameHelp").html("정상입니다.");
    }else{
        $("#realNameHelp").html("실명 입력은 필수입니다.");
    }

});

//  생년월일 - 하이픈 자동 생성
function birth_keyup(obj){
    let birth_len = obj.value.length;
    if (event.keyCode==8){
        obj.value = obj.value.slice(0,birth_len)
        return 0;
    }else if(birth_len==4 || birth_len==7){
        obj.value += '-';
    }
}

let birth_pattern = /^(19[0-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/


$("#inputBirth").blur(function(){

    let result = nullCheck($("#inputBirth").val());
     results[1] = result;
    
    if(!birth_pattern.test($("#inputBirth").val())){
        $("#birthHelp").html("생년월일 날짜 형태를 확인해주세요. 유효하지 않은 일자 입니다.");
        $("#inputBirth").focus();
    }else if($("#inputBirth").val() == ''){
        $("#birthHelp").html("생년월일을 입력해주세요.");
        $("#inputBirth").focus();
    }else{
        $("#birthHelp").html('정상입니다.');
    }

});

const autoHyphen = (target) => {
    target.value = target.value
      .replace(/[^0-9]/g, '')
     .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
   }




   function phoneFormat(phoneNumber){

    
    //특수문자 제거
    const value = phoneNumber.replace(/[^0-9]/g, '');

    // 00 또는 000 지정

    const firstLength = value.length > 9 ? 3 : 2;


  
    
        
        // ({2,3}) - ({3,4}) - ({4})
        return [
            //첫번째 구간 (00 or 000)
            value.slice(0, firstLength),
            //두번째 구간 (000 or 0000)
            value.slice(firstLength, value.length - 4),
            //남은 마지막 모든 숫자
            value.slice(value.length),
        ].join('-');
}

phoneFormat('01012345678');

//전화번호 중복검사
$("#inputPhone").blur(function(){
    let result = nullCheck($("#inputPhone").val());

    const phone = ($("#inputPhone").val());

    console.log("result ;; ", result);

    results[2] = result;
    
    $.get("./phoneCheck?phone="+phone, function(data){

        if(data == '0'){
            $("#phoneHelp").html("사용 가능한 전화번호 입니다! ");
            results[2] = true;
        }else{

            $("#phoneHelp").html("죄송합니다, 이미 사용중인 전화번호가 있습니다")
            $("#phoneHelp").focus();
            results[2] = result;        // => false
        }

    });

    if($("#inputPhone").val() == ''){
        $("#phoneHelp").focus();
        $("#phoneHelp").html("휴대전화 번호를 입력해주세요.");
    }else{
        $("#phoneHelp").html("정상입니다");
    }
});



$("#successBtn").click(function(){

    if(results.includes(false)){    //배열에 해당 (data)가 존재하는지 여부 판단
        alert("필수 입력 사항은 입력해주세요.")
    }else{
        //필수입력사항을 다 입력했다면 회원가입 폼으로 전송
        $("#socialForm").submit();
    }

});

