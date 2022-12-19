<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>simpleMap</title>
        <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx4c39c875ced84734ac53c27524cc3b22"></script>
        <script type="text/javascript">
			function initTmap(){
				var map = new Tmapv2.Map("map_div",  
				{
					center: new Tmapv2.LatLng(37.566481622437934,126.98502302169841), // 지도 초기 좌표
					width: "890px", 
					height: "400px",
					zoom: 15
				});
			} 
		</script>
    </head>
    <body onload="initTmap()">
        <div id="map_div">
        </div>        
    </body>
</html>	

