<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>
<script defer src="/js/myPage.js"></script>
<script defer src="/js/modify.js"></script>
<style>
	#div1{
		cursor: pointer;
	}
	#md{
		display: none;
	}
	#imgMd{
		display: none;
	}
</style>
<!-- <script defer src="/js/membersFile.js"></script> -->
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

	
 	<form action="myPage" method="get" enctype="multipart/form-data">
 	
		<%-- <input type="text" value="${membersVO.id}" name="id">
		<input type="text" value="${member.id}" name="id">
		<input type="text" value="${membersFileVO.oriName}" name="oriName"> --%>
		
		
		<section id="services" class="services sections-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2 style="color: #008374;">마이페이지</h2>
        </div>

        <div class="row gy-4" data-aos="fade-up" data-aos-delay="100">

          <div class="col-lg-4 col-md-6">
            <div class="service-item  position-relative" id="div1">
              <div class="icon">
                <i class="bi bi-activity"></i>
              </div>
             <div>
              <h3 style="color: #008374;">내 정보</h3>
              	<div>
			
			<!-- 프로필사진 첨부가 필수가 아니므로 사진이 없다면 이미지 오류 안나게 해주는 코드 -->
				<c:if test="${not empty membersVO.membersFileVO.fileName}">
					<div style="float:rignt;">
							
							<img alt="" class="rounded-circle" src="/file/membersFile/${membersVO.membersFileVO.fileName}" width="35px" height="35px">
					</div>
				</c:if>
				</div>
			</div>
		
         <%--      <div>
	              <sec:authentication property="Principal" var="member"/>
					<h5>아이디 : ${member.id}</h5> 
					<h5>이름 : ${member.realName}</h5>
					<c:choose>	
						<c:when test="${not empty membersVO}">				
							<h5>수정된 닉네임 : ${membersVO.nickName}</h5>
						</c:when>
						
						<c:otherwise>
							<h5>닉네임 : ${member.nickName}</h5>
						</c:otherwise>
					</c:choose>
			  </div> --%>
			  <sec:authentication property="Principal" var="member"/>
			  <h5>아이디 : ${member.id}</h5> 
			  <h5>이름 : ${member.realName}</h5>
			  <h5>닉네임 : ${member.nickName}</h5>
			  
             <!--  <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a> -->
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-broadcast"></i>
              </div>
              <h3 style="color: #008374;">내가 찜한 상품</h3>
              <p>Ut autem aut autem non a. Sint sint sit facilis nam iusto sint. Libero corrupti neque eum hic non ut nesciunt dolorem.</p>
              <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" id="inquiryListDiv">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-easel"></i>
              </div>
              <h3 style="color: #008374;">나의 1:1문의 내역</h3><br>
              <%-- <sec:authentication property="Principal" var="member"/>
              	<h3>${member.roleNum}</h3>
              	<h3>${AdminMembersVO.id}</h3> --%>
              <a href="./inquiryList" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-bounding-box-circles"></i>
              </div>
              <h3 style="color: #008374;">경매 현황</h3>
              <p>Non et temporibus minus omnis sed dolor esse consequatur. Cupiditate sed error ea fuga sit provident adipisci neque.</p>
              <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-calendar4-week"></i>
              </div>
              <h3 style="color: #008374;">회원정보 수정</h3>
              <p>Cumque et suscipit saepe. Est maiores autem enim facilis ut aut ipsam corporis aut. Sed animi at autem alias eius labore.</p>
              <%-- <a href="./modify?id=${member.id}" id="amd" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a> --%>
				<button type="button" id="amd">클릭</button>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-chat-square-text"></i>
              </div>
              <h3 style="color: #008374;">Dolori Architecto</h3>
              <p>Hic molestias ea quibusdam eos. Fugiat enim doloremque aut neque non et debitis iure. Corrupti recusandae ducimus enim.</p>
              <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
            </div>
          </div><!-- End Service Item -->

        </div>

      </div>
    </section><!-- End Our Services Section -->
		
		
		
<%-- 		<div>
			
			<div>
			
					<c:forEach items="${membersVO.membersFileVOs}" var="membersFileVO">
						
						<img alt="" src="/file/membersFile/${membersFileVO.fileName}" width="32px" height="32px">
						
					
					</c:forEach>
					
			</div>
			
		</div> --%>
		
	<%-- 	<input type="text" value="${membersVO.membersFileVOs.size()}">
			<div class="mb-3" id="membersFileAddResult" data-file-size="${membersVO.membersFileVOs.size()}">
				<c:forEach items="${membersVO.membersFileVOs}" var="membersFileVO">
				
					<p>${membersFileVO.oriName}
						<button type="button" class="deleteMemberFile" data-file-id="${membersFileVO.fileNum}">취소</button>
					</p>
					
				</c:forEach>
		
			</div> --%>
		</form>
		
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
		        <h1 class="modal-title fs-5" id="exampleModalLabel">회원수정 검증</h1>
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

<!-- 마이페이지에서 수정쪽을 누르면 비밀번호 일치해야 수정페이지가 나오게 해주는 ajax -->
<script>
    $('#successBtn').click(function() {
        const checkPassWord = $('#inputPassWord2').val();
        console.log("checkPassWord", checkPassWord);
        if(checkPassWord == ""){
            alert("비밀번호를 입력하세요.");
        } else{
            $.ajax({
                type: 'GET',
                url: '/members/modify?id='+id+'&checkPassWord='+checkPassWord
                
            }).done(function(resultPw){
                console.log(resultPw);
                if(resultPw == 1){
                    console.log("비밀번호 일치");
                    alert("회원수정 페이지로 이동합니다..");
                    window.location.href="./members/modify";
                } else{
                    console.log("비밀번호 틀림");
                    // 비밀번호가 일치하지 않으면
                    alert("비밀번호가 맞지 않습니다.");
                    window.location.href="/";
                }
            }).fail(function(error){
                alert(JSON.stringify(error));
            })
        }
    });
</script>


</body>
</html>