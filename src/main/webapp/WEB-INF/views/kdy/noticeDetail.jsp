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
        <div class="container" data-aos="fade-up">
          <div class="section-header" style="margin-top: 90px;">
            <h2>공지사항</h2>
            ${noticeDetail.membersVO.roleVO.roleName}
            <sec:authentication property="Principal" var="member"/>
            ${member.nickName}
          </div>
          <div class="row gx-lg-0 gy-4 ">

           <div style="height: 50px;">
               <div class="d-flex">
 
                 <div class="info-item d-flex" onclick="location.href='/kdy/membersDetail?id=${inquiryDetail.id}';">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4 >조회수</h4>
                     <p style="margin-bottom: 5PX;">${noticeDetail.notice_hit}</p>
                   </div>
                 </div><!-- End Info Item -->
                   <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4>공지 날짜</h4>
                     <p>${noticeDetail.notice_date}</p>
                   </div>
                 </div>
               </div>
           </div>
  
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="subject" id="information" style="border: 0; color: red;" readonly value="[공 지] ${noticeDetail.notice_title}">
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${noticeDetail.notice_contents}</textarea>
                </div>
                <div class="d-flex">
                  <c:choose>
                    <c:when test="${empty noticeDetail.membersVO.roleVO.roleName}">
                      <div class="text-center" onclick="location.href='/kdy/cNoticeList';">
                        <button type="submit">뒤로가기</button>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <c:choose>
                        <c:when test="${noticeDetail.membersVO.roleVO.roleName ne 'ROLE_ADMIN'}">
                          <div class="text-center" onclick="location.href='/kdy/cNoticeList';">
                            <button type="submit">뒤로가기</button>
                          </div>
                        </c:when>
                        <c:otherwise>
                          <div class="text-center" onclick="location.href='/kdy/cNoticeList';">
                            <button type="submit">뒤로가기</button>
                          </div>
                          <div class="text-center" onclick="location.href='./noticeUpdate?notice_num=${noticeDetail.notice_num}';">
                            <button type="submit">수정하기</button>
                          </div>
                          <div class="text-center" id="nD" onclick="location.href='./noticeDelete?notice_num=${noticeDetail.notice_num}';">
                            <button type="submit">삭제하기</button>
                          </div>
                        </c:otherwise>
                      </c:choose> 
                    </c:otherwise>
                  </c:choose>
                </div>
            </div>
          </div> 
        </div>
  </div>


   
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>