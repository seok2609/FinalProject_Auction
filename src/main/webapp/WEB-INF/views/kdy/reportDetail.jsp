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
            <h2>${reportDetail.id}님이 ${reportDetail.report_id}님을 신고한 사유(내용) 입니다.</h2>
            </div>

            <div>
              <img src="/file/membersFile/${reportDetail.reportFileVOs[0].report_fileName}">
              ${reportDetail.reportFileVOs[0].report_fileName}
            </div>
 
            <div class="row gx-lg-0 gy-4" id="inquiryss">
            <div class="col-lg-8">
              
              <img alt="" src="/file/membersFile/${reportDetail.reportFileVOs[0].report_fileName}">

              <c:forEach items="${reportDetail.reportFileVOs}" var="reportFile">
                <img alt="" src="/file/membersFile/${reportFile.report_fileName}">
            </c:forEach>      

                <div class="form-group mt-3">
                   <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${reportDetail.report_contents}</textarea> 
                </div>
                <div onclick="location.href='/kdy/responseReportNo?report_id=${reportDetail.report_id}';">거절하기</div>
                <div onclick="location.href='/kdy/responseReportOk?report_id=${reportDetail.report_id}';">승인하기</div>
                <div onclick="location.href='/kdy/report';">뒤로가기</div>
            </div>
            
            
            </div>
        </div>
    </div>

        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>