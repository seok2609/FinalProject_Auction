<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"></c:import>
<script defer src="/js/myPage.js"></script>
<style>
       #inquiryListCss{
        color: tomato;
       }
       #md{
       	display: none;
       }
       
</style>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

	<form action="inquiryList" method="get">
	<%-- <sec:authentication property="Principal" var="member"/> --%>
	<div class="container-fluid">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-success">1대1 문의</h6>
                        </div>
                        <table class="table table-striped">
                            <thead>
                                <tr class="text-success">
                                	<th>글번호</th>
                                    <th>아이디</th>
                                    <th>제목</th>
                                    <th>문의 날짜</th>
                                    <th>처리 결과</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${inquiryList}" var="inquiryList">
								<input type="hidden" name="id" value="${param.id}">
                                       <tr onclick="location.href='/kdy/inquiryDetail?id=${inquiryList.id}&inquiry_num=${inquiryList.inquiry_num}';">
                            <c:choose>
	                            <c:when test="${empty inquiryList.inquiryResponseVO.inquiry_response_contents}">
                            		<!-- 관리자가 답변 안했을때 -->
	                            			<td>${inquiryList.inquiry_num}</td>
                                            <td>${inquiryList.id}</td>
                                            <td>${inquiryList.inquiry_text}</td>
                                            <td>${inquiryList.inquiry_date}</td>
	                            </c:when>
	                            <c:otherwise>
	                            	<!-- 관리자가 답변 했을때 -->
	                            			<td id="inquiryListCss">${inquiryList.inquiry_num}</td>
                                            <td id="inquiryListCss">${inquiryList.id}</td>
                                            <td id="inquiryListCss">${inquiryList.inquiry_text}</td>
                                            <td id="inquiryListCss">${inquiryList.inquiry_date}</td>
	                            </c:otherwise>
                            </c:choose>
                                            <c:choose>
                                            	<c:when test="${empty inquiryList.inquiryResponseVO.inquiry_response_contents}">
                                            		<td>미답변</td>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<td>답변완료</td>
                                            	</c:otherwise>
                                            </c:choose>
                                        </tr>        
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                  </div>
                  
                  
                  <!-- Button trigger modal -->
					<!-- <a ><button type="button" id="md" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  Launch demo modal
					</button></a>
					
					Modal
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        ...
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
					</div> -->
                  
</form>


<c:import url="../common/footer.jsp"></c:import>
</body>
</html>