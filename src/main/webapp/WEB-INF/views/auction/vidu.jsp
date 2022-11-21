<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <!-- Form to connect to a video-session -->
    <div id="main" style="text-align: center;">
        <h1>Join a video session</h1>
        <form onsubmit="joinSession(); return false" style="padding: 80px; margin: auto">
            <p>
                <label>Session:</label>
                <input type="text" id="sessionName" value="SessionA" required>
            </p>
            <p>
                <label>User:</label>
                <input type="text" id="user" value="User1">
            </p>
            <p>
                <input type="submit" value="JOIN">
            </p>
        </form>
    </div>

    <!-- OpenVidu Web Component -->
    <!-- <openvidu-webcomponent style="height: 100%;"></openvidu-webcomponent>  -->
</body>
</html>