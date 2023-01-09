<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<c:import url="../temp/boot.jsp"></c:import>
<script defer="defer" type="text/javascript" src="/js/pay/payMethod.js"></script>
<style>
	#div1{
		cursor: pointer;
	}
	#md{
		display: none;
	}
	#imgMd{
		display: none;
	}
	#amd{
		cursor: pointer;
	}
button{
  background:#1AAB8A;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
button:hover{
  background:#fff;
  color:#1AAB8A;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<h2 style="color: #008374; margin-left: 43%; margin-top: 20px;">포인트 결제</h2>
<div style="margin-top: 40px; margin-bottom: 60px;">
<button style="margin-left: 30%;" id="onePoint" type="button" data-name="${membersVO.realName }" data-email="${membersVO.email }" data-phone="${membersVO.phone}">10,000포인트 결제하기(내돈)</button>
<button style="margin-left: 50px;" id="twoPoint" type="button" data-name="${membersVO.realName }" data-email="${membersVO.email }" data-phone="${membersVO.phone}">50,000000포인트 결제하기(가상돈)</button>
</div>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>