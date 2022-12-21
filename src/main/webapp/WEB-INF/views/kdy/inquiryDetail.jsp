<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
            <h2>${inquiryDetail.id}님의 문의 내용 입니다.</h2>
          </div>
          <div class="row gx-lg-0 gy-4 ">

           <div style="height: 50px;">
               <div class="d-flex">
                 <div class="info-item d-flex">
                     <i class="bi bi-envelope flex-shrink-0"></i>
                     <div>
                       <h4>답변상태:</h4>
                       <c:choose>
                             <c:when test="${empty inquiryDetail.inquiryResponseVO.inquiry_response_contents}">
                                 <p>미답변</p>
                             </c:when>
                             <c:otherwise>
                                 <p>답변완료</p>
                             </c:otherwise>
                     </c:choose>
                     </div>
                 </div><!-- End Info Item -->
 
                 <div class="info-item d-flex" onclick="location.href='/kdy/membersDetail?id=${inquiryDetail.id}';">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4 >${inquiryDetail.id}님의 회원정보 보러 가기</h4>
                     <p style="margin-bottom: 5PX;">${inquiryDetail.membersVO.email}</p>
                   </div>
                 </div><!-- End Info Item -->
                   <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4>${inquiryDetail.id}님의 가입일</h4>
                     <p>${inquiryDetail.membersVO.joinDate}</p>
                   </div>
                 </div>
               </div>
           </div>
  
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <input type="text" name="name" class="form-control" id="information" style="border: 0;"   readonly value="${inquiryDetail.id} 님">
                  </div>
                  <div class="col-md-6 form-group mt-3 mt-md-0">
                    <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="문의 날짜 : ${inquiryDetail.inquiry_date}">
                  </div>
                </div>
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="subject" id="information" style="border: 0;" readonly value="문의 제목 : ${inquiryDetail.inquiry_text}">
                </div>
                <div class="form-group mt-3">
                  <div id="information">문의 내용 : </div>
                  <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${inquiryDetail.inquiry_contents}</textarea>
                </div>
		
                <sec:authorize access="isAuthenticated()">	  
                          
      				
                <c:choose>
                  <c:when test="${empty inquiryDetail.inquiryResponseVO.inquiry_response_contents}">
                    <form action="./inquiryResponse" method="post" id="frm">
                      <div>
                        <input type="hidden" id="inquiry_num" name="inquiry_num" value="${inquiryDetail.inquiry_num}">
                                </div>
                                
                                <sec:authorize access="hasRole('ADMIN')">
                                
                                <div class="form-group mt-3">
                                  <textarea class="form-control" name="inquiry_response_contents" id="inquiry_response_contents" rows="7" placeholder="관리자의 답변을 기다리고있어요~" required></textarea>
                                </div> 
                                <div class="d-flex">
                                  <div class="text-center">
                                    <button type="button" class="btn btn-success" id="inquiryAddBtn" onclick="inquiryResponseNullCheck()">답변하기</button>
                                    <button type="button" class="btn btn-success" class="text-center" onclick="location.href='/kdy/inquiryList';">뒤로가기</button>
                                </div> 
                            		</sec:authorize>
                              </form>
                            </c:when>
                            
                           
                            
                            <c:otherwise>
                              <div class="form-group mt-3">
                                <div id="information">관리자 답변 : </div>
                                <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${inquiryDetail.inquiryResponseVO.inquiry_response_contents}</textarea>
                              </div>
                              <div class="text-center" onclick="location.href='/kdy/inquiryList';">
                                <button type="button" class="btn btn-success">뒤로가기</button>
                              </div>
                            </c:otherwise>
                          </c:choose>
                      </sec:authorize>
                          
            </div>
          </div> 
        </div>
  </div>


   
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>