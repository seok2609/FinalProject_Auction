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
        <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:contact@example.com">contact@example.com</a></i>
        <i class="bi bi-phone d-flex align-items-center ms-4"><span>+1 5589 55488 55</span></i>
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
      <!-- 로그인이 되었다면 -->
      	<sec:authorize access="isAuthenticated()">
      		<sec:authentication property="Principal" var="member"/>
      	<%-- 	<h3> <spring:message code="welcome" arguments="${member.nickName}"></spring:message> </h3> --%>
      	<c:choose>	
				<c:when test="${not empty membersVO.id}">				
					<h5>${membersVO.nickName}님 환영합니다!</h5>
				</c:when>
						
				<c:otherwise>
					<h5>${membersVO.nickName}님 환영합니다!</h5>
				</c:otherwise>
		</c:choose>
      	</sec:authorize>
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
      </div>
    </div>
  </section><!-- End Top Bar -->

  <header id="header" class="header d-flex align-items-center">

    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
      <a href="/" class="logo d-flex align-items-center">

        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1>Jiwon Room<span>.</span></h1>
      </a>
     
      <nav id="navbar" class="navbar">
        <ul>
      	 <!-- 로그인이 성공했다면 -->
      
      	 	<sec:authorize access="isAuthenticated()">
      		
      		<sec:authentication property="Principal" var="member"/>      		
      	<%-- 	<sec:authorize access="hasAnyRole('ADMIN', 'MAKER', 'AUCTION', 'WHOLESALER', 'RETAILER', 'MEMBER')"> --%>
      		

          <li><a href="/kdy/inquiryRequest">1대1 문의</a></li>
      		<li><a href="/members/logout">Logout</a></li>
      		<li><a href="/members/myPage">MyPage</a></li>
            <li><a href="/kdy/inquiryRequest">1대1 문의</a></li>
            <li><a href="/kdy/reportRequest">신고 요청</a></li>
            <li><button type="button" id="kakao">kakao logout</button></li>
			<form action="./member/logout" method="post" id="outForm">
				<a href="./member/logout">로그아웃</a>
			</form>

             
            
      		
      		</sec:authorize>
      		
      	<%-- 	</sec:authorize> --%>
      	<!-- 로그인을 하지 않았을때 -->
  		<sec:authorize access="!isAuthenticated()">
          <li><a href="/members/login">로그인</a></li>
          <li><a href="/members/agree">회원가입</a></li>
          <li><a href="/oauth2/authorization/kakao">KaKao Login</a></li>
         </sec:authorize>
         
          <li><a href="#hero">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#portfolio">Portfolio</a></li>
          <li class="dropdown"><a href="#"><span>wholeSale</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="/wholesale/realtime">realTime</a></li>
              <li class="dropdown"><a href="#"><span>sale</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="/wholesale/sale">sale1</a></li>
                  <li><a href="/wholesale/chart">chart</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="blog.html">Blog</a></li>
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
        
        </ul>
         
      </nav><!-- .navbar -->

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

    </div>
  </header><!-- End Header -->
  <!-- End Header -->

  