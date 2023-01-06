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
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<button id="onePoint" type="button" data-name="${membersVO.realName }" data-email="${membersVO.email }" data-phone="${membersVO.phone}">10000포인트 결제하기</button>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>