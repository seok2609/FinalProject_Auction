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
<script src="http://localhost:3000/socket.io/socket.io.js"></script>

<style type=”text/css”>
	body {
	  margin: 0;
	  font-size: 20px;
	}

	.centered {
	  position: absolute;
	  top: 40%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	}

	.video-position {
	  position: absolute;
	  top: 35%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	}

	#video-chat-container {
	  width: 100%;
	  background-color: black;
	}

	#local-video {
	  position: absolute;
	  height: 30%;
	  width: 30%;
	  bottom: 0px;
	  left: 0px;
	}

	#remote-video {
	  height: 100%;
	  width: 100%;
	}

	#chat_box {
		width: 800px;
		min-width: 800px;
		height: 500px;
		min-height: 500px;
		border: 1px solid black;
	}
	#msg {
		width: 700px;
	}
	#msg_process {
		width: 90px;
	}

</style>


</head>
<body>
	
	
	<div id="room-selection-container" class="centered">
		<label>방번호 입력</label>
		<input id="room-input" type="text" />
		<button id="connect-button">CONNECT</button>
	</div>
  
	<div id="video-chat-container" class="video-position" style="display: none;">
		<video id="local-video" autoplay="autoplay"></video>
		<video id="remote-video" autoplay="autoplay"></video>
	</div> 
	


	<div id="chat_box" style="width: 800px;
		min-width: 800px;
		height: 500px;
		min-height: 500px;
		border: 1px solid black;"></div>

	<input type="text" id="msg">
	<button id="msg_process">전송</button>

	<div>
		<form id="frm">
			금액 : <input type="text" id="price">
			<button id="addPrice">매수 신청</button>
		</form>
	</div>

<script src="/static/js/auction/live.js"></script>
</body>
</html>