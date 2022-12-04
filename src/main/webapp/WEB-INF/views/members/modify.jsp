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
<script defer src="/js/joinVerify.js"></script>
<style>
	#div1{
		cursor: pointer;
	}
	#md{
		display: none;
	}
	.bc{
    color: #008374;
  	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
	
	<div class="section-header">
          <h2>회원정보 수정페이지</h2>
    </div>
	
	<form action="modify" method="post" enctype="multipart/form-data" >
            
              <div class="row" >
                <input type="hidden" name="id" value="${param.id}">
                <div class="form-group mt-3">
                  <input type="password" name="passWord" class="form-control" id="inputPassWord" placeholder="패스워드를 입력하세요">
                  <span id="pwHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="password" name="passWordCheck" class="form-control" id="inputPassWordCheck" placeholder="위에 입력한 패스워드를 다시 한번 입력해주세요">
                  <span id="pwCheckHelp" class="bc"></span>
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
                  <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="전화번호 입력" oninput="autoHyphen(this)" maxlength="13">
                  <span id="phoneHelp" class="bc"></span>
                </div>
                    
<!-- 				<div class="form-group mt-3">
				  <label for="formFileSm" class="form-label bc">프로필 사진 첨부 (선택)</label>
				  <input class="form-control form-control-sm" id="memberFileAdd" name="files" type="file">
				</div> -->
                
              </div>
              <br>

              <div class="text-center">
              	<button type="submit" class="btn btn-primary">수정완료</button>
              </div>
         
			</form>
			
			<input type="hidden" value="${resultDrop}" id="rd">
			<button type="button" onclick="location='./drop'" id="dropBtn">회원탈퇴</button>
	
	

	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>