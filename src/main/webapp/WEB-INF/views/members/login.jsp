<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer type="text/javascript" src="/js/test.js"></script>
</head>
<body>
<section class="container-fluid col-lg-10 mt-5">
	<h1>로그인 페이지</h1>
	
<%-- 	<form>
	  <input autocomplete="one-time-code" required />
	  <input type="submit" />
	</form> --%>
	
	<form action="login" method="post">
	
		<div class="mb-3">
			 <label for="id" class="form-label">ID</label>
			 <input type="text" name="id" class="form-control" id="id" placeholder="ID를 입력하세요">
		</div>
		
		<div class="mb-3">
			 <label for="passWord" class="form-label">pw</label>
			 <input type="password" name="passWord" class="form-control" id="passWord">
		</div>
		
		<button type="submit" class="btn btn-primary">로그인</button>
	
	</form>
	
	
	
	
</section>
</body>
</html>