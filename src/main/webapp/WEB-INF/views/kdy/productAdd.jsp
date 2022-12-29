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
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
                        <a class="collapse-item" href="./paymentList">결 제 내 역</a>
                        <a class="collapse-item" href="./cNotice">공지사항 등록</a>
                    </div>
                </div>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
        </ul>

        <div id="contact" class="contact" style="margin-left: 350px;">
            <div class="container" data-aos="fade-up">
              <div class="section-header" style="margin-top: 90px;">
                <h2>상품 등록</h2>
              </div>

              <div class="row " style="width: 1000px;">
               <div style="height: 50px;">
                   <div class="d-flex">
                     <div class="info-item d-flex">
                        <div style="text-align: center;">
                            <h4 style="margin-top: 0px;">[ 안 내 ]</h4>
                        </div>
                     </div><!-- End Info Item -->
     
                     <div class="info-item d-flex">
                        <div>
                            <p style="font-size: 17px;">빈 공간 없이 작성해주시면 감사하겠습니다.</p>
                        </div>
                     </div><!-- End Info Item -->

                     <div class="info-item d-flex">
                        <div>
                           
                          </div>
                     </div><!-- End Info Item -->
                   </div>
               </div>
             
                <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">
                    <form method="post" action="./productAdd" id="frm" enctype="multipart/form-data">
                    <div class="form-group mt-3">
                        상품명 : 
                      <input type="text" class="form-control"name="name" id="name">
                    </div>
                    <div class="form-group mt-3">
                        상품위치 : 
                        <div id="map" style="margin-left: 200px; width:500px;height:400px;"></div>
                      <input type="text" class="form-control" name="product_address" id="product_address" placeholder="상세 주소를 입력해주세요">
                    </div>
                    <div class="mb-3" id="caNum">
                        <label for="message-text" class="col-form-label">상품 등급</label>
                        <select  name="grade_num" class="form-select" id="grade_num">
                          <option class="grade_nums" value="5">미처리</option>
                          <option class="grade_nums" value="1">특</option>
                          <option class="grade_nums" value="2">상</option>
                          <option class="grade_nums" value="3">중</option>
                          <option class="grade_nums" value="4">하</option>
                        </select>
                      </div>
                      <div class="form-group mt-3">
                        <label for="formFileSm" class="form-label bc">상품 이미지</label>
                        <input class="form-control form-control-sm" id="reportFileAdd" name="files" type="file">
                      </div>
                      <div class="form-group mt-3">
                        수량 : 
                      <input type="text" class="form-control"name="quantity" id="quantity" >
                    </div>
                    <div class="form-group mt-3">
                        중량 : 
                      <input type="text" class="form-control"name="weight" id="weight">
                    </div>
                    
                    <div class="d-flex">
                        <div class="text-center">
                            <button type="button" class="btn btn-success" id="productAddBtn" onclick="productAddNullCheck()">등록</button>
                          </div>
                          <div class="text-center" style="margin-left: 10px;"  onclick="location.href='/kdy/saleTypeList';">
                            <button class="btn btn-success"  type="button" id="proB">뒤로가기</button>
                          </div>
                    </div>
                    </form>
                </div>
              </div> 
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
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abf31ecaa88152d20b1faa70bc69a3d1"></script> -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abf31ecaa88152d20b1faa70bc69a3d1&libraries=services,clusterer,drawing"></script>
    <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
            var content = '<div class="bAddr">' + detailAddr + '</div>';

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});


function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // 행정동의 region_type 값은 'H' 이므로
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
    }    
}
	</script>
    
    <c:import url="../common/footer.jsp"></c:import>
</body>

</html>