<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1>
	<sec:authentication property="Principal" var="member"/>
	<h3>아이디 : ${member.id}</h3>
	<h3>실명 : ${member.realName}</h3>
	<h3>닉네임 : ${member.nickName}</h3>
	
	<input type="text" value="${membersVO.membersFileVOs.size()}">
		<div class="mb-3" id="membersFileAddResult" data-file-size="${membersVO.membersFileVOs.size()}">
			<c:forEach items="${membersVO.membersFileVOs}" var="membersFileVO">
			
				<p>${membersFIleVO.oriName}
					<button type="button" class="deleteMemberFile" data-file-id="${membersFileVO.fileNum}">취소</button>
				</p>
				
			</c:forEach>
	
		</div>
			

</body>
</html>