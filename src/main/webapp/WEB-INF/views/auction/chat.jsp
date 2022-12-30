<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<c:import url="../common/header.jsp"></c:import>

        <div class="row" data-aos="fade-up" style="border:solid 1px red; height: 800px; width: 1800px; margin-left: 50px; margin-top: 50px; margin-bottom: 50px;">
            <div style="border: solid 2px orange; height: 800px; width: 1250px;  text-align: center; color: aliceblue; overflow-y:scroll;">
                <div style="border: solid 1px red; width: 1250px; height: 800px; background-color: black;">
                    <div style="margin-top: 400px;">
                        영상 송출
                    </div>
                </div>
                <div style="height: 500px; color: black;">
                    <div>방송 시작 시간</div>
                    <div>인원수</div>
                    <div>방 제목</div>
                    <div>등등등 표출</div>
                </div>
            </div>
            
            <div style="border: solid 2px blueviolet; height: 800px; width: 550px; margin-left: 1250px; margin-top: -805px; background-color: oldlace;">
                <div style="font-weight: bold; border-bottom: solid 1px black; height: 30px;">
                    <div style="margin-top: 3px; margin-left: 10px;">
                        채팅창
                    </div>
                    <div style="margin-left: 470px; margin-top: -20px;">
                        참여인원
                    </div>
                </div>
                <div style="border: solid 1px red; margin-top: 715px; height: 50px; background-color: aliceblue;">
                    <div style="border: solid 1px black; height: 49px; width: 480px;">

                    </div>
                    <div style="border: solid 1px red; text-align: center; font-weight: bold; width: 69px; margin-left: 480px; margin-top: -50px; height: 49px;">
                        <div style="margin-top: 10px;">
                            보내기
                        </div>
                    </div>
                </div>
            </div>
        </div>

  <c:import url="../common/footer.jsp"></c:import>
</body>
</html>