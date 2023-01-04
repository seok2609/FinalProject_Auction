let merchant_uid = new Date();
let name = $("#onePoint").attr("data-name");
let email = $("#onePoint").attr("data-email");
let phone = $("#onePoint").attr("data-phone");

$("#onePoint").click(function(){
    requestPay(name,email,phone);
})

//$("#twoPoint").click(function(){
    //requestPay2();
//})

function requestPay(name,email,phone) {
  IMP.init('imp28415722');
  IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: merchant_uid,
      name: "10000 포인트",
      amount: 10000,
      buyer_email: email,
      buyer_name: name,
      buyer_tel: phone
  }, function (rsp) {
	   if(rsp.success){
		$.ajax({
			url: "./payments",
			type: "POST",
			data: {
				'amount': 10000				
			},
			success : function(paymentResult){
				console.log(paymentResult);
				if(paymentResult=="paid"){
					alert("결제에 성공하였습니다")
					window.location.href = 'http://localhost:5000';
				} else{
					alert("결제에 실패하였습니다. 결제 실패 사유: " + paymentResult);
					location.reload();
				}
				}})
			} else{
				alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
			
			
		})
	}
	   

function requestPay2() {
  IMP.init('imp28415722');
  IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "ORD20180131-0000011",
      name: "노르웨이 회전 의자",
      amount: 20000,
      buyer_email: "gildong@gmail.com",
      buyer_name: "홍길동",
      buyer_tel: "010-4242-4242",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
  }), function (rsp) {
	    console.log(rsp);
	    if (rsp.success) {
	      var msg = '결제가 완료되었습니다.';
	      alert(msg);
	      location.href = "/members/myPage";
	    } else {
	      var msg = '결제에 실패하였습니다.';
	      msg += '에러내용 : ' + rsp.error_msg;
	      alert(msg);
	    }
    }
}