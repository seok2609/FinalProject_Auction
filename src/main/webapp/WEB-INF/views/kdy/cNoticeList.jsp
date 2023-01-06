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
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    
</head>

<body id="page-top">
    <div>
        <c:import url="../common/header.jsp"></c:import>
    </div>
    <!-- Page Wrapper -->
    <div class="section-header container" style="margin-top: 45px;"  data-aos="fade-up">
        <h2>공지사항</h2>
        
    <div id="wrapper" style="height: 800px; width: 1000px; margin-top: 50px; margin-left: 200px;" >
        <div style="width: 2000px;">
            <table border="1" class="table table-hover" id="th">
                <thead class="table-success" style="text-align: center;">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성 날짜</th>
                        <th>조회 수</th>
                        <th>자세히 보기</th>
                    </tr>
                </thead>
                <tbody id="tb" style="text-align: center; color: red;">
                    <c:forEach items="${noticeList}" var="noticeList">
                        <tr>
                            <td>${noticeList.notice_num}</td>
                            <td>${noticeList.notice_title}</td>
                            <td>${noticeList.notice_date}</td>
                            <td>${noticeList.notice_hit}</td>
                            <td>
                                <button class="btn btn-outline-dark" onclick="location.href='./noticeDetail?notice_num=${noticeList.notice_num}';" type="submit" style="width: auto;">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                        <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                    </svg> 자세히
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
          </div>
    </div>
  </div>
    <div class="chefs section-bg" style="margin-left: 900px;">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
          <!-- 이전페이지가 없으면    버튼 비활성화  -->
            <li class="page-item ${pager.pre?'':'disabled'}">
            <!-- page 파라미터가 조정되면 -- startNum/lastNum이 변경되어 출력 리스트가 변경됨 -->
            <!-- 1. page 파라미터 변경함으로써 다음 페이지 조정  -->
              <a class="page-link" href="./cNoticeList?page=${pager.startNum-1}" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a> 
            </li> 
            <!-- 조정된 다음 페이지를 기준으로 startNum t0 lastNum까지 반복문돌려 블럭 형성  -->
            <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
              <li class="page-item"><a class="page-link" href="./cNoticeList?page=${i}">${i}</a> </li>
            </c:forEach> 
            <li class="page-item ${pager.next?'':'disabled'}">
              <a class="page-link" href="./cNoticeList?page=${pager.lastNum}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
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