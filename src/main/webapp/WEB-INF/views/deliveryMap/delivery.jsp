<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function testABtn() {
		console.log(document.getElementById('testAdd').value);
		console.log(mapOption.center);
		console.log("lat : "+lat);
		console.log("lon : "+lon);
		console.log("show distance : ",showDistance);
	}
</script>

</head>
<body>
<!-- ===========header=============== -->
<c:import url="./common/header.jsp"></c:import>
<!-- ================================ -->

	<h1>Test Map</h1>
	<textarea id="testAdd"></textarea>
	<button onclick="testABtn()">더하기</button>
	<!-- 지도를 표시할 div 입니다 -->
	<button onclick="panTo()">트럭 위치</button>
	<div id="map" style="width:100%;height:350px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae6b0e9fe80d419505ac021baf944e44"></script>
	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701+(document.getElementById('testAdd').value), 126.570667), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var lat, lon;
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {	
			
	        lat = position.coords.latitude, // 위도
	        lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	        check();
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            console.log("lat="+lat);
	            console.log("lon="+lon);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

	    // // 마커를 생성합니다
	    // var marker = new kakao.maps.Marker({  
	    //     map: map, 
	    //     position: locPosition
	    // }); 
	    
	    // var iwContent = message, // 인포윈도우에 표시할 내용
	    //     iwRemoveable = true;

	    // // // 인포윈도우를 생성합니다
	    // var infowindow = new kakao.maps.InfoWindow({
	    //     content : iwContent,
	    //     removable : iwRemoveable
	    // });
	    
	    // // 인포윈도우를 마커위에 표시합니다 
	    // infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	    
		
	    
	}    
		function panTo() {
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(lat, lon);
		    
		    // 지도 중심을 부드럽게 이동시킵니다
		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		    map.panTo(moveLatLon);            
		}      
	
	
	//----------------------------------------------------------------------
	function check(){	
		console.log("lat : "+lat);
		console.log("lon : "+lon);
		// 마커를 표시할 위치와 title 객체 배열입니다 
	    var positions = [ {
	        title : "카카오",
	        latlng : new daum.maps.LatLng(37.53946477, 126.82873744)
	    }, {
	    	title : "배달트럭",
	    	latlng : new daum.maps.LatLng(lat, lon)
	    }, {
	        title : "제주공항",
	        latlng : new daum.maps.LatLng(37.44597242, 126.88500282)
	    } ];
	 	
	    // 마커 이미위치 프로그래스바지의 이미지 주소입니다
	    var imageSrc = [{
	    	image : "./images/markerStar.png"
	    }, {
	    	image: "./images/truck.png"
	    }, {
	    	image : "./images/marker_p.png"
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
	
	<text id="showTest"></text>
	<br>
	
	<a href="https://map.kakao.com/link/to/카카오판교오피스,37.402056,127.108212">길찾기</a>
	<a href="https://map.kakao.com/link/to/18375227">?</a>
	<a href="./navi">네비실험</a>
	<a href="./progress">바 실험</a>
	<a href="./latlon">지도 좌표</a>
	
<!— ===========footer=============== —>
<c:import url="./common/footer.jsp"></c:import>
<!— ================================ —>
</body>
</html>