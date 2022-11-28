<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <c:import url="../temp/boot.jsp"></c:import>
	<script defer src="/js/membersFile.js"></script>
	<script defer src="/js/joinVerify.js"></script>
    <link rel="icon" href="./images/images2/favicon.png">
    <link href="/assets/css/naverForm.css" rel="stylesheet">
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
    
    <div class="member" id="signUpSt">
        <!-- 1. 로고 -->
        <!-- <img class="logo" src="./images/images2/logo-naver.png"> -->

        <!-- 2. 필드 -->
        <div class="field">
            <b>아이디</b>
            <input type="hidden" name="roleNum" value="${param.roleNum}">
            <input type="text" name="id" id="inputId" placeholder="아이디를 입력하세요.">
            <span id="idHelp" class="bc"></span>
        </div>
        <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password" name="passWord" id="inputPassWord" placeholder="비밀번호를 입력하세요.">
            <span id="pwHelp" class="bc"></span>
        </div>
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw-confirm" type="password" name="passWordCheck" id="inputPassWordCheck">
            <span id="pwCheckHelp" class="bc"></span>
        </div>
        <div class="field">
            <b>이름</b>
            <input type="text" name="realName" id="inputRealName" placeholder="실명을 입력해주세요.">
            <span id="realNameHelp" class="bc"></span>
        </div>
        
        <div class="field">
            <b>닉네임</b>
            <input type="text" name="nickName" id="inputNickName" placeholder="닉네임을 입력해주세요.">
            <span id="nickNameHelp" class="bc"></span>
        </div>

        <!-- 3. 필드(생년월일) -->
        <div class="field birth">
            <b>생년월일</b>
            <div>
                <input type="number" placeholder="년(4자)">                
                <select>
                    <option value="">월</option>
                    <option value="">1월</option>
                    <option value="">2월</option>
                    <option value="">3월</option>
                    <option value="">4월</option>
                    <option value="">5월</option>
                    <option value="">6월</option>
                    <option value="">7월</option>
                    <option value="">8월</option>
                    <option value="">9월</option>
                    <option value="">10월</option>
                    <option value="">11월</option>
                    <option value="">12월</option>
                </select>
                <input type="number" placeholder="일">
            </div>
            <span id="birthHelp" class="bc"></span>
        </div>


        <!-- 5. 이메일_전화번호 -->
        <div class="field">
            <b>본인 확인 이메일<small>(선택)</small></b>
            <input type="email" placeholder="이메일을 입력해주세요." id="inputEmail" name="email">
            <span id="emailHelp" class="bc"></span>
        </div>
        
        <div class="field tel-number">
            <b>휴대전화</b>
            <select>
                <option value="">대한민국 +82</option>
            </select>
            <div>
                <input type="tel" placeholder="전화번호 입력">
            </div>

            <span id="phoneHelp" class="bc"></span>
        </div>
        
        
        <div class="form-group mt-3">
				  <label for="formFileSm" class="form-label bc">프로필 사진 첨부</label>
				  <input class="form-control form-control-sm" id="memberFileAdd" name="files" type="file">
		</div>
		
		<!-- 6. 가입하기 버튼 -->
        <input type="submit" value="가입하기" id="signUpBtn">

		
    </div>
    
    
    
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>