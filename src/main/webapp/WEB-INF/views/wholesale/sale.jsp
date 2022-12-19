<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    #bu{
  display: none;
  color: #fff;
  background: #059652;
  text-align: center;
  padding: 15px;
  font-weight: 600;
    }

</style>
<script defer src="/js/wholesale/sale.js"></script>
</head>
<body>
    <!-- ===========header=============== -->
<c:import url="../common/header.jsp"></c:import>
<!-- ================================ -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
    $(function() {
      fn_default_datepicker();
  });
  </script>
<form action="fixData" method="get" id="frm">

    <section id="pricing" class="pricing sections-bg">
        <div class="container" data-aos="fade-up">
  
          <div class="section-header">
            <h2>경매 거래 정보</h2>
            <p>최근 3일간의 거래내역 조회가 가능합니다.</p>
          </div>

          <div class="row g-4 py-lg-5" data-aos="zoom-out" data-aos-delay="100">

                  <div class="pricing-item">
                    <c:if test="${!empty vo}">
                        <h3> ${vo[0].whsalName} 상세 경매 내역 </h3>
                      </c:if>
                      <c:if test="${empty vo}">
                      </c:if>

                    <table class="table table-hover" id="api">
                        <thead>
                            <tr>
                                <td>도매시장 : 
                                    <select name="whsalCd" id="whsalCd">
                                     <c:if test="${!empty vo}">
                                       <option value="${vo[0].whsalCd}" class="li">${vo[0].whsalName} 선택!</option>
                                     </c:if>
                                     <c:if test="${empty vo}">
                                       <option value="110001" class="li">선택해주세요</option>
                                     </c:if>
                                     <option value="110001" class="li">서울가락</option>
                                     <option value="311201" class="li">구리</option>
                                     <option value="240004" class="li">광주서부</option>
                                     <option value="250001" class="li">대전오정</option>
                                     <option value="220001" class="li">대구북부</option>
                                     <option value="210001" class="li">부산엄궁</option>
                                     <option value="210009" class="li">부산반여</option>
                                   </select>
                                   
                               </td>
                               <td>
                                 시작일<input type="text" id="datepicker_start" readonly="readonly" name="saleDateStart">
                              </td>
                               <td>
                                 마지막일<input type="text" id="datepicker_end" readonly="readonly" name="saleDateEnd">
                               </td>
                               <td>부류 : 
                                   <select name="largeCd" id="largeCd">
                                     <c:if test="${!empty vo}">
                                       <option value="${vo[0].large}" class="li">${vo[0].largeName} 선택!</option>
                                     </c:if>
                                     <c:if test="${empty vo}">
                                       <option value="">선택해주세요</option>
                                     </c:if>
                                      <option value="">전체</option>
                                       <option value="89">건제품</option>
                                       <option value="06">과실류</option>
                                       <option value="08">과일과채류</option>
                                       <option value="09">과채류</option>
                                       <option value="26">관엽식물류</option>
                                       <option value="11">근채류</option>
                                       <option value="47">기타동물생산물</option>
                                       <option value="28">기타화훼</option>
                                       <option value="83">냉동 해면갑각류</option>
                                       <option value="81">냉동 해면어류</option>
                                       <option value="84">냉동 해면연체류</option>
                                       <option value="91">농림가공</option>
                                       <option value="15">농산물 종자류</option>
                                       <option value="03">두류</option>
                                       <option value="17">버섯류</option>
                                       <option value="14">산채류</option>
                                       <option value="05">서류</option>
                                       <option value="93">수산가공</option>
                                       <option value="07">수실류</option>
                                       <option value="24">숙근류</option>
                                       <option value="73">신선 해면갑각류</option>
                                       <option value="75">신선 해면기타</option>
                                       <option value="71">신선 해면어류</option>
                                       <option value="74">신선 해면연체류</option>
                                       <option value="72">신선 해면패류</option>
                                       <option value="76">신선 해조류</option>
                                       <option value="19">약용작물류</option>
                                       <option value="13">양채류</option>
                                       <option value="10">엽경채류</option>
                                       <option value="18">인삼류</option>
                                       <option value="04">잡곡류</option>
                                       <option value="12">조미채소류</option>
                                       <option value="16">특용작물류</option>
                                       <option value="66">활 내수면어류</option>
                                       <option value="63">활 해면갑각류</option>
                                       <option value="65">활 해면기타</option>
                                       <option value="61">활 해면어류</option>
                                       <option value="64">활 해면연체류</option>
                                       <option value="62">활 해면패류</option>
                                   </select> 
                               </td>
                               <td>
                               </td>
                           </tr>
                         </form>
                           <tr>
                               <th>경매날짜</th>
                               <th>도매시장</th>
                               <th>판매법인</th>
                               <th>분류</th>
                           </tr>
                       </thead>
                       <div class="json_table">
   
                            <tbody>
                              <c:forEach items="${vo}" var="vos">
                              <tr>
                              <td>${vos.saleDate}</td>
                              <td>${vos.whsalName}</td>
                              <td>${vos.cmpName}</td>
                              <td>${vos.midName}</td>
                              </tr>
                              </c:forEach>
                              </tbody>
                         <tfoot>
                         </tfoot>
   
                       </div>
                       
                      </table>
                                                <!-- pagination start -->
<div class="chefs section-bg" style="padding-bottom: 10px;">
  <nav aria-label="Page navigation example">
    <ul class="pagination">
    <!-- 이전페이지가 없으면 	버튼 비활성화  -->
      <li class="page-item ${pager.pre?'':'disabled'}">
      <!-- page 파라미터가 조정되면 -- startNum/lastNum이 변경되어 출력 리스트가 변경됨 -->
      <!-- 1. page 파라미터 변경함으로써 다음 페이지 조정  -->
        <a class="page-link" href="./fixData?page=${pager.startNum-1}&whsalCd=${pager.whsalCd}&saleDateStart=${pager.saleDateStart}&saleDateEnd=${pager.saleDateEnd}&largeCd=${pager.largeCd}" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
        </a> 
      </li> 
      <!-- 조정된 다음 페이지를 기준으로 startNum t0 lastNum까지 반복문돌려 블럭 형성  -->
      <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
        <li class="page-item"><a class="page-link" href="./fixData?page=${i}&whsalCd=${pager.whsalCd}&saleDateStart=${pager.saleDateStart}&saleDateEnd=${pager.saleDateEnd}&largeCd=${pager.largeCd}" > ${i}</a> </li>
      </c:forEach> 
      <li class="page-item ${pager.next?'':'disabled'}">
        <a class="page-link" href="./fixData?page=${pager.lastNum+1}&whsalCd=${pager.whsalCd}&saleDateStart=${pager.saleDateStart}&saleDateEnd=${pager.saleDateEnd}&largeCd=${pager.largeCd}"  aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
<!-- pagination end --> 
              </div>
            </div><!-- End Pricing Item -->
        </div>
  
      </section>

   


<script>

  
$(document).ready(function(){
    
    $("#datepicker_start").on("click",function(){
        
    });
 
     $("#datepicker_start").on("change",function(e){
         var end = $( "#datepicker_end" ).datepicker( "option", "minDate", getDate( e.target ) );
     });
     
     $("#datepicker_end").on("change",function(e){
         
     });
     
     $("#date_search").on("click",function(){
         var start = $("#datepicker_start").val();
         var end = $("#datepicker_end").val();
     });    
});


</script>
<!-- ===========footer=============== -->
<c:import url="../common/footer.jsp"></c:import>
<!-- ================================ -->
</body>
</html>