<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ===========header=============== -->
<c:import url="../common/header.jsp"></c:import>
<!-- ================================ -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<h1> Real Time List</h1>

<form action="realtime" method="get" id="frm">
    <table class="table table-striped" id="api">
     <thead>
         <tr>
             <td>도매시장 : 
            
                 <select name="whsalCd" id="whsalCd">
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
                 <button type="button" id="btn">검색</button>
             </td>
         </tr>
       </form>
         <tr>
             <th>saleDate</th>
             <th>도매시장</th>
             <th>법인</th>
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
          <a class="page-link" href="./realtime?page=${pager.startNum-1}&whsalCd=${pager.whsalCd}" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a> 
        </li> 
        <!-- 조정된 다음 페이지를 기준으로 startNum t0 lastNum까지 반복문돌려 블럭 형성  -->
        <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
          <li class="page-item"><a class="page-link" href="./realtime?page=${i}&whsalCd=${pager.whsalCd}" > ${i}</a> </li>
        </c:forEach> 
        <li class="page-item ${pager.next?'':'disabled'}">
          <a class="page-link" href="./realtime?page=${pager.lastNum+1}&whsalCd=${pager.whsalCd}"  aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
  <!-- pagination end --> 
<!-- ===========footer=============== -->
<c:import url="../common/footer.jsp"></c:import>
<!-- ================================ -->
</body>

<script>

$("#btn").click(function(){
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
        console.log("sss"+val);
        $("#whsalCd").val(val).prop("selected", true);
    },
    error: function(data){

    }
})

})

</script>
</html>