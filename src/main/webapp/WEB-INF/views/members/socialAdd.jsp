<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>

<script defer src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

		<div class="section-header">
	          <h2>소셜회원 회원가입 페이지</h2>
	    </div>
	    
	    
	    
		<!-- 소셜로그인을 누른 회원은 추가정보를 입력하고 우리사이트 회원으로 insert -->	    
	    <div class="text-center">
              	<button type="button" class="btn btn-primary" onclick="location='/oauth2/authorization/kakao'">완료</button>
        </div>

<c:import url="../common/footer.jsp"></c:import>
</body>
</html>