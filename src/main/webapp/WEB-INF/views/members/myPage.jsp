<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script defer src="/js/membersFile.js"></script> -->
</head>
<body>
	<h1>마이페이지</h1>
	<sec:authentication property="Principal" var="member"/>
	<h3>아이디 : ${member.id}</h3>
	<h3>실명 : ${member.realName}</h3>
	<h3>닉네임 : ${member.nickName}</h3>

	
 	<form action="myPage" method="get" enctype="multipart/form-data">
 	
		<input type="text" value="${membersVO.id}" name="id">
		<input type="text" value="${member.id}" name="id">
		<input type="text" value="${membersFileVO.oriName}" name="oriName">
		
		<div>
			
			<div>
			
					<c:forEach items="${membersVO.membersFileVOs}" var="membersFileVO">
						${membersFileVO.fileName}
						<img alt="" src="/file/membersFile/${membersFileVO.fileName}">
						
					
					</c:forEach>
					
			</div>
			
		</div>
		
		<input type="text" value="${membersVO.membersFileVOs.size()}">
			<div class="mb-3" id="membersFileAddResult" data-file-size="${membersVO.membersFileVOs.size()}">
				<c:forEach items="${membersVO.membersFileVOs}" var="membersFileVO">
				
					<p>${membersFileVO.oriName}
						<button type="button" class="deleteMemberFile" data-file-id="${membersFileVO.fileNum}">취소</button>
					</p>
					
				</c:forEach>
		
			</div>
		</form> 

</body>
</html>