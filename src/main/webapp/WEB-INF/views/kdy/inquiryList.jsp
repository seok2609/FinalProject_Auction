<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
                 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        color: #00854b;
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
    <c:import url="../common/header.jsp"></c:import>

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
            <div id="content" class="content">

        <div id="content" class="content" style="margin-top: 45px;" data-aos="fade-up">
            <div class="row" id="mydiv">
                <!-- End of Topbar -->
                <div class="col-xl-3 col-md-6 mb-4" id="nonoresponse">
                    <div class="card border-left-success shadow h-100 py-2"  >
                        <div class="card-body"  onclick="location.href='../kdy/inquiryNoResponseList'">
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
                    <div class="card border-left-success h-100 py-2">
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
                    <div class="card border-left-success h-100 py-2">
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
           
                <sec:authentication property="Principal" var="member"/>
                <div class="container-fluid" style=" width: 1650px;">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3" style="background-color: #008374; ">
                            <h6 class="m-0 font-weight-bold" style="color: white;">1대1 문의</h6>

                            <form action="./inquiryList" style="margin-left: -100px; margin-top: -25px;" class="row row-cols-lg-auto g-3 align-items-center justify-content-center">
                                <div class="col-12">
                                    <div class="input-group" id="memberListSearch">
                                        <input type="text" name="inquirySearch" value="${param.inquirySearch}"
                                            var="" class="form-control" id="inquirySearch"
                                            placeholder="닉네임을 입력해 주세요">
                                        <button type="submit" class="btn btn-success" id="searchNull">검색
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <table class="table table-striped">
                            <tbody>
                                <c:forEach items="${inquiryList}" var="inquiryList">
                                    <c:choose>
                                        <c:when test="${empty inquiryList.inquiryResponseVO.inquiry_response_contents}">
                                                    <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px"  onclick="location.href='/kdy/inquiryDetail?id=${inquiryList.id}&inquiry_num=${inquiryList.inquiry_num}';">
                                                        <div style="border-bottom: solid 1px gainsboro; height: 100px;" id="nonoresponse">
                                                            <div class="d-flex">
                                                                <div class="p-2 w-100">
                                                                    <div class="container2" >
                                                                        <div class="name" style="margin-left: 8px;"> ${inquiryList.id}</div>
                                                                        <div class="contents">${inquiryList.inquiry_text}
                                                                            <div class="contents2">
                                                                                ${inquiryList.membersVO.roleVO.roleName} / ${inquiryList.inquiry_date}
                                                                            </div>
                                                                        </div>
                                                                        <div style="font-weight: bold; width: 100px; margin-left: 1500px; margin-top: -60px;">
                                                                            답변 미완료
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                        </c:when>
                                        <c:otherwise>
                                                    <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px"  onclick="location.href='/kdy/inquiryDetail?id=${inquiryList.id}&inquiry_num=${inquiryList.inquiry_num}';">
                                                        <div style="border-bottom: solid 1px gainsboro; height: 100px;" id="nonoresponse">
                                                            <div class="d-flex">
                                                                <div class="p-2 w-100">
                                                                    <div class="container2" id="inquiryListCss" >
                                                                        <div class="name" style="margin-left: 8px;"> ${inquiryList.id}</div>
                                                                        <div class="contents">${inquiryList.inquiry_text}
                                                                            <div class="contents2">
                                                                                ${inquiryList.membersVO.roleVO.roleName} / ${inquiryList.inquiry_date}
                                                                            </div>
                                                                        </div>
                                                                        <div style="font-weight: bold; width: 100px; margin-left: 1500px; margin-top: -60px;">
                                                                            답변 완료
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
                        </table>
                    </div>
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
                  <a class="page-link" href="./inquiryList?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.inquirySearch}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a> 
                </li> 
                <!-- 조정된 다음 페이지를 기준으로 startNum t0 lastNum까지 반복문돌려 블럭 형성  -->
                <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                  <li class="page-item"><a class="page-link" href="./inquiryList?page=${i}&kind=${pager.kind}&search=${pager.inquirySearch}">${i}</a> </li>
                </c:forEach> 
                <li class="page-item ${pager.next?'':'disabled'}">
                  <a class="page-link" href="./inquiryList?page=${pager.lastNum}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>

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
    <script src="kdy/js/inquiryRequest.js"></script>


</body>
</html> 