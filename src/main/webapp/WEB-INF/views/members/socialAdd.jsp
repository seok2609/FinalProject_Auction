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
<script defer src="/js/social.js"></script>
<script defer src="/js/membersFile.js"></script>
<c:import url="../common/header.jsp"></c:import>

		<div class="section-header">
	          <h2>소셜회원 회원가입 페이지</h2>
	    </div>
	    
	    <div class="col-lg-8" id="signUpSt">
			<form action="socialAdd" method="post" enctype="multipart/form-data" id="socialForm">
			
			<input type="hidden" name="id" value="${social.id}">
			
			<sec:authentication property="Principal" var="member"/>
            
            <div class="d-flex flex-row" style="margin-left: 200px;">
              <div class="row" >
              
                
                <div class="form-group mt-3">
                  <input type="text" name="realName" class="form-control" id="inputRealName" placeholder="실명을 입력해주세요">
                  <span id="realNameHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="nickName" class="form-control" id="inputNickName" readonly="readonly" value="${social.nickName}">
                  <span id="nickNameHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="email" name="email" class="form-control" id="inputEmail" readonly="readonly" value="${social.email}">
                  <span id="emailHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="birth" class="form-control" id="inputBirth" onkeyup="birth_keyup(this)" placeholder="생년월일을 입력해주세요.(숫자만 입력해주세요)" maxlength="10" >
                  <span id="birthHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="전화번호 입력(숫자만 입력해주세요)" oninput="autoHyphen(this)" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="13">
                  <span id="phoneHelp" class="bc"></span>
                </div>
                   
              </div>

               <div style="margin-left: 50px; margin-top: 15px;">
              
                <div id="profileImg">
                  <img alt="" src="/assets/img/profle.png" width="100px" height="100px" onclick="onClickUpload();">
                  <button type="button" class="btn btn-secondary" id="imgBtn" onclick="onClickUpload();">첨부파일</button>
        			<p id="imgSpan"></p>
        		</div>
        		
                <div class="form-group mt-3" id="proDiv">
                  <label for="formFileSm" class="form-label bc">프로필 사진 첨부 (선택)</label>
                  <input class="form-control form-control-sm pro" id="memberFileAdd" name="files" type="file">
                </div>
              </div>
              
              </div>
              
             </form>

		</div>	    
	    
	    
	    
	    
		<!-- 소셜로그인을 누른 회원은 추가정보를 입력하고 우리사이트 회원으로 insert -->	    
	    <div class="text-center">
              	<button type="button" class="btn btn-primary" id="successBtn">완료</button>
        </div>

<c:import url="../common/footer.jsp"></c:import>
</body>
</html>