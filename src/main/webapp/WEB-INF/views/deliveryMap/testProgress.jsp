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

	<script defer src="/map/js/mapTest.js"></script>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae6b0e9fe80d419505ac021baf944e44"></script>
	<script>
	
	var stla;
	var stlo;
	var enla;
	var enlo;
	var disS;
    var disE;
	var clickS;
	var clickE;
	
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
	console.log("stla : ",stla);
	console.log("stlo : ",stlo);
	console.log("enla : ",enla);
	console.log("enlo : ",enlo);
	
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.4730836, 126.8788276), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
    
	//==============================	
	
	var positions = [ {
        title : "카카오",
        latlng : new daum.maps.LatLng(stla, stlo)
    }, {
    	title : "배달트럭",
    	latlng : new daum.maps.LatLng(37.4730836, 126.8788276)
    }, {
        title : "제주공항",
        latlng : new daum.maps.LatLng(enla, enlo)
    } ];
 	
    // 마커 이미위치 프로그래스바지의 이미지 주소입니다
    var imageSrc = [{
    	image : "/map/images/markerStar.png"
    }, {
    	image: "/map/images/x.png"
    }, {
    	image : "/map/images/flag.png"
    }]
    
 
    /* for (var i = 0; i < positions.length; i++) {
 
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
    } */
    
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
        var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[2].latlng, // 마커를 표시할 위치
            title : positions[2].title,
            image : markerImage
        // 마커 이미지 
        });

        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new daum.maps.Size(1, 1);
 
        // 마커 이미지를 생성합니다    
        var markerImage = new daum.maps.MarkerImage(imageSrc[1].image, imageSize);
 
        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[1].latlng, // 마커를 표시할 위치
            title : positions[1].title,
            image : markerImage
        // 마커 이미지 
        });

    
 
    var linePath;
    var lineLine = new daum.maps.Polyline();
    var distance;
    var distanceOverlay;
 
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
	        disS = distance;
        };
        
        if (i == 2) {
            linePath = [ positions[1].latlng, positions[2].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
	        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
	 
	        var drawLine2 = new daum.maps.Polyline({
	            map : map, // 선을 표시할 지도입니다 
	            path : linePath,
	            strokeWeight : 3, // 선의 두께입니다 
	            strokeColor : '#db4040', // 선의 색깔입니다
	            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	            strokeStyle : 'solid' // 선의 스타일입니다
	        });
	 
	        distance = Math.round(lineLine.getLength());
	        displayCircleDot(positions[2].latlng, distance);
	        disE = distance;
        };
         
    } 
    
    
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
    
 
    
    
    //------------------------------------------------------------------------
    
    
	
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	//var map = new kakao.maps.Map(mapContainer, mapOption);
	var lat, lon;

	
	var imageSrc = '/map/images/truck.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize),
	    markerPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치입니다
	
	
	// 지도를 클릭한 위치에 표출할 마커입니다
	var marker2 = new kakao.maps.Marker({ 
	    // 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter(),
	    image: markerImage 
	}); 
	// 지도에 마커를 표시합니다
	marker2.setMap(map);

	// 지도에 클릭 이벤트를 등록합니다
	// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng; 
	    
	    console.log("latlng :",latlng);
	    clickS = latlng.Ma;
	    clickE = latlng.La;
	    
	    console.log("S : ",clickS);
	    console.log("E : ",clickE);
	    
	    // 마커 위치를 클릭한 위치로 옮깁니다
	    marker2.setPosition(latlng);
	    
	    drawLine.setMap(null);
	    drawLine2.setMap(null);
	    distanceOverlay.setMap(null);
	    
	    for (var i = 0; i < positions.length; i++) {
	        if (i == 1) {
	            linePath = [ positions[0].latlng, latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
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
		        disE = distance;
		        
	        };
	        
	        if (i == 2) {
	            linePath = [ latlng, positions[2].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
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
		        displayCircleDot(positions[2].latlng, distance);
		        disS = distance;
	        };
	         
	    } 
	    
	    
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
	    
	    var message = '남은 거리는 ' + distance;
	    
	    progressBar.max = disE + disS;
	    progressBar.value = disE;
	    
	    console.log(message); 
	    
	});  
	function panTo() {
		console.log("panTo");
		// 이동할 위도 경도 위치를 생성합니다 
		console.log("a : "+clickS);
		console.log("b : "+clickE);
		var moveLatLon = new kakao.maps.LatLng(clickS, clickE);
		    
		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	}
	
	</script>
	
		</th>
		<th>
			<label for="progressBar">택배 오는중</label>
			<progress id="progressBar" value="25" max="100"></progress>		
		</th>
	</tr>
	</table>
	<div class="testCSS">
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>