<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="/js/role.js"></script>
<c:import url="../temp/boot.jsp"></c:import>
<style>
	.fc{
		cursor: pointer;
	}
	
	.rc{
		display: none;
	}
</style>
</head>
<body>
<!-- ===========header=============== -->
<c:import url="../common/header.jsp"></c:import>
<!-- ================================ -->

<section id="hero" class="hero">
		<div class="icon-boxes position-relative">
		      <div class="container position-relative">
		        <div class="row gy-4 mt-5">
		
		<form method="get" action="signUpC" id="getC" class="fc">
		          <div class="col-xl-3 col-md-3" data-aos="fade-up" data-aos-delay="100" id="rdc">
		            <div class="icon-box">
		              <div class="icon"><i class="bi bi-easel"></i></div>
		              <h4 class="title"><a class="stretched-link">제조업자 회원가입</a></h4>
		              <input type="radio" class="rc" name="roleNum" value="2" id="rd1" checked="">
		            </div>
		          </div>
		          
		</form>
		          <!--End Icon Box -->
		
		<form action="signUpD" method="get" id="getD" class="fc">
		          <div class="col-xl-3 col-md-3" data-aos="fade-up" data-aos-delay="200" id="rdd">
		            <div class="icon-box">
		              <div class="icon"><i class="bi bi-gem"></i></div>
		              <h4 class="title"><a class="stretched-link">도매업자 회원가입</a></h4>
		              <input type="radio" class="rc" name="roleNum" value="3" id="rd2" checked="">
		            </div>
		          </div>
		          
		</form>
		          <!--End Icon Box -->
		
		<form action="signUpG" method="get" class="fc" id="getG">
		          <div class="col-xl-3 col-md-3" data-aos="fade-up" data-aos-delay="300" id="rdg">
		            <div class="icon-box">
		              <div class="icon"><i class="bi bi-geo-alt"></i></div>
		              <h4 class="title"><a class="stretched-link">경매사 회원가입</a></h4>
		               <input type="radio" class="rc" name="roleNum" value="4" id="rd3" checked="">
		            </div>
		          </div>
		          
		</form>
		          <!--End Icon Box -->
		
		<form action="signUpS" method="get" class="fc" id="getS">
		          <div class="col-xl-3 col-md-3" data-aos="fade-up" data-aos-delay="400" id="rds">
		            <div class="icon-box">
		              <div class="icon"><i class="bi bi-command"></i></div>
		              <h4 class="title"><a class="stretched-link">소매업자 회원가입</a></h4>
		               <input type="radio" class="rc" name="roleNum" value="5" id="rd4" checked="">
		            </div>
		          </div>
		          
		</form>
		          <!--End Icon Box -->
		          
		<form action="signUp" method="get" class="fc" id="getM">
		          <div class="col-xl-3 col-md-3" data-aos="fade-up" data-aos-delay="500" id="rdm">
		            <div class="icon-box">
		              <div class="icon"><i class="bi bi-command"></i></div>
		              <h4 class="title"><a class="stretched-link">일반회원 회원가입</a></h4>
		               <input type="radio" class="rc" name="roleNum" value="7" id="rd5" checked="">
		            </div>
		          </div>
		</form>
		
		
		
		        </div>
		      </div>
		    </div>
		   </section>

<!— ===========footer=============== —>
<c:import url="../common/footer.jsp"></c:import>
<!— ================================ —>

</body>
</html>