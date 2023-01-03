<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<head>
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
  <!-- ================================================================================ -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin 2 - Tables</title>
  <!-- Custom fonts for this template -->
  <link href="/kdy/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <style>

     #mydiv{
      margin-left: 250px;
     }
     #memberListSearch{
      margin-left: 50px;
     } 
     #blackMembersCss{
      color: seagreen;
     }
     #blackMembersCsss{
      color: red
     }
     #blackListMembers{
      margin-left: 15px;
      color: red;
     }
     #blackMembersCssss{
      color: mediumvioletred;
     }
     #nonoresponse:hover{
      box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;
     }
  </style>
  <script  defer src="/kdy/js/admin.js"></script>
</head>
<body>
      <!-- ======= Header ======= -->
  
  <section id="topbar" class="topbar d-flex align-items-center">
    <div class="container d-flex justify-content-center justify-content-md-between">
      <div class="contact-info d-flex align-items-center">
       
      </div>
      <div class="social-links d-none d-md-flex align-items-center">
      <!-- 로그인이 되었다면 -->
      	<sec:authorize access="isAuthenticated()">
      		<sec:authentication property="Principal" var="member"/>
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

      		<li><a href="/members/logout">로그아웃</a></li>
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
  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
       <!-- Sidebar -->
       <ul class="navbar-nav bg-gradient-success sidebar sidebar-dark accordion" id="accordionSidebar">
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./adminPage">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">관리자<sup>PAGE</sup></div>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <!-- Divider -->
        <hr class="sidebar-divider">
        
        <!-- Heading -->
        <div class="sidebar-heading">
            MEMBER
        </div>
        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                aria-expanded="true" aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>회 원 관 리</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="./memberList">회 원 조 회</a>
                    <a class="collapse-item" href="./inquiryList">1 대 1 문 의</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fas fa-fw fa-wrench"></i>
                <span>신고</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="./report">신 고 요 청</a>
                    <a class="collapse-item" href="./memberBlackList">블 랙 리 스 트</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">
        <!-- Heading -->
        <div class="sidebar-heading">
            Addons
        </div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                aria-expanded="true" aria-controls="collapsePages">
                <i class="fas fa-fw fa-folder"></i>
                <span>관 리</span>
            </a>
            <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="./saleList">판 매 내 역</a>
                    <a class="collapse-item" href="./saleTypeList">판 매 품 목</a>
                    <a class="collapse-item" href="./cNotice">공지사항 등록</a>
                </div>
            </div>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">
    </ul>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content" class="contents" style="margin-top: 45px;" data-aos="fade-up">

                    <div class="row" id="mydiv" style="margin-left: -1px;">
                        <!-- End of Topbar -->
                        <div class="col-xl-3 col-md-6 mb-4" style="margin-left: 25px;"  id="cc">
                            <div class="card border-left-success  h-100 py-2" >
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-success font-weight-bold text-primary text-uppercase mb-1">
                                                총 회원</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${result} 건</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- DataTales Example -->
                    <div class="container-fluid" style="width: 1650px;" >
                    <div class="card shadow mb-4" >
                        <div class="card-header py-3 row" style="background-color: #008374; margin-left: 1px;">
                            <div class="m-0 font-weight-bold" style="color: white;">회원</div>
                            <sec:authorize access="isAuthenticated()">
      		                    <sec:authentication property="Principal" var="member"/>
                                <input type="hidden" name="id" value="${member.id}">
                                </sec:authorize>
                                <form action="./memberList" style="margin-left: -100px; margin-top: -25px;" class="row row-cols-lg-auto g-3 align-items-center justify-content-center">
                                    <div>
                                        <div class="input-group" id="memberListSearch">
                                            <input type="text" name="search" value="${param.search}" var="" class="form-control" id="search" placeholder="닉네임을 입력해 주세요">
                                            <button type="submit" class="btn btn-success" id="searchNull">검색
                                            </button>
                                        </div>
                                        <div id="blackListMembers" style="color: white; margin-left: 90px; margin-top: 15px;">블랙리스트 회원은 빨간색</div>
                                    </div>
                                </form>
                        </div>
                            <tbody>
                                <c:forEach items="${membersVO}" var="mVO">
                                    <c:choose>
                                        <c:when test="${mVO.black < 2}">
                                            <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px" onclick="location.href='/kdy/membersDetail?id=${mVO.id}';">
                                                <div style="border-bottom: solid 1px gainsboro; height: 100px;" id="nonoresponse">
                                                    <div class="d-flex">
                                                        <div class="p-2 w-100">
                                                            <div class="container2" >
                                                                <div class="name" style="margin-left: 8px; margin-top: 15px;" id="blackMembersCss">아이디 : ${mVO.id}</div>
                                                                <div class="contents" id="blackMembersCss" style="margin-left: 8px; margin-top: 15px; font-weight: bold; font-size: 20px;">닉네임 : ${mVO.nickName}</div>
                                                                <div id="blackMembersCssss" style="font-weight: bold; width: 180px; margin-left: 1400px; margin-top: -45px;">
                                                                    ${mVO.roleVO.roleName}
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px"  onclick="location.href='/kdy/membersDetail?id=${mVO.id}';">
                                                <div style="border-bottom: solid 1px gainsboro; height: 100px;" id="nonoresponse">
                                                    <div class="d-flex">
                                                        <div class="p-2 w-100">
                                                            <div class="container2" >
                                                                <div class="name" style="margin-left: 8px; margin-top: 15px;" id="blackMembersCsss">아이디 : ${mVO.id}</div>
                                                                <div class="contents" id="blackMembersCsss" style="margin-left: 8px; margin-top: 15px; font-weight: bold; font-size: 20px;">닉네임 : ${mVO.nickName}</div>
                                                                <div id="blackMembersCsss" onclick="location.href='/kdy/blackC?id=${mVO.id}'" style="font-weight: bold; width: 100px; margin-left: 1500px; margin-top: -60px;">
                                                                   블 랙
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach> 
                            </tbody>
                    </div>
                </div>
            </div>

            <div class="chefs section-bg" style="margin-left: 750px;">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
                  <!-- 이전페이지가 없으면 	버튼 비활성화  -->
                    <li class="page-item ${pager.pre?'':'disabled'}">
                    <!-- page 파라미터가 조정되면 -- startNum/lastNum이 변경되어 출력 리스트가 변경됨 -->
                    <!-- 1. page 파라미터 변경함으로써 다음 페이지 조정  -->
                      <a class="page-link" href="./memberList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a> 
                    </li> 
                    <!-- 조정된 다음 페이지를 기준으로 startNum t0 lastNum까지 반복문돌려 블럭 형성  -->
                    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                      <li class="page-item"><a class="page-link" href="./memberList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a> </li>
                    </c:forEach> 
                    <li class="page-item ${pager.next?'':'disabled'}">
                      <a class="page-link" href="./memberList?page=${pager.lastNum}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
            </div>
        </div>
    </div>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <c:import url="../common/footer.jsp"></c:import>
      <!-- Bootstrap core JavaScript-->
      <script src="vendor/jquery/jquery.min.js"></script>
      <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
      <!-- Core plugin JavaScript-->
      <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  
      <!-- Custom scripts for all pages-->
      <script src="js/sb-admin-2.min.js"></script>
  
      <!-- Page level plugins -->
      <script src="vendor/datatables/jquery.dataTables.min.js"></script>
      <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
  
      <!-- Page level custom scripts -->
      <script src="js/demo/datatables-demo.js"></script>
      
</body>
</html>