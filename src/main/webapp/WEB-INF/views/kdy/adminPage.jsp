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
    <title>SB Admin 2 - Dashboard</title>
    <!-- Custom fonts for this template-->
    <link href="/kdy/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="/kdy/css/sb-admin-2.min.css" rel="stylesheet">
    <style>
          #mydiv{
        margin-left: 200px;
       } 
       #nonoresponse:hover{
        box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;
       }
              .name{
            color: gray;
            font-weight: 900;
        }
        .contents{
            margin: 6px;
            font-size: 20px;
            font-weight: 600;
        }
        .contents > .contents2{
            font-size: 15px;
            color: gray;
        }
    </style>

</head>

<body id="page-top">
    <div>
        <c:import url="../common/header.jsp"></c:import>
    </div>
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
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">

                <!-- Begin Page Content -->
                <div class="container-fluid" data-aos="fade-up">

               
                    <!-- Content Row -->
                    <div class="row">
                        <div class="row" id="mydiv" style="margin-top: 50px; ">
                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4" id="nonoresponse">
                            <div class="card border-left-success shadow h-100 py-2" >
                                <div class="card-body" onclick="location.href='../kdy/memberList'">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                총 회원 수</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${result} 명</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4" id="nonoresponse">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body" onclick="location.href='../kdy/report'">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                대기중인 신고요청 </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${reportNoResponse}건</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4" id="nonoresponse">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body" onclick="location.href='../kdy/inquiryNoResponseList'">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                대기중인 1대1 문의  </div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">${inquiryNoResponse}건</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-12 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">당월 일일 방문자 수</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <!-- DataTales Example -->
                    <div class="card shadow mb-4" >
						
                        <div class="card-body" style="margin-bottom: 50px;">
                            <div class="table-responsive">
                              
                                    <c:choose>
                                        <c:when test="${empty adminInquiryList}">
                                            대기중인 1대1문의가 없습니다.
                                        </c:when>
                                        <c:otherwise>
                                            <table class="table table-striped">
                                                <thead>
                                                    <div class="card-header py-3" style="background-color: #008374; color: white;">최신 1대1문의 5개 리스트</div>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${adminInquiryList}" var="inquiryList">   
                                                        <div class="list" style="  box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px"  onclick="location.href='/kdy/inquiryDetail?id=${inquiryList.id}&inquiry_num=${inquiryList.inquiry_num}';">
                                                            <div style="border-bottom: solid 1px gainsboro; height: 100px;" id="nonoresponse" >
                                                                <div class="d-flex">
                                                                    <div class="p-2 w-100">
                                                                        <div class="container2" >
                                                                            <div class="name"> ${inquiryList.id}</div>
                                                                            <div class="contents">${inquiryList.inquiry_text}
                                                                                <div class="contents2">
                                                                                    ${inquiryList.membersVO.roleVO.roleName} / ${inquiryList.inquiry_date}
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>   
                                                    </c:forEach> 
                                                </tbody>
                                            </table>
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>
    <div>
        <c:import url="../common/footer.jsp"></c:import>
    </div>

</body>

</html>