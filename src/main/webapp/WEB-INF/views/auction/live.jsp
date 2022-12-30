<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <title>라이브 도매 경매 방송</title>
  <!-- <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="styleshhet" href="/static/css/auction/stylesheet.css">
  <link rel="stylesheet" href="/static/css/auction/getHTMLMediaElement.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<!-- 2019-0611 css 경로 정리 -->
<link rel="stylesheet" type="text/css" href="https://res.afreecatv.com/css/global/common_set.css">
<link rel="stylesheet" type="text/css" href="https://res.afreecatv.com/css/global/chat/chat_wrap.css"> <!-- 채팅용 css -->
<link rel="stylesheet" type="text/css" href="https://res.afreecatv.com/css/global/webplayer/webplayer_live.css"> <!-- 웹플레이어용 css -->
<!-- //2019-0611 css 경로 정리 -->


<script>
  function getIeVersion () {

    var word;
    var version = "N/A";

    var agent = navigator.userAgent.toLowerCase();
    var name = navigator.appName;

    if ( name == "Microsoft Internet Explorer" )
    {
      word = "msie ";
    }
    else
    {
      if ( agent.search("trident") > -1 )
      {
        word = "trident/.*rv:";
      }
      else if ( agent.search("edge/") > -1 )
      {
        word = "edge/";
      }
    }

    var reg = new RegExp( word + "([0-9]{1,})(\\.{0,}[0-9]{0,1})" );

    if (  reg.exec( agent ) != null  ) version = RegExp.$1 + RegExp.$2;

    return version;
  }

  if(getIeVersion() == '7.0' || getIeVersion() == '8.0')
  {
    alert('익스플로러10 이상부터 이용 가능합니다.');
    location.href = 'https://www.afreecatv.com';
  }
  else if(getIeVersion() == '9.0')
  {
    alert("서비스 이용이 원활하지 않을 수 있습니다.\n익스플로러10 이상으로 이용해주세요.");
  }
</script>
</head>
<body>
  
  <c:import url="../common/header.jsp"></c:import>
  
 <!-- 관리자가 보는 방송 관리 페이지 -->
 <!-- 1. 내 화면 송출 -->
 <input type="text" style="display: none;" id="id" value="${id}">
 <div class="row">
   <h1>
    Video OneWay Broadcasting using RTCMultiConnection
    <p class="no-mobile">
      Multi-user (one-to-many) video broadcasting using star topology.
    </p>
  </h1>
	
  <section class="make-center">
    <input type="text" id="room-id" value="abcdef" autocorrect=off autocapitalize=off size=20>
    <!-- <button id="open-room">Open Room</button>
    <button id="join-room">Join Room</button> -->
    <button id="open-or-join-room">Auto Open Or Join Room</button>

    <!-- <div id="videos-container" style="margin: 20px 0;"></div> -->

    <div id="room-urls" style="text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
  </section>
 
 </div>
	<div id="webplayer" chat-move="true" class="webplayer_live chat_open layout_v2">
    <div id="webplayer_top" class="u211007">
      <!-- 로고 -->
      <h1 class="logo">
        <a href="https://www.afreecatv.com/" title="아프리카TV 홈으로" target="_blank">
          아프리카TV
        </a>
      </h1>
      <!-- //로고 -->
      <!-- 광고배너  -->
      <div class="banner" id="header_ad" style="display:none;">
        <a href="javascript:;"></a>
      </div>
      <!-- //광고배너 -->
      <!-- 메인헤더 -->
      <div class="top_item">
        <div class="serviceUtil">
                <div class="balloonArea">
            <a href="https://adballoon.afreecatv.com/savings.php?view=myadballoon" class="gauge" onclick="setClickLog('icon_adballoon','location=live')"; target="_blank"></a>
          </div>
                <button type="button" id="studioPlayKorPlayer" class="btn-broadcast" tip="방송하기">방송하기</button>
          <div class="noticeArea" id="FeedRoot">
            <button type="button" class="btn-notice" tip="알림"><span>알림</span></button>
            <div id="" class="feed_layer"></div>
          </div>
        <button type="button" class="btn-login" id="btn-login">로그인</button>
        <div class="settingWrap">
          <button type="button" class="btn-settings" tip="설정">설정</button>
          <div class="modeSetting" id="modeSetArea">
                      <div class="modeSet">
              <strong class="my_mode">어두운모드</strong>
              <input type="checkbox" id="modecheck">
              <label class="modecheck" for="modecheck"></label>
              <p>이 브라우저에만 적용됩니다</p>
            </div>
                      <ul>
              <li><a href="https://item.afreecatv.com/quickview.php" class="my_item" target="_blank" onclick="setClickLog('gnb_00000002','button_type=item')";>아이템</a></li>
              <li><a href="https://item.afreecatv.com/starballoon.php" class="my_balloon" target="_blank" onclick="setClickLog('gnb_00000002','button_type=balloon')";>별풍선</a></li>
                          <li><a href="https://sotong.afreecatv.com" class="my_sotong" target="_blank" onclick="setClickLog('gnb_00000002','button_type=sotong')">소통센터</a></li>
                          <li><a href="https://help.afreecatv.com/atv.php" class="my_custom" target="_blank" onclick="setClickLog('gnb_00000002','button_type=customer')";>고객센터</a></li>
                          <li><a href="https://www.afreecatv.com/afreeca_intro.htm" class="my_service" target="_blank" onclick="setClickLog('gnb_00000002','button_type=service')";>서비스 소개</a></li>
                        </ul>
          </div>
        </div>
  
        <div class="profileWrap" id="profileWrapBtn">
          <div class="userInfo">
            <div class="thumb">
            </div>
            <button type="button" class="btn-login"></button>
          </div>
  
          <div class="loginUserMenu">
            <div class="btn_quick">
              <a href="javascript:;" target="_blank" class="mybs" onclick="setClickLog('gnb_00000001','button_type=station')";><span>방송국</span></a>
              <a href="javascript:;" target="_blank" class="favorite">즐겨찾기</a>
            </div>
            <ul class="menuList">
              <li><a class="my_item" href="https://point.afreecatv.com/report/AfreecaUseList.asp" target="_blank" onclick="setClickLog('gnb_00000001','button_type=item')";>내 아이템</a></li>
              <li><a class="my_balloon" href="https://point.afreecatv.com/report/afreecaballoonlist.asp" target="_blank" onclick="setClickLog('gnb_00000001','button_type=balloon')";>내 별풍선</a></li>
              <li><a class="my_gd" href="https://point.afreecatv.com/Subscription/SubscriptionList.asp" target="_blank" onclick="setClickLog('gnb_00000001','button_type=subscription')";>내 구독</span></a></li>
                           <li><a class="my_bene" href="https://adrevenue.afreecatv.com" target="_blank" onclick="setClickLog('gnb_00000001','button_type=advertising')";>내 광고</a></li>
              <li><a class="my_point" href="https://mypoint.afreecatv.com/index.php?szWork=point_status" target="_blank" onclick="setClickLog('gnb_00000001','button_type=point')";>내 포인트</a></li>
              <li><a class="my_tk" href="https://mypoint.afreecatv.com/index.php?szWork=token_status" target="_blank" onclick="setClickLog('gnb_00000001','button_type=token')";>내 크레딧</span></a></li>
              <li><a class="my_spon" href="https://adballoon.afreecatv.com/savings.php?view=myadballoon" target="_blank" onclick="setClickLog('gnb_00000001','button_type=adballoon')";><span>내 애드벌룬</span></a></li>
              <li><a class="my_profit" href="https://myrevenue.afreecatv.com" target="_blank" onclick="setClickLog('gnb_00000001','button_type=profit')";><span>내 수익</span></a></li>
              <li><a class="my_stat" href="https://broadstatistic.afreecatv.com/" target="_blank" onclick="setClickLog('gnb_00000001','button_type=stat')";><span>내 통계</span></a></li>
                          <li>
                <a class="my_message" href="https://note.afreecatv.com/app/index.php"  target="_blank" onclick="setClickLog('gnb_00000001','button_type=note')";>
                  <span>내 쪽지 </span><span class="cnt memo">0</span><span>개<span class="new" style="display:none;">New</span></span>
                </a>
              </li>
            </ul>
                      <ul class="menuList">
              <li><a href="https://dashboard.afreecatv.com/index.php" class="my_dashboard" target="_blank" onclick="setClickLog('gnb_00000001','button_type=dashboard')";><span >외부장치 방송 설정</span></a></li>
            </ul>
            <ul class="menuList">
              <li><a href="https://shopfreeca.afreecatv.com/mypage" class="my_shopping" target="_blank" onclick="setClickLog('gnb_00000001','button_type=shopping')";><span>MY 쇼핑</span></a></li>
            </ul>
            <div class="modeSet">
              <strong class="my_mode">어두운모드</strong>
              <input type="checkbox" id="modecheck2">
              <label class="modecheck" for="modecheck2"></label>
              <p>이 브라우저에만 적용됩니다</p>
            </div>
            
            <div class="userFootMenu">
              <a href="https://member.afreecatv.com/app/user_info.php" class="myinfo" target="_blank" onclick="setClickLog('gnb_00000001','button_type=my_info')";>내 정보</a>
              <a href="https://member.afreecatv.com/app/user_security.php" class="safe" target="_blank" onclick="setClickLog('gnb_00000001','button_type=security')";><em>내 정보 보호</em></a>
              <a href="javascript:;" class="logout" onclick="setClickLog('gnb_00000001','button_type=logout')";>로그아웃</a>
            </div>
  
          </div>
        </div>
  
        <div class="serviceMenu" id="serviceMenuList">
          <button type="button" class="btn-allMenu" tip="전체메뉴">전체메뉴</button>
          <div class="allMenuList">
            <div class="inner">
              <dl class="menu01">
                <dt>콘텐츠</dt>
                              <dd class="new"><a href="https://2022award.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_AWARD');">2022 BJ대상</a></dd>
                <dd><a href="https://sports.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_SPORTS');">스포츠</a></dd>
                              <dd><a href="https://esports.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_ESPORTS');">e스포츠</a></dd>
                              <dd><a href="https://bjmatch.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_BJMATCH');">BJ 멸망전</a></dd>
                <dd><a href="https://bora.afreecatv.com" target="_blank" onclick="callAU('CLICK_BORA_AFREECATV');">보.라에서 생긴 일</a></dd>
                <dd><a href="https://gametv.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_GAMETV');">게임TV</a></dd>
                <dd><a href="https://ani.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_ANI');">애니메이션관</a></dd>
                <dd><a href="https://theater.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_THEATER');">지상파/케이블관</a></dd>
                            </dl>
              <dl class="menu02">
                <dt>후원 및 아이템</dt>
                <dd><a href="https://item.afreecatv.com/starballoon.php" target="_blank" onclick="callAU('CLICK_SUB_STARBALLOON');">별풍선</a></dd>
                <dd><a href="https://item.afreecatv.com/subscription.php" target="_blank" onclick="callAU('CLICK_SUB_SUBSCRIBE');">구독</a></dd>
                              <dd><a href="https://adballoon.afreecatv.com/savings.php?view=list" target="_blank" onclick="callAU('CLICK_SUB_ADDBALLOON');">애드벌룬</a></dd>
                              <dd><a href="https://afevent2.afreecatv.com/app/signature_balloon/index.php" target="_blank" onclick="callAU('CLICK_SUB_SIGNATURE');">시그니처 풍선</a></dd>
                <dd><a href="https://item.afreecatv.com/quickview.php" target="_blank" onclick="callAU('CLICK_SUB_ITEM');">아이템</a></dd>
              </dl>
                          <dl class="menu03">
                <dt>서비스</dt>
                <dd><a href="https://mypoint.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_POINT');">포인트 &amp; 크레딧</a></dd>
                <dd><a href="https://shopfreeca.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_SHOP');">샵프리카</a></dd>
                <dd class="new"><a href="https://partnership.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_PARTNERSHIP');">파트너십</a></dd>
                <dd><a href="https://ogqmarket.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_OGQ');">아프리카TV OGQ마켓</a></dd>
                <dd><a href="https://studio.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_OPENSTUDIO');">오픈 스튜디오</a></dd>
                <dd class="new"><a href="https://aftmarket.tv" target="_blank" >AFTmarket</a></dd>
              </dl>
                          <dl class="menu04">
                <dt>BJ</dt>
                <dd><a href="https://afevent2.afreecatv.com/app/starbj/index.php" target="_blank" onclick="callAU('CLICK_SUB_STARBJ');">스타BJ</a></dd>
                              <dd><a href="https://contentlab.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_LAB');">콘텐츠 지원센터</a></dd>
                <dd><a href="https://newbj.afreecatv.com/rewardpoint/" target="_blank" onclick="callAU('CLICK_SUB_NEWBJ');">신입BJ 지원센터</a></dd>
                <dd><a href="https://vodbj.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_EDIT');">편집BJ 지원센터</a></dd>
                <dd><a href="https://bjguide.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_GUIDE');">BJ가이드</a></dd>
                <dd><a href="https://bjedu.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_EDU');">아프리카TV BJ교육</a></dd>
                              <dd><a href="https://issue.afreecatv.com" target="_blank" onclick="callAU('CLICK_SUB_ISSUE');">이슈방송 스케줄</a></dd>
                            </dl>
            </div>
          </div>
        </div>
      </div>
  
      <ul class="view_ctrl">
        <li class="btn_chat"><button type="button"><span>채팅창</span></button></li>
        <li class="btn_list"><button type="button"><span>방송리스트</span></button></li>
        <li class="btn_list_bookmark"><button type="button"><span>즐겨찾기</span></button></li>
      </ul>
  
      <div id="afSearcharea"></div>
  
    </div>
    <!-- 2020 - 0323 플래시 플래이어 지원중단 -->
    <div class="browser_alarm">
        <!-- 기본 창 -->
        <div>
          <p>
            Flash 플레이어 지원이 종료되었습니다. 최적의 환경으로 <a href="javascript:;" >브라우저 업데이트</a> 후 이용해 보세요.				</p>
          <a href="#n" class="close">닫기</a>
        </div>
        <!-- // 기본 창 -->
        <!-- 작은 창 -->
        <div>
          <p>
            Flash 플레이어 지원종료 안내					<a href="javascript:;" >브라우저 업데이트</a>
          </p>
          <a href="#n" class="close">닫기</a>
        </div>
        <!-- // 작은 창 -->
    </div>
  </div>
  
    <!-- webplayer_scroll -->
    <div id="webplayer_scroll">
      <!-- WebPlayer 영역 webplayer_contents -->
      <div id="webplayer_contents">
        <!-- 영상 출력영역 player_area -->
        <div id="player_area" >
          <!-- htmlplayer_wrap -->
          <div class="htmlplayer_wrap">
            <div class="htmlplayer_content">
              <style>
      .bxSliderWrapper {
          max-width: 250px;
          margin: auto;
      }
  </style>
  <script>
    //window.opener에 접근하기 위해 domain이 맞아야 동작하므로 최상단에 적용
    //기존에 requirejs내에 있엇던 선언이 있음. 모두 afreecatv.com이기때문에  if없이 걍 넣음
    //외부에서 sandbox iframe으로 플레이어 추가하는 경우가 있어 try catch 검
    try {
      window.document.domain = "afreecatv.com";
    } catch(e) {
      //try catch도 sentry에 에러 로그 남겠지?
    }
  
      if (window.navigator.userAgent.match(/MSIE|Internet Explorer|Trident/i)) {
          window.location = 'microsoft-edge:' + window.location;
          setTimeout(function() {
              window.location = 'https://go.microsoft.com/fwlink/?linkid=2135547';
          }, 1);
      }
  </script>
  
  
  
    <!--
    Description  : html 플레이어
    Author : dk
  
    공통 관리를 위해 include 로 호출
    모든 element 수정시 플레이어 기능 영향있을수 있으므로 확인 필요
     -->
  
  
  
    <!--
    player index 값 정리
    video 1
    추천방송 10
    watermark  15
    버튼 및  타이틀 20
    툴팁 30
    백그라운드 이미지 : 35
    버퍼링 및 블라인드 40
    -->
  
  
  
    <!--
    상황별 출력 클레스
    mouseover -> 마우스 오버 시 출력 , 스크립트 로 관리됨
    live . editor , video , offline  -> 개상황에 따른 출력 컨텐츠들을 관리하는 클레스
     -->
  <!-- 2016-1005 embed iframe video 모두 가능-->
  <!-- 플레이어 영역 -->
  <div class="vr_player"></div>
  <div id="afreecatv_player" class="">
  
  
      <!-- 플에이어  사이즈 비율 출력 엘리먼트   -->
      <div class="afreecatv_player_size"></div>
  
  
  
      <!-- 비디오 영역 div 는  개발 요청으로 추가  -->
      <div id="videoLayer">
        <div id="videos-container" style="margin: 20px 0;"></div>
      </div>
  
          <div id="videoLayerCover" tabindex="1"
               style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;z-index: 2; display: none;"></div>
      <!-- 워터마크 -->
      <!-- tl , tc , tr  , bl , bc , br  클레스로 포지션 지정 , 포지션 지정되지 않을시 출력되지 않음
        opacity 클레스 추가시 불투명하게 출력 -->
      <div class="watermark tl opacity" style="display:none;">afreecaTV</div>
  
      <!--  기본로고 출력 -->
      <div class=" default_logo">afreecaTV</div>
  
      <!-- 툴팁-->
      <div class="tooltip" style="top:50px;  left: 100px;"><em></em></div>
  
      <!-- body 에  embedded_mode 클레스 추가시 출력됨-->
      <!-- <h1 class="player_title"> <span></span><strong>AfreecaTV</strong> </h1> -->
  
      <!-- 2018-0907
        사전탐방 송출제한  엘리먼트 이동 (tuneou)   , 기본값은 none
        smode , extend_mode , 퍼가기 모드출력될 수 있도록  css 컨트로
        로고는
      -->
      <div class="player_info">
              <div id="tuneOut" class="tuneout" style=" display:none; ">
          <p>사전 협의되지 않은 탐방 및 재송출은 정중히 사절합니다.</p>
        </div>
              <div class="title"> <!-- -->
          <div>
            <span id="bjNick"></span>
            <span id="viewerCnt"><em></em></span>
          </div>
          <h1 id="broadTitle"></h1>
                </div>
      </div>
  
      <!--  screen mode 일 때 채팅창, 리스트, 즐찾 열기 -->
      <ul class="view_ctrl in_screen" style="display: none;">
        <li class="btn_chat"><button type="button"><span>채팅창 on/off</span></button></li>
        <li class="btn_list"><button type="button"><span>방송리스트 on/off</span></button></li>
        <li class="btn_list_bookmark"><button type="button"><span>즐겨찾기 on/off</span></button></li>
      </ul>
      <!--  //screen mode 일 때 채팅창, 리스트, 즐찾 열기 -->
  
      <!-- 플레이어 컨트롤 버튼 -->
      <div class="player_ctrlBox" tabindex="1">
        <!-- <div class="ms-test-cont" style="display:inline-block;">
          <ul>
            <li class="content-type" style="display:inline-block">LIVE  </li>
            <li class="bj-nick"style="display:inline-block">뷁키 </li>
            <li class="viewer-cnt" style="display:inline-block">123 </li>
          </ul>
          <div class="broad-title">
  
          </div>
        </div> -->
        <div class="ctrl">
          <div class="progress" style="display: none;">
            <div class="progress_track">
              <div class="video_thumbnail time">
                <span class="reverse_time"><em></em></span>
                <span class="dev_positive_time" style="bottom : 25px; display: none;"><em></em></span>
              </div>
              <div class="watched" style="width:100%;"></div>
              <button class="handler" style="left:100%;"><span></span></button>
              <div class="download" style="width:0%; display: none;"></div>
              <div class="progress_bar"></div>
            </div>
          </div>
          <!-- 타임 시프트 용 play pause 버튼 -->
          <button type="button" id="time_shift_play" class="pause" aria-label="재생" style="display: none;"></button>
          <!-- 재생버튼 stop 클레스 변경시 정지버튼으로 변경됨 -->
          <button type="button" id="play" class="play" aria-label="재생"></button>
          <!-- 볼륨 -->
          <div class="volume">
            <button type="button" class="sound" id="btn_sound">
              <span></span><span></span>
            </button>
            <div class="volume_slider_wrap">
              <div class="volume_slider">
                <div class="volume_range" style="width: 50%;"></div>
                <button class="volume_handler" style="left:50%;"></button>
              </div>
            </div>
          </div>
          <button type="button" id="liveButton" class="live_state" style="display: block;"><em></em><span>LIVE</span></button>
  
        </div>
  
        <div class="right_ctrl">
  
          <!-- 임베디드 아프리카티비 바로가기 -->
          <!--<button type="button" class="btn_afreecatv">아프리카 티비에서 보기</button>-->
  
                  <!-- 임베디드 공유하기 -->
                  <button type="button" class="btn_share"></button>
  
          <!-- 화질선택 임베디드는 미노출 -->
          <div class="quality_box">
            <button type="button" class="btn_quality_mode"><span>일반화질</span></button>
            <ul>
              <li><button type="button" class="auto_quality"><span>자동화질</span></button></li>
              <li><button type="button" class="original_quality"><span>원본화질</span></button></li>
              <li><button type="button" class="high_quality"><span>고화질</span></button></li>
              <li><button type="button" class="normal_quality"><span>일반화질</span></button></li>
              <li><button type="button" class="low_quality"><span>저화질</span></button></li>
            </ul>
          </div>
  
          <!-- 플레이어 셋팅버튼 -->
          <div class="setting_box" style="display:block;">
            <button type="button" class="btn_setting">setting<div class="tooltip" style="display: none;"><span>설정</span><em></em></div>
            </button>
            <div class="setting_list">
              <ul>
                <!-- span 안에 "자막켜기" 텍스트 있는데 js 에서 동적으로 처리함 -->
                <li><button type="button" id="btnLiveCaptionOnOff" style="display: none;"><span></span></button></li>
                <li><button type="button" id="btnCheckPlayerState"><span>진단하기</span></button></li>
              </ul>
            </div>
          </div>
  
          <!-- PIP -->
          <button type="button" class="btn_pip_mode" style="display: none;">
            <div class="tooltip"><span>PIP 모드(P)</span><em></em></div>
          </button>
  
          <!-- 씨네마 -->
          <button type="button" class="btn_smode">
            <!-- 툴팁 2016-0923--><div class="tooltip"><span>스크린모드(S)</span><em></em></div>
          </button>
          <!-- 전체모드 클레스 추가시 버튼형태 변경 -->
          <button type="button" class="btn_extend_mode">
            <div class="tooltip"><span>전체화면(F)</span><em></em></div>
          </button>
  
        </div>
  
      </div>
  
      <div class="center_btn" style="display: none;">
        <button type="button" class="btn_cneter_play" style="display: none;"><span>PLAY</span></button>
  
        <div class="volume_icon"  style="display: none;"><span></span><span></span><span></span><span></span><span></span></div>
      </div>
  
          <!-- 5초 앞,뒤로 이벤트 -->
          <div class="center_msg" style="display: none;"><span>5초</span></div>
  
          <div class="nextvideo" id="stop_screen">
              <dl>
                  <dt class="tit">다음 VOD</dt>
                  <dd class="stit">title</dd>
                  <dd class="nextplay"><a href="#n">VOD 보기</a></dd>
              </dl>
              <em class="cancel"><a href="#n">자동재생 취소</a></em>
              <span class="timer"><em></em> 후 자동재생</span>
              <span class="bg"></span>
          </div>
  
      <!-- 화면 블라인드 상태 -->
      <!-- <div class="video_blind"> -->
      <div class="video_blind" style="display:none;">
        <div class="video_blind_in">
          <div class="content">
            
            <!-- 성인 -->
            <div class="dialog type_adult" style="display:none;">
              <h2>19</h2>
              <p>청소년 유저들을 보호하기 위해 <em>19세 이상의 유저만</em><br> 이용할 수 있도록 연령제한이 설정된 컨텐츠 입니다.</p>
              <p><strong></strong></p>
              <div class="btn_set">
                <button type="button" class="enter"><span>확인</span></button> <button type="button" class="close"><span>취소</span></button>
              </div>
            </div>
            <!-- //성인 -->
  
            <div class="dialog type_maxuser" style="display:none;">
                          <h2>참여 가능한 인원이 초과되었습니다.<br>잠시 후 입장해 주세요.</h2>
                          <p class="txt">Full방에 바로 입장이 가능한 퀵뷰 아이템 구매페이지로 이동하시겠습니까?</p>
                          <p class="txt_desc" style="display:none">퀵뷰 아이템을 사용 중인 경우, 로그인을 하시면 바로 참여하실 수 있습니다.</p>
                          <div class="btn_set">
                              <button type="button" class="enter"><span>예</span></button>
                              <button type="button" class="close" style="display:none"><span>로그인</span></button>
                          </div>
                      </div>
            
            <!-- PPV 방송  -->
            <div class="dialog type_ppv_not_allow" style="display:none;">
              <p>본 방송은 티켓 구매 후 참여가능 합니다.</p>
              <div class="btn_set">
                <button type="button" class="enter"><span>확인</span></button>
              </div>
            </div>
  
            <div class="dialog type_ppv_not_login" style="display:none;">
              <p>본 방송은 로그인이 필요한 서비스 입니다.</p>
              <div class="btn_set">
                <button type="button" class="enter"><span>로그인</span></button>
              </div>
            </div>
            <!-- //PPV 방송 -->
  
            <div class="dialog type_adult_lock" style="display:none;">
              <h2><span class="adult">19</span><span class="lock">lock</span></h2>
              <p>이 방송은 BJ가 만 19세 미만 참여를 <br> 제한한 방송이며 비밀번호가 설정되어 있습니다.</p>
            </div>
  
            <!-- 무중단 -->
            <div class="dialog type_continue" style="display:none;">
              <h2>앗, 잠깐만 기다려주세요</h2>
              <p class="txt">방송이 잠시 중단되었습니다.</p>
                          <p class="txt_desc">대기 시간 내에 BJ님이 재접속하면 방송이 다시 시작됩니다.</p>
              <span>대기시간 <em>00:00</em></span>
            </div>
            <!-- //무중단 -->
  
            <!-- 비번방 -->
            <div class="dialog type_password" style="display:none;">
                          <form name="passwordForm" style="margin:0px" onsubmit="return false;">
              <h2>비밀번호 설정 방송</h2>
              <p>방송을 보려면 BJ가 정해놓은 비밀번호를 입력해야 합니다.</p>
              <div><label for="pwd">비밀번호</label><input type="password" id="pwd"></div>
              <p class="red" style="display:none;">비밀번호가 일치하지 않습니다.</p>
              <div class="btn_set">
                <button type="button" class="enter"><span>들어가기</span></button> <button type="button" class="close"><span>되돌아가기</span></button>
              </div>
                          </form>
            </div>
            <!-- //비번방 -->
  
            <!-- 블라인드 -->
            <div class="dialog type_blind" style="display:none;">
              <h2>BLIND</h2>
              <strong>채팅금지 횟수 초과로 인해 <span>2</span>분간 블라인드 처리됩니다.</strong>
              <p>블라인드 상태에서는 화면과 채팅이 보이지 않으며 <br> 블라인드 상태로 방송에서 나갈 경우 <br> 자동 강제퇴장 처리되며 재입장이 불가능합니다.</p>
            </div>
            <!-- //블라인드 -->
  
            <!-- 방송종료  -->
            <div class="dialog type_end" style="display:none;"><h2>방송 중이지 않습니다.</h2></div>
            <!-- //방송종료  -->
  
            <!-- 브라우저 업데이트  -->
            <div class="dialog" style="display:none;" id="browserUpDate">
              Flash플레이어 지원이 2020년 6월에 종료되었습니다.<br>브라우저를 업데이트하여 최적의 환경에서 아프리카TV를 이용해 보세요!					</div>
            <!-- //브라우저 업데이트  -->
  
            <div class="dialog type_mobile_pause" style="display:none;">
              <h2>BJ가 방송을 일시정지 하였습니다.</h2>
              <p>다시 시작할때까지 잠시만 기다려 주세요</p>
            </div>
  
  
            <!-- 공통케이스 -->
            <div class="dialog type_common" style="display:none;">
              <!--p><span class="blue">DARgooni</span>에 의해 강제 퇴장되었습니다.</p>
              <p>운영자에 의해 강제 퇴장되었습니다.</p>
              <p>BJ에 의해 강제 퇴장되었습니다.</p>
              <p>운영자에 의해 방송이 종료되었습니다.</p>
              <p>동일한 방송을 여러 개 시청하실 수 없습니다. <br><strong>해당 방송은 이미 시청 중입니다.</strong></p>
              <p>BJ에 의해 블랙리스트로 등록되어 방송을 시청할 수 없습니다.</p>
              <p>아프리카TV 운영원칙 위반으로 서비스 이용이 정지되었습니다.</p>
              <p>정상적인 접근이 아니므로 방송을 시청할 수 없습니다.</p>
              <p>해외 지역 제한 서비스입니다.</p>
              <p><strong>[AfreecaTV 서비스 점검] </strong><br><span>2016년 8월 13일(수) 03:00~08:00</span> 까지 서비스 점검 중 입니다.</p-->
            </div>
            <!-- //공통케이스 -->
          </div>
        </div>
      </div>
      <!-- 크롬 브라우저 설치 유도 -->
      <div class="ui-pop chrome_install" style="display:none">
        <div class="pop-body">
          <strong>Chrome 브라우저로 참여해 보세요!</strong>
          <p>
            최신 버전의 Chrome 브라우저를 이용하시면<br>보다 안정적인 HTML5 플레이어로<br>방송을 이용하실 수 있습니다.				</p>
          <a href="https://www.google.com/chrome" target="_blank" class="btn_download">Chrome 브라우저 다운로드</a>
        </div>
        <div class="chk-box">
          <input type="checkbox" name="" id="chk1">
          <label for="chk1">30일간 열지 않기</label>
        </div>
        <a href="javascript:;" class="pop-close"><span>레이어 닫기</span></a>
      </div>
  
      <!-- 로딩바 -->
      <div class="loading" style="display: none;">
        <div>
          <!--
            광고 이미지  or 기본 로딩 이미지
            둘 다 어드민에 등록된 것 사용
            http://res.afreecatv.com/images/afreecatv_player/loading.gif(기존 로딩 이미지 136*136)는 사용하지 않는다
            이미지 에러 시 http://res.afreecatv.com/images/afreecatv_player/default_loading.gif(160*160) 를 사용
          -->
          <img class="loading_img" src="https://res.afreecatv.com/images/afreecatv_player/default_loading.gif" 
            data-use-ad="1" data-tracking-tag="" onload="this.done=true;" alt="로딩 이미지">			
        </div>
  
      </div>
      <!-- //로딩바 -->
      <!-- 버퍼링 바 -->
      <div class="buffering" style="display: none;"><span></span></div>
      <!-- //버퍼링 바 -->
  
      <!-- 광고영역 -->
      <!-- 2016-1007 -->
      <div class="da_area" style="display:none;"><a href="javascript:;" ></a></div>
          <button type="button" style="display:none;" class="da_area_left"  id="da_btn_click"><span>CLICK</span><em>-00:00</em></button>
          <button type="button" style="display:none;" class="da_area_right" id="da_btn_skip"><em>00</em><span>초 후 광고 SKIP</span></button>
              <div id="tuneOut" class="tuneout" style="display:none;">
        <p>사전 협의되지 않은 탐방 및 재송출은 정중히 사절합니다.</p>
      </div>
      
      <!--160713-->
      <div class="item_ten" style="display: none;">
        <div class="blind">불타는 텐미닛</div>
        <div class="min">1</div>
        <div class="min2"><strong>1</strong> 초 후 자동으로 UP합니다.</div>
        <button type="button" class="btn_up"><span class="blind">바로UP</span></button>
        <button type="button" class="btn_next"><span class="blind">다음 기회에</span></button>
        <button type="button" class="btn_close"><span class="blind">닫기</span></button>
      </div>
      <!--//160713-->
      
      <!--쉬는시간용 블루박스-->
      <div class="break_time" id="breakTimeBox" style="display: none;">
        <p>
          <strong><i></i><em></em>쉬는시간 후 방송이 이어집니다. </strong>
          BJ에게 후원이 되는 광고 보면서 조금만 기다려요!			</p>
      </div>
      <!--//쉬는시간용 블루박스-->
  
      <!--adcon-->
      <div class="adballoon_icon" style="display: none; z-index:999;">
        <a href="javascript:;" class="adcon-area" style="z-index:999;">
          <span class="thumb"><img src="" ></span>
          <span class="con_desc">
            <span class="area">
              <em class="con_tit">ADCON</em>
              <span class="con_stit">BJ가 선택한 ADCON 클릭</span>
            </span>
          </span>
        </a>
        <button type="button" class="adballoon_close"><span></span></button>
      </div>
      <!--//adcon-->
  
      <div class="browser_alarm">
        <p>
          Flash 플레이어 지원종료 안내 
          <a href="https://www.afreecatv.com/flashplayer_information.html" target="_blank">브라우저 업데이트</a>
        </p>
        <a href="#n" class="close">닫기</a>
      </div>
  
      <div id="paidPromotionNoticeBox" class="text_box"> <p>본 영상은 광고를 포함하고 있습니다.</p> </div>
  
      <div id="liveCaptionBox" class="screen_text_output">
        <div class="text">
          <img src="" alt="">
          <p></p> <!-- style="font-size: 10px;" -->
        </div>
      </div>
  </div>
  
  
  <!-- //플레이어 영역 -->
              <div class="player_item_list on preroll">
                <div class="text_output">
                  <!-- 2021-05-07 추가 -->
                  <p></p>
                  <!-- // 2021-05-07 추가 -->
  
                </div>  <!-- 추가  2018-0803-->
                <ul>
                  <!-- button에 off 클레스 추가 시 클릭안되는 상태  -->
                  <!-- 2019-0611 button  에 title 값 tip로 변경 , 디자인 툴팁 출력  -->
                  <li class="multi" style="display:none;"><button type="button" tip="멀티"><em></em><span>멀티</span></button><div class="sub_tooltip">멀티</div></li>
                  <li class="vr" style="display:none;"><button type="button" tip="VR"><em></em><span>VR시작</span></button><div class="sub_tooltip">VR시작</div></li>
                  <li class="count_vote" style="display:none;"><button type="button" tip="투표집계"><em></em><span>투표집계</span></button><div class="sub_tooltip">투표집계</div></li>
                  <li class="vote_result" style="display:none;"><button type="button" tip="투표결과"><em></em><span>투표결과</span></button><div class="sub_tooltip">투표결과</div></li>
                  <li class="vote" style="display:none;"><button type="button" tip="투표하기"><em></em><span>투표하기</span></button><div class="sub_tooltip">투표하기</div></li>
                  <li class="user_join" style="display:none;">
                    <button id="u_multi" type="button" tip="유저참여">
                      <em></em>
                      <span>유저참여</span>
                    </button>
                    <div class="sub_tooltip">유저참여방송</div>
                    <div class="item_list_layer" style="display:none;">
                      <strong>유저 참여 요청</strong>
                      <p>방송에 참여해 보세요.</p>
                      <a href="javascript:;" class="close">닫기</a>
                    </div>
                  </li>
                  <li class="subscribe" style="display:none;">
                    <button type="button"><em></em><span>구독하기</span></button>
                    <div class="tooltip_bx">
                      <em></em>
                      <div class="subscribe_info">
                        <span class="icon"></span>
                        <p>지금 이 <span class='cr01'>BJ 후원</span>하고<br><span class='cr02'>본방입장+퍼스나콘 혜택</span>까지!?</p>
                      </div>
                    </div>
                    <div class="sub_tooltip">구독하기</div>
                  </li>
                  <li class="star_balloon">
                    <button type="button" tip="별풍선"><em></em><span>별풍선</span></button><div class="sub_tooltip">별풍선</div>
                    <div class="speech_bubble" style="display:none;">
                      <strong>풍앗이 종료!</strong>
                      <p>승리팀에 별풍선을 선물해보세요.</p>
                      <a href="#n" class="close"><span>레이어 닫기</span></a>
                    </div>
                  </li>
                  <li class="adballoon">
                    <button type="button" id="btnGiftAdBalloon" tip="애드벌룬" ><em></em><span>애드벌룬</span></button>
                    <div class="sub_tooltip">애드벌룬</div>
                    <div class="speech_bubble" enable="on" style="display:none;">
                    <em class="icon"></em>
                    <p>이제 영상 광고 보고 <br> 애드벌룬 선물하세요!</p>
                    <a href="#n" class="close"><span>레이어 닫기</span></a>
                    </div>
                  </li>
                                  <li class="shopping">
                                      <button type="button" tip="샵프리카"><em></em><span>샵프리카</span><span class="ic_new">new</span></button><div class="sub_tooltip">샵프리카</div>
                                      <div class="adshop_layer" style="display:none;">
                                          <em class="ic_adshop"></em>
                                          <strong>애드벌룬 혜택이 더해진 샵</strong>
                                          <p>샵에서 BJ의 선택상품, 일반상품을<br>구매하면, 애드벌룬 혜택이 플러스</p>
                                          <a href="#n" class="close">닫기</a>
                                      </div>
                                  </li>
                  <li class="sticker"><button type="button" tip="스티커"><em></em><span>스티커</span></button><div class="sub_tooltip">스티커</div></li>
                  <li class="edit_angle" style="display: none;"><button data-target="edit_angle" type="button" tip="편집각"><em></em><span>편집각</span></button><div class="sub_tooltip">편집각</div></li>
                  <li class="user_clip">
                    <button type="button"><em></em><span>유저 클립</span><span class="ic_new">new</span></button>
                    <div class="item_list_layer tooltip">
                      <em class="ic_userclip"></em>
                      <strong>누구나 만들 수 있는 유저클립 & Catch</strong>
                      <p>지금 보고 계신 장면을 누구나<br>바로 클립으로 만드실 수 있습니다.</p>
                    </div>
                  </li>
                  <li class="laterwatch"><button data-target="laterwatch_text" type="button" tip="나중에보기"><em></em><span>나중에보기</span></button><div class="sub_tooltip">나중에보기</div></li>
                  <li class="bookmark" ><button data-target="bookmark_text" type="text" tip="즐겨찾기"><em></em><span>즐겨찾기</span></button><div class="sub_tooltip">즐겨찾기</div></li>
                  <li class="up_recommend" ><button data-target="up_text" type="text" tip="UP"><em></em><span>UP</span></button><div class="sub_tooltip">UP</div></li>
                  <li class="share" ><button type="button" tip="공유하기"><em></em><span>공유하기</span></button><div class="sub_tooltip">공유하기</div></li>
                </ul>
  
                <div class="layer_tooltip">
                  <p class="error_text" style="display:none;"><em></em>본인을 즐겨찾기 할 수 없습니다. <br/> 다른 BJ를 즐겨찾기 해주세요.</p>
                  <p class="up_text" style="display:none;"><em></em><span>닉네임</span>님을 UP 하였습니다. <br/>UP은 하루에 한번씩!</p>
                  <p class="bookmark_text" style="display:none;"></p>
                  <p class="laterwatch_text" style="display: none;"></p>
                  <p class="edit_angle_text" style="display:none"></p>
                  <p class="time_shift_text alert_text" style="display:none;"><em></em>퀵뷰/퀵뷰 플러스 사용 시 타임머신 기능을<br>이용할 수 있는 공식 방송입니다.</p>
                  <!-- <p class="honey_fun_text" style="display: block;"><em></em>지금이 꿀잼타이밍이라면? 꿀잼각 버튼을 눌러주세요~.</p> -->
                  <!-- <p class="up_text"><em></em>이미 UP한 BJ입니다. <br/> 내일 또 UP해주세요.^^</p> -->
                  <!-- <p class="error_text"><em></em>즐겨찾기는 500개까지 추가 가능합니다. <br/> 즐겨찾기 정리 후 추가해주세요.</p> -->
                  <!-- <p class="error_text"><em></em>일시적인 문제로 UP을 실패하였습니다. <br/>잠시 후 다시 시도해 주세요.</p> -->
                  <!-- <p class="error_text"><em></em>본인을 UP 할 수 없습니다. <br/>다른 BJ를 추천해주세요.</p> -->
                  <!-- <p class="error_text"><em></em>본인의 방송은 꿀잼각으로 선정할 수 없습니다.</p> -->
                  <!-- <p class="error_text"><em></em><i>1</i>초 후에 다시 시도할 수 있습니다.</p> -->
                  <!-- <p class="error_text" style="display:block"><em></em>멀티 효과가 적용되었습니다.<br>화면 왼쪽에서 원하는 화면을 선택하세요.</p> -->
                  <!-- <p class="error_text"><em></em>BJ가 타임머신 기능이 지원되지<br/>않는 방송 옵션을 사용하여<br/>타임머신 기능을 제공하지 못합니다.</p> -->
                </div>
              </div>
            </div>
          </div>
          <!-- //htmlplayer_wrap -->
          <!-- broadcast_information -->
          <div class="broadcast_information">
            <input type="hidden" id="szBjId" value="dreamkey2015" />
            <input type="hidden" id="nStationNo" value="" />
            <div class="bj_thumbnail">
              <a href="https://bj.afreecatv.com/dreamkey2015" target="_blank" title="방송국 가기">
                <img src="https://res.afreecatv.com/images/afmain/img_thumb_profile.gif" onerror="this.src='https://res.afreecatv.com/images/afmain/img_thumb_profile.gif'" alt="BJ 로고" class="thum">
                <p><span>방송국<br />가기</span></p>
              </a>
            </div>
            <div class="text_information">
              <div class="nickname">꿈의조각♪</div>
              <div class="broadcast_viewer_cnt">
                <span><em id="nAllViewer">0</em></span>
                <div class="viewer_cnt_detail">
                  <strong>현재 유저 수</strong>
                  <ul>
                    <li>
                      <i></i><span>본방</span>:<span id="nCurrentViewer">0</span>
                      (<div><i></i><span>PC</span>:<span id="nPcViewer">0</span></div>/
                      <div><i></i><span>MOBILE</span>:<span id="nMobileViewer">0</span></div>)
                    </li>
                    <li><i></i><span>중계방</span>:<span id="nRelayViewer">0</span></li>
                    <li><i></i><span>누적 유저 수</span>:<span id="nTotalViewer">0</span></li>
                  </ul>
                </div>
              </div>
              <div class="btn_bjaward_poll" style="display:none;">
                <button type="button" class="btn_bjpoll">BJ대상 투표</button>
              </div>
  
              <div class="broadcast_title">
                <div class="btn_shopping" style="display:none;">
                  <a href="#n">상품구매</a>
                  <div class="layer_shopping">
                    <div>
                      판매 수익은 방송중인<br><em class="nick"></em> 님과 공유됩니다.									</div>
                    <button href="#n" class="close">닫기</button>
                    <span class="arr"></span>
                  </div>
                </div>
                <span>여러분의 사연을 글로 적지 않고 신청곡을 통해 BJ와 함께 소통해보세요~^^[실시간!소통!라디오♪음악방송]10화</span>

                <button id="open-room" type="button">Open Room</button>
                <button id="join-room" type="button">Join Room</button>

              </div>
              <div class="hashtag" id="hashtag"></div>
              <div class="etc">
                <ul>
                  <li class="up_cnt"><em>up</em><span class="count">0</span></li>
                  <li class="boomark_cnt"><em>즐겨찾기</em><span class="count">0</span></li>
                  <li class="detail"><button class="on">방송정보</button></li>
                </ul>
              </div>
              <ul class="detail_view" style="display:block;">
                <li><strong>방송시작시간</strong><span>2022-12-28 13:40:22</span></li>
                <li><strong>해상도</strong><span>640X360</span></li>
                <li><strong>화질</strong><span>1000K</span></li>
                <li><strong>카테고리</strong><span></span></li>
                <li><strong>방송국</strong><span><a href="#" target="_blank">AfreecaTV</a></span></li>
              </ul>
            </div>
            <button class="chat_open">채팅열기</button>
            <button class="btn_open">펼치기</button>
          </div>
          <!-- //broadcast_information -->
        </div>
        <!-- //player_area -->
        <!-- 채팅 영역 -->
        <!-- 채팅영역 chatting_area-->
  <div id="chatting_area" font-level="1" class="">
      <div class="move_handle"></div><!--채팅 영역 조절-->
      <!-- chatbox -->
      <div id="chatbox" class="chatbox">
          <!-- 2020-0214 -->
          <div class="chat_blind" style="display: none;">
              <div>
                  <p>채팅 팝업 상태입니다.</p>
                  <button type="button">채팅 불러오기</button>
              </div>
          </div>
          <div class="area_header">
              <div class="chat_move_wrap" tip="">
                  <button class="chat_move"></button><!--채팅 좌우 이동-->
                  <div class="tooltip" style="display: none;">
                      <p>좌/우로 자유롭게 이동해보세요!</p>
                      <button type="button" class="close">닫기</button>
                  </div>
              </div>
              <h2>
                  <span>채팅</span>
                  <a href="javascript:;" id="chatbox_btn_org" style="display:none">본방입장</a>
              </h2>
              <!-- 세팅 버튼들 -->
              <ul id="btnset">
                  <li id="setbox_chatnotice" class="c-notice" style="display:none;">
                      <a href="javascript:;" class="" tip="BJ 공지">BJ 공지</a>
                  </li>
                  <li id="setbox_mchat" class="mchat" style="display:none;">
                      <a href="javascript:;" class="off" tip="매니저 채팅">매니저 채팅</a>
                  </li>
                  <li id="setbox_kicklist" class="c-out" style="display:none;">
                      <a href="javascript:;" class="off" tip="강제퇴장인원">강제퇴장인원</a>
                  </li>
                  <li id="setbox_ice" class="ice" style="display:none;">
                      <a href="javascript:;" class="freeze" tip="얼리기">얼리기</a>
                  </li>
                  <li id="setbox_viewer" class="viewer">
                      <a href="javascript:;" class="off" tip="채팅참여인원">채팅참여인원</a>
                  </li><!-- 활성화  class="on" 추가 -->
                  <li id="setbox_set" class="set">
                      <a href="javascript:;" class="off" tip="설정">설정</a>
                  </li>
                  <li id="setbox_close" class="close">
                      <a href="javascript:;" class="tip-right" tip="채팅영역 숨기기">채팅영역 숨기기</a>
                  </li>
              </ul>
              <!-- //세팅 버튼들 -->
              <!-- idsearch 2015-07-31 추가 -->
              <div id="idsearch" class="idsearch" style="display:none;">
                  <input type="text" id="searchId" class="input_text" title="아이디" placeholder="아이디" />
                  <!-- SORT -->
                  <div class="sel"><!-- 1개나 첫번째엔 first 추가 -->
                      <a href="javascript:;" id="selChatOpt">채팅금지</a>
                      <ul id="selChatOptList" style="display: none;">
                          <li><a href="javascript:;">채팅금지</a></li>
                          <li><a href="javascript:;">강제퇴장</a></li>
                          <!-- <li><a href="javascript:;">블랙리스트 추가</a></li> -->
                          <li><a href="javascript:;">매니저 임명/해임</a></li>
                      </ul>
                  </div>
                  <!-- //SORT -->
                  <a id="applyChatOpt" href="javascript:;" class="btn_apply">적용</a>
              </div>
              <!-- //idsearch -->
              <!-- 채팅 공지, 타임광고 -->
              <div class="chat_topbox">
                  <!-- 채팅 공지 -->
                  <div class="chat_notice "> <!-- 클래스 open 추가 공지 열기 -->
                      <span class="ico new"><em></em></span> <!-- 새 공지 작성시 new 클래스 추가 -->
                      <div class="msg">
                          <p></p>
                      </div>
                      <a href="javascript:;" class="btn_chat_notice"><span>채팅 공지 열고 닫기</span></a>
                  </div>
                  <!-- //채팅 공지 -->
                  <!-- 타임 광고 -->
                  <a href="javascript:;" class="time_ad"></a>
                  <!-- //타임 광고 -->
              </div>
              <!-- //채팅 공지, 타임광고 -->
          </div>
          <!-- dashboard 얼리기 옵션 -->
          <div class="ui-pop setting_freeze" id="setting_freeze" style="display: none">
              <p class="pop-title">채팅방 얼리기</p>
              <div class="pop-body">
                  <p>BJ와 아래 선택한 등급은<br>채팅창을 얼려도 채팅이 가능합니다.</p>
                  <dl>
                      <dt>본방</dt>
                      <dd>
                          <p>얼린 후 채팅 참여 등급</p>
                          <ul id="origin_freeze_ul">
                              <li><label for="origin_freeze_0"><input type="checkbox" id="origin_freeze_0">열혈팬</label></li>
                              <li><label for="origin_freeze_1"><input type="checkbox" id="origin_freeze_1">구독팬</label></li>
                              <li><label for="origin_freeze_2"><input type="checkbox" id="origin_freeze_2">팬클럽</label></li>
                              <li><label for="origin_freeze_3"><input type="checkbox" id="origin_freeze_3">서포터</label></li>
                              <li><label for="origin_freeze_4"><input type="checkbox" id="origin_freeze_4">매니저</label></li>
                          </ul>
                          <button type="button" class="on" id="origin_chat_ice_btn" state="ice_on">얼리기</button>
                      </dd>
                  </dl>
                  <dl>
                      <dt>
                          중계방
                          <div class="tip">
                              <em></em>
                              <div>
                                  <p>모든 중계방이 한번에<br> 얼리기/녹이기 됩니다.</p>
                                  <p>각 중계방에 대한 얼리기는<br> 해당 방에서만 가능합니다.</p>
                              </div>
                          </div>
                      </dt>
                      <dd>
                          <p>얼린 후 채팅 참여 등급</p>
  
                          <ul id="relay_freeze_ul">
                              <li><label for="relay_freeze_0"><input type="checkbox" id="relay_freeze_0">열혈팬</label></li>
                              <li><label for="relay_freeze_1"><input type="checkbox" id="relay_freeze_1">구독팬</label></li>
                              <li><label for="relay_freeze_2"><input type="checkbox" id="relay_freeze_2">팬클럽</label></li>
                              <li><label for="relay_freeze_3"><input type="checkbox" id="relay_freeze_3">서포터</label></li>
                              <li><label for="relay_freeze_4"><input type="checkbox" id="relay_freeze_4">매니저</label></li>
                          </ul>
                          <button type="button" class="on" id="relay_chat_ice_btn" state="ice_on">얼리기</button>
                      </dd>
                  </dl>
              </div>
              <a href="javascript:;" class="pop-close"><span>레이어 닫기</span></a>
          </div>
  
          <!-- 레이어_시청자리스트 -->
          <div class="chat_layer list_participant" id="list_viewer">
              <div class="area_header"><h2><span>채팅참여인원</span></h2></div>
  
              <div class="input_wrap" style="display: none;">
                  <input type="text">
                  <button class="delete">지우기</button>
                  <button class="search">검색</button>
              </div>
  
              <div class="contents">
                  <div class="list">
                      <dl class="bj" style="display: none;">
                          <dt>BJ</dt>
                          <dd>
                              <ul class="bj vlist">
                              </ul>
                          </dd>
                      </dl>
                      <dl class="manager" style="display: none;">
                          <dt>매니저</dt>
                          <dd>
                              <ul class="manager vlist">
                              </ul>
                          </dd>
                      </dl>
  
                      <dl class="hot" style="display: none;">
                          <dt>열혈팬</dt>
                          <dd>
                              <ul class="hot vlist">
                              </ul>
                          </dd>
                      </dl>
  
                      <dl class="subscription" style="display: none;">
                          <dt>구독팬</dt>
                          <dd>
                              <ul class="subscription vlist">
                              </ul>
                          </dd>
                      </dl>
  
                      <dl class="fan" style="display: none;">
                          <dt>팬</dt>
                          <dd>
                              <ul class="fan vlist">
                              </ul>
                          </dd>
                      </dl>
  
                      <dl class="supporter" style="display: none;">
                          <dt>서포터</dt>
                          <dd>
                              <ul class="supporter vlist">
                              </ul>
                          </dd>
                      </dl>
  
                      <dl class="normal" style="display: none;">
                          <dt>일반 참여자</dt>
                          <dd>
                              <ul class="normal vlist">
                              </ul>
                          </dd>
                      </dl>
  
                  </div>
  
                  <div class="none" style="display: none;">
                      <div>
                          <em>%</em> 에 대한 <br>검색결과가 없습니다.                        <p>확인 후 다시 검색해주세요.</p>
                      </div>
                  </div>
  
              </div>
              <button class="more">펼치기 / 닫기</button>
              <a href="javascript:;" class="close">닫기</a>
          </div>
          <!-- //레이어_시청자리스트 -->
  
  
          <div class="chat_layer_setting">
              <div class="chat_layer setting_chat">
                  <div class="area_header"><h2><span>채팅 설정</span></h2></div>
                  <div class="contents">
                      <ul>
                          <li><a href="javascript:;" class="more_layer" data-title="mark">채팅창 표시 방법</a></li>
                          <li><a href="javascript:;" class="more_layer" data-title="person">개인 설정</a></li>
                      </ul>
                      <ul style="display: none;">
                          <li style="display: none;"><a href="javascript:;" class="more_layer" data-title="manage">채팅 관리</a></li>
                      </ul>
                      <ul>
                          <li><a href="javascript:;" id="clear_chat">채팅 지우기</a></li>
                          <li><a href="javascript:;" id="popout_chat">채팅 팝업</a></li>
                          <li><a href="javascript:;" id="chat_rules">채팅 규칙 보기</a></li>
                      </ul>
                      <div class="font-level">
                          <span>채팅 크기 설정</span>
                          <div class="ctrl">
                              <input type="text" value="1" readonly="">
                              <button class="minus">-</button>
                              <button class="plus">+</button>
                          </div>
                          <div class="preview" font-level="1">
                              <dl>
                                  <dt class="man">
                                      <em></em>
                                      <img src="https://res.afreecatv.com/images/chat/ic_chat/ic_fanclub.svg">
                                      <img src="https://res.afreecatv.com/images/chat/ic_chat/ic_quick.svg">
                                      <a href="javascript:;">아프리카TV</a> :
                                  </dt>
                                  <dd>안녕하세요</dd>
                              </dl>
                          </div>
                      </div>
                  </div>
                  <a href="javascript:;" class="close">닫기</a>
              </div>
  
              <div class="chat_layer sub mark">
                  <div class="area_header">
                      <a href="javascript:;" class="history_back">뒤로가기</a>
                      <h2><span>채팅창 표시 방법</span></h2>
                  </div>
                  <div class="contents">
                      <ul>
                          <li>
                              <div class="checkbox_wrap">
                                  <input type="checkbox" id="st1_emoticon">
                                  <label for="emoticon_view">이모티콘 보기</label>
                              </div>
                          </li>
                          <li>
                <div class="checkbox_wrap">
                  <input type="checkbox" id="st1_emoticon_ani">
                  <label for="emoticon_ani">이모티콘 움직이기</label>
                </div>
              </li>
                          <li>
                              <div class="checkbox_wrap">
                                  <input type="checkbox" id="st1_ogq">
                                  <label for="emoticon_small">OGQ 이모티콘 작게보기</label>
                              </div>
                          </li>
                          <li>
                              <div class="checkbox_wrap">
                                  <input type="checkbox" id="st1_joinout">
                                  <label for="participant_view">참여자 출입 표시</label>
                              </div>
                          </li>
                      </ul>
                  </div>
                  <a href="javascript:;" class="close">닫기</a>
              </div>
  
              <div class="chat_layer sub person">
                  <div class="area_header">
                      <a href="javascript:;" class="history_back">뒤로가기</a>
                      <h2><span>개인 설정</span></h2>
                  </div>
                  <div class="contents">
                      <ul>
                          <li>
                              <a href="javascript:;" class="title" id="change_nickname">닉네임 변경</a>
                          </li>
                          <li>
                              <a href="javascript:;" class="title" id="change_subscription_nickname" style="display: none;">구독 닉네임 변경</a>
                          </li>
                          <li>
                              <div class="checkbox_wrap">
                                  <input type="checkbox" id="st1_whisper">
                                  <label for="whisper_receive">귓속말 수신 허용</label>
                              </div>
                          </li>
                          <li style="display: none;">
                              <div class="checkbox_wrap">
                                  <input type="checkbox" id="st1_trans">
                                  <label for="global_translation">해외 언어 번역</label>
                              </div>
                          </li>
                          <li>
                              <div class="checkbox_wrap">
                                  <input type="checkbox" id="st1_fanchatcolor">
                                  <label for="fan_color">팬채팅 색상 사용</label>
                              </div>
                          </li>
                      </ul>
                  </div>
                  <a href="javascript:;" class="close">닫기</a>
              </div>
  
              <div class="chat_layer sub manage">
                  <div class="area_header">
                      <a href="javascript:;" class="history_back">뒤로가기</a>
                      <h2><span>채팅 관리</span></h2>
                  </div>
                  <div class="contents">
                      <ul>
                          <li style="display: none;"><a href="javascript:;" id="manage_relay">중계방 관리</a></li>
                          <li style="display: none;">
                              <div class="checkbox_wrap">
                                  <input type="checkbox" id="st1_ban_msg">
                                  <label for="global_translation">강제퇴장메시지 유저에게 보이기</label>
                              </div>
                          </li>
                      </ul>
                  </div>
                  <a href="javascript:;" class="close">닫기</a>
              </div>
          </div>
  
  
          <!-- 2018-0118 채팅 하단 이동 버튼 추가 -->
          <div class="chat_scroll_down">
              <button type="button">채팅 아래로 스크롤</button>
          </div>
          <!-- //2018-0118 채팅 하단 이동 버튼 추가 -->
          <!-- 2019-1202  on 클레스 추가시 출력  -->
          <div class="emoticon_output">
              <button type="button" class="btn_output"><img src="" onerror="this.src='https://res.afreecatv.com/images/chat/ogq_default.png'" alt=""></button>
              <button type="button" class="close"><span>닫기</span></button>
          </div>
          <!-- actionbox -->
          <div id="actionbox" class="actionbox">
              <!-- 버튼들 -->
              <ul id="ul1" class="ul1">
                  <li id="btn_emo" class="emo first off"><a href="javascript:;" tip="이모티콘">이모티콘</a><span class="emo_tiplayer" id="emoLayer" style="display:none;"><em class="txt"></em><span class="icon"></span><button type="button" class="close">닫기</button></span></li><!-- 활성화  class="on" 추가 -->
                  <li id="btn_police" class="police off"><a href="javascript:;" tip="신고">신고</a></li>
                  <li id="btn_translation" class="translation" style="display:none;"><em></em><a href="#n" tip="번역">번역</a></li>
              </ul>
              <ul id="ul2" class="ul2">
                  <li id="btn_star" class="star off"><a href="javascript:;" tip="별풍선 선물하기">별풍선 선물하기</a></li>
                  <li id="btn_adballoon" class="adballoon off"><a href="javascript:;" tip="애드벌룬 선물하기">애드벌룬 선물하기</a></li>
                  <li id="btn_sticker" class="sticker off"><a href="javascript:;" tip="스티커 선물하기">스티커 선물하기</a></li>
                  <li class="game_point off" style="display:none;">
                      <a href="javascript:;" tip="젬(Gem)">젬(Gem)<span class="ic_new"></span></a>
                      <div class="game_point_layer" style="display:none;">
                          <p><em>젬</em>을 모아 이모티콘 오픈, 응모,  <br> 승부예측 등 다양한 활동에 참여해보세요!</p>
                          <button class="close">닫기</button>
                      </div>
                  </li>
              </ul>
              <div class="ic_gem" style="display:none;"></div>
              <!-- //버튼들 -->
              <div class="translation_select">
                  <div class="translation_select_con">
                      <div class="select_btn off"> <!-- on off 로 리스트 출력 -->
                          <a href="#n"><span id="trans_selected_lang" data="zh_CN" langCode="4">중국어 간체</span><em></em></a>
                          <ul>
                              <li class="translation_lang"><a href="#n" data="zh_CN" langCode="4">중국어 간체</a></li>
                              <li class="translation_lang"><a href="#n" data="zh_TW" langCode="5">중국어 번체</a></li>
                                                          <li class="translation_lang"><a href="#n" data="ja_JP" langCode="2">일본어</a></li>
                              <li class="translation_lang"><a href="#n" data="en_US" langCode="1">영어</a></li>
                              <li class="translation_lang"><a href="#n" data="th_TH" langCode="6">태국어</a></li>
                              <li class="translation_lang"><a href="#n" data="vi_VN" langCode="7">베트남어</a></li>
                          </ul>
                      </div><span>로</span><button type="button" id="trans_submit">번역</button>
                  </div>
              </div>
              <!-- chat_write -->
              <div id="chat_write" class="chat_write">
                  <h3>채팅쓰기</h3>
                  <div class="ad_toggle">
                          <span class="blue">
                              <input id="manage" type="radio" name="managerchat" checked="checked" class="on" data-message-type="1">
                              <label for="manage" class="on">운영</label>
                          </span>
                      <span class="red">
                              <input id="warning" type="radio" name="managerchat" data-message-type="2">
                              <label for="warning">경고</label>
                          </span>
                  </div>
                  <div id="write_area" class="write_area" contenteditable="true" ondragenter="return false;" ondrop="return false;" ondragover="return false;" placeholder="채팅 입력 (C)"></div>
              <button type="button" id="btn_send" class="btn_send" title="보내기" placeholder="채팅 입력 (C)">보내기</button>
          </div>
          <!-- //chat_write -->
          <!-- vote button -->
          <div class="poll_layer" id="layer_poll">
              <!-- <a href="javascript:;" class="poll"><span>투표하기</span>새 투표가 시작되었습니다.</a>
  <a href="#" class="poll_end"><span>투표 마감</span>투표가 마감되었습니다.</a>//
  <a href="#" class="poll_result"><span>투표 결과</span>투표결과가 발표되었습니다.</a>//
  <button type="button" class="btn_close" onclick="document.getElementById('layer_poll').style.display='none'"><span class="blind">닫기</span></button> -->
          </div>
          <!-- //vote button -->
      </div>
      <!-- //actionbox -->
  
      <!-- 레이어_이모티콘 2015-09-07 추가 -->
      <div id="emoticonArea">
          <div id="emoticonBox" class="ogq">
              <div class="tab_area">
                  <ul>
                      <li><a href="javascript:;">이모티콘</a></li>
                  </ul>
                  <div class="item_list">
                      <button class="prev off">이전</button> <!-- off 클레스로 비활성화  -->
                      <div>
                          <ul>
                              <li class="on" data-type="RECENT"><button type="button" class="ic_clock"></button></li>
                              <li data-type="SUBSCRIPTION"><button type="button"><img src="https://res.afreecatv.com/images/webplayer/chat/icon_small1.png" alt="구독"></button></li>
                              <li data-type="DEFAULT"><button type="button"><img src="https://res.afreecatv.com/images/webplayer/chat/icon_small2.png" alt="AF기본"></button></li>
                          </ul>
                      </div>
                      <button class="next off">다음</button> <!-- off 클레스로 비활성화  -->
                  </div>
              </div>
  
              <!-- 최근 사용 이모티콘 탭 -->
              <ul class="tab_area2" style="display: none;">
                  <li class="on" data-type="DEFAULT"><a href="javascript:;"><span>이모티콘</span></a></li>
                  <li class="" data-type="OGQ"><a href="javascript:;"><span>구매 이모티콘</span></a></li>
              </ul>
              <!-- // 최근 사용 이모티콘 탭 -->
  
              <div class="scroll_area recent_emoticon recent_emoticon_default"> </div>
              <div class="scroll_area recent_emoticon recent_emoticon_ogq" style="display: none;" > </div>
  
              <div class="scroll_area subscription_emoticon" style="display: none;">
                  <!-- <div class="sg_area"></div> -->
              </div>
              <div class="scroll_area common_emoticon"></div>
              <div class="btn_close"><a href="javascript:;" title="닫기">닫기</a></div>
          </div>
      </div>
      <!-- //레이어_이모티콘 -->
  
      <div id="chat_area" class="chat_area"></div>
      <!-- //chat_area -->
  
      <!-- 광고배너 ti_wrap3 플래시 채팅창TI 214*400px 2015-11-19 추가 -->
      <div id="chat_ad" class="chat_banner" style="display:none;"><div class="ti_in">
              <a href="javascript:;"></a>
              <a href="javascript:;"><img src="https://res.afreecatv.com/new_player/img/btn_adclose.png" class="btn_close" alt="닫기"></a>
          </div></div>
      <!-- //광고배너 ti_wrap3 -->
      </div>
      <!-- //chatbox -->
  
      <div id="chat_container_chat_rules" class="chat_rule"> <!-- on 클레스 추가로 출력 -->
          <div class="chat_rule_title">
          </div>
          <div class="chat_rule_contents">
              <div class="box">
              </div>
          </div>
          <div class="footer">
              <button id="agree_button" type="button">규칙에 동의합니다!</button>
              <button id="close_button" type="button">닫기</button>
          </div>
      </div>
  </div>
  <!-- //채팅영역 chatting_area-->
        <!-- //채팅 영역-->
        <!-- 영상리스트 영역 list_area-->
        <div id="list_area" class="list_area">
          <div class="area_header">
            <button class="chat_move"></button><!--채팅 좌우 이동-->
            <h2><span>리스트</span></h2>
            <ul>
              <li class="refresh"><a href="#n">새로고침</a></li>
              <li class="close"><a href="#n">닫기</a></li>
            </ul>
            <ul id="tabSearchItemTab" class="list_tab" style="display:none;">
              <li class="on" id="searchAll" data-type="searchAll"><a href="#n">통합검색</a></li>
              <li id="searchBroad" data-type="searchBroad"><a href="#n">생방송</a></li>
              <li id="searchVod" data-type="searchVod"><a href="#n">VOD</a></li>
              <li id="searchBj" data-type="searchBj"><a href="#n">BJ</a></li>
              <li id="searchClose" class="close"><a href="#n">검색 닫기</a></li>
            </ul>
          </div>
          <div class="loading">loading</div>
          <div class="list_contents randomBtn_add" id="tabList">
            <div class="bjvod">
            </div>
            <div class="recom">
            </div>
            <div class="curation">
            </div>
            <!-- LIST SECTION TEMPLETE-->
            <dl class="section_templete" style="display:none">
              <dd>
                <h4 class="sub_title"></h4>
                <ul class="contents_list">
                </ul>
              </dd>
            </dl>
            <!-- //LIST SECTION TEMPLETE-->
          </div>
          <div class="list_contents" id="tabSearch" style="display:none;">
  
            <div class="list_contents_item" id="tabSearchItemSel">
              <div class="select_box" id="selLiveSearch1">
                <a class="selected" href="#n" data="">정확도 순</a>
                <ul>
                  <li><a href="javascript:;" data="rank">BJ 랭킹 순</a></li>
                  <li><a href="javascript:;" data="pc_total_view_cnt">참여인원 순</a></li>
                  <li><a href="javascript:;" data="broad_start">최신 순</a></li>
                  <li><a href="javascript:;" data="broad_bps">고화질 순</a></li>
                  <li><a href="javascript:;" data="broad_resolution">고해상도 순</a></li>
                  <li><a href="javascript:;" data="">정확도 순</a></li>
                </ul>
              </div>
              <div class="select_box" id="selVodSearch1">
                <a class="selected" href="#n" data="ALL">전체</a>
                <ul>
                  <li><a href="javascript:;" data="ALL">전체</a></li>
                  <li><a href="javascript:;" data="REVIEW">방송 다시보기</a></li>
                  <li><a href="javascript:;" data="HIGHLIGHT">하이라이트</a></li>
                  <li><a href="javascript:;" data="NORMAL">업로드 VOD</a></li>
                  <li><a href="javascript:;" data="CLIP">유저클립</a></li>
                  <li><a href="javascript:;" data="PLAYLIST">재생목록</a></li>
                </ul>
              </div>
              <div class="select_box" id="selVodSearch2">
                <a class="selected" href="#n" data="">정확도 순</a>
                <ul>
                  <li><a href="javascript:;" data="">정확도 순</a></li>
                  <li><a href="javascript:;" data="reg_datetime">최신 순</a></li>
                  <li><a href="javascript:;" data="view_cnt">재생인원순</a></li>
                </ul>
              </div>
              <div class="select_box" id="selVodSearch3">
                <a class="selected" href="#n" data="1year">1년</a>
                <ul>
                  <li><a href="javascript:;" data="">전체</a></li>
                  <li><a href="javascript:;" data="1day">1일</a></li>
                  <li><a href="javascript:;" data="1week">1주</a></li>
                  <li><a href="javascript:;" data="1month">1개월</a></li>
                  <li><a href="javascript:;" data="1year">1년</a></li>
                </ul>
              </div>
              <div class="select_box" id="selBjSearch1">
                <a class="selected" href="#n" data="">정확도 순</a>
                <ul>
                  <li><a href="javascript:;" data="">정확도 순</a></li>
                  <li><a href="javascript:;" data="total_view_cnt">누적참여자 순</a></li>
                  <li><a href="javascript:;" data="total_broad_time">방송시간 순</a></li>
                  <li><a href="javascript:;" data="favorite_cnt">애청자 순</a></li>
                  <li><a href="javascript:;" data="fanclub_cnt">팬클럽 순</a></li>
                </ul>
              </div>
            </div>
            <p class="no_result" style="display:none;"> 입력하신 검색어 <span></span>에 대한 <br> 검색 결과가 없습니다. </p>
            <dl class="search_templete" style="display:none">
              <dt class="sub_title"><h3><em></em>생방송 검색결과 <span>86건</span></h3><a href="#n">더보기</a></dt>
              <dd>
                <ul class="contents_list">
                </ul>
              </dd>
            </dl>
            <div class="paging" style="display:none;">
            </div>
          </div>
          <!-- 2016-0919 생방송일때만 출력 -->
          <div class="random_broadcast" id="btn_random_broad_frame">
            <a href="javascript:;" id="btn_random_broad_view" class="btn_random">랜덤으로 방송입장</a>
            <a href="javascript:;" id="btn_random_broad_setting" class="btn_random_setting"> <span class="blind">환경설정</span> </a>
            <!-- <div class="icon_new" style=""> <span class="blind">new</span></div> -->
          </div>
        </div>
        <!-- //영상리스트 영역 list_area-->
        <!-- 즐겨찾기리스트 영역 list_bookmark_area-->
        <div id="list_bookmark_area" class="list_area seach_view">
          <div class="area_header">
            <button class="chat_move"></button><!--채팅 좌우 이동-->
            <h2><span>즐겨찾기</span></h2>
            <!-- 2019-0611 -->
            <ul class="list_tab">
              <li data-type="LIST_ALL"><a href="javascript:;">전체</a></li>
              <li  data-type="LIST_ONAIR"><a href="javascript:;">방송중</a></li>
              <li data-type="LIST_VOD"><a href="javascript:;">VOD</a></li>
              <li data-type="LIST_BJ"><a href="javascript:;">BJ</a></li>
            </ul>
            <!-- 2019-0611 -->
            <ul>
              <li class="refresh"><a href="#n">닫기</a></li>
              <li class="close"><a href="#n">닫기</a></li>
            </ul>
          </div>
          <div class="loading">loading</div>
          <div class="list_contents">
            <div class="list_contents_item">
              <!-- <div class="select_box" id="selFavorite1">
          <a class="select_label" href="javascript:;" data-type="LIST_ALL">전체</a>
          <ul>
        <li><a href="javascript:;" data-type="LIST_ALL">전체</a></li>
        <li><a href="javascript:;" data-type="LIST_ONAIR">방송중</a></li>
        <li><a href="javascript:;" data-type="LIST_VOD">VOD</a></li>
        <li><a href="javascript:;" data-type="LIST_BJ">BJ</a></li>
        </ul>
        </div> -->
              <div class="select_box" id="selFavorite2" style="display:none;">
                <a class="select_label" href="javascript:;">전체</a>
                <ul>
                  <li><a href="javascript:;">전체</a></li>
                  <li><a href="javascript:;">방송중</a></li>
                  <li><a href="javascript:;">VOD</a></li>
                  <li><a href="javascript:;">BJ</a></li>
                </ul>
              </div>
            </div>
            <p class="no_result" style="display:none;">즐겨찾기한 BJ가 없습니다.</p>
            <!-- <div class="list_contents_item">
          <ul class="list_tab">
            <li class="on"><a href="#n">통합검색</a></li>
            <li><a href="#n">생방송</a></li>
            <li><a href="#n">VOD</a></li>
            <li class="close"><a href="#n">검색 닫기</a></li>
          </ul>
        </div> -->
            <dl class="section" id="listOnAirFavorite"  style="display:none;">
              <dt class="sub_title"><h3>방송중</h3></dt>
              <dd>
                <ul class="contents_list">
                </ul>
              </dd>
            </dl>
  
            <dl class="section" id="listVodFavorite"  style="display:none;">
              <!--
          2019.02.27
          더보기 이아콘이 없으면 <h3>내용</h3>
          더보기 아이콘이 있으면 <h3><a href="#" title="내용 + 더보기">내용</a></h3>
        -->
              <dt class="sub_title"><h3>즐겨찾기한 BJ의 VOD</h3></dt>
              <dd>
                <ul class="contents_list">
                </ul>
              </dd>
            </dl>
  
            <dl class="section" id="listAllFavorite"  style="display:none;">
              <!--
          2019.02.27
          더보기 이아콘이 없으면 <h3>내용</h3>
          더보기 아이콘이 있으면 <h3><a href="#" title="내용 + 더보기">내용</a></h3>
        -->
              <dt class="sub_title"><h3>즐겨찾기 BJ</h3></dt>
              <dd>
                <ul class="bookmook_list contents_list">
                </ul>
              </dd>
            </dl>
            <div class="paging" style="display:none;">
              <a class="page-item prev" href="#">이전</a>
              <a class="page-item on" href="#">1</a>
              <a class="page-item" href="#">2</a>
              <a class="page-item" href="#">3</a>
              <a class="page-item" href="#">4</a>
              <a class="page-item" href="#">5</a>
              <!-- <a class="page-item" href="#">6</a>
        <a class="page-item" href="#">7</a>
        <a class="page-item" href="#">8</a>
        <a class="page-item" href="#">9</a>
        <a class="page-item" href="#">10</a>
        <span>...</span>
        <a class="page-item" href="#">15</a> -->
              <a class="page-item next" href="#">다음</a>
            </div>
  
          </div>
        </div>
        <!-- //즐겨찾기리스트 영역 list_bookmark_area-->
      </div>
      <!-- //webplayer_contents -->
    </div>
    <!-- //webplayer_scroll -->
  
    <!-- 각종 레이어 위치 -->
    <!-- //채팅 팝업과 공통 레이어 영역 -->
    <!-- 이동가능한 레이어 위치 -->
  <div class="moveLayer">
    <!-- //매니저 채팅 -->
    <div id="layer_mchat" class="layer_mchat" style="display: none;">
      <h2>매니저 채팅<button type="button" id="btn_mchat_clear" tip="채팅 지우기">채팅 지우기</button></h2>
      <a class="btn_close" href="javascript:;">닫기</a>
      <!-- sendbox -->
      <div class="sendbox">
        <!--input type="text" id="m_write_area" class="input" /-->
        <div><textarea id="m_write_area" class="input" style="resize:none;"></textarea></div>
        <a class="send" id="m_btn_send" href="javascript:;">보내기</a>
      </div>
      <!-- //sendbox -->
      <!-- mchatlist -->
      <div id="mchatlist" class="mchatlist">
        <div id="m_chat_area" class="m_chat_area">
          <div id="m_chat_memoyo" class="chat_memoyo">
          </div>
        </div>
      </div>
      <!-- //mchatlist -->
    </div>
    <!-- //매니저 채팅 -->
    <!--채팅지킴이 관리목록 width:364px;height:494px-->
    <div class="chat-keeper" id="adminManagerList" style="display: none;">
      <div class="layer_in">
        <strong class="title">채팅지킴이 관리목록</strong>
        <div class="inwrap">
          <div class="section relay">
            <strong>BJ중계방</strong>
            <div class="box_tb">
              <table cellspacing="0" cellpadding="0" id="relayBroadList"><!--160830 span 추가-->
              </table>
            </div>
          </div>
        </div>
        <div class="btn_wrap">
          <a href="javascript:;" class="btn_st2">닫기</a>
        </div>
        <a href="javascript:;" class="btn_close2">닫기</a>
      </div>
    </div>
    <!--//채팅지킴이 관리목록-->
  
    <!--매니저 중계방 관리 목록-->
    <div class="ui-pop relay" id="relayBroadManageList" style="display: none;">
      <div class="pop-title"><p>중계방 관리</p>
        <button type="button" class="btn_refresh"><span class="blind">새로고침</span></button>
      </div>
      <div class="pop-body">
        <p class="txt">
          BJ와 고정 매니저만 본방, 중계방을 관리할 수 있습니다. 				<br>
          (단, FULL방은 열혈팬이거나 퀵뷰를 보유해야만 입장가능)			</p>
        <div class="tbl">
          <table>
            <colgroup>
              <col style="width:60px;">
              <col style="width:80px;">
              <col style="width:100px;">
              <col>
            </colgroup>
            <thead>
            <tr>
              <th>구분</th>
              <th>방송번호</th>
              <th>인원(PC/MOBILE)</th>
              <th>입장</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
      <div class="pop-btn line">
        <a href="javascript:;" class="btn">닫기</a>
      </div>
      <a href="javascript:;" class="pop-close"><span>닫기</span></a>
    </div>
    <!--//매니저 중계방 관리 목록-->
  </div>
  <!-- //이동가능한 레이어 위치 -->
  
  <!-- 고정된 레이어 위치 -->
  <div class="fixLayer">
      <!-- 방송진단 레이어 -->
      <div class="ui-pop diagnose" id="layerCheckPlayerState" style="display:none;">   <!--  scroll 클레스 추가시 컨텐츠 스크롤 되며 헤더 스타일 변경 -->
          <p class="pop-title">내 상태 진단하기<span>방송참여에 문제가 있을 때 확인해보세요.</span></p>
          <div class="pop-body">
              <div class="scroll_box">
                  <dl id="playerStateServer" class="align-center">
                      <dt><em class="icon connect"></em> 방송 접속 상태</dt>
                      <dd>
                          <div class="state">진단 대기중</div>
                          <p class="progress_bar" style="display: none;"><span style="width:0%;"></span></p>
                          <ul class="info">
                          </ul>
                      </dd>
                  </dl>
  
                  <dl id="playerStateAgent" class="align-center">
                      <dt><em class="icon high-definition"></em>고화질 스트리머</dt>
                      <dd>
                          <div class="state">진단 대기중</div>
                          <p class="progress_bar" style="display: none;"><span style="width:0%;"></span></p>
                          <ul class="info">
                          </ul>
                      </dd>
                  </dl>
  
                  <dl id="playerStateChat" class="align-center">  <!--  open 클레스 추가시 하단 정보영역 출력-->
                      <dt><em class="icon chatting"></em>채팅 접속 상태</dt>
                      <dd>
                          <div class="state">진단 대기중</div>
                          <p class="progress_bar" style="display: none;"><span style="width:0%;"></span></p>
                          <ul class="info">
                          </ul>
                      </dd>
                  </dl>
  
                  <dl id="playerStateNetwork" class="align-center">
                      <dt><em class="icon network"></em>네트워크 상태</dt>
                      <dd>
                          <div class="state">진단 대기중</div>
                          <p class="progress_bar" style="display: none;"><span style="width:0%;"></span></p>
                          <ul class="info">
                          </ul>
                      </dd>
                  </dl>
  
                  <dl id="playerStateSpeed" class="align-center">
                      <dt><em class="icon internet"></em>인터넷 속도</dt>
                      <dd>
                          <div class="state">진단 대기중</div>
                          <p class="progress_bar" style="display: none;"><span style="width:0%;"></span></p>
                          <ul class="info">
                          </ul>
                      </dd>
                  </dl>
  
                  <div class="pop-btn">
                      <a href="javascript:;" class="btn btn_blue btn_check_start">진단 시작하기</a>  <!-- off 클레스 추가 시 비활성화 -->
                  </div>
              </div>
          </div>
          <a href="javascript:;" class="pop-close"><span>레이어 닫기</span></a>
      </div>
      <!-- //방송진단 레이어 -->
      <!-- 강제퇴장인원 -->
      <div class="wrap-out" id="layerKickList" style="display:none;">
          <div class="layer_in">
              <strong class="title">강제퇴장인원</strong>
              <div class="total_p"><strong class="total">총 인원</strong> (<strong id="kickListCount">0</strong>명)</div>
              <div class="list_area">
                  <div class="list-head">
                      <strong class="nic">닉네임(아이디)</strong>
                      <strong class="time">적용 시간</strong>
                      <strong class="sysop">적용 BJ/매니저</strong>
                      <strong class="out">강제퇴장</strong>
                  </div>
                  <div class="list-body">
                      <ul id="kickList">
                      </ul>
                  </div>
              </div>
              <button type="button" id="refreshKickList" class="btn_refresh"><span class="blind">새로고침</span></button>
              <div class="btn_wrap"><a href="javascript:;" class="btn_st2">닫기</a></div>
              <a href="javascript:;" class="btn_close2">닫기</a>
          </div>
      </div>
      <!-- //강제퇴장인원 -->
  
      <!-- 방송 신고 접수 -->
      <div class="layer_m" id="layerReport"><div class="layer_in">
          <strong class="title">방송 신고 접수</strong>
          <div class="layer_ac">
              <strong class="color_blk">이 방송을 어떤 문제로 신고하시겠습니까?</strong><br />
              <span class="fts11_pdt5">지속적인 허위 신고 접수 시<br />서비스 이용이 제한될 수 있습니다.</span>
          </div>
          <div class="report_box">
              <div class="gift_img">퀵뷰아이템 이용권"</div>
              <div class="text">
                  <em>불법 사설 도박, 음란물 신고시<br />추첨을 통해 <strong class="color_bl">퀵뷰 30일 이용권</strong>을 드립니다.</em>
                  <a href="https://afwbbs1.afreecatv.com/app/index.php?board=notice&b_no=3247&control=view" target="_blank">신고보상 자세히 보기</a>
              </div>
          </div>
          <div class="btn_wrap"><a href="javascript:;" id="reportToto" class="btn_st1">불법사설 도박 신고</a> <a href="javascript:;" id="reportAdult" class="btn_st1">음란물 신고</a> <a href="https://help.afreecatv.com/atv.php?type=exMailDeclare" class="btn_st2" target="_blank">기타신고</a></div>
          <a href="javascript:;" class="btn_close2">닫기</a>
      </div></div>
      <!-- //방송 신고 접수 -->
  
      <!-- 음란물로 신고하겠습니까? -->
      <div class="layer_m" id="layerReportAdult"><div class="layer_in">
          <div class="layer_ac">
              <strong class="color_blk">본 방송(BJ ID : <span class="color_bl">%s</span>)을<br />음란물로 신고하겠습니까?</strong>
              <span class="icon_exc">&apos;신고&apos; 버튼을 누르는 시점의 방송 화면이 <br />자동 저장되어 접수 됩니다</span>
          </div>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">신고</a> <a href="javascript:;" class="btn_st2">취소</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
      </div></div>
      <!-- //음란물로 신고하겠습니까? -->
  
      <!-- 불법 사설 도박으로 신고하겠습니까? 2015-12-10 추가 -->
      <div class="layer_m" id="layerReportToto"><div class="layer_in">
          <div class="layer_ac">
              <strong class="color_blk">본 방송(BJ ID : <span class="color_bl"></span>)을<br />불법 사설 도박으로 신고하시겠습니까?</strong>
              <span class="icon_exc">&apos;신고&apos; 버튼을 누르는 시점의 방송 화면이 <br />자동 저장되어 접수 됩니다</span>
          </div>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">신고</a> <a href="javascript:;" class="btn_st2">취소</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
      </div></div>
      <!-- //불법 사설 도박으로 신고하겠습니까? -->
      <!-- 별풍선 선물하기 -->
      <div class="layer_l" id="layerStarGift"><div class="layer_in">
          <strong class="title">별풍선 선물하기</strong>
          <div class="layer_al">
              <strong class="color_blk">별풍선이란?</strong> &nbsp; <a href="https://item.afreecatv.com/starballoon.php" target="_blank" class="color_bl fts11">별풍선 헤택이 궁금하다면 클릭!</a><br />
              <ul class="sub_list2">
                  <li>참여자가 BJ에게 선물할 수 있는 유료 아이템입니다. <br /><span class="fts11 color_gray">(BJ는 별풍선을 환전하여 실제수익으로 돌려받게 됩니다.)</span></li>
                  <li>별풍선을 선물하시면 자동으로 BJ 팬클럽에 가입이 됩니다. <br /><span class="fts11 color_gray">(팬클럽 이모티콘 표시 / 팬클럽 전용 채팅컬러 제공)</span></li>
              </ul>
              <ul class="table_list">
                  <li><span><em>별풍선을 선물할 BJ</em> : </span><strong class="color_bl"></strong></li>
                  <li><span><em>내가 보유한 별풍선</em> : </span>0개 <a href="javascript:;" class="btn_st3">별풍선 구매</a></li>
                  <li>
                      <span><em>선물할 별풍선</em> : </span>
                      <fieldset class="select_area">
                          <legend>선물할 별풍선 선택</legend>
                          <input type="radio" name="optStarBalloon" label="no5" class="input_radio" value="5" checked /> <label for="no5">5개</label> &nbsp;
                          <input type="radio" name="optStarBalloon" label="no10" class="input_radio" value="10" /> <label for="no5">10개</label> &nbsp;
                          <input type="radio" name="optStarBalloon" label="no50" class="input_radio" value="50" /> <label for="no5">50개</label> &nbsp;
                          <input type="radio" name="optStarBalloon" label="no100" class="input_radio" value="100" /> <label for="no5">100개</label><br />
                          <em><input type="radio" label="write" name="optStarBalloon" value="-1" class="input_radio" /> 직접입력 <input type="text" id="nStarBalloon" class="input_text" style="width:60px" maxlength="5" disabled /> 개</em>
                      </fieldset>
  
                  </li>
              </ul>
          </div>
          <div class="btn_wrap"><a href="javascript:;" class="btn_st1">선물하기</a> <a href="javascript:;" class="btn_st2">취소</a></div>
          <a href="javascript:;" class="btn_close2">닫기</a>
      </div></div>
      <!-- //별풍선 선물하기 -->
  
      <!-- 별풍선 선물하기 신규(국내만) -->
      <div class="pop_stargift" id="layerStarGiftNew">
      <div class="layer_in">
          <div class="loading"><span></span></div>
          <div class="guide_layer" style="display:none">
              <a href="javascript:;" class="close sub">close</a>
              <div class="guide_step1">
                  <strong>1. VOD 주소입력</strong>
                  <p>재생수 100 / UP 20 이상의 <br>다시보기, 하이라이트, <br> 업로드 VOD, 유저 VOD 중 선택</p>
              </div>
              <div class="guide_step2">
                  <strong>2. 재생 시작 시간 입력</strong>
                  <p>선물하고 싶은 구간의 재생 시작시간 입력 <br> 단, VOD에 따라 오차가 발생할 수 있음</p>
              </div>
              <div class="guide_step3">
                  <strong>3. 선물할 별풍선 개수 입력</strong>
                  <p>1초당 별풍선 N개 <br> 최소 5초 ~ 최대 SS초까지 선물 가능 </p>
              </div>
              <p>영상풍선 선물 설정은 BJ의 설정에 따라 변경 됩니다.</p>
          </div>
          <span class="lightbox"></span>
          <h2>
              <a href="javascript:;" class="on">별풍선 선물하기</a>
              <a href="javascript:;">대결미션</a>			
              <a href="javascript:;">영상풍선 선물하기</a>
          </h2>
          <a href="javascript:;" class="what_star">별풍선이란?</a>
          <!-- 별풍선이란? 레이어 -->
          <div class="star_info_layer">
              <div class="inner">
                  <div class="info_b">
                      <span class="img"></span>
                      <dl>
                          <dt>별풍선이란?</dt>
                          <dd>참여자가 BJ를 응원하고 후원할 수 있는<br>유료 선물 시스템입니다.</dd>
                          <dd>별풍선을 선물하면 자동으로 BJ 팬클럽<br>에 가입 됩니다.</dd>
                          <dd>선물받은 BJ는 별풍선을 환전하여 실제<br>수익으로 돌려 받게 됩니다.</dd>
                      </dl>
                      <a href="https://item.afreecatv.com/starballoon.php" target="_blank" class="btn_detail">상세보기</a>
                  </div>
                  <div class="info_sgb">
                      <span class="img"></span>
                      <dl>
                          <dt>시그니처 풍선이란?</dt>
                          <dd>BJ의 개성이 돋보이도록 직접 만들어<br>등록하는 맞춤형 별풍선입니다.</dd>
                      </dl>
                      <a href="https://afevent2.afreecatv.com/app/signature_balloon/index.php" target="_blank" class="btn_detail">상세보기</a>
                  </div>
                  <!-- 영상풍선일때만 보여짐 -->
                  <div class="info_sgb">
                      <span class="img video_balloon_img"></span>
                      <dl>
                          <dt>영상풍선 혜택보기</dt>
                          <dd>별풍선에 좋아하는 VOD를 담아서 <br> 선물하는 서비스 입니다. <br> 원하는 재생구간을 설정하여 선물할 수 있습니다. </dd>
                      </dl>
                  </div>
                  <a href="javascript:;" class="btn_close sub">닫기</a>
              </div>
          </div>
          <!-- //별풍선이란? 레이어 -->
  
          <!-- 대결미션이란? 레이어 -->
          <div class="mission_info_layer" style="display: none;">
        <div class="inner">
          <div class="info_b mission_info">
            <dl>
              <dt>대결미션이란?</dt>
              <dd>BJ가 팀을 이루어 대결 콘텐츠를 진행하고 후원된 별풍선을 대결<br>결과에 따라 나눠가지는 기능입니다.</dd>
              <dd>현재 시청중인 BJ에게 별풍선 후원하는 것이 아닌 대결미션에<br>별풍선 후원하여 별풍선을 모금하였다가 결과에 따라 모금된<br>별풍선을 참여 BJ에게 전달합니다.</dd>
              <dd>별풍선 후원 시 해당 방송의 팬클럽 가입과 열혈팬 순위에 집계됩니다.</dd>
            </dl>
          </div>
          <a href="#" class="btn_close">닫기</a>
        </div>
      </div>
  
  
          <!-- 전자비서 목소리 선택 -->
          <div class="voice_selector_box" style="display: none;">
              <h4>목소리를 선택해주세요</h4>
  
              <ul id="aqua_voice_select_container">
              </ul>
              <div class="voice_selector_footer" style="display: none;">
                  <p>알림음 목소리 아이템을 사용할 수 있도록 <strong>BJ에게 스티커를 선물해보세요!</strong></p>
                  <a href="javascript:;">스티커 선물하기</a>
              </div>
              <a href="javascript:;" class="close"></a>
          </div>
          <!-- // 전자비서 목소리 선택 -->
          <div id="common_container_chat_rules" class="chat_rule"> <!-- on 클레스 추가로 출력 -->
              <div class="chat_rule_title">
              </div>
              <div class="chat_rule_contents">
                  <div class="box">
                  </div>
              </div>
              <div class="footer">
                  <button id="agree_button" type="button">규칙에 동의합니다!</button>
                  <button id="close_button" type="button">닫기</button>
              </div>
          </div>
          
          <!-- 별풍선 -->
          <div class="tab1">
              <div class="star_list">
                  <p>시그니처 풍선은 BJ만의 특별한 풍선입니다.</p> <!-- 시그니처 풍선일때 노출-->
                  <div class="input_signature">
                      <input type="checkbox" id="signature_check" >
                      <label for="signature_check">100개 이상의 시그니처 풍선 선물시 클립 남기기</label>
                  </div>
                  <ul>
                      <li><span class="thumb active"><em></em><a href="#"><img src="https://res.afreecatv.com/new_player/items/m_balloon_33.png" alt=""></a></span></li>
                      <li><span class="thumb"><em></em><a href="#"><img src="https://res.afreecatv.com/new_player/items/m_balloon_100.png" alt=""></a></span></li>
                      <li><span class="thumb"><em></em><a href="#"><img src="https://res.afreecatv.com/new_player/items/m_balloon_200.png" alt=""></a></span></li>
                  </ul>
                  <!-- 2018-0830 버튼 추가  off 클레스 출력 시 활성 비활성화 -->
                  <div id="signatureArrowBtn">
                      <button type="button" class="prev off">prev</button>
                      <button type="button" class="next off">next</button>
                  </div>
              </div>
              <div class="send_area">
                  <a href="javascript:;" class="btn_stars change">스타즈 별풍선</a>
                  <!-- 스타즈별풍선 레이어 -->
                  <div class="stars_layer">
                      <div class="inner">
                          <h2>스타즈 별풍선</h2>
                          <div class="tab_area" style="display: none;">
                              <ul>
                              </ul>
                          </div>
                          <div class="scroll_area">
                              <ul>
                              </ul>
                          </div>
                          <a href="javascript:;" class="btn_close sub">닫기</a>
                      </div>
                  </div>
                  <!-- //스타즈별풍선 레이어 -->
                  <dl class="gift_at">
                  <dt>
                      <strong>nickname(id)</strong>님께 선물                    <div class="checkbox" id="divSequence">
                          <input type="checkbox" id="sequence_check">
                          <label for="sequence_check">연속선물</label>
                          <div class="question">?</div>
                          <div class="tooltip">연속선물 ON 상태로 선물하면 선물 창이 유지되며,<br>선물할 개수는 선물 완료 후 +1 개로 자동 입력 됩니다.</div>
                      </div>
                  </dt>
                  <dd class="">
                      <span class="txt_default">선물할 별풍선</span>
                      <input type="text" value="10" class="starCount" placeholder="0" autocomplete="Off">
                      <span class="txt_count">개</span>
                      <button class="plus" type="button" enable="on">plus</button>
                      <button class="countReset">Delete</button>
                  </dd>
                  </dl>
                  <dl class="gift_st">
                      <dt>보유 별풍선</dt>
                      <dd><span class="userBalloonCount">2,000</span>개</dd>
                      <dd class="txt_error" style="display:none;"><em></em><span>보유 별풍선 부족</span></dd>
                  </dl>
                  <a href="javascript:;" class="btn_buy">구매</a>
                  <!-- 전자비서 목소리 추가 -->
                  <div class="gift_input" id="aqua_voice_input_container" style="display: none">
                      <h3>선물 메시지</h3>
                      <span>
              <div class="voice_text" id="auqa_voice_textarea" contenteditable="true" ondragenter="return false;" ondrop="return false;" ondragover="return false;" placeholder="전자비서 알림음으로 재생될 채팅 메시지를 입력해주세요."></div>
              <!--일단 이모티콘은 뺀다 <button type="button" id="aqua_voice_emoticon">이모티콘</button> -->
            </span>
                      <!-- 글자수 카운트용 -->
                      <!-- <p>0/300</p> -->
                      <p class="noti" style="display: none;" id="noti_in_use_aqua_voice">BJ의 방송 설정에 전자비서가 없거나 별도의 개수 설정이<br>되어있을 경우 알림음 재생이 안될 수 있습니다.</p>
                      <p class="noti" style="display: none;" id="noti_in_no_use_aqua_voice">BJ가 알림음 목소리 아이템을 미사용 중입니다.<br>아이템을 사용할 수 있도록 스티커를 선물해보세요.</p>
                      <div class="cover_box">
                          <p>무료 체험 기간이 종료되었습니다. <br> BJ에게 스티커를 선물하시면 아이템 구매로 이용이 가능합니다.</p>
                          <a id="aqua_voice_send_sticker" href="javascript:;">스티커 선물하기</a>
                      </div>
  
                  </div>
                  <div class="btn_voice" id="aqua_voice_select_btn" style="display: none">
                      <a href="javascript:;" class="voice_selector active">
                          <img src="//res.afreecatv.com/images/webplayer/layer/icon_luv.png" alt="까칠한 러브">
                          <span>까칠한 러브</span>
                      </a>
                  </div>
                  <!-- 전자비서 목소리 추가 -->
                  <div class="btn_area">
                      <button class="btn_gift">선물하기</button><button class="btn_cancel">취소</button>
                  </div>
                  <p class="txt_info">별풍선을 선물하면 BJ를 후원하고 팬클럽에도 가입됩니다.</p>
              </div>
          </div>
          <!--// 별풍선 -->
          <!-- 대결미션 -->
          <div class="tab2 mission" style="display:block;">
        <div class="section">
          <h3>MCK 풀래티넘 대전</h3>
          <div class="section_contents">
            <!-- LiveView에서 돔생성 -->
          </div>
        </div>
        <div class="send_area">
          <dl class="gift_at">
            <dt></dt>
            <dd>
              <span class="txt_default">후원할 별풍선</span>
              <!-- <span class="txt_error">보유 별풍선 부족</span> -->
              <input type="text" value="10" class="starCount" placeholder="0" class="">
              <span class="txt_count">개</span>
              <button class="countReset">Delete</button>
            </dd>
          </dl>
          <dl class="gift_st">
            <dt>보유 별풍선</dt>
            <dd><span class="userBalloonCount">2,000</span>개</dd>
            <dd class="txt_error" style="display:none;"><em></em><span>보유 별풍선 부족</span></dd>
          </dl>
          <a href="#" class="btn_buy">구매</a>
  
          <div class="btn_area">
            <div class="btn_layer" style="display:none;">
              보유 별풍선이 즉시 차감됩니다.						<a href="#n" id="tooltipCloseBtn" class="close"></a>
            </div>
            <button class="btn_gift">후원하기</button>
            <button class="btn_cancel">취소</button>
          </div>
  
          <p class="txt_info">후원된 별풍선은 대결미션 참가 BJ가 결과에 따라 나누어 가집니다.  <br>
            별풍선 후원 시 해당 방송의 팬클럽 가입과 열혈팬 순위에 집계됩니다.</p>
        </div>
              <div class="mission_dim" style="display: none;">
          <div class="contents"><p>대결단계에서만 후원 가능합니다.</p></div>
        </div>
      </div>
          <!-- //대결미션 -->
          <!-- 영상풍선 -->
          <div class="tab3" style="display:none">
              <div class="video_balloon_info">
                  <ul>
                      <li><p>URL</p><span><input type="text" class="vodURL" placeholder="선물할 VOD 주소 입력 "></span></li>
                      <li><p>재생 시간<em>(최대 25초)</em></p><span><input type="text" class="vodStart" placeholder="00:00:00"></span><p>부터<b>5초</b></p></li>
                      <li>
                          <a href="javascript:;"><span></span><em></em></a>
                      </li>
                  </ul>
                  <div>
                      <p class="bj_config">재생수 100 / UP 20 이상,<br>다시보기, 하이라이트, 업로드 VOD, 유저 VOD 선물 가능</p>
                      <p class="txt_error" style="display:none"></p>
                  </div>
              </div>
              <div class="send_area">
                  <a href="javascript:;" class="btn_stars">VOD 검색</a>
                  <dl class="gift_at">
                      <dt><strong>nickname(id)</strong>님께 선물</dt>
                      <dd>
                          <span class="txt_default">선물할 별풍선 <em>(1초당 <b>gift_cnt</b>개)</em></span>
                          <input type="text" value="10" class="starCount" placeholder="0" autocomplete="Off">
                          <span class="txt_count">개</span>
                          <button class="countReset">삭제</button>
                      </dd>
                  </dl>
                  <dl class="gift_st">
                      <dt>보유 별풍선</dt>
                      <dd><span class="userBalloonCount">2,000</span>개</dd>
                      <dd class="txt_error" style="display:none;"><em></em><span>보유 별풍선 부족</span></dd>
                  </dl>
                  <a href="javascript:;" class="btn_buy">구매</a>
                  <div class="btn_area">
                      <button class="btn_gift">선물하기</button><button class="btn_cancel">취소</button>
                  </div>
                  <p class="txt_info"><a href="javascript:;">영상풍선 선물 설정 방법이 궁금하세요?</a></p>
              </div>
          </div>
          <!--// 영상풍선 -->
          <a href="javascript:;" class="btn_close">닫기</a>
      </div>
      </div>
      <!-- //별풍선 선물하기 신규(국내만) -->
      <!-- //애드벌룬 레이어 -->
      <div id="pop_adballoon" class="pop_adballoon" data-height="800"></div>
      <!-- //이모티콘 선물하기 레이어 -->
      <div id="pop_gift_emoticon" class="ui-pop gift-emoticon" style="display:none;"></div>
      <!-- //구독권 선물하기(국내만) -->
    <div class="layer_l gd_gift" id="layerSubscriptionGift"><div class="layer_in"> <!-- 팝업버젼 win_pop 클래스 추가 504*408-->
          <strong class="title">구독 선물하기</strong>
          <div class="layer_al">
              <strong class="color_blk">구독이란</strong> &nbsp; <a href="https://item.afreecatv.com/subscription.php#benefit" target="_blank" class="color_bl fts11">구독 혜택이 궁금하다면 클릭!</a><br />
              <ul class="sub_list2">
                  <li>구독은 좋아하는 BJ를 후원하고<br />본방 입장, 구독 전용 닉네임 등 다양한 혜택을 받을 수있는 정기 후원입니다.</li>
              </ul>
              <ul class="table_list">
                  <li><span>구독 대상 BJ : </span><strong class="color_bl"></strong></li>
                  <li><span>선물받을 유저 : </span><strong class="color_bl"></strong></li>
                  <li>
                      <span>보유중인 구독권 : </span>
                      <div class="quick_box">
                          <ul>
                              <li>
                                  1개월 구독 선물권(30일) <em>보유 : <strong></strong></em>
                                  <div class="btn_wrap"><a href="#" data="712001" class="btn_st4">구매</a> <a href="#" data="1" class="btn_st5">선물</a></div>
                              </li>
                              <li>
                                  3개월 구독 선물권(90일) <em>보유 : <strong></strong></em>
                                  <div class="btn_wrap"><a href="#" data="712002" class="btn_st4">구매</a> <a href="#" data="2" class="btn_st5">선물</a></div>
                              </li>
                              <li class="last">
                                  6개월 구독 선물권(180일) <em>보유 : <strong></strong></em>
                                  <div class="btn_wrap"><a href="#" data="712003" class="btn_st4">구매</a> <a href="#" data="3" class="btn_st5">선물</a></div>
                              </li>
                          </ul>
                      </div>
                  </li>
              </ul>
              <div class="fts11 pdt10 color_blk">※ 선물시 구독 대상 BJ를 구독할 수 있는 구독 선물권이 1개 선물됩니다.</div>
          </div>
          <div class="btn_wrap"><a href="javascript:;" class="btn_st2">닫기</a></div>
          <a href="javascript:;" class="btn_close2">닫기</a>
      </div></div>
  
      <!-- 퀵뷰 선물하기 -->
      <div class="layer_l" id="layerQuickViewGift"><div class="layer_in">
          <strong class="title">퀵뷰 선물하기</strong>
          <div class="layer_al">
              <strong class="color_blk">퀵뷰란</strong> &nbsp; <a href="https://item.afreecatv.com/quickview.php" target="_blank" class="color_bl fts11">퀵뷰 혜택이 궁금하다면 클릭!</a><br />
              <ul class="sub_list2">
                  <li>퀵뷰 아이템은 방송을 빠르고 편리하게 참여 할 수 있는 프리미엄 아이템 입니다. </li>
              </ul>
              <ul class="table_list qv_area">
                  <li><span>퀵뷰 선물받을 아이디 : </span><strong class="color_bl"></strong></li>
                  <li id="li_quickviewplus">
                      <span>보유중인 퀵뷰 플러스 : </span>
                      <div class="quick_box">
                          <ul>
                              <li id="7daysquickviewplus" style="display:none;">
                                  퀵뷰 플러스 7일 선물권<em>보유 : <strong>0</strong>개</em>
                                  <div class="btn_wrap"><a href="javascript:;" data="100" class="btn_st7">선물</a></div>
                              </li>
                              <li>
                                  퀵뷰 플러스 30일 선물권<em>보유 : <strong>0</strong>개</em>
                                  <div class="btn_wrap"><a href="javascript:;" data="740020" class="btn_st4">구매</a> <a href="javascript:;" class="btn_st7" data="101" >선물</a></div>
                              </li>
                              <li>
                                  퀵뷰 플러스 90일 선물권<em>보유 : <strong>0</strong>개</em>
                                  <div class="btn_wrap"><a href="javascript:;" data="740025" class="btn_st4">구매</a> <a href="javascript:;" class="btn_st7" data="102" >선물</a></div>
                              </li>
                              <li class="last">
                                  퀵뷰 플러스 365일 선물권<em>보유 : <strong>0</strong>개</em>
                                  <div class="btn_wrap"><a href="javascript:;" data="740030" class="btn_st4">구매</a> <a href="javascript:;" class="btn_st7" data="103" >선물</a></div>
                              </li>
                          </ul>
                      </div>
                  </li>
                  <li id="li_quickview">
                      <span class="space_t">보유중인 퀵뷰 : </span>
                      <div class="quick_box">
                          <ul>
                              <li>
                                  퀵뷰 30일 선물권 <em>보유 : <strong>0</strong>개</em>
                                  <div class="btn_wrap"><a href="javascript:;" data="676752" class="btn_st4">구매</a> <a href="javascript:;" data="1" class="btn_st7">선물</a></div>
                              </li>
                              <li>
                                  퀵뷰 90일 선물권 <em>보유 : <strong>0</strong>개</em>
                                  <div class="btn_wrap"><a href="javascript:;" data="676753" class="btn_st4">구매</a> <a href="javascript:;" data="2" class="btn_st7">선물</a></div>
                              </li>
                              <li class="last">
                                  퀵뷰 365일 선물권 <em>보유 : <strong>0</strong>개</em>
                                  <div class="btn_wrap"><a href="javascript:;" data="676754" class="btn_st4">구매</a> <a href="javascript:;" data="3" class="btn_st7">선물</a></div>
                              </li>
                          </ul>
                      </div>
                  </li>
              </ul>
              <div class="fts11 pdt10 color_blk">※ 선물시 해당 퀵뷰가 1개 선물됩니다.</div>
          </div>
          <div class="btn_wrap"><a href="javascript:;" class="btn_st2">닫기</a></div>
          <a href="javascript:;" class="btn_close2">닫기</a>
      </div></div>
      <!-- //퀵뷰 선물하기 -->
  
      <!-- 스티커 선물하기 -->
      <div id="layerStickerGift" style="display:none;" class="pop_stk">
      <h1>스티커 선물하기</h1>
      <p class="what_stk">스티커란</p>
      <div class="pop_layer" style="display:none;">
          <div class="stk_layer">
              <h2>BJ에게 격려와 힘이 되는 스티커</h2>
              <ul>
                  <li><em>방송 아이템 교환</em>스티커는 BJ가 방송 <br> 아이템으로 교환 가능</li>
                  <li><em>서포터 가입</em>스티커를 선물하면 <br> BJ의 서포터로 가입</li>
              </ul>
              <p>스티커란 유저가 BJ에게 선물하는 유료 아이템 입니다.</p>
              <a href="https://item.afreecatv.com/sticker.php" target="_blank" class="btn_itemview">스티커로 교환할 수 있는 아이템 보러가기</a>
              <button type="button" class="layer_close">닫기</button>
          </div>
      </div>
      <div class="sticker_wrap">
          <div class="stkview_wrap">
              <p class="sticker_view" id="stickerView"><img src="" alt="" /><span>10</span></p>
              <div class="sticker_list2">
                  <div class="list_tit">
                      <h2 class="blind">스티커 분류</h2>
                      <ul id="stickerTabList">
                      </ul>
                  </div>
                  <button type="button" class="btn_on"></button>
                  <div class="sticker_box" id="stickerImgList">
                  </div>
              </div>
          </div>
          <div class="choice_stk">
              <h3 class="st_choice">선물할 스티커 개수 선택 :</h3>
              <ul>
                  <li><input type="radio" class="radio" id="radio1" name="optSticker" value="5" /><label for="radio1"> 5<em>개</em></label></li>
                  <li><input type="radio" class="radio" id="radio2" name="optSticker" value="10" checked /><label for="radio2" class="on"> 10<em>개</em></label></li>
                  <li><input type="radio" class="radio" id="radio3" name="optSticker" value="50" /><label for="radio3"> 50<em>개</em></label></li>
                  <li><input type="radio" class="radio" id="radio4" name="optSticker" value="100" /><label for="radio4"> 100<em>개</em></label></li>
                  <li class="last"><input type="radio" class="radio" id="radio5" name="optSticker" value="-1" title="직접입력 선택하셨습니다" /><label for="radio5"><input type="text" value="직접입력" class="self_txt" id="nSticker" title="선물한 스티커 개수를 적어주세요" maxlength="5" disabled /> <em>개</em></label></li>
              </ul>
          </div>
          <div class="result">
              <ul>
                  <li><em class="ugold">선물할 스티커</em><span class="use_gold">10</span>개</li>
                  <li><em class="cggold">보유중인 스티커</em><span class="gold">0</span>개<a href="javascript:;" class="btn_charge">구매</a></li>
                  <li><em class="givebj">선물할 BJ</em><span></span></li>
              </ul>
              <button type="button" class="btn_presen"><strong>선물하기</strong></button>
          </div>
      </div>
      <span class="bg_layer png24" style="display:none;"></span>
      <a href="javascript:;" class="btn_close2">닫기</a>
      </div>
      <!-- //스티커 선물하기 -->
  
      <!-- 구독 이모티콘 구독 유도 레이어 -->
      <div class="layer_xl" id="layer_gudok_emoticon"><div class="layer_in">
          <div class="layer_ac">
              구독팬 전용 이모티콘을 사용하려면 해당 BJ를 구독해야 합니다.<br>BJ를 구독하면 이모티콘 사용 뿐만 아니라<br>다양한 혜택을 받으실 수 있습니다.            <strong class="par color_blk">해당 BJ를 구독하시겠습니까?</strong>
          </div>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">구독</a> <a href="javascript:;" class="btn_st2">아니오</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
      </div></div>
      <!-- 구독 닉네임 구독 유도 레이어 -->
      <div class="layer_m" id="layerBuySubscriptionNickname"><div class="layer_in">
          <div class="layer_ac">
              BJ를 구독하면 방송 채팅에서<br>구독 닉네임을 사용할 수 있습니다.<br><strong>구독 하시겠습니까?</strong>
          </div>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">예</a> <a href="javascript:;" class="btn_st2">아니요</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
      </div></div>
      <!-- 구독 하기 레이어 -->
      <div id="layerBuyNoneSubscription" class="ui-pop layer-gudok" style="display:none" >
          <p class="pop-title">구독하기</p>
          <div class="pop-body"><div class="scroll_box">
              <div class="gudok_bj">
                  <p><em></em><i>()</i>님을 구독하시겠습니까?</p>
              </div>
              <div class="benefits">
                  <h3>구독 혜택</h3>
                  <div class="info_img">
                      <ul>
                          <li>구독료 후원</li>
                          <li>채팅 효과</li>
                          <li>구독팬 전용 닉네임</li>
                      </ul>
                  </div>
  
                  <a href="https://item.afreecatv.com/subscription.php#benefit" target="_blank" class="more">더 보기</a>
              </div>
  
              <!-- 48개월 이상 -->
              <div class="perthnacorn over">
            <h3>구독 퍼스나콘</h3>
                  <ol>
                      <!-- 기본 이미지 & 등록을 한 경우 li on 클래스 추가 -->
  
                      <!-- 구독 이미지 등록하지 않은경우 -->
                      <li id="per0" class="on">
                          <span style='background-image:url("https://static.file.afreecatv.com/spcon/personalcon_default.png")'></span>
                          <p>기본</p>
                      </li>
                      <!-- 구독 이미지 등록한 경우 -->
                      <li id="per3" ><span><em></em></span><p>3개월</p></li>
                      <li id="per6"><span><em></em></span><p>6개월</p></li>
                      <li id="per12"><span><em></em></span><p>12개월</p></li>
                      <li id="per24"><span><em></em></span><p>24개월</p></li>
                      <li id="per36"><span><em></em></span><p>36개월</p></li>
                      <li id="per48"><span><em></em></span><p>48개월</p></li>
                      <li id="per60"><span><em></em></span><p>60개월</p></li>
                      <li id="per72"><span><em></em></span><p>72개월</p></li>
                      <li id="per84"><span><em></em></span><p>84개월</p></li>
                  </ol>
              </div>
  
              <div class="signature ">
                  <h3>시그니처 이모티콘 </h3>
                  <ul>
                      <li class='noList'> 등록된 시그니처 이모티콘이 없습니다.</li>
                  </ul>
              </div>
          </div></div>
          <div class="send_area">
              <dl class="gd_select">
                  <dt>구독권 선택</dt>
                      <dd>
                                              <button class="active" data-itemId="700016" data-price="3300">월 자동결제</button>
                          <button data-itemId="742120" data-price="3300">1개월</button>
                                              <button data-itemId="710265" data-price="9900">3개월</button>
                          <button data-itemId="710266" data-price="19800">6개월</button>
                          <button data-itemId="710267" data-price="39600">12개월</button>
                      </dd>
                  <dd class="tip">※ 구독을 이용할 기간을 선택해 주세요.</dd>
              </dl>
              <dl class="gd_total">
                  <dt>결제 금액</dt>
                                  <dd><strong >3,300</strong> 원</dd>
                              </dl>
              <div class="btn_area">
                  <button type="button" class="btn_b" >구독하기</button>
                  <button class="btn_w" >취소</button>
              </div>
          </div>
          <a href="javascript:;" class="pop-close"><span>레이어 닫기</span></a>
      </div>
      <!-- 정기 구독 연장 레이어 -->
      <div id="layerSubscriptionTicket" class="ui-pop layer-gudok ing" style="display:none">
          <p class="pop-title">구독하기</p>
          <div class="pop-body"><div class="scroll_box">
              <div class="gudok_bj">
                  <div class="info_wrap">
                      <div class="info">
                          <strong><em>()</em></strong>
                          <p><em>1개월</em> 구독 중</p>
                      </div>
                      <div class="thumb">
                          <span style="background-image:url();"></span>
                      </div>
                  </div>
            <span class="desc"> ※ 정기권으로 중복 구독하시면 구독 기간이 연장됩니다.</span>
              </div>
  
              <div class="gudok_infos">
                  <dl id="subscriptionInfo">
                      <dt>이용중인 구독권</dt>
                      <dd></dd>
                      <dt>구독 기간</dt>
                      <dd>  ~ 현재</dd>
                      <dt>다음 결제일</dt>
                  </dl>
                  <a href="https://item.afreecatv.com/subscription.php#benefit" target="_blank" class="more">구독 혜택 보기</a>
              </div>
  
              <div class="perthnacorn">
                  <h3>이용중인 구독 퍼스나콘 </h3>
                  <div class="myStep">
                      <div id="perPrev" class="prev"><span><em class="default"></em></span><p>기본</p></div>
                      <div id="perNext" class="next"><span><em class="default"></em></span><p></p></div>
                      <span class="progress"><em id="perProgress" style="width:0%;"></em></span>
                  </div>
              </div>
  
              <div class="signature active">
                  <h3>시그니처 이모티콘 </h3>
                  <ul>
                      <li class='noList'> 등록된 시그니처 이모티콘이 없습니다.</li>
                  </ul>
              </div>
          </div></div>
          <div class="send_area">
              <dl class="gd_select">
                  <dt>구독권 선택</dt>
                      <dd>
                                              <button disabled data-itemId="700016" data-price="3300">월 자동결제</button>
                                              <button class="active" data-itemId="742120" data-price="3300">1개월</button>
                          <button data-itemId="710265" data-price="9900">3개월</button>
                          <button data-itemId="710266" data-price="19800">6개월</button>
                          <button data-itemId="710267" data-price="39600">12개월</button>
                      </dd>
                  <dd class="tip">※ 구독을 이용할 기간을 선택해 주세요.</dd>
              </dl>
              <dl class="gd_total">
                  <dt>결제 금액</dt>
                  <dd><strong >3,300</strong>원</dd>
              </dl>
              <div class="btn_area">
                  <button type="button" class="btn_b" >연장하기</button>
                  <button class="btn_w" >취소</button>
              </div>
          </div>
          <a href="javascript:;" class="pop-close"><span>레이어 닫기</span></a>
      </div>
  
      <!-- 자동 결제 구독 정보 레이어 -->
      <div id="layerSubscriptionAutoPay" class="ui-pop layer-gudok ing" style="display:none">
          <p class="pop-title">구독하기</p>
          <div class="pop-body auto"><div class="scroll_box">
              <div class="gudok_bj">
                  <div class="info_wrap">
                      <div class="info">
                          <strong><em>()</em></strong>
                          <p><em>N개월</em> 구독 중</p>
                      </div>
                      <div class="thumb">
                          <span style="background-image:url();"></span>
                      </div>
                  </div>
              </div>
  
              <div class="gudok_infos">
                  <dl id='subscriptionInfo'>
                      <dt>이용중인 구독권</dt>
                      <dd></dd>
                      <dt>구독 기간</dt>
                      <dd></dd>
                      <dt>잔여 일수</dt>
                      <dd></dd>
                      <dd>
                          <button id="unsubscribeBtn" type="button" class="btn">
                          </button>
                      </dd>
                  </dl>
                  <a href="https://item.afreecatv.com/subscription.php#benefit" target="_blank" class="more">구독 혜택 보기</a>
              </div>
  
  
              <div class="perthnacorn">
                  <h3>이용중인 구독 퍼스나콘 </h3>
                  <div class="myStep">
                      <div id="perPrev" class="prev"><span><em class="default"></em></span><p>기본</p></div>
                      <div id="perNext" class="next"><span><em style="background-image:url();"></em></span><p></p></div>
                      <span class="progress"><em id="perProgress" style="width:0%;"></em></span>
                  </div>
              </div>
  
              <div class="signature active">
                  <h3>시그니처 이모티콘 </h3>
                  <ul>
                      <li class='noList'> 등록된 시그니처 이모티콘이 없습니다.</li>
                  </ul>
              </div>
          </div></div>
          <div class="send_area" style="display:none">
              <dl class="gd_select">
                  <dt>구독권 선택</dt>
                      <dd>
                                              <button class="active" data-itemId="700016" data-price="3300">월 자동결제</button>
                                              <button data-itemId="742120" data-price="3300" disabled>1개월</button>
                          <button data-itemId="710265" data-price="9900" disabled>3개월</button>
                          <button data-itemId="710266" data-price="19800" disabled>6개월</button>
                          <button data-itemId="710267" data-price="39600" disabled>12개월</button>
                      </dd>
                  <dd class="tip">※ 구독을 이용할 기간을 선택해 주세요.</dd>
              </dl>
              <dl class="gd_total">
                  <dt>결제 금액</dt>
                  <dd><strong >3,300</strong>원</dd>
              </dl>
              <div class="btn_area">
                  <button type="button" class="btn_b" >연장하기</button>
                  <button class="btn_w" >취소</button>
              </div>
          </div>
          <a href="javascript:;" class="pop-close"><span>닫기</span></a>
      </div>
  
      <!-- 구독 선물권 확인 레이어 -->
      <div id="layerGiftSubscriptionConfirm" class="layer_m"><div class="layer_in">
          <div class="layer_ac">
              BJ닉네임님에게 사용 가능한<br><strong class="color_bl">선물 받은 6개월 구독권(180일)</strong>을 보유중입니다.<br><strong>사용하시겠습니까?</strong>
          </div>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">예</a> <a href="javascript:;" class="btn_st2">아니요</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
      </div></div>
      <!-- //불법 사설 도박으로 신고하겠습니까? -->
      <!-- 미 구독중인 BJ  --> <!-- 팝업버젼 win_pop 클래스 추가 425*462 -->
      <div id="layerNoneSubscriptionBjUseGift" class="pop_gudok">
          <div class="layer_in">
              <span class="lightbox"></span>
              <h2>선물 받은 구독권 사용하기</h2>
              <div class="info_area">
                  <p class="info_msg01"><span class="cr01">아프리카TV</span><em>(AfreecaTV)</em>님을 구독하시겠습니까?</p>
                  <div class="info_img">
                      <ul class="blind">
                      <li>구독료 후원</li>
                      <li>채팅 효과</li>
                      <li>구독팬 전용 닉네임</li>
                      </ul>
                      <a href="https://item.afreecatv.com/subscription.php#benefit" target="_blank">구독혜택 더 보러 가기</a>
                  </div>
              </div>
              <div class="send_area">
                  <dl class="gd_date">
                  <dt class="long">사용할 구독권</dt>
                  <dd>선물 받은 N개월 구독권(##일)</dd>
                  </dl>
                  <p class="t_info">내 구독 > 내 선물·후원 정보 > 구독 선물권에서 보유중인 선물 받은 구독권을 확인하실 수 있습니다.</p>
                  <div class="btn_area">
                      <button class="btn_b">사용하기</button><button class="btn_w">취소</button>
                  </div>
              </div>
              <a href="javascript:;" class="btn_close">닫기</a>
          </div>
      </div>
      <!-- //미 구독중인 BJ -->
      <br />
      <!-- 정기구독중인 BJ  --> <!-- 팝업버젼 win_pop 클래스 추가 425*411 -->
      <div id="layerSubscriptionBjUseGift" class="pop_gudok">
          <div class="layer_in">
              <span class="lightbox"></span>
              <h2>선물 받은 구독권 사용하기</h2>
              <div class="info_area">
                  <p class="info_msg02"><span class="cr01">아프리카TV</span><em>(AfreecaTV)</em>님을 N개월 구독 중입니다!<br /><span class="cr02">※ 선물 받은 구독권으로 중복 구독하시면 구독 기간이 연장됩니다.</span></p>
              </div>
              <div class="send_area">
                  <dl class="gd_date">
                  <dt class="long">이용중인 구독권</dt>
                  <dd>정기구독권</dd>
                  </dl>
                  <dl class="gd_date gd_space">
                  <dt>구독기간</dt>
                  <dd>YYYY-MM-DD ~ YYYY-MM-DD (잔여일수 : DDDD일)</dd>
                  </dl>
                  <dl class="gd_date gd_space">
                  <dt class="long">사용할 구독권</dt>
                  <dd>선물 받은 N개월 구독권(##일)</dd>
                  </dl>
  
                  <div class="btn_area">
                      <button class="btn_b">사용하기</button><button class="btn_w">취소</button>
                  </div>
              </div>
              <a href="javascript:;" class="btn_close">닫기</a>
          </div>
      </div>
  
      <!-- 사용 성공 --> <!-- 팝업버젼 win_pop 클래스 추가 425*379-->
      <div id="layerSubscriptionBjUseGiftSuccess" class="pop_gudok">
          <div class="layer_in">
              <span class="lightbox"></span>
              <h2>선물 받은 구독권 사용하기</h2>
              <div class="info_area">
                  <p class="info_msg02"><span class="cr01">아프리카TV</span>(AfreecaTV)님에게<br />선물 받은 N개월 구독권(##일)을 사용하였습니다.</p>
              </div>
              <div class="send_area">
                  <dl class="gd_date">
                  <dt class="long">이용중인 구독권</dt>
                  <dd>선물 받은 N개월 구독권(##일)</dd>
                  </dl>
                  <dl class="gd_date gd_space">
                  <dt>구독기간</dt>
                  <dd>YYYY-MM-DD ~ YYYY-MM-DD (잔여일수 : DDDD일)</dd>
                  </dl>
                  <div class="btn_area">
                      <button class="btn_w">확인</button>
                  </div>
              </div>
              <a href="javascript:;" class="btn_close">닫기</a>
          </div>
      </div>
      <!-- //사용 성공  -->
  
      <!-- 구독이 불가능한 경우 -->
      <div id="layerErrorSubscription" class="pop_gudok">
          <div class="layer_in">
              <span class="lightbox"></span>
              <h2>구독하기</h2>
              <div class="info_area">
                  <p class="info_msg02"><span class="cr01">아프리카TV</span>(AfreecaTV)님은<br />휴면중인 BJ로 구독할 수 없습니다. </p>
              </div>
              <div class="send_area">
                  <div class="btn_area">
                      <button class="btn_w">확인</button>
                  </div>
              </div>
              <a href="#" class="btn_close">닫기</a>
          </div>
      </div>
  
      <form name="oLoginTmpForm" style="margin:0px;" onsubmit="return false;">
      <!-- 레이어 로그인 -->
      <div class="lay lay_login " id="layerLogin" style="display: none;"><!-- 청소년인경우 lay_login_young 추가 -->
      <!-- memo -->
      <div class="memo">
          <h2>아프리카TV</h2>
          <div class="login_age_young" style="display: none;">만 19세 미만의 청소년이 이용할 수 없습니다. 로그인 후 이용해 주세요.</div><!-- 청소년인경우 -->
          <!-- fieldset -->
          <fieldset>
              <legend>로그인영역</legend>
              <div class="login">
                  <!-- 쓰기폼 -->
                  <dl>
                      <dt><label for="szUid">아이디</label></dt><dd><input type="text" id="szUid" title="아이디"></dd>
                      <dt><label for="szPassword">비밀번호</label></dt><dd><input type="password" id="szPassword" title="비밀번호" maxlength="15">
                          <!-- 2017-0705 캡스 락 추가-->
                          <span class="caps_Lock" style="display:none;">
                              <em></em>
                              <strong>Caps Lock</strong>이 켜져 있습니다.                        </span>
                      </dd>
                  </dl>
                  <!-- //쓰기폼 -->
  
  
                  <!-- 알림 -->
                  <div class="info" style="display: none;">법정 대리인 동의가 필요한 아이디입니다.<br>법정대리인 인증 후 이용 부탁 드립니다.</div>
                  <!-- //알림 -->
                  <!-- 아이디저장 -->
                  <em class="idsave">
                      <!-- 2019-0604 -->
                      <input type="checkbox" id="log_retain" title="로그인 상태유지"> <label for="log_retain">로그인 상태 유지</label>
                      <!-- 해외 통합 작업으로 인해 영어랑 베트남어 BR 추가 -->
                      
                      <div class="layer_info" style="display: none;">
                          <span class="arrow"></span>
                          <div class="layer_contents">
                              <ul>
                                  <li class="red">개인정보 보호를 위해 개인 PC에서만 사용하세요.</li>
                              </ul>
                          </div>
                          <a href="javascript:;" class="layer_close">레이어닫기</a>
                      </div>
                      <input type="checkbox" id="bSaveId" title="아이디 저장"> <label for="bSaveId">아이디 저장</label>
                  </em>
                  <!-- //아이디저장 -->
                  <!-- 로그인 -->
                  <button type="button" class="btn_login" title="로그인"></button>
                  <!-- //로그인 -->
              </div>
          </fieldset>
          <!-- //fieldset -->
          <!-- SNS 로그인 -->
                  <div class="sns_join">
              <a href="#" class="naver" id="btnConnectNaver"><em></em><p>네이버로 로그인</p></a>
              <a href="#" class="kakao" id="btnConnectKakao"><em></em><p>카카오로 로그인</p></a>
              <a href="#" class="apple" id="btnConnectApple"><em></em><p>Apple ID로 로그인</p></a>
          </div>
                  <!-- //SNS 로그인 -->
          <!-- btnbox -->
          <div class="btnbox end">
              <span><a href="https://help.afreecatv.com" target="_blank">도움말</a></span>
              <span><a href="https://member.afreecatv.com/app/find_id_pw.php" target="_blank">아이디/비밀번호 찾기</a></span>
              <span><a href="https://member.afreecatv.com/app/join.php" target="_blank">회원가입</a></span>
          </div>
          <!-- //btnbox -->
      </div>
      <!-- //memo -->
      <!-- close -->
      <div class="btn_close_top"><a href="javascript:;" title="레이어 닫기">닫기</a></div>
      <!-- //close -->
      </div>
      <!-- //레이어 로그인 -->
  
      <!-- 레이어 2차 비밀번호 로그인 -->
      <div class="lay lay_login " id="layerSecondLogin" style="display: none;">
      <!-- memo -->
      <div class="memo">
          <h2>아프리카TV</h2>
          <div class="pw_info">2차 비밀번호를 사용 중인 계정입니다. 2차 비밀번호를 입력해주세요</div>
          <!-- fieldset -->
          <fieldset>
              <legend>로그인영역</legend>
              <input type="hidden" id="szUid" title="아이디" />
              <input type="hidden" id="bSaveId" title="아이디 저장" />
              <div class="login login_pw2">
                  <!-- 쓰기폼 -->
                  <dl class="pw2">
                      <dt><label for="szPassword2">비밀번호</label></dt><dd><input type="password" id="szPassword2" title="비밀번호"></dd>
                  </dl>
                  <!-- //쓰기폼 -->
                  <!-- 알림 -->
                  <div class="info" style="display: none;"></div>
                  <!-- //알림 -->
                  <!-- 로그인 -->
                  <button type="button" class="btn_login_pw2" title="로그인"></button>
                  <!-- //로그인 -->
              </div>
          </fieldset>
          <!-- //fieldset -->
          <!-- btnbox -->
          <div class="btnbox end">
              <span><a href="https://member.afreecatv.com/app/find_security.php" target="_blank" id="find_2nd_pwd">2차 비밀번호 찾기</a></span>
          </div>
          <!-- //btnbox -->
      </div>
      <!-- //memo -->
      <!-- close -->
      <div class="btn_close_top"><a href="javascript:;" title="레이어 닫기">닫기</a></div>
      <!-- //close -->
      </div>
      <!-- //레이어 2차 비밀번호 로그인 -->
      </form>
  
      <!-- 닉네임 변경 -->
      <div class="layer_s" id="layerNickChange"><div class="layer_in">
          <strong class="title">닉네임 변경</strong>
          <div class="layer_ac">
              <span class="fts11">아프리카TV 닉네임을 입력해주세요.</span><br />
              <span class="color_red fts11" style="display:none;"></span>
          </div>
          <div class="layer_ac pdt10">
              <input type="text" title="닉네임 입력" class="input_text" style="width:120px"/> <a href="javascript:;" class="btn_st2">중복확인</a>
          </div>
          <ul class="sub_list">
              <li>한글 6자(영문 12자)까지 입력 가능</li>
              <li>변경 시, 24시간 후 재변경 가능</li>
              <li>게시판 및 채팅에서 사용됩니다.</li>
          </ul>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">확인</a> <a href="javascript:;" class="btn_st2">취소</a></div>
          <a href="javascript:;" class="btn_close2">닫기</a>
      </div></div>
      <!-- //닉네임 변경 -->
  
      <!-- 구독 닉네임 변경 -->
      <div class="layer_s" id="layerSubscriptionNickChange"><div class="layer_in">
              <strong class="title">구독팬 전용 닉네임 변경</strong>
              <div class="layer_ac">
                  <p>구독팬 전용 닉네임을 입력해주세요.</p>
                  <span class="color_red fts11" style="display:none;"></span>
              </div>
              <div class="layer_ac pdt10">
                  <input type="text" title="닉네임 입력" class="input_text" style="width:120px"/> <a href="javascript:;" class="btn_st2">중복확인</a>
              </div>
              <ul class="sub_list">
                  <li>한글 6자(영문 12자)까지 입력 가능</li>
                  <li>설정 후 24시간 뒤 변경 가능</li>
                  <li>
                      기본 닉네임은 <a id="nickSetting" href="javascript:;" >내정보&gt;닉네임설정</a>을 이용                </li>
              </ul>
              <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">변경</a> <a href="javascript:;" class="btn_st2">기본 닉네임 사용</a></div>
              <a href="javascript:;" class="btn_close2">닫기</a>
          </div></div>
      <!-- //구독 닉네임 변경 -->
  
      <!-- 플레시플레이어 지원종료 안내 레이어 -->
      <div class="ui-pop improve  end_flashplayer" id="end_flashplayer"  style="display: none;" >
          <div class="pop-title">Flash Player 서비스 종료 안내</div>
          <div class="pop-body">
  
              <p>Flash플레이어 지원이 2020년 6월에 종료되었습니다.<br>브라우저를 업데이트하여 최적의 환경에서 아프리카TV를 이용해 보세요!</p>
              <ul>
                  <li class="chrome"><a href="//www.google.com/chrome" target="_blank"><span>Google Chrome</span></a></li>
                  <li class="edge"><a href="//www.microsoft.com/edge" target="_blank"><span>Microsoft Edge</span></a></li>
                  <li class="whale"><a href="//whale.naver.com" target="_blank"><span>Naver Whale</span></a></li>
                  <li class="opera"><a href="//www.opera.com" target="_blank"><span>Opera</span></a></li>
                  <li class="firefox"><a href="//www.mozilla.org/firefox/download/thanks" target="_blank"><span>Firefox</span></a></li>
                  <li class="safari"><a href="//support.apple.com/downloads/safari" target="_blank"><span>Safari</span></a></li>
              </ul>
  
          </div>
          <!-- <div class="pop-btn">
              <a href="javascript:;" class="btn">확인</a>
          </div> -->
          <a href="javascript:" class="pop-close"><span>닫기</span></a>
      </div>
      <!-- //플레시플레이어 지원종료 안내 레이어 -->
  
      <!--신규 공유 레이어 -->
      <div class="ui-pop improve share_broadcast_layer" id="layerShare" style="display: none;">
          <div class="pop-title">공유하기</div>
          <div class="pop-body">
              <ul class="tab" id="share_tab">
                  <li class="on"><a href="javascript:;">URL</a></li>
                  <li><a href="javascript:;">퍼가기</a></li>
              </ul>
              <ul class="tab_contents">
                  <li class="on">
                      <!-- 복사가되면 input_wrap 에 copy 클래스 추가 -->
                      <div class="input_wrap">
                          <input type="text" id="share_link" value="" readonly=""><button id="share_link_btn" type="text">복사</button>
                      </div>
                      <!-- 스펙아웃으로 인해 주석처리 -->
                      <!-- <div class="check_wrap"><input type="checkbox" id="start_time"><label for="start_time"><span>00:00:01</span></label> 부터 재생 시작</div> -->
                      <div class="sns_list">
                                                      <button type="button" id="share_twitter" class="twitter"><span>트위터</span></button>
                              <button type="button" id="share_facebook" class="facebook"><span>페이스북</span></button>
                              <button type="button" id="share_telegram" class="telegram"><span>텔레그램</span></button>
                              <button type="button" id="share_kakao" class="kakao"><span>카카오톡</span></button>
  
                                                  </div>
                  </li>
                  <li>
                      <div class="select_box">
                          <a class="selected" href="javascript:;">640x360</a>
                          <ul>
                              <li><a href="javascript:;" data-width="640" data-height="360">640X360</a></li>
                              <li><a href="javascript:;" data-width="854" data-height="480">854X480</a></li>
                              <li><a href="javascript:;" data-width="960" data-height="540">960X540</a></li>
                          </ul>
                      </div>
                      <!-- <div class="wrap_right">
                          <div class="check_wrap"><input type="checkbox" id="chat_on"><label for="chat_on"><span>채팅노출</span></label></div>
                          <div class="check_wrap"><input type="checkbox" id="auto_start"><label for="auto_start"><span>자동재생</span></label></div>
                      </div> -->
  
                      <div class="input_wrap">
                          <input type="text" id="share_source" value="<iframe width='640' height='360' src='" readonly=""><button id="share_source_btn" type="text">복사</button>
                      </div>
                      <!-- 스펙아웃으로 인해 주석처리 -->
                      <!-- <div class="check_wrap"><input type="checkbox" id="start_time_2"><label for="start_time_2"><span>00:00:01</span></label> 부터 재생 시작</div> -->
  
                  </li>
              </ul>
          </div>
          <div class="pop-btn">
              <a href="javascript:;">취소</a>
          </div>
          <a href="javascript:;" class="pop-close"><span>닫기</span></a>
      </div>
      <!--//신규 공유 레이어 -->
  
      <!-- 원본화질로 2015-06-15 추가 -->
      <div class="layer_m" id="layerPlayOrg"><div class="layer_in">
              <strong class="title">아프리카TV 원본화질로 시청하기</strong>
              <div class="layer_ac">
                  <strong class="color_blk">원본화질로 시청하기 위해<br />아프리카TV 플레이어를 실행합니다.</strong><br />
                  <span class="fts11_pdt5">플레이어가 설치되지 않았을 경우,<br /><strong class="color_bl">[확인]</strong>을 클릭하면 프로그램이 설치됩니다. </span>
              </div>
              <div class="btn_wrap_line"><a href="#" class="btn_st1">확인</a> <a href="#" class="btn_st2">취소</a></div>
              <a href="#" class="btn_close2">닫기</a>
          </div></div>
      <!-- //원본화질로 -->
  
    <!-- 고화질로 시청하려면 2015-07-17 추가 -->
      <div class="layer_m" id="layer_high_quality">
          <div class="layer_in">
              <div class="layer_ac">
                  <strong class="layer_stit">모든 방송을 고화질로 참여하려면?</strong>
                  <span class="fs11">BJ가 설정한 화질로 참여하기 위해서는<br />고화질 스트리머가 필요합니다.</span>
              </div>
              <div class="btn_wrap pdt10"><a href="javascript:;" class="btn_st1" id="install_streamer">고화질 스트리머 실행하기</a></div>
              <span class="info_normal_quality">저화질로 계속 참여하시려면 <a href="javascript:;"><span class="color_bl">여기</span></a>를 클릭하세요</span>
              <!-- a href="#" class="btn_close">닫기</a -->
          </div>
      </div>
      <!-- //고화질로 시청하려면 -->
  
      <!-- 플러그인 설치 2015-06-15 추가
      <div class="layer_m" id="layerInstallPlugin"><div class="layer_in">
              <strong class="title">플러그인 설치</strong>
        <div class="layer_ac">
          <span class="fts11_pdt5"><strong class="color_bl">파이어폭스, 크롬, 사파리, 오페라 브라우저</strong>에서<br />원활한 이용을 위해 플러그인 설치가 필요합니다</span>
        </div>
        <div class="btn_wrap_line"><a href="#" class="btn_st1">확인</a> <a href="#" class="btn_st2">취소</a></div>
        <a href="#" class="btn_close2">닫기</a>
      </div></div>
    <!-- //플러그인 설치 -->
  
      <!-- MAC 스트리머 업데이트 -->
      <div class="layer_m" id="layer_high_quality_mac">
          <div class="layer_in">
              <div class="layer_ac">
                  <strong class="layer_stit">고화질 스트리머 업데이트 안내</strong>
                  <span class="fs11">고화질 스트리머가 업데이트 되었습니다.<br/>BJ가 설정한 화질로 참여하기 위해서는<br/>MAC OS 전용 고화질 스트리머가 필요합니다.</span>
              </div>
              <div class="btn_wrap pdt10"><a href="https://afupd1.afreecatv.com/AfreecaTV_MAC_Installer.pkg" class="btn_st1" target="_blank">고화질 스트리머 업데이트하기</a></div>
              <!-- a href="#" class="btn_close">닫기</a -->
          </div>
      </div>
      <!-- //MAC 스트리머 업데이트 -->
      
      <!-- 사파리 업데이트 레이어 -->
      <div class="ui-pop improve high_definition" style="display:none">
    <div class="pop-body">
      <strong>고화질 스트리머 이용 안내</strong>
      <p>이용중이신  MAC OS 버전은 원본,고화질 참여에 필요한 스트리머 설치가 원활하지 않아<br>
      일반화질을 이용하시거나, 아래 두 가지 내용 참고하셔서 이용 부탁드립니다.</p>
      <ul>
        <li>
          <em>1</em>
          <strong>MAC OS 업데이트</strong>
          <p>시스템 상단 ( <i class="ic_apple">apple</i> ) 아이콘 &gt; 시스템 환경 설정 &gt;<br>소프트웨어 업데이트</p>
          <div class="browser">
            <a href="https://support.apple.com/ko-kr/HT201541" target="_blank"><span class="icon setting">시스템 환경 설정</span></a>
          </div>
        </li>
        <li>
          <em>2</em>
          <strong>타 브라우저 이용</strong>
          <p>( 이미지 클릭시 해당 브라우저 다운로드 페이지로<br>이동합니다. )</p>
          <ul class="browser">
            <li><a href="https://www.google.co.kr/chrome" target="_blank" class="icon chrome">Chrome</a></li>
            <li><a href="https://www.microsoft.com/ko-kr/edge" target="_blank" class="icon edge">Edge</a></li>
            <li><a href="https://www.mozilla.org/ko/firefox/new/" target="_blank" class="icon firefox">Firefox</a></li>
            <li><a href="https://www.opera.com/ko" target="_blank" class="icon opera">Opera</a></li>
            <li><a href="https://whale.naver.com/ko/download/mac/" target="_blank" class="icon whale">Whale</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <a href="javascript:;" class="pop-close"><span>닫기</span></a>
      </div>
      <!-- 사파리 업데이트 레이어 -->
  
      <!-- 구독 선물권 수신 레이어 -->
      <div id="layerGiftSubscriptionAlram" class="layer_m"><div class="layer_in">
          <div class="layer_ac">
              닉네임(아이디)님이<br/><strong class="color_bl">N개월 구독권(##일)</strong>을 선물하였습니다.<br/><strong>지금 바로 사용하시겠습니까?</strong>
          </div>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st1">예</a> <a href="javascript:;" class="btn_st2">아니요</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
      </div></div>
  
      <!-- 별풍선 부족 시 구매 여부 레이어 -->
      <div id="layerStarballoonBuyConfirm" class="layer_m"><div class="layer_in">
          <div class="layer_ac">
              보유하신 별풍선이 부족합니다.<br/>별풍선을 더 구매하시겠습니까?        </div>
          <div class="btn_wrap_line"><a href="javascript:;" class="btn_st2">아니요</a> <a href="javascript:;" class="btn_st1">예</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
      </div></div>
  </div>
  <!-- //고정된 레이어 위치 -->
  
  <!-- 배경 딤처리-->
  <div class="bg_dark"></div>
  <!-- 툐스트 메세지-->
  <div class="toast_message" style="display:none;">
      <!-- x버튼 없고 p 자동 정렬 -->
      <div class="success" id="textCenterDiv" style="display:none;"><p class="text_center"></p></div>
    <!-- x버튼 있음 -->
      <div class="success" id="closeButtonDiv" style="display:none;"><p></p><button type="button" class="close"><span>닫기</span></button> </div>
  </div>
  
    <!-- 고정된 레이어 위치 -->
    <div class="fixLayer">
      <!-- //레이어 영역-->
  
      <!-- 리스트 내 공유하기 레이어 복사해서 리스트에 넣자 -->
      <div class="ui-pop improve share_layer_templete" style="display:none;">
        <div class="pop-title">공유하기</div>
        <div class="pop-body">
          <div>
            <button type="button" class="twitter"><em></em><span>트위터</span></button>
            <button type="button" class="facebook"><em></em><span>페이스북</span></button>
            <button type="button" class="url"><em></em><span>URL 복사</span></button>
          </div>
        </div>
        <!-- <div class="pop-btn">
      <a href="#n" class="btn_blue">확인</a>
      <a href="#n">취소</a>
      </div> -->
        <a href="javascript:;" class="pop-close"><span>레이어 닫기</span></a>
      </div>
  
      <!-- 방송 중이지 않습니다 -->
      <div class="layer_m" id="layerAirOff"><div class="layer_in">
          <div class="layer_ac pdt30 pdb30">
            <dl class="air_fin_tit">
              <!-- 이거 플레이어 스크립트에서 함
              <dt>방송이 종료되었습니다.</dt>
              <dd>시청해 주셔서 감사합니다. <br />다음 방송 시간에 또 만나요.</dd>-->
              <dt></dt>
              <dd></dd>
            </dl>
            <div class="air_recomm">
              <h2>추천방송</h2>
              <div class="list">
              </div>
              <ul>
                <li class="prev"><a href="javascript:;">이전</a></li>
                <li class="next"><a href="javascript:;">다음</a></li>
              </ul>
            </div>
          </div>
          <a href="javascript:;" class="btn_close">닫기</a>
        </div></div>
      <!-- //방송 중이지 않습니다 -->
  
      <!-- 즐겨찾기에서 삭제 -->
      <div class="layer_s" id="layerFavDel"><div class="layer_in">
          <div class="layer_ac">
            <span class="color_bl"></span>님의 방송을<br /> 즐겨찾기에서 삭제하시겠습니까?				</div>
          <div class="btn_wrap"><a href="javascript:;" class="btn_st1">예</a> <a href="javascript:;" class="btn_st2">아니요</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
        </div></div>
      <!-- //즐겨찾기에서 삭제 -->
  
      <!-- 추천 받지 않기 기능 - 추천 목록에서 해당 BJ 삭제 2016-02 -->
      <div class="layer_s" id="layerRecommendedBJDel"><div class="layer_in">
          <div class="layer_ac">
            <span class="color_bl"></span>님의 방송을<br /> 더 이상 추천 받지 않겠습니까?				</div>
          <div class="btn_wrap"><a href="javascript:;" class="btn_st1">예</a> <a href="javascript:;" class="btn_st2">아니요</a></div>
          <a href="javascript:;" class="btn_close">닫기</a>
        </div></div>
      <!-- //추천 받지 않기 기능 - 추천 목록에서 해당 BJ 삭제 -->
  
      <!--랜덤방송 설정 width:400px;height:460px-->
      <div class="random-set" id="layerRandomBroadOption" style="display: none; background-color: white;">
        <div class="layer_in">
          <strong class="title">랜덤방송 설정</strong>
          <div class="inwrap">
            <!--#1-->
            <div class="inbox">
              <strong class="stit">카테고리 선택</strong>
              <p class="desc">선택한 카테고리만 랜덤으로 방송입장이 됩니다.</p>
              <div class="category" id="categoriesArea">
                <!--<span><input type="checkbox" id="all"><label for="all">전체</label></span><span>-->
              </div>
            </div>
            <!--//#1-->
            <!--#2-->
            <div class="inbox">
              <strong class="stit">참여인원 선택</strong>
              <p class="desc">설정한 유저 수 이상만 랜덤으로 방송입장이 됩니다. (최대 100명)</p>
              <div class="slider_area" id="viewCountArea">
                <div class="slider">
                  <div class="track"></div>
                  <div class="runner"></div>
                </div>
                <div class="slider_txt"><input type="text" value="0" id="sliderLink">명</div>
              </div>
            </div>
            <!--//#2-->
            <!--#3-->
            <div class="inbox" id="keywordsArea">
              <strong class="stit">키워드 입력</strong>
              <p class="desc">
                등록한 키워드가 포함된 방송 제목으로만 랜덤으로 방송입장이 됩니다.							<br>최대 3개 키워드만 등록 가능합니다.						</p>
              <input type="text" class="txt_input" id="keywordsArea_input" placeholder="생방"><a href="javascript:;" class="btn_add">추가</a>
              <div class="keyword_area">
  
              </div>
            </div>
            <!--//#3-->
          </div>
          <div class="btn_wrap_line">
            <a href="javascript:;" class="btn_st1">설정저장</a>
            <a href="javascript:;" class="btn_st2">취소</a>
          </div>
          <a href="javascript:;" class="btn_close2">닫기</a>
        </div>
      </div>
      <!--//랜덤방송 설정-->
  
  
      <!-- 채팅 명령어 도움말 -->
      <div class="layer_m" id="layerChatHelp" style="display: none;"><div class="layer_in">
          <strong class="title">채팅 명령어 도움말</strong>
          <div class="layer_al">
            <span class="fts11 color_blk">해당 명령어를 사용하시면 좀 더 편리하게 아프리카TV <br>채팅을 이용하실 수 있습니다.</span>
            <ul class="command_list">
              <li><strong>/go (아이디) </strong>: <span>아이디의 방송국 가기</span></li>
              <li><strong>/k (아이디) </strong>: <span>아이디 강제퇴장</span></li>
              <li><strong>/m (아이디) </strong>: <span>아이디 벙어리</span></li>
              <li><strong>/to (아이디) </strong>: <span>귓속말하기</span></li>
              <li><strong>/re </strong>: <span>최근 귓속말에 답변을 보냄</span></li>
              <li><strong>/c </strong>: <span>화면 지우개</span></li>
              <li><strong>/h </strong>: <span>채팅 명령어 도움말 보기</span></li>
              <li><strong>/hc </strong>: <span>채팅 명령어 도움말 닫기</span></li>
              <li><strong>/n </strong>: <span>닉네임 변경</span></li>
              <li><strong>/q </strong>: <span>방송 그만보기</span></li>
            </ul>
          </div>
          <div class="btn_wrap"><a href="javascript:;" class="btn_st2">닫기</a></div>
          <a href="javascript:;" class="btn_close2">닫기</a>
        </div></div>
      <!-- //채팅 명령어 도움말 -->
  
        
  
        <!--운영자 강제 퇴장 패널티 강화 안내 width:340px;height:358px-->
        <div class="penalty-info" id="kickPenaltyInfoLayer" style="display: none;">
          <div class="layer_in">
            <strong class="title">운영자 강제 퇴장 패널티 강화 안내</strong>
            <div class="inwrap">
              <div class="penalty">
                <span class="icon af3"></span>
                <em>채팅은 소중한 컨텐츠입니다!</em>
                <p class="normal">아프리카TV 유저들을 위해 배려와 존중이 있는<br /> 따뜻한 채팅문화를 조성하도록 운영자가 더 노력하겠습니다.</p>
              </div>
              <div class="gr_box">
                <p class="red">운영자 강퇴 패널티 강화 내용</p>
                <div class="gry">※ 운영자 강퇴 시 24시간 채팅금지<br />※ 강퇴 누적 시 3일~7일 이용정지</div>
              </div>
            </div>
            <div class="btn_wrap">
              <a href="javascript:;" class="btn_st2">확인</a>
            </div>
            <a href="javascript:;" class="btn_close2">닫기</a>
          </div>
        </div>
  
        <!--운영자 강제 퇴장안내 width:350px;height:363px-->
        <div class="toejang" id="adminKickPenaltyLayer" style="display: none;">
          <div class="layer_in">
            <strong class="title">운영자 강제퇴장 안내 (강제퇴장 <span id="count"><strong class="red">1</strong>회차</span>)</strong>
            <div class="inwrap">
              <div class="penalty">
              </div>
              <div class="gr_box">
                타인비하, 인종/지역/성/직업/장애인 차별, <br>
                정치선동, 청소년 보호법 위반 등 <br>
                방송내용과 상관없이 소통을 방해하는 어그로성 채팅은 <br>
                강제퇴장 대상입니다.							<strong></strong><br>
                <a href="https://help.afreecatv.com/atv.php?type=exMailQuestion" class="btn_help" target="_blank"><span>고객센터 문의하기</span></a>
              </div>
            </div>
            <div class="btn_wrap">
              <a href="javascript:;" class="btn_st2">확인</a>
            </div>
            <a href="javascript:;" class="btn_close2">닫기</a>
          </div>
        </div>
  
        <!-- 휴면ID 정상 사용안내-->
        <div class="sleep" id="sleepLayer" style="display:none;">
          <div class="layer_in">
            <strong class="title">휴면ID 정상 사용 안내</strong>
            <div class="inwrap">
              <span class="icon"></span>
              <strong class="stit">휴면상태가 해제 되었습니다!</strong>
              <div class="desc" id="sleepLayerDesc">회원님의 아이디가 정상 로그인 처리되어<br>휴면(장기 미접속)상태가 해제 되었습니다.<br>아래 확인 버튼을 눌러주시면 정상적인 사용이 가능합니다.</div>
              <div class="btn_wrap_line"><a href="javascript:;" class="btn_st2">확인</a></div>
              <a href="javascript:;" class="btn_close2">닫기</a>
            </div>
          </div>
        </div>
        <!-- 나중에보기 안내 레이어
        <div id="View_after" style="display:none;">
          <div class="view_after_title">
  
            <p class="Registration"><em></em>나중에 보기에 등록되었습니다.</p>
            <span class="vodMsg">보고 싶은 VOD나, 아직 보지 않은<br>VOD를 목록에 등록해 두고  언제든 간편하게 찾아보세요!</span>
  
            <p class="delete" style="display: none;"><em></em>나중에 보기가 삭제 되었습니다.</p>
            <span class="liveMsg" style="display: none;">라이브 방송을 시청할 수 없는 상황일 때<br> 목록에 담아두고 원하는 시간에 손쉽게 찾아 보세요!</span>
  
          </div>
          <div class="view_after_contents">
            <a>VOD의 “나중에 보기” 메뉴</a>에서<br>등록 한 영상을 확인 하실 수 있습니다.				</div>
          <div class="view_after_footer">
            <label for="close_layer"><input type="checkbox" id="close_layer" />다시보지않기</label>
            <button type="button" name="button" class="close">닫기</button>
          </div>
          <button type="button" name="button" class="layer_close">레이어 닫기</button>
        </div> -->
        <!-- 편집각 안내 레이어 -->
        <div id="edit_angle_layer" class="layer_s highlight"><div class="layer_in">
            <strong class="title">편집각이란?</strong>
            <div class="layer_ac">
              <strong>LIVE 도중 원하는 구간을 체크하는 기능</strong>으로<br>편집각으로 표시 된 구간은 다시보기 영상에서<br>확인 할 수 있습니다.					</div>
            <div class="btn_wrap_line">
              <a href="#" class="btn_st2">확인</a>
              <div class="never_see"><input type="checkbox"><label for="">더 이상 보지않기</label></div>
            </div>
            <a href="#" class="btn_close">닫기</a>
          </div></div>
  
        <div class="layer_l ppv_ticket" style="display:none;"><div class="layer_in">
            <strong class="title">본 방송은 티켓 구매 후 참여가능 합니다.</strong>
            <div class="layer_al">
              <div class="ppv_ticket_img"></div>
  
              <ul class="sub_list2">
                <!-- 여기 하단 정보는 어드민에서 html 형식으로 등록되어 있음
                그래서 따로 번역은 안해도 됨. - poedit에 안나오게 하려고 번역 함수 제거-->
              </ul>
  
            </div>
  
            <!-- 웹용 버튼 -->
            <div class="btn_wrap">
              <a href="#" class="btn_st1">
                <span>티켓을 구매하시려면?</span>
                <strong>티켓 구매</strong>
              </a>
              <a href="#" class="btn_st2">
                <span>티켓을 이미 구매하셨다면?</span>
                <strong>방송 참여</strong>
              </a>
            </div>
  
  
            <a href="#" class="btn_close2">닫기</a>
          </div></div>
  
        <!-- 2018-0908 ff14 ppv 방송특전아이템 발급 완료  -->
        <!-- 특별 쿠폰 어쩌구 이건 이제 안쓰는 듯 - poedit에 안나오게 하려고 번역 함수 제거
        <div class="layer_m ppv_coupon" ><div class="layer_in">
            <div class="layer_ac">
              <strong class="layer_stit">특전아이템 쿠폰이 발급 되었습니다.</strong><br>발급된 쿠폰은 티켓 구매 페이지 또는 <br /> 쪽지함에서 확인하실 수 있습니다.
            </div>
            <div class="btn_wrap"><a href="#" class="btn_st2">확인</a></div>
            <a href="#" class="btn_close">닫기</a>
          </div></div>
        -->
  
        <div class="layer_m ppv_login" ><div class="layer_in">
            <div class="layer_ac">
              본 방송은 로그인이 필요한 서비스 입니다.					</div>
            <div class="btn_wrap"><a href="#" class="btn_st2">로그인</a></div>
            <a href="#" class="btn_close">닫기</a>
          </div></div>
  
  
  
        <div class="ui-pop award_vote" style="display: none;">
          <p class="pop-title">BJ Awards 투표</p>
          <div class="pop-body">
            <ul>
              <!-- template <li>
          <input type="radio" name="award" id="award1"><label for="award1"><strong>FlaSh.이영호(byflash)</strong>님을 <br> 2018 BJ Awards <span>종합게임부문</span>에 <br> 투표하시겠습니까?</label>
        </li>
        <li>
          <input type="radio" name="award" id="award2"> <label for="award2"><strong>FlaSh.이영호(byflash)</strong>님을 <br> 2018 BJ Awards <span>온라인게임부문</span>에 <br> 투표하시겠습니까?</label>
        </li> -->
            </ul>
          </div>
          <div class="pop-btn">
            <a href="javascript:;" class="btn btn_blue">확인</a>
            <a href="javascript:;" class="btn btn_white">취소</a>
          </div>
          <a href="javascript:;" class="pop-close"><span>레이어 닫기</span></a>
        </div>
    </div>
    <!-- //고정된 레이어 위치 -->
    <!-- //각종 레이어 위치 -->
  </div>
  <script type="text/javascript" src="https://static.afreecatv.com/asset/app/search/dist/umd/index.js" class="searchBox" data-type="total" data-location="live_player"></script>
  

	
	
	
   
   
   
   
   
   <c:import url="../common/footer.jsp"></c:import>

  <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="/static/js/auction/main.js"></script>
<script src="/static/js/auction/RTCMultiConnection.js"></script>
<script src="https://192.168.10.85:9001/socket.io/socket.io.js"></script>
<script src="/static/js/auction/getHTMLMediaElement.js"></script>

<script src="https://www.webrtc-experiment.com/common.js"></script>

<script>
  // ......................................................
// .......................UI Code........................
// ......................................................
document.getElementById('open-room').onclick = function() {
    disableInputButtons();
    connection.open(document.getElementById('room-id').value, function() {
        showRoomURL(connection.sessionid);
    });
};

document.getElementById('join-room').onclick = function() {
    disableInputButtons();

    connection.sdpConstraints.mandatory = {
        OfferToReceiveAudio: true,
        OfferToReceiveVideo: true
    };
    connection.join(document.getElementById('room-id').value);
};

document.getElementById('open-or-join-room').onclick = function() {
    disableInputButtons();
    connection.openOrJoin(document.getElementById('room-id').value, function(isRoomExist, roomid) {
        if (isRoomExist === false && connection.isInitiator === true) {
            // if room doesn't exist, it means that current user will create the room
            showRoomURL(roomid);
        }

        if(isRoomExist) {
          connection.sdpConstraints.mandatory = {
              OfferToReceiveAudio: true,
              OfferToReceiveVideo: true
          };
        }
    });
};

// ......................................................
// ..................RTCMultiConnection Code.............
// ......................................................

var connection = new RTCMultiConnection();

// by default, socket.io server is assumed to be deployed on your own URL
connection.socketURL = 'https://192.168.10.85:9001/';

// comment-out below line if you do not have your own socket.io server
// connection.socketURL = 'https://muazkhan.com:9001/';

connection.socketMessageEvent = 'video-broadcast-demo';

connection.session = {
    audio: true,
    video: true,
    oneway: true
};

connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: false,
    OfferToReceiveVideo: false
};

// https://www.rtcmulticonnection.org/docs/iceServers/
// use your own TURN-server here!
connection.iceServers = [{
    'urls': [
        'stun:stun.l.google.com:19302',
        'stun:stun1.l.google.com:19302',
        'stun:stun2.l.google.com:19302',
        'stun:stun.l.google.com:19302?transport=udp',
    ]
}];

connection.videosContainer = document.getElementById('videos-container');
connection.onstream = function(event) {
    var existing = document.getElementById(event.streamid);
    if(existing && existing.parentNode) {
      existing.parentNode.removeChild(existing);
    }

    event.mediaElement.removeAttribute('src');
    event.mediaElement.removeAttribute('srcObject');
    event.mediaElement.muted = true;
    event.mediaElement.volume = 0;

    var video = document.createElement('video');

    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
    }

    if(event.type === 'local') {
      video.volume = 0;
      try {
          video.setAttributeNode(document.createAttribute('muted'));
      } catch (e) {
          video.setAttribute('muted', true);
      }
    }
    video.srcObject = event.stream;

    var width = parseInt(connection.videosContainer.clientWidth / 3) - 20;
    var mediaElement = getHTMLMediaElement(video, {
        title: event.userid,
        buttons: ['full-screen'],
        width: width,
        showOnMouseEnter: false
    });

    connection.videosContainer.appendChild(mediaElement);

    setTimeout(function() {
        mediaElement.media.play();
    }, 5000);

    mediaElement.id = event.streamid;
};

connection.onstreamended = function(event) {
    var mediaElement = document.getElementById(event.streamid);
    if (mediaElement) {
        mediaElement.parentNode.removeChild(mediaElement);

        if(event.userid === connection.sessionid && !connection.isInitiator) {
          alert('Broadcast is ended. We will reload this page to clear the cache.');
          location.reload();
        }
    }
};

connection.onMediaError = function(e) {
    if (e.message === 'Concurrent mic process limit.') {
        if (DetectRTC.audioInputDevices.length <= 1) {
            alert('Please select external microphone. Check github issue number 483.');
            return;
        }

        var secondaryMic = DetectRTC.audioInputDevices[1].deviceId;
        connection.mediaConstraints.audio = {
            deviceId: secondaryMic
        };

        connection.join(connection.sessionid);
    }
};

// ..................................
// ALL below scripts are redundant!!!
// ..................................

function disableInputButtons() {
    document.getElementById('room-id').onkeyup();

    document.getElementById('open-or-join-room').disabled = true;
    document.getElementById('open-room').disabled = true;
    document.getElementById('join-room').disabled = true;
    document.getElementById('room-id').disabled = true;
}

// ......................................................
// ......................Handling Room-ID................
// ......................................................

function showRoomURL(roomid) {
    var roomHashURL = '#' + roomid;
    var roomQueryStringURL = '?roomid=' + roomid;

    var html = '<h2>Unique URL for your room:</h2><br>';

    html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
    html += '<br>';
    html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';

    var roomURLsDiv = document.getElementById('room-urls');
    roomURLsDiv.innerHTML = html;

    roomURLsDiv.style.display = 'block';
}

(function() {
    var params = {},
        r = /([^&=]+)=?([^&]*)/g;

    function d(s) {
        return decodeURIComponent(s.replace(/\+/g, ' '));
    }
    var match, search = window.location.search;
    while (match = r.exec(search.substring(1)))
        params[d(match[1])] = d(match[2]);
    window.params = params;
})();

var roomid = '';
if (localStorage.getItem(connection.socketMessageEvent)) {
    roomid = localStorage.getItem(connection.socketMessageEvent);
} else {
    roomid = connection.token();
}
document.getElementById('room-id').value = roomid;
document.getElementById('room-id').onkeyup = function() {
    localStorage.setItem(connection.socketMessageEvent, document.getElementById('room-id').value);
};

var hashString = location.hash.replace('#', '');
if (hashString.length && hashString.indexOf('comment-') == 0) {
    hashString = '';
}

var roomid = params.roomid;
if (!roomid && hashString.length) {
    roomid = hashString;
}

if (roomid && roomid.length) {
    document.getElementById('room-id').value = roomid;
    localStorage.setItem(connection.socketMessageEvent, roomid);

    // auto-join-room
    (function reCheckRoomPresence() {
        connection.checkPresence(roomid, function(isRoomExist) {
            if (isRoomExist) {
                connection.join(roomid);
                return;
            }

            setTimeout(reCheckRoomPresence, 5000);
        });
    })();

    disableInputButtons();
}

// detect 2G
if(navigator.connection &&
   navigator.connection.type === 'cellular' &&
   navigator.connection.downlinkMax <= 0.115) {
  alert('2G is not supported. Please use a better internet service.');
}
</script>


</body>
</html>