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

<div class="container" data-aos="fade-up" id="inquirySt">
        <div class="section-header">
          <h2>1 대 1 문의</h2>
          <p>1 대 1 문의페이지 입니다. 관리자의 답변을 기다려주시면 감사하겠습니다.</p>
        </div>

        <div class="row gx-lg-0 gy-4" id="inquiryss">
          <div class="col-lg-8">
            <form action="./inquiryRequest" method="post" enctype="multipart/form-data" >
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="id" class="form-control" id="id" readonly value=${adminMembersVO.id}>
                </div>
              </div>
              <div class="form-group mt-3">
                <input type="text" class="form-control" name="inquiry_text" id="inquiry_text" placeholder="간단하게 사유를 작성해 주세요." required>
              </div>
              <div class="form-group mt-3">
                <textarea class="form-control" name="inquiry_contents" id="inquiry_contents" rows="7" placeholder="문의하실 내용을 입력해주세요" required></textarea>
              </div>
              <div>
                <i class="fa-regular fa-image"></i>
                  <button type="button" id="reportFileAdd">파일추가</button>
              </div>


              <div class="text-center" id="inquiryAddBottonST">
                <button type="submit" id="inquiryAddBtn">문의하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      
      <script src="../../../../resources/static/kdy/js/inquiryRequest.js"></script>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>