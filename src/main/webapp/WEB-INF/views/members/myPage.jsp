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
<style>
	#div1{
		cursor: pointer;
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
              <h3 style="color: #008374;">내 정보</h3><br>
              <div>
	              <sec:authentication property="Principal" var="member"/>
					<h5>아이디 : ${member.id}</h5> 
					<h5>이름 : ${member.realName}</h5>	
					<h5>닉네임 : ${member.nickName}</h5>	
			  </div>
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

          <div class="col-lg-4 col-md-6">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-easel"></i>
              </div>
              <h3 style="color: #008374;">나의 1:1문의 내역</h3>
              <p>Ut excepturi voluptatem nisi sed. Quidem fuga consequatur. Minus ea aut. Vel qui id voluptas adipisci eos earum corrupti.</p>
              <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-bounding-box-circles"></i>
              </div>
              <h3 style="color: #008374;">Asperiores Commodit</h3>
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
              <a href="#" class="readmore stretched-link">Read more <i class="bi bi-arrow-right"></i></a>
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
		
		
		
		<div>
			
			<div>
			
					<c:forEach items="${membersVO.membersFileVOs}" var="membersFileVO">
						${membersFileVO.fileName}
						<img alt="" src="/file/membersFile/${membersFileVO.fileName}">
						
					
					</c:forEach>
					
			</div>
			
		</div>
		
		<input type="text" value="${membersVO.membersFileVOs.size()}">
			<div class="mb-3" id="membersFileAddResult" data-file-size="${membersVO.membersFileVOs.size()}">
				<c:forEach items="${membersVO.membersFileVOs}" var="membersFileVO">
				
					<p>${membersFileVO.oriName}
						<button type="button" class="deleteMemberFile" data-file-id="${membersFileVO.fileNum}">취소</button>
					</p>
					
				</c:forEach>
		
			</div>
		</form> 
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>