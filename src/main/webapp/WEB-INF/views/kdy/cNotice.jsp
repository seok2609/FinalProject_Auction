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
    <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">
    
    <!-- Custom styles for this template-->
    <link href="/kdy/css/sb-admin-2.min.css" rel="stylesheet">
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<!-- jquery -->
  <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- include summernote css/js-->
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>   
    <link href="/kdy/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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
      <script  defer src="/kdy/js/admin.js"></script>
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

        <div id="contact" class="contact " style="margin-left: 350px;">
            <div class="container" data-aos="fade-up">
              <div class="section-header" style="margin-top: 90px;">
                <h2>공지사항 등록</h2>
              </div>

              <div class="row " style="width: 1000px;">
               <div style="height: 50px;">
                   <div class="d-flex">
                     <div class="info-item d-flex">
                        <div>
                            <h4 style="margin-top: 0px;">[ 안 내 ]</h4>
                            
                          </div>
                     </div><!-- End Info Item -->
     
                     <div class="info-item d-flex">
                        <div>
                            <p>제목, 내용 작성은 필수입니다</p>
                          </div>
                     </div><!-- End Info Item -->

                     <div class="info-item d-flex">
                        <div>
                           
                          </div>
                     </div><!-- End Info Item -->
                   </div>
               </div>
             
                <div class="col-lg-8 php-email-form " style="margin-bottom: 90px;">
                    <form method="post" action="./cNotice" id="frm">
                    <div class="form-group mt-3">
                        공지사항 제목 : 
                      <input type="text" class="form-control"name="notice_title" id="notice_title" style="color: red">
                    </div>
                    <div class="form-group mt-3">
                      <div id="information">공지 사항 : </div>
                      <textarea class="form-control" name="notice_contents" id="notice_contents"  rows="7"></textarea>
                    </div>
                    <div class="d-flex">
                        <div class="text-center">
                            <button type="button" class="btn btn-success" id="inquiryAddBtn" onclick="cNoticeNullCheck()">등록</button>
                          </div>
                          <div class="text-center" style="margin-left: 10px;"  onclick="location.href='/kdy/adminPage';">
                            <button class="btn btn-success"  type="button" id="noticeB">뒤로가기</button>
                          </div>
                    </div>
                    </form>
                </div>
              </div> 
            </div>
      </div>
    
           </div> 
    </div>
    
    <script type="text/javascript">
        $("#notice_contents").summernote(
                {
                        height: 260,                
                        minHeight: null,           
                        maxHeight: null,          
                        focus: true 
  
                    });</script>
    
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
    
    <c:import url="../common/footer.jsp"></c:import>
</body>

</html>