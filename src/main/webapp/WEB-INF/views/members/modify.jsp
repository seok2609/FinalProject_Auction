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
<script defer src="/js/membersFile.js"></script>
<script defer src="/js/myPage.js"></script>
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
              <sec:authentication property="Principal" var="member"/>
                <input type="hidden" name="id" value="${param.id}">
                <div class="form-group mt-3">
                  <input type="password" name="passWord" class="form-control" id="inputPassWord" placeholder="패스워드를 입력하세요">
                  <span id="pwHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="password" name="passWordCheck" class="form-control" id="inputPassWordCheck"  placeholder="위에 입력한 패스워드를 다시 한번 입력해주세요">
                  <span id="pwCheckHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="nickName" class="form-control" id="inputNickName" placeholder="닉네임을 입력하세요" value="${member.nickName}">
                  <span id="nickNameHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="email" name="email" class="form-control" id="inputEmail" placeholder="email을 입력하세요" value="${member.email}">
                  <span id="emailHelp" class="bc"></span>
                </div>
                
                <div class="form-group mt-3">
                  <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="전화번호 입력" oninput="autoHyphen(this)" maxlength="13" value="${member.phone}">
                  <span id="phoneHelp" class="bc"></span>
                </div>


				<div class="form-group mt-3">
				  <label for="formFileSm" class="form-label bc">프로필 사진 첨부 (선택)</label>
				  <input class="form-control form-control-sm" id="memberFileAdd" name="files" type="file">
				</div>

				<c:choose>
					<c:when test="${not empty membersVO.membersFileVO}">
				
						<p><img alt="" class="rounded-circle" src="/file/membersFile/${membersVO.membersFileVO.fileName}" width="35px" height="35px">
							<button type="button" class="deleteMemberFile" data-file-id="${membersVO.membersFileVO.fileNum}">삭제</button>
						</p>
				
			
			
				</c:when>
					<c:otherwise>
						<p>
							현재 첨부파일이 존재하지 않습니다.
						</p>
					</c:otherwise>
	           </c:choose>
              </div>
              <br>

              <div class="text-center">
              	<button type="submit" class="btn btn-primary">수정완료</button>
              </div>
         
			</form>
			
			<input type="hidden" value="${resultDrop}" id="rd">
			<!-- <button type="button" id="dropBtn">회원탈퇴</button> -->
			<button type="button" id="dropBtn">회원탈퇴</button>
			<div>
				<c:if test="${message == false}">
					비밀번호가 일치하지 않습니다.
				</c:if>
			</div>
			
			
			<!-- Button trigger modal -->
			<!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="md">
			  Launch demo modal
			</button>
			
			Modal
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 탈퇴</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			       	<label class="form-label">현재 비밀번호 입력</label>
                    <input type="password" id="inputPassWord" name="passWord" class="form-control" required>
			      </div>
			      <div class="modal-body">
			       	<label class="form-label">입력한 비밀번호 재 입력</label>
                    <input type="password" id="inputPassWordCheck" name="passWordCheck" class="form-control" required>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary">확인</button>
			      </div>
			    </div>
			  </div>
			</div> -->


		<!-- 회원탈퇴 모달 -->
			
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="md">
		  Launch demo modal
		</button>
		
		<!-- Modal -->
		<sec:authentication property="Principal" var="member"/>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원탈퇴 검증</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      <input type="hidden" name="passWord" id="checkPassWord2" value="${member.password}">
		        <div class="mb-3">
		           	<label class="form-label">현재 비밀번호 입력</label>
                    <input type="password" id=inputPassWord2 name="checkPassWord" class="form-control">
                    <span id="pwHelp2" class="bc"></span>
                </div>
                
           <!--      <div class="mb-3">
		           	<label class="form-label">입력한 비밀번호 재 입력</label>
                    <input type="password" id="inputPassWordCheck2" name="checkPassWord" class="form-control">
                     <span id="pwCheckHelp2" class="bc"></span>
                </div> -->
		      </div>
		      
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary" id="successBtn">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
	

	<c:import url="../common/footer.jsp"></c:import>

<script>
    $('#successBtn').click(function() {
        const checkPassWord = $('#inputPassWord2').val();
        console.log("checkPassWord", checkPassWord);
        if(checkPassWord == ""){
            alert("비밀번호를 입력하세요.");
        } else{
            $.ajax({
                type: 'GET',
                url: '/members/drop?checkPassWord='+checkPassWord
                
            }).done(function(resultPw){
                console.log(resultPw);
                if(resultPw == 1){
                    console.log("비밀번호 일치");
                    alert("회원탈퇴가 성공적으로 완료되었습니다. 이용해주셔서 감사합니다.");
                    window.location.href="../";
                } else{
                    console.log("비밀번호 틀림");
                    // 비밀번호가 일치하지 않으면
                    alert("비밀번호가 맞지 않습니다.");
                    window.location.reload();
                }
            }).fail(function(error){
                alert(JSON.stringify(error));
            })
        }
    });
</script>

</body>
</html>