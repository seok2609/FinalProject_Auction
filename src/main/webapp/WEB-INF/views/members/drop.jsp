<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>
	<script defer src="/js/joinVerify.js"></script>

<style>
	.bc{
    color: #008374;
  }
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<section id="services" class="services sections-bg">


		<div class="section-header">
          <h2 style="color: #008374;">회원탈퇴 페이지</h2>
        </div>
        

		<div class="form-group mt-3">
            <input type="password" name="passWord" class="form-control" id="inputPassWord" placeholder="패스워드를 입력하세요">
            <span id="pwHelp" class="bc"></span>
        </div>
                
        <div class="form-group mt-3">
             <input type="password" name="passWordCheck" class="form-control" id="inputPassWordCheck" placeholder="위에 입력한 패스워드를 다시 한번 입력해주세요">
             <span id="pwCheckHelp" class="bc"></span>
        </div>


			<div>
				<c:if test="${message == false}">
					비밀번호가 일치하지 않습니다.
				</c:if>
			</div>

		<input type="submit" value="탈퇴하기">
		
		




</section>





<c:import url="../common/footer.jsp"></c:import>
</body>
</html>