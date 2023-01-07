<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
    <script  defer src="/kdy/js/admin.js"></script>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

<div class="container" data-aos="fade-up" id="inquirySt">
        <div class="section-header">
          <h2>신고 요청</h2>
          <p>신고요청 페이지입니다. 자세한 사유를 작성해주시면 관리자가 처리하겠습니다. 감사합니다.</p>
        </div>

        <div class="row gx-lg-0 gy-4" id="inquiryss">
          <div class="col-lg-8">
            <form action="./reportRequest" method="post" id="frm" enctype="multipart/form-data" >
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="id" class="form-control" id="id" readonly value=${membersReportVO.id}>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="report_id" id="report_id" readonly value=${membersReportVO.report_id}>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="report_contents" id="report_contents" rows="7" placeholder="신고내용을 입력해주세요" required></textarea>
              </div>
              
              <div class="form-group mt-3">
                <label for="formFileSm" class="form-label bc">증거 사진 첨부 (선택)</label>
                <input class="form-control form-control-sm" id="reportFileAdd" name="files" type="file">
              </div>
              <div class="text-center" style="margin-top: 15px;">
                <button type="button"  class="btn btn-success" id="inquiryAddBtn" onclick="reportNullCheck()">신고하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!-- =--------------------------------------------------------------------------- -->
     
      <script src="../../../../resources/static/kdy/js/inquiryRequest.js"></script>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>