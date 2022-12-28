<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <title>도매시장 경매방송</title>
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <%-- <c:import url="../template/boot.jsp"></c:import> --%>
  <link href="/static/css/reset.css" rel="stylesheet">
  <link href="/static/css/auction/chat.css" rel="stylesheet">
  <link rel="stylesheet" media="only screen and (min-width:200px) and (max-width:480px)" href="/static/css/auction/liveAuctionM.css">
  <!-- <link href="/images/miniLogo_BidCoin.png" rel="shortcut icon" type="image/x-icon"> -->
  <link rel="stylesheet" href="/static/css/auction/getHTMLMediaElement.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

</head>
<body>
  
  <c:import url="../common/header.jsp"></c:import>
  
  <!-- ==========================관리자============================================ -->
  <sec:authorize access="hasRole('ROLE_ADMIN')">
  
  <sec:authentication property="Principal" var="user"/>
  <section class="" style="padding-top: 20px;">
  
  <div class="section-header" style="margin-top: 90px;">
            <h2>관리자 - 경매방송 관리</h2>
  </div>
  <div>
	<div>
		<p id="real">현재 경매를 진행하고 있지 않습니다..</p>
	</div>
		
    <!-- 방송 시작 부분 -->
		<div id="videos-container" style="margin: 20px 0;">
			<div id="media-container" class = "media-container shadowBox col-sm-12">
				<div id="media-broadcast">
					<div id="media-header" >
						<div id="media-title">
							<h2 id="media-titleText"></h2>
						</div>
						<div id="item">
			          	  	<span id="selecteditem"></span>
			         	</div>  
					</div>
				
					<div id="media-box" class="media-box" style="position: relative;">
						<div id= "blackVideo" style="width: 100%; height: 100%; color: #a8a8a8; display:flex; align-items: center; justify-content: center;">
							<div>현재 실시간 경매를 진행하고 있지 않습니다.</div>
						</div>
						<video id="localVideo" autoplay playsinline style="left: 50%;" ></video>
						
						
						<div id = "mediaControls" style="width: 100%;  position: absolute;">
						
							<div id="muteVideo" style="width: 35px; height: 35px;"></div>
							<div id="mute-audio" style="width: 35px; height: 35px;"></div>
							<div id="volume-slider" style="width: 35px; height: 35px;"></div>
							<div id="zoom" style="width: 35px; height: 35px; float: right;"></div>
						</div>
						
					</div>
					
					
				</div>
				
		
        <div class="chat-container">	
			<div id= "chat-header" >
	          <div id="text">
	            <span id="final">현재 최고가:</span>
	            <span id="amount"><fmt:formatNumber value="${value}" pattern="###,###,###,###"/></span>
	            <span id="hidden" style="display: none;">${value}</span>
	            <span id="finalamount"></span>
	          </div>
	          
	
	          <ul class="tabs">
	            <li class="tab-link current" data-tab="chatt">채팅창</li>
	            <li class="tab-link" data-tab="iddd">시청자 (<span id="count"></span>)</li>
	          </ul>
		
			</div>
          <div id='chatt' class="tab-content current">
              <div class="chat-box">
                <div id='talk'></div>
                <div id='sendZone'>
                  <input type='text' id='msg'  placeholder="메시지를 입력해보세요!">
                  <input class ="bidcoinBtn" type='button' value='보내기' id='btnSend'>
                </div>
              </div>
              <div id="bidZone">
                  <input type='button' value="직접입력" id="auction" class ="bidcoinBtn">
                  <input type='button' value="+" id="add" class ="bidcoinBtn">
              </div>
          </div>
          <div id ="iddd" class="tab-content">
              
          </div>
        </div>
      </div>
	  	
    </div>
    <input  type="hidden" id="room-id" value="123" readonly="readonly" autocorrect=off autocapitalize=off size=20>
    <%-- <sec:authorize access="hasRole('ROLE_ADMIN')" > --%>
    
    <div style="display: flex; justify-content: center;">
    <div class="shadowBox media-container">
    	<div id="media-broad-option">
						<div class="optionBox">
							<div style="font-size: 20px; font-weight: bold;">방송설정</div>
							<div>
								방송 제목<input type="text" id="broadName" style="margin: 10px;"><input type="button" value="설정" id="setBroadNameBtn" class="bidcoinBtn">
								<button class= "bidcoinBtn" id="open-room">방송 시작</button>
								<button id="cameraStatus" class= "bidcoinBtn"> 방송 종료 </button>
							</div>
						  	<div>카메라 설정<select id="cameras"></select></div>
							<button id="cameraBlack" class= "bidcoinBtn"> 방송 송출 일시 정지 </button>
							<button id="screenShare" class= "bidcoinBtn"> 화면 공유로 전환 </button>
							
							
						</div>
						
						<div class="optionBox">
							<div style="font-size: 20px; font-weight: bold;">경매설정</div>
							<div>
				              <span>경매 물건</span>
                      <select id="items" name="items" style="width: 60%;">
                        <option value="none"selected>=== 선택 ===</option>
                        <c:forEach items="${itemList}" var="items">
                        <option value="${items.productNum}" data-price="${items.productPrice}">${items.productName}</option>
                      </c:forEach>
                      </select>
				              <input type="button" value="설정" id="itemsend" class="bidcoinBtn">
				            </div>
				             
				            <div>
				           		<span>단위가격</span>
					            <input type="text" id="unit">
					            <input type="button" value="설정" id="unitsend" class="bidcoinBtn">
				            </div>
						
							<input type="button" class="bidcoinBtn" value="채팅정지" id='stopStart'>
						    <input type="button" class="bidcoinBtn" value="경매시작" id="auctionStart"> <!--배열 controller로 보내짐 / 가격 안변하게하기-->
						    <!-- <input type="button" class="bidcoinBtn" value="경매종료" id="end"> session 닫힘 -->
						
					
						</div>
					</div>
    
    
    </div></div>
    <%-- <%-- </sec:authorize> --%>

	
    
  </div>
	<div style="display: none;">
      <h2 id="id">테스트멤버</h2>
      <h2 id="loginnum">111</h2>
      <h2 id="point">30000</h2>
      <h2 id="role">도매업자</h2>
	</div>
	<div id="room-urls" style="width : 200px;text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
  </div>
  </section>
</div>
	
<c:import url="../common/footer.jsp"></c:import>

<!-- <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script src='/static/js/auction/chat.js'></script>
<script src="/static/js/auction/RTCMultiConnection.js"></script>
<!-- <script src="/socket.io/socket.io.js"></script> -->
<script src="http://localhost:9001/socket.io/socket.io.js"></script>
<script src="/static/js/auction/getHTMLMediaElement.js"></script>
<script src='/static/js/auction/index.js'></script>

  <footer>
    <small id="send-message"></small>
  </footer>

  <script src="https://www.webrtc-experiment.com/common.js"></script>

<script type="text/javascript">

	// <sec:authorize access="hasRole('ROLE_ADMIN')" >
		adminChat();
		adminBroadCast();
	// </sec:authorize>
	
	
	
	joinRoom();
	
/* 	// On this codelab, you will be streaming only video (video: true).
	const mediaStreamConstraints = {
	  video: true,
	};

	// Video element where stream will be placed.
	const localVideo = document.querySelector('#localVideo');

	// Local stream that will be reproduced on the video.
	let localStream;

	// Handles success by adding the MediaStream to the video element.
	function gotLocalMediaStream(mediaStream) {
	  localStream = mediaStream;
	  localVideo.srcObject = mediaStream;
	}

	// Handles error by logging a message to the console with the error message.
	function handleLocalMediaStreamError(error) {
	  console.log('navigator.getUserMedia error: ', error);
	}

	// Initializes media stream.
	navigator.mediaDevices.getUserMedia(mediaStreamConstraints)
	  .then(gotLocalMediaStream).catch(handleLocalMediaStreamError);
	
	document.querySelector("#blackVideo").remove();
	 connection.open(document.getElementById('room-id').value, function() {
//	        showRoomURL(connection.sessionid);
	    });
	 localVideo.removeAttribute("hidden"); */
</script>


</sec:authorize>
<!-- ========================================================================== -->


<!-- =================================== 도매업자 ==================================== -->
<sec:authorize access="hasRole('ROLE_WHOLESALER')">







</sec:authorize>
<!-- ======================================================================= -->
<div class="section-header" style="margin-top: 90px;">
            <h2>로그인한 도매업자 회원만 참여가 가능합니다.</h2>
  </div>

</body>
</html>