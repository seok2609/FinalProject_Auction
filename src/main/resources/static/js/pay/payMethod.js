let merchant_uid = new Date();
let name = $("#onePoint").attr("data-name");
let email = $("#onePoint").attr("data-email");
let phone = $("#onePoint").attr("data-phone");

$("#onePoint").click(function(){
    requestPay(name,email,phone);
})

$("#twoPoint").click(function(){
    requestPay2(name,email,phone);
})

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
					window.location.href = 'http://localhost:80';
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
	   

function requestPay2(name,email,phone) {
  IMP.init('imp28415722');
  IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "vbank",
      merchant_uid: merchant_uid,
      name: "50000000 포인트",
      amount: 50000000,
      buyer_email: email,
      buyer_name: name,
      buyer_tel: phone
  }, function (rsp) {
	   if(rsp.success){
		$.ajax({
			url: "./payments",
			type: "POST",
			data: {
				'amount': 50000000				
			},
			success : function(paymentResult){
				console.log(paymentResult);
				if(paymentResult=="paid"){
					alert("결제에 성공하였습니다")
					window.location.href = 'http://localhost:80';
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