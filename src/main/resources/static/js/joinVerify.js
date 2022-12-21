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
let results = [false, false, false, false, false, false, false]

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
                $("#idHelp").html("죄송합니다. 이미 사용중인 ID 입니다");
                $("#inputId").focus();
                results[0] = result;    //false
            }
        });
    }else{
        // ID가 중복도 안되고 입력도 하지 않으면.
        $("#idHelp").html("ID는 필수입니다.");
        $("#inputId").focus();
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
            $("inputPassWordCheck").focus();

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
// $("#inputEmail").blur(function(){

//     let result = nullCheck($("#inputEmail").val());

//     results[5] = result;

//     if(result){
//         $("#emailHelp").html("정상입니다.")
//     }else{
//         $("#emailHelp").html("이메일 입력은 필수입니다.");
//     }
// });

//이메일 정규식 검증
function isEmail(asValue) {
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;



	return regExp.test(asValue);

}

$("#inputEmail").blur(function(){

    let result = nullCheck($("#inputEmail").val());
    results[5] = result;

    if($("#inputEmail").val()== ''){
        $("#inputEmail").focus();
        $("#emailHelp").html("이메일을 확인해주세요.");
    }else if(!isEmail($("#inputEmail").val())){
        $("#inputEmail").focus();
        $("#emailHelp").html("이메일 형식을 확인해주세요");
    }else{
        $("#emailHelp").html("정상입니다.");
    }

});


//생년월일 검증
// $("#inputBirth").blur(function(){

//     let result = nullCheck($("#inputBirth").val());

//     results[6] = result;

//     if(result){
//         $("#birthHelp").html("정상입니다.")

//     }else{
//         $("#birthHelp").html("생년월일 입력은 필수입니다.")
//     }

// });

// function isBirthday(dateStr) {

// 	var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
// 	var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
// 	var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
// 	var today = new Date(); // 날짜 변수 선언
// 	var yearNow = today.getFullYear(); // 올해 연도 가져옴

//     console.log("연도 : ", year);
//     console.log("월 : ", month);
//     console.log("일 : ", day);

// 	if (dateStr.length <=8) {
// 	// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
// 		if (1900 > year || year > yearNow){
// 			return false;
// 		} else if (month < 1 || month > 12) {
// 			return false;
// 		} else if (day < 1 || day > 31) {
// 			return false;
// 		} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
// 			return false;
// 		} else if (month == 2) {

// 			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
// 			if (day>29 || (day==29 && !isleap)) {
// 				return false;
// 			} else {
// 				return true;
// 			} //end of if (day>29 || (day==29 && !isleap))
// 		} else {
// 			return true;
// 		}//end of if
// 	}
// 	else {
// 		//1.입력된 생년월일이 8자 초과할때 :  auth:false
// 		return false;
// 	}
// }

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
     results[6] = result;
    
    if(!birth_pattern.test($("#inputBirth").val())){
        $("#birthHelp").html("생년월일 날짜 형태를 확인해주세요. 유효하지 않은 일자 입니다.");
        $("#inputBirth").focus();
    }else if($("#inputBirth").val() == ''){
        $("#birthHelp").html("생년월일을 입력해주세요.");
        $("#inputBirth").focus();
    }else{
        $("#birthHelp").html('정상입니다.');
    }

    // let result1 = isBirthday(function(){

    //     console.log(result1);

    //     if(result1){
    //         console.log("true");
    //         $("#birthHelp").html("");
    //     }else{
    //         console.log("false");
    //         $("#birthHelp").html("연/월/일을 확인해주세요.");
    //         $("#inputBirth").focus();
    //     }

    // });

})


//전화번호 검증
// $("#inputPhone").blur(function(){

//     let result = nullCheck($("#inputPhone").val());

//     results[7] = result;

//     if(result){
//         $("#phoneHelp").html("정상입니다.")
//     }else{
//         $("#phoneHelp").html("전화번호 입력은 필수입니다.");
//     }

// });



const autoHyphen = (target) => {
    target.value = target.value
      .replace(/[^0-9]/g, '')
     .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
   }



// // 000-0000-0000
// String.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g, "");
 
// // 00-000-0000
// String.replace(/^(\d{0,2})(\d{0,3})(\d{0,4})$/g, "$1-$2-$3").replace(/\-{1,2}$/g, "");


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

$("#inputPhone").blur(function(){
let result = nullCheck($("#inputPhone").val());

results[7] = result;

    if($("#inputPhone").val() == ''){
        $("#phoneHelp").focus();
        $("#phoneHelp").html("휴대전화 번호를 입력해주세요.");
    }else{
        $("#phoneHelp").html("");
    }

    // if($("#inputPhone").val() != '1', '0', '2', '3', '4', '5', '6', '7', '8', '9', '-' ){
    //     $("#phoneHelp").html("숫자를 입력해주세요");
    // }else{
    //     $("#phoneHelp").html("");
    // }
});

$("#signUpBtn").click(function(){

    if(results.includes(false)){    //배열에 해당 (data)가 존재하는지 여부 판단
        alert("필수 입력 사항은 입력해주세요.")
    }else{
        //필수입력사항을 다 입력했다면 회원가입 폼으로 전송
        $("#signUpForm").submit();
    }

});







//회원탈퇴 성공 메세지
// $("#hiBtn").click(function(){

//     console.log("버튼클릭");

//     $("#md").trigger('click');

// });


$("#dropBtn").click(function(){

    console.log("버튼클릭");
    console.log($("#inputPassWord").val());

    $("#md").trigger('click');


});


//수정 폼에서 수정완료를 누를때 닉네임을 수정하지 않거나 

// $("#updateBtn").click(function(){

//     console.log("수정폼에서 수정완료 버튼 클릭");

//     $("#modifyFrm").submit();

// })