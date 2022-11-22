<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.2/dist/umd/popper.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/js/tempus-dominus.js"></script>

    <link href="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/css/tempus-dominus.css"
          rel="stylesheet">
          <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          rel="stylesheet">

<c:import url="../common/header.jsp"></c:import>
</head>
<body>	
	<div class="container row" style="float: none; margin:0 auto; margin-top: 100px; margin-bottom: 100px;">
		<form class="row g-3">
		  <div class="col-md-6">
		    <label for="title" class="form-label">경매 제목</label>
		    <input type="text" class="form-control" id="title" name="title">
		  </div>
		  <div class="col-md-6">
		    <label for="inputPassword4" class="form-label">상품 선택</label><br>
		    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">경매 가능 상품보기</button>
		  </div>
		  <!-- Scrollable modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" id="exampleModal">
				  <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary">Save changes</button>
				      </div>
				    </div>
				</div>
		  	</div>
		  <div class="col-md-6">
		    <label for="headCount" class="form-label">허용 인원 수</label>
		    <select class="form-select" aria-label="Default select example" name="head_count">
			  <option selected>선택</option>
			  <option value="1">5명</option>
			  <option value="2">6명</option>
			  <option value="3">7명</option>
			  <option value="3">8명</option>
			  <option value="3">9명</option>
			  <option value="3">10명</option>
			</select>
		  </div>
		  <div class="col-md-6">
		  	<span></span><br>
		  	* 경매 허용 인원 수는 최소 5명, 최대 10명 입니다.
		  </div>
		  <div class="col-12">
		    <label for="inputAddress2" class="form-label">내용</label>
		    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
		  </div>
		  <div class="col-md-6">
		    <label for="inputCity" class="form-label">City</label>
		    <input type="text" class="form-control" id="inputCity">
		  </div>
		  <div class="col-md-4">
		    <label for="inputState" class="form-label">State</label>
		    <select id="inputState" class="form-select">
		      <option selected>Choose...</option>
		      <option>...</option>
		    </select>
		  </div>
		  <div class="col-md-2">
		    <label for="inputZip" class="form-label">Zip</label>
		    <input type="text" class="form-control" id="inputZip">
		  </div>
		  <div class="col-12">
		    <div class="form-check">
		      <input class="form-check-input" type="checkbox" id="gridCheck">
		      <label class="form-check-label" for="gridCheck">
		        Check me out
		      </label>
		    </div>
		  </div>
		  
		  <div class="mb-3">
			  <label for="formFile" class="form-label"></label>
			  <input class="form-control" type="file" id="formFile">
		  </div>
		  
		  
		<div class='col-md-6' id='datetimepicker1' data-td-target-input='nearest' data-td-target-toggle='nearest'>
		   <label for="datetimepicker1Input" class="form-label">경매 시간 선택</label>
		   <input id='datetimepicker1Input' type='text' class='form-control'data-td-target='#datetimepicker1' name="start_date"/>
		   <span class='input-group-text' data-td-target='#datetimepicker1' data-td-toggle='datetimepicker'>
		     <span class='fa-solid fa-calendar'></span>
		   </span>
		 </div>
		  <div class="col-12">
		    <button type="submit" class="btn btn-primary">경매 신청</button>
		  </div>
	</form>
		
	</div>
		
	<c:import url="../common/footer.jsp"></c:import>
	<script type="text/javascript">
	new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
	    display: { 
	        components: {
	            seconds: false,
	            useTwentyfourHour: false,
	        },
	        icons: {
	            type: 'icons',
	            time: 'fa fa-solid fa-clock',
	            date: 'fa fa-solid fa-calendar',
	            up: 'fa fa-solid fa-arrow-up',
	            down: 'fa fa-solid fa-arrow-down',
	            previous: 'fa fa-solid fa-chevron-left',
	            next: 'fa fa-solid fa-chevron-right',
	            today: 'fa fa-solid fa-calendar-check',
	            clear: 'fa fa-solid fa-trash',
	            close: 'fas fa-solid fa-xmark'
	        },
	    },
	});
	</script>
</body>
</html>