<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>라이브 도매 경매 방송</title>

    <!--css-->

    <link rel="stylesheet" href="/static/css/auction/broadcast.css" type="text/css">
    <link rel="stylesheet" href="/static/css/auction/stylesheet.css" type="text/css">
    <link rel="stylesheet" href="/static/css/auction/getHTMLMediaElement.css" type="text/css">


    <!--라이브러리 -->
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Sock JS -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


</head>
<body>
<c:import url="../common/header.jsp"></c:import>

    <!-- 접속 아이디 -->
    <input type="text" style="display: none;" id="username" value="${member}">

    <!-- 전체 컨텐츠 -->
        <div id="broadcast-box" class="container container-fluid">
            <!-- 채팅포함 미디어 컨텐츠 (전체)-->
            <div id="media-box" class="row">
                <div id="video-box" class="col-8">
                    <div id="videos-container">
                        영상 송출
                    </div>
                    <div id="broadcast-info" class="row">
                        <button class="col">방송 정보</button>
                        <button class="col">판매 상품 정보</button>
                        <button class="col">입찰 정보</button>
                    </div>
                </div>
            
            
                <div id="chat-mainbox" class="col-4">
                    <div id="chat-header" class="row">
                        <div id="chat-info1" class="col-4">
                            <button onclick="getChattingList()">채팅창</button>
                        </div>
                        <div id="chat-info2" class="col-4">
                            <button onclick="getParticipants()">참여자</button>
                        </div>
                        <div id="bid-btn" class="col-4">
                            <button onclick="getBidPage()">경매 참여(입찰)</button>
                        </div>
                    </div>
                        
                        <div id="chat-frame">
                            <!-- 참여자 목록  -->
                            <div id="participants-box" class="border border-3" style="display: none;">
                                    <ul class="list-group list-group-flush" id="participants"></ul>
                            </div>
                            
                            <!-- 채팅 목록 -->
                            <div id="chat-box" class="border border-3">

                            </div>
                            <div id="chat-write" class="row">
                                <div class="col-10">
                                    <input type="text" class="input" id="chat-input" onkeyup="enterkey()">
                                </div>
                                <div id="send-msg" class="col-2">
                                    <span><h3>➡️</h3></span>
                                </div>
                            </div>

                            <!-- 경매 참여 (입찰 )-->
                            <div id="bid-box" style="display : none;" class="row">
                                <div class="text-center">
                                    <img src="/assets/img/profle.png" class="rounded">
                                </div>
                                <div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">An item</li>
                                        <li class="list-group-item">A second item</li>
                                        <li class="list-group-item">A third item</li>
                                        <li class="list-group-item">A fourth item</li>
                                        <li class="list-group-item">And a fifth one</li>
                                    </ul>
                                <div>
                                    입찰 : <input type="text"><button>입찰</button>
                                    <br><button>단위 가격 자동 입찰</button>
                                    <span>보유포인트 : <h3><fmt:formatNumber value="30000000" pattern="#,###" /></h3></span>
                                </div>
                                 
                                </div>
                            </div>

                        </div>
                </div>
            </div>
        </div>

    <!-- 전체 컨텐츠 -->
<c:import url="../common/footer.jsp"></c:import>


  <!-- 자바스크립트 파일 , socket.io 서버 -->
  <script src="/static/js/auction/chat.js"></script>
  <script src="/static/js/auction/getHTMLMediaElement.js"></script>
  <script src="/static/js/auction/RTCMultiConnection.js"></script>
  <script src="https://localhost:9001/socket.io/socket.io.js"></script>
 <!--  <script src="/static/js/auction/multi.js"></script> -->
  <script src="https://www.webrtc-experiment.com/common.js"></script>

</body>
</html>