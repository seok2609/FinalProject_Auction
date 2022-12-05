<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #inquirySt{
      margin-top: 50px;
      margin-bottom: 50px;
    }
    #inquiryss{
      margin-left: 350px;
    }
    #inquiryAddBottonST{
      margin-top: 50px;
    }
  </style>
</head>
<body>
    <c:import url="../common/header.jsp"></c:import>

    <div class="container-fluid">
        <div class="container" data-aos="fade-up" id="inquirySt">
            <div class="section-header">
            <h2>${blackDetail[0].report_id}님이 블랙당한 사유(내용) 입니다.</h2>
            </div>
              <button  id="blackCancel" onclick="location.href='/kdy/balckCancel?report_id=${blackDetail[0].report_id}';">블랙 해제</button>
              <button onclick="location.href='/kdy/memberBlackList';">뒤로가기</button>

            <div>
              <c:forEach items="${blackDetail}" var="blackDetails">
                <div>
                  <hr>
                  <h3>${blackDetails.id}님이 ${blackDetails.report_date}에 신고하였습니다.</h3>
                  <hr>
                  <div class="form-group mt-3">
                    <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${blackDetails.report_contents}</textarea>
                  </div>
            </div>
              </c:forEach>
            </div>
          
           
        </div>
    </div>
        <script src="js/inquiryRequest.js"></script>
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>