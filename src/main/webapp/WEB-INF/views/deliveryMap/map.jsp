<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html, body {width:100%;height:100%;margin:0;padding:0;} 
	.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
	.radius_border{border:1px solid #919191;border-radius:5px;}     
	.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:70px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
	.custom_typecontrol span {display:block;width:70px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;} 
	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
	.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
	.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
	.custom_typecontrol .selected_btn:hover {color:#fff;}   
	     
	#progressBar{
		width: 500px;
  		height: 30px;
	}     
	
	#mapTable{
		border: 1px solid;
		text-align: center;	
		margin-right:auto;
		margin-left:auto;
	}
	
	#infoTable{
		text-align: center;
		margin-right:auto;
		margin-left:auto;
	}

</style>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
<!-- <section class="container-fluid col-lg-10 mt-5"> -->
		
		
		<section id="contact" class="contact">
		<div class="section-header">
          <h2>택배 위치</h2>
        </div>
	<table id="mapTable">
		<tr>
		<th>
	
	<div class="map_wrap" style="width:450px; height: 400px;">
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
		<div class="custom_typecontrol radius_border">
			<span id="btnRoadmap" class="selected_btn" onclick="panTo()">현재 위치</span>
		</div>
	</div>
	<!-- <div id="map" style="width:500px;height:350px;"></div> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae6b0e9fe80d419505ac021baf944e44"></script>
	<script>
	
	console.log("start");
	var stla;
	var stlo;
	var enla;
	var enlo;
	
	var barS;
	var barE;
	
	<c:forEach items="${StartList}" var="list">
		stla = ${list.latitude};
		stlo = ${list.longitude};
	</c:forEach>
	<c:forEach items="${EndList}" var="list">
		enla = ${list.latitude};
		enlo = ${list.longitude};
	</c:forEach>
	
	console.log("stla : "+stla);
	console.log("stlo : "+stlo);
	console.log("enla : "+enla);
	console.log("enlo : "+enlo);
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(stla, stlo), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var lat, lon;
	var checkD;
	
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
	        title : "시작위치",
	        latlng : new kakao.maps.LatLng(stla, stlo)
	    }, {
	    	title : "배달트럭",
	    	latlng : new kakao.maps.LatLng(lat, lon)
	    }, {
	        title : "도착위치",
	        latlng : new kakao.maps.LatLng(enla, enlo)
	    } ];
	 	
	    // 마커 이미위치 프로그래스바지의 이미지 주소입니다
	    var imageSrc = [{
	    	image : "/map/images/markerStar.png"
	    }, {
	    	image : "/map/images/truck.png"
	    }, {
	    	image : "/map/images/marker_p.png"
	    }]
	    
	 
	    for (var i = 0; i < positions.length; i++) {
	 
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(30, 35);
	 
	        // 마커 이미지를 생성합니다    
	        var markerImage = new kakao.maps.MarkerImage(imageSrc[i].image, imageSize);
	 
	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	            map : map, // 마커를 표시할 지도
	            position : positions[i].latlng, // 마커를 표시할 위치
	            title : positions[i].title,
	            image : markerImage
	        // 마커 이미지 
	        });
	    }
	
	 
	    var linePath;
	    var lineLine = new kakao.maps.Polyline();
	    var distance;
	 
	    //------------------------------------------------------------------------
	    
	    for (var i = 0; i < positions.length; i++) {
	        if (i == 1) {
	            linePath = [ positions[0].latlng, positions[1].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
		        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
		 
		        var drawLine = new kakao.maps.Polyline({
		            map : map, // 선을 표시할 지도입니다 
		            path : linePath,
		            strokeWeight : 3, // 선의 두께입니다 
		            strokeColor : '#b5975b', // 선의 색깔입니다
		            strokeOpacity : 0.7, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle : 'dashed' // 선의 스타일입니다
		        });
		 
		        distance = Math.round(lineLine.getLength());
		        barS = distance;
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
		        checkD = Math.round(lineLine.getLength());
		        barE = distance;
				displayCircleDot(positions[2].latlng, distance);
				
				console.log("barE : "+barE);
	        };
	         
	    } 
	    
	}

		var testB = document.getElementById("progress Bar"); 


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
	    
	    var points = [
	 	    new kakao.maps.LatLng(stla, stlo),
	 	    new kakao.maps.LatLng(enla, enlo)
	 	];
		var bounds = new kakao.maps.LatLngBounds();   
		for (i = 0; i < points.length; i++) {
		    bounds.extend(points[i]);
		}
		/* function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
		setBounds(); */
		
	</script>
	
	</th>
		<th>
			<table id="infoTable">
				<c:forEach items="${Info}" var="Info">
					<tr>
						<th>경매장 : </th>
						<th>${Info.category}</th>
					</tr>
					<tr>
						<th>이름 : </th>
						<th>${Info.title}</th>
					</tr>
					<tr>
						<th>설명 : </th>
						<th>${Info.contents}</th>
					</tr>
					<tr>
						<th>가격 : </th>
						<th>${Info.award}</th>
					</tr>
					<tr>
						<th>수량 : </th>
						<th>${Info.amount}</th>
					</tr>
				</c:forEach>
			</table>
		
			<br>	
			<label for="progressBar">진행도</label>
			<br>
			<progress id="progressBar" value="95" max="100"></progress>
		
		</th>
		</tr>
	</table>
	
	<br>

	<a href="./testProgress">클릭 이벤트</a>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>