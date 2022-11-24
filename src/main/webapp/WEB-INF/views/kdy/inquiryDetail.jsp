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
    <c:import url="../common/header.jsp"></c:import>
    <!-- Begin Page Content -->
    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-success">1대1 문의</h6>
            </div>
            <table class="table table-striped">
                <thead>
                    <tr class="text-success">
                        <th>아이디</th>
                        <th>제목</th>
                        <th>문의 날짜</th>
                        <th>처리 결과</th>
                        <th>문의 내용</th>
                    </tr>
                </thead>
                <tbody>
                            <tr>
                                <td>${inquiryDetail.id}</td>
                                <td>${inquiryDetail.inquiry_text}</td>
                                <td>${inquiryDetail.inquiry_date}</td>
                                <td>${inquiryDetail.inquiry_response}</td>
                                <td>${inquiryDetail.inquiry_contents}</td>
                            </tr>       
                </tbody>
            </table>
        </div>
        </div>
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>