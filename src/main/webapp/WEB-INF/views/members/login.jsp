<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>

<style>
  #loginSt{
    margin-left: 250px;
  }
  #pwConfirm{
  	cursor: pointer;
  }
  #pb{
  	display: none;
  }
</style>
<script defer src="/js/login.js"></script>
		  
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
			  
			  <!-- 아래 있는 비밀번호 찾기 모달 띄우기 -->
				  <div style="float: right;" id="pwConfirm" data-bs-toggle="modal" data-bs-target="#myModal">
					  	pw찾기
				  </div>
				  
				</div>
				
				 <!--  <div id="pb">
				 	 <button  type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
					</button>	
				 </div> -->
				 
	<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding:35px 50px;">
                    <h4><span class="glyphicon glyphicon-lock"></span> 비밀번호 찾기</h4>
                </div>
                <div class="modal-body" style="padding:40px 50px;">
                    <div style="color: #ac2925">
                        <center>입력된 정보로 임시 비밀번호가 전송됩니다.</center>
                    </div>
                    <hr>
                    <form role="form">
                        <div class="form-group">
                            <label for="userEmail"><span class="glyphicon glyphicon-user"></span>email</label>
                            <input type="text" class="form-control" id="userEmail" placeholder="가입시 등록한 이메일을 입력하세요.">
                        </div>
                        <div class="form-group">
                            <label for="userName"><span class="glyphicon glyphicon-eye-open"></span> name</label>
                            <input type="text" class="form-control" id="userName" placeholder="가입시 등록한 이름을 입력하세요.">
                        </div>
                        <button type="button" class="btn btn-success btn-block" id="checkEmail">OK</button>
                    </form>
                    <hr>
                    <div class="text-center small mt-2" id="checkMsg" style="color: red"></div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span
                            class="glyphicon glyphicon-remove"></span> Cancel
                    </button>
                </div>
            </div>

        </div>
    </div>
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

	
	
</section>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>