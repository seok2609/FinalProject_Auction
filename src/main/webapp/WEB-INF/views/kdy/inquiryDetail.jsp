<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
  </style>
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
 
                 <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4>${inquiryDetail.id}님의 Email:</h4>
                     <p>${inquiryDetail.membersVO.email}</p>
                   </div>
                 </div><!-- End Info Item -->
                   <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4>${inquiryDetail.id}님의 Call:</h4>
                     <p>${inquiryDetail.membersVO.phone}</p>
                   </div>
                 </div>
               </div>
           </div>
  
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">
                <div class="row">
                  <div class="col-md-6 form-group">
                    <input type="text" name="name" class="form-control" id="name"   readonly value="${inquiryDetail.id}">
                  </div>
                  <div class="col-md-6 form-group mt-3 mt-md-0">
                    <input type="text" class="form-control" name="email" id="email"  readonly value="${inquiryDetail.inquiry_date}">
                  </div>
                </div>
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="subject" id="subject" readonly value="${inquiryDetail.inquiry_text}">
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${inquiryDetail.inquiry_contents}</textarea>
                </div>
                
                <c:choose>
					<c:when test="${empty inquiryDetail.inquiryResponseVO.inquiry_response_contents}">
		                <form action="./inquiryResponse" method="post">
		                    <div>
		                        <input type="hidden" id="inquiry_num" name="inquiry_num" value="${inquiryDetail.inquiry_num}">
		                    </div>
		                    <div class="form-group mt-3">
		                    <textarea class="form-control" name="inquiry_response_contents" id="inquiry_response_contents" rows="7" placeholder="관리자의 답변을 기다리고있어요~" required></textarea>
		                    </div>  
		                    <div class="text-center" id="inquiryAddBottonST">
		                        <button type="submit" id="inquiryAddBtn">답변하기</button>
		                      </div>
		                </form>
					</c:when>
					<c:otherwise>
		                <div class="form-group mt-3">
		                    <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${inquiryDetail.inquiryResponseVO.inquiry_response_contents}</textarea>
		                </div>
					</c:otherwise>
				</c:choose>
            </div>
          </div> 
        </div>
  </div>


   
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>