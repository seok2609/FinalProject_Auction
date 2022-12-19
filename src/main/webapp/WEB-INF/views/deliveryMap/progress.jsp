<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src="/map/js/mapSetting.js"></script>
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
	
	.testCSS{position:static;top:30%;right:30%; width:600px; height:300px;}
	
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
	
        
	<div id="map" style="width:500px;height:400px;">
		<div class="custom_typecontrol radius_border">
				<span id="btnRoadmap" class="selected_btn" onclick="panTo()">현재 위치</span>
		</div>
		
		
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae6b0e9fe80d419505ac021baf944e44"></script>
	<script>
		console.log("start");
		var stla;
		var stlo;
		var enla;
		var enlo;
		
		var disS;
		var disE;
		
		var startT = 08;
		var endT = 20;
		var testST;
		var testET;
		
		<c:forEach items="${startList}" var="list">
			stla = ${list.latitude};
			stlo = ${list.longitude};
			//testST = ${list.startDate};
		</c:forEach>
		<c:forEach items="${endList}" var="list">
			enla = ${list.latitude};
			enlo = ${list.longitude};
			//testET = ${list.endDate};
		</c:forEach>
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(stla, stlo), // 지도의 중심좌표
		        level: 8 // 지도의 확대 레벨
		    };
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
	    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

		var a = Math.abs((stla + enla)/2);
	    console.log("check a : "+Math.abs((stla + enla)/100*(25)));
	    console.log("a : "+a); 
		var b = Math.abs((stlo + enlo)/2);
		var checkPoint = 0;
		
		// 마커를 표시할 위치와 title 객체 배열입니다 		
		var positions = [ {
			title : "카카오",
			latlng : new daum.maps.LatLng(stla, stlo)
		}, {
			title : "배달트럭",
			latlng : new daum.maps.LatLng(a, b)
		}, {
			title : "제주공항",
			latlng : new daum.maps.LatLng(enla, enlo)
		} ];
		// 마커 이미위치 프로그래스바지의 이미지 주소입니다
		var imageSrc = [{
			image : "/map/images/markerStar.png"
		}, {
			image: "/map/images/truck.png"
		}, {
			image : "/map/images/flag.png"
		}]

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new daum.maps.Size(24, 35);
		
		// 마커 이미지를 생성합니다    
		var markerImage = new daum.maps.MarkerImage(imageSrc[0].image, imageSize);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[0].latlng, // 마커를 표시할 위치
			title : positions[0].title,
			image : markerImage
		// 마커 이미지 
		});

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new daum.maps.Size(24, 35);
		
		// 마커 이미지를 생성합니다    
		var markerImage = new daum.maps.MarkerImage(imageSrc[2].image, imageSize);

		// 마커를 생성합니다
		var marker2 = new daum.maps.Marker({
			map : map, // 마커를 표시할 지도
			position : positions[2].latlng, // 마커를 표시할 위치
			title : positions[2].title,
			image : markerImage
		// 마커 이미지 
		});

		var linePath;
	    var lineLine = new daum.maps.Polyline();
	    var distance;

		var drawLine;
		var drawLine2;

		function MK(){
			
			if(checkPoint==1){
				drawLine.setMap(null);
				drawLine2.setMap(null);
				distanceOverlay.setMap(null);
				marker3.setMap(null);
			}
				
			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new daum.maps.Size(24, 35);
		
			// 마커 이미지를 생성합니다    
			var markerImage = new daum.maps.MarkerImage(imageSrc[1].image, imageSize);

			// 마커를 생성합니다
			marker3 = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[1].latlng, // 마커를 표시할 위치
				title : positions[1].title,
				image : markerImage
				
			// 마커 이미지 
			});
			
			//------------------------------------------------------------------------
			
			for (var i = 0; i < positions.length; i++) {
				if (i == 1) {
					linePath = [ positions[0].latlng, positions[1].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
					lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
			
					drawLine = new daum.maps.Polyline({
						map : map, // 선을 표시할 지도입니다 
						path : linePath,
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#b5975b', // 선의 색깔입니다
						strokeOpacity : 0.7, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'dashed' // 선의 스타일입니다
					});
			
					distance = Math.round(lineLine.getLength());
					disS = distance;
				};
				
				if (i == 2) {
					linePath = [ positions[1].latlng, positions[2].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
					lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
			
					drawLine2 = new daum.maps.Polyline({
						map : map, // 선을 표시할 지도입니다 
						path : linePath,
						strokeWeight : 3, // 선의 두께입니다 
						strokeColor : '#db4040', // 선의 색깔입니다
						strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});
			
					distance = Math.round(lineLine.getLength());
					disE = distance;
					displayCircleDot(positions[2].latlng, distance);
				};
				
			} 
			
			
			
			//------------------------------------------------------------------------
			
			
			
			
			
			
		
			function displayCircleDot(position, distance) {
				if (distance > 0) {
					// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
					distanceOverlay = new daum.maps.CustomOverlay(
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
			
			checkPoint = 1;

		}
		function panTo() {
			console.log("panTo");
			// 이동할 위도 경도 위치를 생성합니다 
			console.log("a : "+a);
			console.log("b : "+b);
			var moveLatLon = new kakao.maps.LatLng(a, b);
			    
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);
		}
	 	MK();
	 	
	 	var points = [
	 	    new kakao.maps.LatLng(stla, stlo),
	 	    new kakao.maps.LatLng(a, b),
	 	    new kakao.maps.LatLng(enla, enlo)
	 	];
		var bounds = new kakao.maps.LatLngBounds();   
		for (i = 0; i < points.length; i++) {
		    bounds.extend(points[i]);
		}
		function setBounds() {
		    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
		    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
		    map.setBounds(bounds);
		}
		setBounds();
	</script>
	
	
	</th>
			
			<th>
				<label for="progressBar">택배 오는중</label>
	<progress id="progressBar" value="0" max="100"></progress>
	<div class="testCSS">
		
		<br>
		<text>출발 예정시간 :</text>
		<text id="startTime" value=startT>07:00</text>
		<br>
		<text>출발 예정날짜 : </text>
		<text>testST</text>
		<br>
		<text>도착 예정시간 :</text>
		<text id="endTime" value=endT>20:00</text>
		<br>
		<text>도착 예정날짜 : </text>
		
		<br>
		
		<br>
		<text>현재 시간 :</text>
		<text id="nowTime" value="08">8:00</text>
		<br>
		<text id="result"></text>
		
		<br>
		<button id="downTime">1시간 전</button>
		<button id="upTime">1시간 후</button>
	</div>		
			</th>
		</tr>
	</table>	
	
	<br>
	<button id="testBtn">테스트</button>
	
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>