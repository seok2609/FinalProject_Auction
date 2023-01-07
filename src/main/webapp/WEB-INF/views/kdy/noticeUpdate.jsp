<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style>
    #inquirySt{
      margin-top: 50px;
      margin-bottom: 50px;
    }
    #inquiryss{
      margin-left: 350px;
    }
    #inquiryAddBottonST{
      margin-top: 50px;
    }
    #information{
            font-size: 17px;
            font-weight: bold;
        }
  </style>
      <script  defer src="/kdy/js/admin.js"></script>
</head>
<body>
    <c:import url="../common/header.jsp"></c:import>
    <!-- Begin Page Content -->
    <div id="contact" class="contact">
      <form method="post" action="./noticeUpdate" id="frm">
        <input style="display: none;" value="${noticeUpdate.notice_num}">
        <div class="container" data-aos="fade-up">
          <div class="section-header" style="margin-top: 90px;">
            <h2>공지사항</h2>
          </div>
          <div class="row gx-lg-0 gy-4 ">

           <div style="height: 50px;">
               <div class="d-flex">
 
                 <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4 >조회수</h4>
                     <p style="margin-bottom: 5PX;">${noticeUpdate.notice_hit}</p>
                   </div>
                 </div><!-- End Info Item -->
                   <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4>공지 날짜</h4>
                     <p>${noticeUpdate.notice_date}</p>
                   </div>
                 </div>
               </div>
           </div>
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">
              <input hidden type="text" name="notice_num" value="${noticeUpdate.notice_num}">
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="notice_title" id="notice_titleU"  value="[공 지] ${noticeUpdate.notice_title}">
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control" name="notice_contents" id="notice_contentsU" rows="7">${noticeUpdate.notice_contents}</textarea>
                </div>
                <div class="d-flex">
                  <div class="text-center" onclick="location.href='/kdy/cNoticeList';">
                    <button type="button" class="btn btn-success" id="noticeUpdateC">취소하기</button>
                  </div>
                  <div class="text-center">
                    <button type="button" class="btn btn-success" onclick="noticeUpdate()" >등록하기</button>
                  </div>
                
                </div>
            </div>
          </div> 
        </div>
      </form>
  </div>


   
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>