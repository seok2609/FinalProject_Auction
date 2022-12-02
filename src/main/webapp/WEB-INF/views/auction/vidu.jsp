<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<title>Insert title here</title>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="/static/openvidu/app.js"></script>
<script src="/static/openvidu/webcomp/openvidu-browser-2.24.0.js"></script>
<script type="application/octet-stream" src="/static/openvidu/app/app.component.ts"></script>
<script type="application/octet-stream" src="/static/openvidu/app/app.module.ts"></script>
<link rel="styleSheet" href="/static/openvidu/webcomp/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="/"><img class="demo-logo" src="resources/images/openvidu_vert_white_bg_trans_cropped.png"/> JS</a>
				<a class="navbar-brand nav-icon" href="https://github.com/OpenVidu/openvidu-tutorials/tree/master/openvidu-js" title="GitHub Repository" target="_blank"><i class="fa fa-github" aria-hidden="true"></i></a>
				<a class="navbar-brand nav-icon" href="http://www.docs.openvidu.io/en/stable/tutorials/openvidu-js/" title="Documentation" target="_blank"><i class="fa fa-book" aria-hidden="true"></i></a>
			</div>
		</div>
	</nav>

	<div id="main-container" class="container">
		<div id="join">
			<div id="img-div"><img src="resources/images/openvidu_grey_bg_transp_cropped.png" /></div>
			<div id="join-dialog" class="jumbotron vertical-center">
				<h1>Join a video session</h1>
				<form class="form-group" onsubmit="joinSession(); return false">
					<p>
						<label>Participant</label>
						<input class="form-control" type="text" id="userName" required>
					</p>
					<p>
						<label>Session</label>
						<input class="form-control" type="text" id="sessionId" required>
					</p>
					<p class="text-center">
						<input class="btn btn-lg btn-success" type="submit" name="commit" value="Join!">
					</p>
				</form>
			</div>
		</div>

		<div id="session" style="display: none;">
			<div id="session-header">
				<h1 id="session-title"></h1>
				<input class="btn btn-large btn-danger" type="button" id="buttonLeaveSession" onmouseup="leaveSession()" value="Leave session">
			</div>
			<div id="main-video" class="col-md-6"><p></p><video autoplay playsinline="true"></video></div>
			<app-root>
				
			</app-root>
			<div id="video-container" class="col-md-6"></div>
		</div>
	</div>

	<footer class="footer">
		<div class="container">
			<div class="text-muted">OpenVidu © 2022</div>
			<a href="http://www.openvidu.io/" target="_blank"><img class="openvidu-logo" src="resources/images/openvidu_globe_bg_transp_cropped.png"/></a>
		</div>
	</footer>
    
    
</body>
</html>