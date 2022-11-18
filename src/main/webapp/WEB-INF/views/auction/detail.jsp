<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="https://unpkg.com/peerjs@1.4.7/dist/peerjs.min.js"></script>
<script src="http://192.168.1.28:3000/socket.io/socket.io.js"></script>

<style type=”text/css”>
	
	#chat_box {
		width: 500px;
		min-width: 500px;
		height: 500px;
		min-height: 500px;
		border: 1px solid black;
		float : right;
	}
	#msg {
		width: 700px;
		float: right;
	}
	#msg_process {
		width: 90px;
		float: right;
	}

	#video-grid {
		display: grid;
		grid-template-columns: repeat(auto-fill,300px);
		grid-auto-rows: 300px;
	}

	video {
		width: 100%;
		height: 100%;
		object-fit: cover;
	}

</style>

<c:import url="../common/header.jsp"></c:import>
</head>
<body>
	
	
	<div id="video-grid"></div>
	


	<div id="chat_box" style="width: 500px;
		min-width: 500px;
		height: 500px;
		min-height: 500px;
		border: 1px solid black; float: right"></div>
	<div>
		<input type="text" id="msg" style="width: 500px;
					float: right;">
		<button id="msg_process" style="width: 90px;
				float: right;">전송</button>
	</div>
	<div>
		<form id="frm">
			금액 : <input type="text" id="price">
			<button id="addPrice">매수 신청</button>
		</form>
	</div>

<script src="/static/js/auction/live.js"></script>
</body>
</html>