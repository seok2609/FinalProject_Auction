<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        #information{
            font-size: 17px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <c:import url="../common/header.jsp"></c:import>
    <div id="contact" class="contact">
        <div class="container" data-aos="fade-up">
          <div class="section-header" style="margin-top: 90px;">
            <h2>${membersDetail.id}님의 회원정보 입니다.</h2>
          </div>
          <div class="row gx-lg-0 gy-4 ">

           <div style="height: 50px;">
               <div class="d-flex">
                 <div class="info-item d-flex" onclick="location.href='/kdy/inquiryList?inquirySearch=${membersDetail.id}';">
                     <i class="bi bi-envelope flex-shrink-0"></i>
                     <div>
                       <h4 style="padding-top: 5px;">${membersDetail.id}님의 1대1문의 내역 보러가기</h4>
                     </div>
                 </div><!-- End Info Item -->
 
                 <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div>
                     <h4 style="padding-top: 5px;">${membersDetail.id}님의 프로필사진</h4>
                   </div>
                 </div><!-- End Info Item -->
                   <div class="info-item d-flex">
                   <i class="bi bi-envelope flex-shrink-0"></i>
                   <div >
                    <h5 style="margin-bottom: 5px;">${membersDetail.id}님의 등급은</h5>
                    <p style="font-weight: bolder; font-size: 17px;">${membersDetail.membersVO.roleVO.roleName} 입니다.</p>
                   </div>
                 </div>
               </div>
           </div>
  
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">
                <div class="row">
                  <div class="col-md-4 form-group">
                    <input type="text" name="name" class="form-control" id="information" style="border: 0;" readonly value="아이디 : ${membersDetail.id}">
                  </div>
                  <div class="col-md-4 form-group mt-3 mt-md-0">
                    <input type="text" class="form-control" name="email" id="information" style="border: 0;" readonly value="닉네임 : ${membersDetail.membersVO.nickName}">
                  </div>
                  <div class="col-md-4 form-group mt-3 mt-md-0">
                    <input type="text" class="form-control" name="email" id="information" style="border: 0;" readonly value="성함 : ${membersDetail.membersVO.realName}">
                  </div>
                </div><hr>
                <div class="row">
                    <div class="col-md-6 form-group">
                      <input type="text" class="form-control" name="subject" id="information" style="border: 0;" readonly value="이메일 : ${membersDetail.membersVO.email}">
                    </div>
                    <div class="col-md-6 form-group">
                        <input type="text" class="form-control" name="subject" id="information" style="border: 0;" readonly value="전화번호 : ${membersDetail.membersVO.phone}">
                      </div>
                </div><hr>
                  <div class="row">
                    <div class="col-md-6 form-group">
                        <input type="text" name="name" class="form-control" id="information" style="border: 0;" readonly value="생년월일 : ${membersDetail.membersVO.birth}">
                      </div>
                      <div class="col-md-6 form-group">
                        <input type="text" name="name" class="form-control" id="information" style="border: 0;" readonly value="가입일 : ${membersDetail.membersVO.joinDate}">
                      </div>
                  </div>
            </div>
          </div> 
        </div>
  </div>
    <c:import url="../common/footer.jsp"></c:import>
</body>
</html>