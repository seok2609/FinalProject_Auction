<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
  <script defer>
    function noClick() {
      alert("이미 판매한 상품입니다 수정할 수 없습니다.");
    }
    function noAuction(){
      alert("이미 판매한 상품입니다 경매할 수 없습니다.");
    }
  </script>
<script  defer src="/kdy/js/admin.js"></script>
</head>
<body>
    <c:import url="../common/header.jsp"></c:import>

    <div class="container-fluid">
      <div id="contact" class="contact">
        <div class="container" data-aos="fade-up" id="inquirySt">
            <div class="section-header">
            <h2>상품번호 ${saleDetail.product_num}번<br> 품목 : ${saleDetail.name}</h2>
            </div>
            <div class="row gx-lg-0 gy-4">
              <div style="height: 50px;">
                <div class="d-flex">
                  <div class="info-item d-flex" >
                    <i class="bi bi-envelope flex-shrink-0"></i>
                    <div>
                      <h4>상품 판매 여부</h4>
                        <div class="d-flex" style="color: black; cursor: pointer;">
                                 <div  style="color: aliceblue;">SOLDOUT</div>
                        </div>
                    </div>
                </div><!-- End Info Item -->

                  <div class="info-item d-flex">
                    <i class="bi bi-envelope flex-shrink-0"></i>
                    <div>
                      <h4>상품 등급</h4>
                        <div class="d-flex" style="color: black; cursor: pointer;">
                          <c:choose>
                            <c:when test="${productVO.grade_num == 5}">
                              <div  style="color: aliceblue;">미처리</div>
                            </c:when>
                            <c:when test="${productVO.grade_num == 4}">
                              <div style="color: aliceblue;">하</div>&emsp;
                            </c:when>
                            <c:when test="${productVO.grade_num == 3}">
                              <div  style="color: aliceblue;">중</div>&emsp;
                            </c:when>
                            <c:when test="${productVO.grade_num == 2}">
                              <div style="color: aliceblue;">상</div>&emsp;
                            </c:when>
                            <c:otherwise>
                              <div  style="color: aliceblue;">특</div>&emsp;
                            </c:otherwise>
                          </c:choose>
                        </div>   
                    </div>
                  </div><!-- End Info Item -->
                    <div class="info-item d-flex" style="height: 95px;">
                    <i class="bi bi-envelope flex-shrink-0"></i>
                        <div style="margin-top: 5px; cursor: pointer;">
                          <h4>경매 날짜</h4>
                            ${saleDetail.auctionVO.sign_date}
                        </div>
                  </div>
                  </div><!-- End Info Item -->
                </div>
            </div>
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px; margin-top: 50px;">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="information" style="border: 0;"   readonly value="상품 수량 : ${saleDetail.quantity} kg">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="상품 중량 : ${saleDetail.weight} kg">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="배송 상태 : ${saleDetail.deliveryStateVO.stateName}">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="낙찰가 : ${saleDetail.auctionVO.award}원">
                </div>
                    <!-- ======= Frequently Asked Questions Section ======= -->
                    <c:choose>
                      <c:when test="${empty saleDetail.productFileVOs[0].fileName}">                        
                      </c:when>
                      <c:otherwise>
                        <section id="faq" class="faq">
                          <div class="container" data-aos="fade-up" style="margin-left: 150px; margin-top: -45px;">
                            <div class="row gy-4">
                              <div class="col-lg-8">
                                <div class="accordion accordion-flush" id="faqlist" data-aos="fade-up" data-aos-delay="100">
                                  <div class="accordion-item">
                                    <h3 class="accordion-header">
                                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                                        <span class="num">-</span>
                                        상품번호 ${saleDetail.product_num}번의 품질을 확인해보세요
                                      </button>
                                    </h3>
                                    <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                      <div class="accordion-body">
                                        <c:forEach items="${saleDetail.productFileVOs}" var="proFile">
                                          <img alt="" src="/file/membersFile/${proFile.fileName}">
                                        </c:forEach>  
                                      </div>
                                    </div>
                                  </div><!-- # Faq item-->
                                </div>
                              </div>
                            </div>
                          </div>
                        </section><!-- End Frequently Asked Questions Section -->
                      
                      </c:otherwise>
                    </c:choose>
              </div>
                
              <div class="d-flex" style="margin-left: 400px;">
                    <div class="text-center"   onclick="location.href='/kdy/saleList';">
                      <button type="submit" id="inquiryAddBtn">뒤로가기</button>
                    </div>

              </div>
          </div>
            </div>
        </div>
      </div>
    </div>
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>