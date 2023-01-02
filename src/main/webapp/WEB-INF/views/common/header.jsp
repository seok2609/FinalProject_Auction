<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
	<!-- Favicons -->
  <link href="/assets/img/favicon.png" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap');
    </style>


  <!-- Vendor CSS Files -->
  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/assets/css/main.css" rel="stylesheet">

  <!-- social login JavaScript -->
  <script defer src="/js/header.js"></script>
  <!-- =======================================================
  * Template Name: Impact - v1.1.1
  * Template URL: https://bootstrapmade.com/impact-bootstrap-business-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  
  <!-- ======= Header ======= -->
  
  <section id="topbar" class="topbar d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
       
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
      <!-- 로그인이 되었다면 -->
      	<sec:authorize access="isAuthenticated()">
      		<sec:authentication property="Principal" var="member"/>
      	<%-- 	<h3> <spring:message code="welcome" arguments="${member.nickName}"></spring:message> </h3> --%>
   <%--    	<c:choose>	
				<c:when test="${not empty membersVO.id}">				
					<h5>${membersVO.realName}님 환영합니다!</h5>
				</c:when>
						
				<c:otherwise>
				</c:otherwise>
		</c:choose> --%>
					<h5>${member.realName}님 환영합니다!</h5>
      	</sec:authorize>
        
      </div>
    </div>
  </section><!-- End Top Bar -->

  <header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="/" class="logo d-flex align-items-center">

        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>도매시장 통합 홈페이지<span>.</span></h1>
      </a>
     
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="#hero">메인</a></li>
          <li class="dropdown"><a href="#"><span>도매정보</span><i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="/wholesale/realtime">실시간경매</a></li>
              <li><a href="/wholesale/sale">거래정보</a></li>
             <!-- <li class="dropdown"><a href="#"><span>정산경매</span><i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="/wholesale/sale">거래정보</a></li>
                  <li><a href="/wholesale/chart">통계정보</a></li> 
                </ul>
              </li>-->
            </ul>
          </li>
      	 <!-- 로그인이 성공했다면 -->
      	 	<sec:authorize access="isAuthenticated()">
      		<sec:authentication property="Principal" var="member"/>      		
      		<sec:authorize access="hasAnyRole('ADMIN', 'MAKER', 'AUCTION', 'WHOLESALER', 'RETAILER', 'MEMBER')">

		${membersVO.id}
		${membersVO.distinguish}
		<c:choose>
				
				<c:when test="${membersVO.distinguish == 2}">
		      		<!-- <button type="button" id="kakao">kakao logout</button> -->
		      		<li><a id="kakao">카카오 로그아웃</a></li>
				</c:when>
				
				<c:otherwise>
					<li><a href="/members/logout">로그아웃</a></li>	
				</c:otherwise>
			</c:choose>
	
		      		<!-- <li><a href="/members/logout">로그아웃</a></li>	 -->			
      		
      		
      		<!-- 관리자로 로그인했을땐 마이페이지가 보이면 안됌 -->
      		<sec:authorize access="hasAnyRole('MAKER', 'AUCTION', 'WHOLESALER', 'RETAILER', 'MEMBER')">
      			<li><a href="/members/myPage">마이페이지</a></li>
      		</sec:authorize>
      		
          <li><a href="/kdy/inquiryRequest">1대1문의</a></li>
          <li><a href="/kdy/reportRequest">신고요청</a></li>
          
          <!-- 만약 방금 소셜로그인을 했다면 추가로 정보입력하는 창 띄우기 -->
 <%--          <c:if test="${kakao.profile}">
              	<li><a href="./members/socailInsert">추가정보입력</a></li>
           </c:if> --%>

             <sec:authorize access="hasAnyRole('ADMIN')">
             <li><a href="/kdy/adminPage">Admin</a></li>
			</sec:authorize>


      		</sec:authorize>
      		</sec:authorize>
      	<!-- 로그인을 하지 않았을때 -->
  		<sec:authorize access="!isAuthenticated()">
          <li><a href="/members/login">로그인</a></li>
          <li><a href="/members/agree">회원가입</a></li>
          <li><a href="/kdy/live">방송</a></li>
          </sec:authorize>
        </ul>
         
      </nav><!-- .navbar -->

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
  </header><!-- End Header -->
  <!-- End Header -->

  