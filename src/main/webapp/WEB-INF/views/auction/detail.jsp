<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script defer src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script defer src="http://localhost:3000/socket.io/socket.io.js"></script>
<style type="text/css">
#chat_box {
	width: 500px;
	min-width: 500px;
	height: 400px;
	min-height: 400px;
	border: 1px solid black;
}

#msg {
	width: 500px;
}

#msg_process {
	width: 90px;
}

</style>

</head>
<body>

<div>
	<video id="localVideo" autoplay width="500px"></video>
	<video id="remoteVideo" autoplay width="500px"></video>
</div>

<!-- <div>
	<button id="startButton">Start</button>
	<button id="callButton">Call</button>
	<button id="hangupButton">Hang UP</button>
</div>
 -->

<div id="chat_box"></div>
<input type="text" id="msg">
<button id="msg_process">전송</button>

<div>
	금액 : <input type="text">
	<button>매수 신청</button>
</div>

<script src="/static/js/auction/live.js"></script>
</body>
</html>