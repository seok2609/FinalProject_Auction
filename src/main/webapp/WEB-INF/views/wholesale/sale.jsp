<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .ui-block-a {
    margin-right: 10px;
  }
  .ui-block-a{
    margin-right: 10px;
  }
</style>
</head>
<body>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
        
  $(function() {
          fn_default_datepicker();
  });
          
  function fn_default_datepicker()
  {
      var start = $( "#datepicker_start" ).datepicker({
          dateFormat: 'yymmdd' //Input Display Format 변경
          ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
          ,changeYear: false //콤보박스에서 년 선택 가능
          ,changeMonth: true //콤보박스에서 월 선택 가능                
          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
          ,buttonImage: "/assets/img/calendar3.svg" //버튼 이미지 경로
          ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
          ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
          ,minDate: "-3D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "0M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                 
      });
          
      var end = $( "#datepicker_end" ).datepicker({
          dateFormat: 'yymmdd' //Input Display Format 변경
          ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
          ,changeYear: false //콤보박스에서 년 선택 가능
          ,changeMonth: true //콤보박스에서 월 선택 가능                
          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
          ,buttonImage: "/assets/img/calendar3.svg" //버튼 이미지 경로
          ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
          ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
          ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
          ,minDate: "0M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "0M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)    
             ,defaultDate: "+1w"
        });
      
      //초기값을 오늘 날짜로 설정
      $('#datepicker_start').datepicker('setDate', '-3D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
      $('#datepicker_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
  }
   
  function getDate( element ) {
      var date;
      var dateFormat = "yymmdd";
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
      return date;
   }
   
      </script>

<!-- ===========header=============== -->
<c:import url="../common/header.jsp"></c:import>
<!-- ================================ -->
<h1> Real Time List</h1>
<form action="sale" method="post">

 <table class="table table-striped" id="api">
  <thead>
      <tr>
          <td>도매시장 : 
              <select name="whsalCd" id="whsalCd">
                <option value="110001">서울가락</option>
                <option value="311201">구리</option>
                <option value="240004">광주서부</option>
                <option value="250001">대전오정</option>
                <option value="220001">대구북부</option>
                <option value="210001">부산엄궁</option>
                <option value="210009">부산반여</option>
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
              <button type="submit" >검색</button>
          </td>
      </tr>
    </form>
      <tr>
          <th>saleDate</th>
          <th>도매시장</th>
          <th>법인</th>
          <th>소분류</th>
      </tr>
  </thead>
  <div class="json_table">
    <tbody>
      <c:forEach items="${vo}" var="vos">
      <tr>
      <td>${vos.saleDate}</td>
      <td>${vos.whsalName}</td>
      <td>${vos.cmpName}</td>
      <td>${vos.smallName}</td>
      </tr>
      </c:forEach>
      </tbody>

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
            <a class="page-link" href="./saleDB?page=${pager.startNum-1}&whsalCd=${pager.whsalCd}&whsalCd=${pager.whsalCd}&whsalCd=${pager.whsalCd}" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a> 
          </li> 
          <!-- 조정된 다음 페이지를 기준으로 startNum t0 lastNum까지 반복문돌려 블럭 형성  -->
          <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
            <li class="page-item"><a class="page-link" href="./list?page=${i}&search=${pager.search}"> ${i}</a> </li>
          </c:forEach> 
          <li class="page-item ${pager.next?'':'disabled'}">
            <a class="page-link" href="./list?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
    <!-- pagination end --> 

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
   

//   $("#datepicker_end").datepicker({beforeShow: customRange});
// function customRange(input) {
//     if($("#datepicker_start").val() ==''){   
//         alert('시작일을 먼저 선택하세요');       
//         return false;
//     }
//     var max_date  = $("#datepicker_start").datepicker('getDate');
//     max_date.setDate(max_date.getDate()+3); // 가져온시작일에서 +7일추가
//     var min_date = '+0';
//     return { minDate: min_date,maxDate: max_date};
// }

  </script>
<!-- ===========footer=============== -->
<c:import url="../common/footer.jsp"></c:import>
<!-- ================================ -->
</body>
</html>