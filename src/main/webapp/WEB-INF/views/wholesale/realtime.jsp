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
<body>
<!-- ===========header=============== -->
<c:import url="../common/header.jsp"></c:import>
<!-- ================================ -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<form action="realtime" method="get" id="frm">

    <section id="pricing" class="pricing sections-bg">
        <div class="container" data-aos="fade-up">
  
          <div class="section-header">
            <h2>Real Time List</h2>
            <c:set var="today" value="<%=new java.util.Date()%>" />
            <c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 실시간 경매내역" /></c:set> 
             <p>데이터는 30분 간격으로 갱신됩니다.</p>
          </div>

          <div class="row g-4 py-lg-5" data-aos="zoom-out" data-aos-delay="100">

                  <div class="pricing-item">
                    <h3><c:out value="${date}" /></h3>
                    <div class="icon">
                      <i class="bi bi-water"></i>
                    </div>

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
                                 <!-- <select name="whsalCd" id="whsalCd"> -->
                                      <option value="110001" class="what">서울가락</option>
                                      <option value="311201" class="what">구리</option>
                                      <option value="240004" class="what">광주서부</option>
                                      <option value="250001" class="what">대전오정</option>
                                      <option value="220001" class="what">대구북부</option>
                                      <option value="210001" class="what">부산엄궁</option>
                                      <option value="210009" class="what">부산반여</option>
                                    </select>
                                   </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td></td><td></td>
                            </tr>
                          </form>
                            <tr>
                                <th>경락일시</th>
                                <th>도매시장</th>
                                <th>법인</th>
                                <th>분류</th>
                                <th>경락가</th>
                                <th>물량</th>
                            </tr>
                        </thead>
                        <div class="json_table">
                            <c:if test="${!empty vo}"> 
                          <tbody>
                            <c:forEach items="${vo}" var="vos">
                            <tr>
                            <td>${vos.sbidtime}</td>
                            <td>${vos.whsalName}</td>
                            <td>${vos.cmpName}</td>
                          
                            <td>${vos.midName}</td>
                            <td>${vos.cost}원</td>
                            <td>${vos.qty}Kg</td>
                            </tr>
                            </c:forEach>
                            </tbody>
                            </c:if>
                            <c:if test="${empty vo}"> 
                                <ul> 
                                  <li><i class="bi bi-check"></i>  No Real Time Data.</li>
                                </ul> 
                            </c:if>
                            
                        </div>
                    </table>
              </div>
            </div><!-- End Pricing Item -->
        </div>
  
      </section>

   

<!-- ===========footer=============== -->
<c:import url="../common/footer.jsp"></c:import>
<!-- ================================ -->
</body>

<script>

$("#whsalCd").change(function(){
    let val = $("#whsalCd").val();
    console.log("sss"+val);
    $.ajax({
	type:"get",
	url :"/wholesale/realtime",
	data:{
        whsalCd:val,
	},
    success: function(data){
        $("#frm").submit();
    
    },
    error: function(data){
    }
})
})

</script>
</html>