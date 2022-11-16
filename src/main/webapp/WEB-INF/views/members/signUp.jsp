<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

	<section id="contact" class="contact">
	
	
		<div class="section-header">
          <h2>회원가입 페이지</h2>
        </div>
	


          <div class="col-lg-8">
            <form action="signUp" method="post" >
              <div class="row">
              
                <div class="form-group mt-3">
                  <input type="text" name="id" class="form-control" id="id" placeholder="아이디를 입력하세요" required="">
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="passWord" class="form-control" id="passWord" placeholder="pw" required="">
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="userName" class="form-control" id="userName" placeholder="닉네임을 입력하세요" required="">
                </div>
                
                <div class="form-group mt-3">
                  <input type="email" name="email" class="form-control" id="email" placeholder="email을 입력하세요" required="">
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="birth" class="form-control" id="birth" placeholder="생년월일" required="">
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="phone" class="form-control" id="phone" placeholder="전화번호 입력" required="">
                </div>
                
              </div>

              <div class="my-3">
<!--                 <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div> -->
              </div>
              <div class="text-center">
              	<button type="submit" class="btn btn-primary">회원가입</button>
              </div>
            </form>
          </div><!-- End Contact Form -->
	

</section>


<c:import url="../common/footer.jsp"></c:import>

</body>
</html>