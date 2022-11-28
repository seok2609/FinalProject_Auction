<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="/map/js/mapSetting.js"></script>
</head>
<body>
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae6b0e9fe80d419505ac021baf944e44"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.4786630, 126.531743), // 지도의 중심좌표
		        level: 8 // 지도의 확대 레벨
		    };
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
	    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
		
	    // 마커를 표시할 위치와 title 객체 배열입니다 
	    var positions = [ {
	        title : "카카오",
	        latlng : new daum.maps.LatLng(33.450705, 126.570677)
	    }, {
	    	title : "배달트럭",
	    	latlng : new daum.maps.LatLng(33.450705+0.000559161*(25), 126.570677-0.00077867*(25))
	    }, {
	        title : "제주공항",
	        latlng : new daum.maps.LatLng(33.5066211, 126.492810)
	    } ];
	 	
	    // 마커 이미위치 프로그래스바지의 이미지 주소입니다
	    var imageSrc = [{
	    	image : "/map/images/markerStar.png"
	    }, {
	    	image: "/map/images/truck.png"
	    }, {
	    	image : "/map/images/marker_p.png"
	    }]
	    
	 
	    for (var i = 0; i < positions.length; i++) {
	 
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new daum.maps.Size(24, 35);
	 
	        // 마커 이미지를 생성합니다    
	        var markerImage = new daum.maps.MarkerImage(imageSrc[i].image, imageSize);
	 
	        // 마커를 생성합니다
	        var marker = new daum.maps.Marker({
	            map : map, // 마커를 표시할 지도
	            position : positions[i].latlng, // 마커를 표시할 위치
	            title : positions[i].title,
	            image : markerImage
	        // 마커 이미지 
	        });
	    }
	 
	    var linePath;
	    var lineLine = new daum.maps.Polyline();
	    var distance;
	 
	    //------------------------------------------------------------------------
	    
	    for (var i = 0; i < positions.length; i++) {
	        if (i == 1) {
	            linePath = [ positions[0].latlng, positions[1].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
		        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
		 
		        var drawLine = new daum.maps.Polyline({
		            map : map, // 선을 표시할 지도입니다 
		            path : linePath,
		            strokeWeight : 3, // 선의 두께입니다 
		            strokeColor : '#b5975b', // 선의 색깔입니다
		            strokeOpacity : 0.7, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle : 'dashed' // 선의 스타일입니다
		        });
		 
		        distance = Math.round(lineLine.getLength());
		        
	        };
	        
	        if (i == 2) {
	            linePath = [ positions[1].latlng, positions[2].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
		        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
		 
		        var drawLine = new daum.maps.Polyline({
		            map : map, // 선을 표시할 지도입니다 
		            path : linePath,
		            strokeWeight : 3, // 선의 두께입니다 
		            strokeColor : '#db4040', // 선의 색깔입니다
		            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle : 'solid' // 선의 스타일입니다
		        });
		 
		        distance = Math.round(lineLine.getLength());
		        displayCircleDot(positions[2].latlng, distance);
	        };
	         
	    } 
	    
	    
	    
	    //------------------------------------------------------------------------
	    
	    
	    
	    
	    
	    
	 
	    function displayCircleDot(position, distance) {
	        if (distance > 0) {
	            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
	            var distanceOverlay = new daum.maps.CustomOverlay(
	                    {
	                        content : '<div class="dotOverlay">남은거리 <span class="number">'
	                                + distance + '</span>m</div>',
	                        position : position,
	                        yAnchor : 1,
	                        zIndex : 2
	                    });
	 
	            // 지도에 표시합니다
	            distanceOverlay.setMap(map);
	        }
	    } 
		
		
	</script>
	<h1>Progress Bar</h1>
<br>
<br>

<label for="progressBar">택배 오는중</label>
<progress id="progressBar" value="0" max="100"> 40% </progress>

<br>
<text>출발 예정시간 :</text>
<text id="startTime" value="07">07:00</text>
<text>도착 예정시간 :</text>
<text id="endTime" value="18">20:00</text>

<br>
<text>현재 시간 :</text>
<text id="nowTime" value="11">11:00</text>
<br>
<button id="downTime">1시간 전</button>
<button id="upTime">1시간 후</button>


	
</body>
</html>