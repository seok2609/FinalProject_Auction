<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Spring Boot WebRTC Demo</title>
    <link href="/static/cgh/css/styles.css" rel="stylesheet" type="text/css">
</head>
<body onbeforeunload="disconnect();">
<div id="selectedVideosContainer">
    <video id="remoteView"></video>
    <video id="selfView"></video>
</div>
<div id="remoteVideosContainer"></div>

<script src='/static/cgh/js/adapter-latest.js'></script>
<script src='/static/cgh/js/main.js'></script>
</body>
</html>