<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>라이브 도매 경매 방송</title>

    <!--css-->

    <link rel="stylesheet" href="/static/css/auction/broadcast.css" type="text/css">
    <!-- <link rel="stylesheet" href="/static/css/auction/stylesheet.css" type="text/css"> -->
    <link rel="stylesheet" href="/static/css/auction/getHTMLMediaElement.css" type="text/css">


    <!--라이브러리 -->
    <!-- Jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Sock JS -->
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


</head>
<body>
<c:import url="../common/header.jsp"></c:import>

    <!-- Principal 접속 아이디 -->
    <sec:authentication property="Principal" var="user"/>
    <input type="text" style="display: none;" id="username" value="${member}">

    <!-- 옥션 번호 -->
    <input type="hidden" id="auction_num" value="${vo.auctionVO.auction_num}">

    <!-- 상품 번호 -->
    <input type="hidden" id="product_num" value="${vo.product_num}">

    <!-- 단위 가격 -->
    <input type="hidden" style="display: none;" value="5000">

    <!-- 전체 컨텐츠 -->
        <div id="broadcast-box" class="container container-fluid">
            <!-- 채팅포함 미디어 컨텐츠 (전체)-->
            <div id="media-box" class="row">
                <div id="video-box" class="col-8">
                    <div id="videos-container">
                        준비 중...
                    </div>
                    <div id="broadcast-info" class="row">
                        <button class="col">방송 정보</button>
                        <button class="col">판매 상품 정보</button>
                        <button class="col">입찰 정보</button>
                    </div>
                    <div class="row">
                        <!-- 방송 정보 -->
                        <div class="list-group" style="display: none;">
                            <div class="list-group-item">
                              <div class="d-flex w-100 justify-content-between">
                                <h5 class="mb-1"><span class="opacity-50">${vo.auctionVO.title}</span></h5>
                                <small>허용 인원 수 ${vo.auctionVO.head_count}</small>
                              </div>
                              <p class="mb-1">Some placeholder content in a paragraph.</p>
                              <small>${vo.auctionVO.sign_date}</small>
                            </div>
                        </div>

                        <!-- 판매 상품 정보 -->


                        <!-- 약관 -->
                        <div class="accordion accordion-flush" id="accordionFlushExample" style="display: none;">
                            <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                  Accordion Item #1
                                </button>
                              </h2>
                              <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the first item's accordion body.</div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                  Accordion Item #2
                                </button>
                              </h2>
                              <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the second item's accordion body. Let's imagine this being filled with some actual content.</div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header" id="flush-headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                  Accordion Item #3
                                </button>
                              </h2>
                              <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">Placeholder content for this accordion, which is intended to demonstrate the <code>.accordion-flush</code> class. This is the third item's accordion body. Nothing more exciting happening here in terms of content, but just filling up the space to make it look, at least at first glance, a bit more representative of how this would look in a real-world application.</div>
                              </div>
                            </div>
                          </div>


                        <!-- 관리자 모드 -->
                            <button class="col-4" id="open-room">방송시작</button>
                            <button class="col-4" id="startauction">경매 시작</button>
                            <button class="col-4" id="pauseauction">경매 중지</button>
                            <button id="terminateauction" class="col-4">경매 종료</button>

                    </div>
                </div>
            
            
                <div id="chat-mainbox" class="col-4">
                    <div id="chat-header" class="row">
                        <!-- <ul class="nav nav-tabs">
                            <li class="nav-item">
                              <a class="nav-link active" aria-current="page" href="#">Active</a>
                            </li>
                            <li class="nav-item dropdown">
                              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Dropdown</a>
                              <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Separated link</a></li>
                              </ul>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link disabled">Disabled</a>
                            </li>
                        </ul> -->
                        
                        
                        
                        <div id="chat-info1" class="col">
                            <button onclick="getChattingList()">채팅창</button>
                        </div>
                        <div id="chat-info2" class="col">
                            <button onclick="getParticipants()">참여자</button>
                        </div>
                        <div id="bid-btn" class="col">
                            <button onclick="getBidPage()">경매 참여(입찰)</button>
                        </div>
                    </div>
                        
                        <div id="chat-frame">
                            <!-- 참여자 목록  -->
                            <div id="participants-box" class="border border-3" style="display: none;">
                                <ul class="list-group list-group-flush" id="participants" data-role="${user.roleNum}"></ul>
                            </div>
                            
                            <!-- 채팅 목록 -->
                            <div id="chat-box" class="border border-3" onscroll="scrollFN()">

                            </div>
                            <div id="chat-write" class="row">
                                <div class="col-10">
                                    <textarea class="form-control" id="chat-input" onkeyup="enterkey()" style="resize: none;"></textarea>
                                    <!-- <input type="text" class="input" id="chat-input" onkeyup="enterkey()"> -->
                                </div>
                                <div class="col-2">
                                    <button type="button" class="btn btn-success">➤</button>
                                </div>
                               
                            </div>

                            <!-- 경매 참여 (입찰 )-->
                            <div id="bid-box" style="display : none;" class="row">
                                <div class="text-center">
                                    <img src="/assets/img/profle.png" class="rounded">
                                </div>
                                <div>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item"><div class="opacity-50">상품명</div>${vo.name}</li>
                                        <li class="list-group-item"><div class="opacity-50">현재가</div><span id="currentprice">${vo.auctionVO.init_price}</span></li>
                                        <li class="list-group-item"><div class="opacity-50">중량</div>${vo.quantity} kg </li>
                                        <li class="list-group-item"><div class="opacity-50">원산지</div>${vo.product_address}</li>
                                        <li class="list-group-item"><div class="opacity-50">입찰 단위 가격</div><span id="unitprice"><fmt:formatNumber value="5000" pattern="#,###"/></span></li>
                                    </ul>
                                <div class="row">
                                    입찰 : <input type="text" id="inputfree" disabled onkeyup="getCalculate(this)" onblur="getCalculate2(this)"><button disabled id="free-bidding" onclick="setFreeBidding()">입찰</button>
                                    <br><button disabled id="unit-bidding" onclick="setUnitBidding()">단위 가격 자동 입찰</button><br>
                                    <span>보유포인트 : <span id="mypoint"><fmt:formatNumber value="400000" pattern="#,###"/></span></span>
                                </div>
                                 
                                </div>
                            </div>


                        </div>
                </div>
            </div>
        </div>

    <!-- 전체 컨텐츠 -->
    <!-- 비디오 -->
    <div class="row" style="display: none;">
        <h1>
            Video OneWay Broadcasting using RTCMultiConnection
            <p class="no-mobile">
            Multi-user (one-to-many) video broadcasting using star topology.
            </p>
        </h1>
            
        <section class="make-center">
            <input type="text" id="room-id" value="abcdef" autocorrect=off autocapitalize=off size=20>
            <!-- <button id="open-room">Open Room</button> -->
            <button id="join-room">Join Room</button>
            <button id="open-or-join-room">Auto Open Or Join Room</button>

            <!-- <div id="videos-container" style="margin: 20px 0;"></div> -->

            <div id="room-urls" style="text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
        </section>
  </div>


<c:import url="../common/footer.jsp"></c:import>


  <!-- 자바스크립트 파일 , socket.io 서버 -->
  <script src="/static/js/auction/chat.js"></script>
  <script src="/static/js/auction/getHTMLMediaElement.js"></script>
  <script src="/static/js/auction/RTCMultiConnection.js"></script>
  <script src="https://192.168.0.16:9001/socket.io/socket.io.js"></script>
  <script src="/static/js/auction/multi.js"></script>
  <script src="https://www.webrtc-experiment.com/common.js"></script>

</body>
</html>