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
    <div class="container-fluid">
        <div class="container" data-aos="fade-up" id="inquirySt">
            <div class="section-header">
            <h2>${inquiryDetail.id}님의 문의 내용 입니다.</h2>
            </div>

            <div class="row gx-lg-0 gy-4" id="inquiryss">
            <div class="col-lg-8">
                <div class="row">
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="inquiryDetail_text" id="inquiryDetail_text" readonly value=${inquiryDetail.inquiry_text}>
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="inquiryDetail_date" id="inquiryDetail_date" readonly value=${inquiryDetail.inquiry_date}>
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control" name="inquiryDetail_response" id="inquiryDetail_response" readonly value=${inquiryDetail.inquiry_response}>
                    </div>
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
        <script src="../../../../resources/static/kdy/js/inquiryRequest.js"></script>
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>