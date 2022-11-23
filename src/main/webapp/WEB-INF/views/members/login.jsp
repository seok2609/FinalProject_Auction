<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		 rel="stylesheet"
		  integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" 
		  crossorigin="anonymous">
<style>
  #loginSt{
    margin-left: 250px;
  }
</style>
		  
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<!-- <section class="container-fluid col-lg-10 mt-5"> -->
		
		
		<section id="contact" class="contact">
		<div class="section-header">
          <h2>로그인 페이지</h2>
        </div>
	


          <div class="col-lg-8" id="loginSt">
            <form action="login" method="post">
              <div class="row" >
              
                <div class="form-group mt-3">
                  <input type="text" name="id" value="${cookie.Id.value}" class="form-control" id="id" placeholder="아이디를 입력하세요">
                </div>
                
                <div class="form-group mt-3">
                  <input type="passWord" name="passWord" class="form-control" id="passWord" placeholder="pw입력">
                </div>
                
              </div>


				<div class="form-group mb-3">
				    	ID저장하기
				    <input type="checkbox" name="rememberId" class="form-check-input" id="exampleCheck2">
				 </div>
				 
			<div class="mb-3">
			    <label for="password" class="form-label">자동로그인</label>
			    <input type="checkbox" name="rememberMe" class="form-check-input" id="exampleCheck2">
			  </div>
			  
              <div class="my-3">
<!--                 <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div> -->
              </div>
              <div class="text-center">
              	<button type="submit">로그인</button>
              </div>
            </form>
          </div><!-- End Contact Form -->

   

 
   
		
	
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		 integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" 
		 crossorigin="anonymous"></script>
	
	
</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>