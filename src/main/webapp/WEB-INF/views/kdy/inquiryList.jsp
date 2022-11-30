<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<head>

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

    <style>

       #mydiv{
        margin-left: 250px;
       } 
       #inquiryListCss{
        color: tomato;
       }
    </style>

</head>

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
                    <!-- <h6 class="collapse-header">Custom Components:</h6> -->
                    <a class="collapse-item" href="./memberList">회 원 조 회</a>
                    <a class="collapse-item" href="./inquiryList">1 대 1 문 의</a>
                    <a class="collapse-item" href="./auctioneer">구 인 구 직</a>
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
                    <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                    <a class="collapse-item" href="./report">신 고 요 청</a>
                    <a class="collapse-item" href="./memberBlackList">블 랙 리 스 트</a>
                    <!-- <a class="collapse-item" href="utilities-animation.html">Animations</a>
                    <a class="collapse-item" href="utilities-other.html">Other</a> -->
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
                    <!-- <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item" href="login.html">Login</a>
                    <a class="collapse-item" href="register.html">Register</a>
                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a> -->
                    <a class="collapse-item" href="./saleList">판 매 내 역</a>
                    <a class="collapse-item" href="./saleTypeList">판 매 품 목</a>
                    <a class="collapse-item" href="./paymentList">결 제 내 역</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">


    </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <!-- <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form> -->

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    MAIN HOME
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    LOGOUT
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
            <div class="row" id="mydiv">
                <!-- End of Topbar -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2" >
                        <div class="card-body" onclick="location.href='../kdy/inquiryNoResponseList'">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-success font-weight-bold text-primary text-uppercase mb-1">
                                        응답하지 않은 문의</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${totalInquiryNo} 건</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-success font-weight-bold text-primary text-uppercase mb-1">
                                        응답완료</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${totalInquiryYes} 건</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-success font-weight-bold text-primary text-uppercase mb-1">
                                        총 문의</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">${totalInquiry} 건</div>
                                </div>
                                <div class="col-auto">
                                    <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-success">1대1 문의</h6>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr class="text-success">
                                    <th>아이디</th>
                                    <th>등급</th>
                                    <th>제목</th>
                                    <th>문의 날짜</th>
                                    <th>처리 결과</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${inquiryList}" var="inquiryList">
                                        <tr onclick="location.href='/kdy/inquiryDetail?id=${inquiryList.id}&inquiry_num=${inquiryList.inquiry_num}';">
                            <c:choose>
	                            <c:when test="${empty inquiryList.inquiryResponseVO.inquiry_response_contents}">
                                            <td>${inquiryList.id}</td>
                                            <td>${inquiryList.membersVO.roleVO.roleName}</td>
                                            <td>${inquiryList.inquiry_text}</td>
                                            <td>${inquiryList.inquiry_date}</td>
	                            </c:when>
	                            <c:otherwise>
                                            <td id="inquiryListCss">${inquiryList.id}</td>
                                            <td id="inquiryListCss">${inquiryList.membersVO.roleVO.roleName}</td>
                                            <td id="inquiryListCss">${inquiryList.inquiry_text}</td>
                                            <td id="inquiryListCss">${inquiryList.inquiry_date}</td>
	                            </c:otherwise>
                            </c:choose>
                                            <c:choose>
                                            	<c:when test="${empty inquiryList.inquiryResponseVO.inquiry_response_contents}">
                                            		<td>미답변</td>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<td>답변완료</td>
                                            	</c:otherwise>
                                            </c:choose>
                                        </tr>       
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    </div>
                </div>
            
            </div>
        </div>
        <nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${pager.pre}">
					<li class="page-item"><a class="page-link"
						href="./inquiryList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">◁</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					<li class="page-item"><a class="page-link"
						href="./inquiryList?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a>
					</li>
				</c:forEach>
				<li class="page-item ${pager.next?'':'disabled'}"><a
					class="page-link" href="./inquiryList?page=${pager.lastNum+1}">▷</a></li>
			</ul>
		</nav>

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

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
    <script src="kdy/js/inquiryRequest.js"></script>


</body>

</html> 