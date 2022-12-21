<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도매시장통합홈페이지</title>
<style>

  #m{

  font-size: 20px;
  display: block;
  font-weight: 700;
  color: var(--color-primary);
  line-height: 40px;

  }
</style>

</head>

<body>
<!-- ===========header=============== -->
<c:import url="./common/header.jsp"></c:import>
<!-- ================================ -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- chart js -->
<script defer src="/static/js/wholesale/chart.js"></script>


  <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero">
   		<!-- 로그인이 성공했다면 -->
   		<%-- <div style= "float: right;">
      	 	<sec:authorize access="isAuthenticated()">
      		
      			<sec:authentication property="Principal" var="member"/>
      		<h3> <spring:message code="welcome" arguments="${member.nickName}"></spring:message> </h3>
      		</sec:authorize>
      	</div> --%>
    <div class="container position-relative">
      <div class="row gy-5" data-aos="fade-in">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center text-center text-lg-start">
          <h2>도매 유통정보의 핵심 <br><span>도매시장 통합 홈페이지</span></h2>
          <p>전국 32개 공영도매시장에서 매일 수집되는 다양한 정보를 신속, 편리하게 제공하여<br>
            농산물의 유통효율화 향상을 위해 지원합니다.</p>
          <div class="d-flex justify-content-center justify-content-lg-start">
            <a href="http://192.168.1.28:4200" class="btn-get-started" target="_blank">실시간 경매 방송</a>
            <a href="https://www.youtube.com/watch?v=LXb3EKWsInQ" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2">
          <img src="assets/img/main_vegetable.png" class="img-fluid" alt="" data-aos="zoom-out" data-aos-delay="100">
        </div>
      </div>
    </div>

    <div class="icon-boxes position-relative">
      <div class="container position-relative">
        <div class="row gy-4 mt-5">
          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-easel"></i></div>
              <h4 class="title"><a href="./members/agree" class="stretched-link">일반회원 회원가입</a></h4>
            </div>
          </div>
          <!--End Icon Box -->

          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-gem"></i></div>
              <h4 class="title"><a href="" class="stretched-link">Sed ut perspiciatis</a></h4>
            </div>
          </div>
          <!--End Icon Box -->

          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-geo-alt"></i></div>
              <h4 class="title"><a href="/delivery/map" class="stretched-link">택배 위치</a></h4>
            </div>
          </div>
          <!--End Icon Box -->

          <div class="col-xl-3 col-md-6" data-aos="fade-up" data-aos-delay="500">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-command"></i></div>
              <h4 class="title"><a href="" class="stretched-link">Nemo Enim</a></h4>
            </div>
          </div>
          <!--End Icon Box -->


        </div>
      </div>
    </div>

    </div>
  </section>
  <!-- End Hero Section -->

  <main id="main">

    <!-- ======= Stats Counter Section ======= -->
    <section id="stats-counter" class="stats-counter">
      <div class="container" data-aos="fade-up">

        <div class="row gy-4 align-items-center">

          <div class="col-lg-6">
            <img src="assets/img/stats-img.svg" alt="" class="img-fluid">
          </div>

          <div class="col-lg-6">

            <div class="stats-item d-flex align-items-center">
              <span data-purecounter-start="0" data-purecounter-end="${whsal.totCnt}" data-purecounter-duration="1" class="purecounter"></span><p id="m">회!&nbsp;</p>
           
              <c:if test="${empty whsal.totCnt}">
                <p> 어제 일자의 경매 시장내역이 없습니다.</p>
              </c:if>
              <c:if test="${!empty whsal.totCnt}">
                <p> 어제 거래량이 가장 많았던 시장은 <strong>"${whsal.whsalName}"</strong></p>
              </c:if>
 
            </div><!-- End Stats Item -->

            <div class="stats-item d-flex align-items-center">
              <span data-purecounter-start="0" data-purecounter-end="${mid.dataCnt}" data-purecounter-duration="1" class="purecounter"></span><p id="m">회!&nbsp;</p>
			        <c:if test="${empty mid.dataCnt}">
                <p> 어제 일자의 경매 품목내역이 없습니다.</p>
              </c:if>
              <c:if test="${!empty mid.dataCnt}">
              <p> 어제 거래량이 가장 많았던 품목은 <strong>"${mid.midName}"</strong></p>
             
              </c:if>
        
            </div><!-- End Stats Item -->

             <div class="stats-item d-flex align-items-center">
              <span data-purecounter-start="0" data-purecounter-end="${totQty.totQty}" data-purecounter-duration="1" class="purecounter"></span><p id="m">톤!&nbsp;</p>
              <c:if test="${empty totQty.totQty}">
                <p> 어제 일자의 경매 물량내역이 없습니다.</p>
              </c:if>
              <c:if test="${!empty totQty.totQty}">
              <p> 어제 거래 총 물량은 </p>

              </c:if>
        
            </div><!-- End Stats Item -->
            
              <div class="stats-item d-flex align-items-center">
                <span data-purecounter-start="0" data-purecounter-end="${totAmt.totAmt}" data-purecounter-duration="1" class="purecounter"></span><p id="m">백만원!&nbsp;</p>
              <c:if test="${empty totAmt.totAmt}">
                <p> 어제 일자의 경매 금액내역이 없습니다.</p>
              </c:if>
              <c:if test="${!empty totAmt.totAmt}">
              <p> 어제 거래 총 금액은 </p>
              </c:if>
        
            </div><!-- End Stats Item -->

        </div>

      </div>
    </section><!-- End Stats Counter Section -->

    <!-- ======= Real Time ListSection ======= -->
    <section id="pricing" class="pricing sections-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>
          <c:set var="today" value="<%=new java.util.Date()%>" />
          <c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 실시간 경매내역" /></c:set> 
          
          <c:out value="${date}" />
         </h2>
           <p>데이터는 30분 간격으로 갱신됩니다.</p>
        </div>
        <div class="row g-4 py-lg-5" data-aos="zoom-out" data-aos-delay="100">

              <div class="col-lg-4">
                <div class="pricing-item">
                  <h3>Busan</h3>
                  <div class="icon">
                    <i class="bi bi-water"></i>
                  </div>
              
                <c:if test="${!empty busan}">
                  <table class="table table-hover">
                    <tbody>
                  <c:forEach items="${busan}" var="vos">
                    <tr>
                      <td>${vos.cmpName}</td>
                      <td>${vos.midName}</td>
                      <td>${vos.qty}개</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                </c:if>
                <c:if test="${empty busan}">
                  <ul>
                    <li><i class="bi bi-check"></i>  No Real Time Data.</li></ul>
              
                </c:if>
            </div>
          </div><!-- End Pricing Item -->

          <div class="col-lg-4">
            <div class="pricing-item featured">
              <h3>Seoul</h3>
              <div class="icon">
                <i class="bi bi-building"></i>
              </div>
              <c:if test="${!empty seoul}">
                <table class="table table-hover">
                  <tbody>
                <c:forEach items="${seoul}" var="vos">
                  <tr>
                    <td>${vos.cmpName}</td>
                    <td>${vos.midName}</td>
                    <td>${vos.qty}개</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              </c:if>
              <c:if test="${empty seoul}">
                <ul>
                  <li><i class="bi bi-check"></i>  No Real Time Data.</li></ul>
            
              </c:if>
              <div class="text-center"><a href="/wholesale/realtime" class="buy-btn">go to Detail</a></div>
            </div>
          </div><!-- End Pricing Item -->

          <div class="col-lg-4">
            <div class="pricing-item">
              <h3>Deagu</h3>
              <div class="icon">
                <i class="bi bi-apple"></i>
              </div>
              <c:if test="${!empty deagu}">
                  <table class="table table-hover">
                    <tbody>
                  <c:forEach items="${deagu}" var="vos">
                    <tr>
                    <td>${vos.cmpName}</td>
                    <td>${vos.midName}</td>
                    <td>${vos.qty}개</td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
                </c:if>
                <c:if test="${empty deagu}">
                  <ul>
                    <li><i class="bi bi-check"></i>  No Real Time Data.</li></ul>
              
                </c:if>
      
            </div>
          </div><!-- End Pricing Item -->

        </div>

      </div>
    </section><!-- Real Time List Section -->

    <!-- ======= Chart Section ======= -->
    <input type="hidden" id="b1Name" value="${best[0].midName}">
    <input type="hidden" id="b2Name" value="${best[1].midName}">
    <input type="hidden" id="b3Name" value="${best[2].midName}">
    <input type="hidden" id="b1Cnt" value="${best[0].dataCnt}">
    <input type="hidden" id="b2Cnt" value="${best[1].dataCnt}">
    <input type="hidden" id="b3Cnt" value="${best[2].dataCnt}">

    <input type="hidden" id="w1Name" value="${bestW[0].whsalName}">
    <input type="hidden" id="w2Name" value="${bestW[1].whsalName}">
    <input type="hidden" id="w3Name" value="${bestW[2].whsalName}">
    <input type="hidden" id="w4Name" value="${bestW[3].whsalName}">
    <input type="hidden" id="w5Name" value="${bestW[4].whsalName}">
    <input type="hidden" id="w6Name" value="${bestW[5].whsalName}">
    <input type="hidden" id="w1Cnt" value="${bestW[0].totCnt}">
    <input type="hidden" id="w2Cnt" value="${bestW[1].totCnt}">
    <input type="hidden" id="w3Cnt" value="${bestW[2].totCnt}">
    <input type="hidden" id="w4Cnt" value="${bestW[3].totCnt}">
    <input type="hidden" id="w5Cnt" value="${bestW[4].totCnt}">
    <input type="hidden" id="w6Cnt" value="${bestW[5].totCnt}">
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>Chart</h2>
          <p>정산 경매 내역</p>
         
        </div>

        <div class="row gy-4">
          <div class="col-lg-6">
            <h3>Best item</h3>
            <!--여기에차트-->
            <div>
              <canvas id="myPieChart"></canvas>
              <div id="js-legend" class="chart-legend"></div>
            </div>
          </div>
          <div class="col-lg-6">
            <div>
              <canvas id="myChart"></canvas>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Chart Section -->

  </main><!— End #main —>

<!— ===========footer=============== —>
<c:import url="./common/footer.jsp"></c:import>
<!-- ================================ -->

</body>

</html>