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
	<table>
		<thead>
			<tr>
				<th>상품 번호</th><th>공급자</th><th>품명</th><th>품목</th><th>수량</th><th>출하지</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${vo.product_num}</td>
					<td>${vo.id}</td>
					<td>${vo.name}</td>
					<td>${vo.category}</td>
					<td>${vo.quantity}</td>
					<td>${vo.pickup_address}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script type="text/javascript">
		$.ajax({
			type:"post",
			
		})
	</script>
</body>
</html>