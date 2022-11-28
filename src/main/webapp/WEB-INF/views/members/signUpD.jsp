<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>
<script defer src="/js/membersFile.js"></script>
<script defer src="/js/joinVerify.js"></script>
<style>
  #signUpSt{
    margin-left: 250px;
  }
  .bc{
    color: #008374;
  }
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

	<section id="contact" class="contact">
	
	
		<div class="section-header">
          <h2>도매업자 회원가입 페이지</h2>
        </div>
	

          <div class="col-lg-8" id="signUpSt">
			<form action="signUp" method="post" enctype="multipart/form-data" id="signUpForm">
            
              <div class="row" >
              
                <div class="form-group mt-3">
                <input type="hidden" name="roleNum" value="${param.roleNum}">
                  <input type="text" name="id" class="form-control" id="inputId" placeholder="아이디를 입력하세요">
                  <span id="idHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="password" name="passWord" class="form-control" id="inputPassWord" placeholder="패스워드를 입력하세요">
                  <span id="pwHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="password" name="passWordCheck" class="form-control" id="inputPassWordCheck" placeholder="위에 입력한 패스워드를 다시 한번 입력해주세요">
                  <span id="pwCheckHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="realName" class="form-control" id="inputRealName" placeholder="실명을 입력해주세요">
                  <span id="realNameHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="nickName" class="form-control" id="inputNickName" placeholder="닉네임을 입력하세요">
                  <span id="nickNameHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="email" name="email" class="form-control" id="inputEmail" placeholder="email을 입력하세요">
                  <span id="emailHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="birth" class="form-control" id="inputBirth" placeholder="생년월일">
                  <span id="birthHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="전화번호 입력">
                  <span id="phoneHelp" class="bc"></span>
                </div>
                    

				<div class="form-group mt-3">
				  <label for="formFileSm" class="form-label bc">프로필 사진 첨부</label>
				  <input class="form-control form-control-sm" id="memberFileAdd" name="files" type="file">
				</div>
                
              </div>

              <div class="my-3">
<!--                 <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div> -->
              </div>
              <div class="text-center">
              	<button type="submit" class="btn btn-primary" id="signUpBtn">회원가입</button>
              </div>
         
			</form>
          </div><!-- End Contact Form -->

</section>


<c:import url="../common/footer.jsp"></c:import>

</body>
</html>