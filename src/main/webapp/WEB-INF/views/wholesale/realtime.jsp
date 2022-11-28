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
<h1> Real Time List</h1>

<table class="table table-striped">
<thead>
<tr><th>saleDate</th><th>도매시장</th><th>법인</th><th>소분류</th></tr>
</thead>
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
</table>

<!-- ===========footer=============== -->
<c:import url="../common/footer.jsp"></c:import>
<!-- ================================ -->
</body>
</html>