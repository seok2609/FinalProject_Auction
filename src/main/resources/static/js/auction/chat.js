//$(document).ready(function(){

  let init = $("#currentprice").html();
  init += "";
  init = init.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
  $("#currentprice").html(init);

  let unitprice = $("#unitprice").html();
  unitprice = unitprice.replace(/,/g, "");
  unitprice *= 1;

  let checkmybidding = false;


  //내 보유 포인트
  let myinitpoint=$("#mypoint").html();

  //참여자 리스트
  const participants = [];

  //본인 id
  const username = $("#username").val();

  $("#disconn").on("click", (e) => {
      disconnect();
  })
  
  $("#send-msg").on("click", (e) => {
      send();
  });

  const websocket = new WebSocket("wss://192.168.200.2:80/chat");

  websocket.onmessage = onMessage;
  websocket.onopen = onOpen;
  websocket.onclose = onClose;




  function send(){

      let msg = document.getElementById("chat-input");

      if(msg.value == ''){
        alert("내용을 입력하세요.");
      }else{
        console.log(username + ":" + msg.value);
        websocket.send(username + ":" + msg.value);
        msg.value = '';
      }
  }
  
  //경매에서 나갔을 때
  function onClose(evt) {
      var str = "[퇴장]:"+ username + ": 님이 방을 나가셨습니다.";
    //   participants = participants.filter((element)=> element !== username);
    //   console.log(participants);
      websocket.send(str);
  }
  
  //경매에 들어왔을 때
  function onOpen(evt) {
      var str = "[입장]:"+username + ": 님이 입장하셨습니다.";
    //   participants.push(username);
    //   console.log(participants);
      websocket.send(str);
  }

  function onMessage(msg) {
    
      var data = msg.data;
      var sessionId = null;
      //데이터를 보낸 사람
      var message = null;
      var arr = data.split(":");

      var cur_session = username;

      //현재 세션에 로그인 한 사람
      sessionId = arr[0];
      message = arr[1];

      //로그인 한 클라이언트와 타 클라이언트를 분류(나)
      if(sessionId == cur_session){
          var str = "<div class='mymsg'>";
          str += "<span class='anothername'>"+sessionId+"(나)"+"</span>";
          str += "<span class='msg'>"+message +"</span>";
          str += "</div>";
          $("#chat-box").append(str);
      }else if(sessionId == '현재가'){
        // 입찰 상태 
        // 1. 현재가에 입찰가 입력
        $("#currentprice").html(arr[1]);
        // 2. 입찰자 판별 
            if(arr[2] != username){
                $("#mypoint").html(myinitpoint);
                checkmybidding = false;
            }
            var str = "<div class='d-flex justify-content-center'>";
            str +="<span>"+arr[2]+"님이 입찰하셨습니다."+"(현재가 : "+arr[1]+" 원)"+"</span>"
            str += "</div>";
            $("#chat-box").append(str);
      }else if(sessionId == '[입장]' || sessionId == '[퇴장]'){
        var str = "<div class='d-flex justify-content-center'>";
        str +="<span>"+arr[1]+arr[2]+"</span>"
        str += "</div>";
        $("#chat-box").append(str);
            if(sessionId == '[입장]'){
                participants.push(arr[1]);
            }else{
                participants = participants.filter((element)=> element !== username);
            }
      }
      else{
            var str = "<div class='anothermsg'>";
            str += "<span class='anothername'>"+sessionId+"</span>";
            str += "<span class='msg'>"+message +"</span>";
            str += "</div>"
          $("#chat-box").append(str);
      }
  }
  
    function enterkey(){
        if (window.event.keyCode == 13) {
            // 엔터키가 눌렸을 때
            send();
        }
    }

    //경매 참여자 불러오기
    function getParticipants(){
        $("#chat-write").attr("style","display : none;");
        $("#chat-box").attr("style","display : none;");
        $("#bid-box").attr("style","display : none;");
        $("#participants-box").removeAttr("style");
        $("#participants").empty();
        for(let i=0; i<participants.length; i++){

            if(participants[i] == username){
                let code = '<li class="list-group-item d-flex justify-content-between align-items-center">'
                +participants[i]+" 님 (나)";
                $("#participants").prepend(code);
            }else{
                let code = '<li class="list-group-item d-flex justify-content-between align-items-center">'
                +participants[i]+
                '<span class="badge bg-success rounded-pill" onclick="setReport(event)" style="cursor: pointer;" data-id='+""+participants[i]+""+'>신고</span>';
                $("#participants").prepend(code);
            }
        
            // $("#participants").prepend(code);

        }
    }

    //채팅 목록 불러오기
    function getChattingList(){
        $("#participants-box").attr("style","display : none;");
        $("#bid-box").attr("style","display : none;");
        $("#chat-write").removeAttr("style");
        $("#chat-box").removeAttr("style");



    }

    //입찰 페이지 불러오기
    function getBidPage(){
        $("#participants-box").attr("style","display : none;");
        $("#chat-write").attr("style","display : none;");
        $("#chat-box").attr("style","display : none;");
        $("#bid-box").removeAttr("style");
    }


    //입찰 시 포인트 차감 함수
    function minusPoint(currentprice){
        let mypoint = $("#mypoint").html();
        mypoint = mypoint.replace(/,/g, "");

        //숫자타입으로 변환
        mypoint *= 1;

        mypoint = mypoint - currentprice;

        //스트링 타입으로 변환
        mypoint += "";

        //차감한 포인트 천단위 변환 후 표출
        mypoint = mypoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#mypoint").empty();
        $("#mypoint").text(mypoint);
        
    }

    //현재가 변경 함수
    function changeCurPrice(unitprice){
        //넘버타입으로 변경
        let currentprice = $("#currentprice").html();
        currentprice = currentprice.replace(/,/g, "");
        currentprice *=1;

        //계산
        currentprice = currentprice + unitprice;

        minusPoint(currentprice);


        //스트링 타입으로 변환
        currentprice += "";
        //현재가 천단위 변환후 return
        currentprice = currentprice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");



        return currentprice;
    }

    function setUnitBidding(){
        
        //현재 내가 입찰 중인 가격이 최고가 인지 확인
        if(checkmybidding){
            alert("현재 "+username+"님이 최고가로 입찰 중입니다.");
            return;
        }

        // 단위가격으로 입찰 여부 확인
        let result = window.confirm("단위가격으로 입찰 하시겠습니까?");
        if(!result){
            return;
        }

        //현재가 변경 및 포인트 차감
        let currentprice = changeCurPrice(unitprice);


        //내 입찰상태 변경 => true
        checkmybidding = true;

        websocket.send("현재가:"+currentprice+":"+username);

    }

    //신고하기 버튼 클릭
    function setReport(event){

        let user = event.target.getAttribute('data-id');

        let link ="/kdy/reportRequest?report_id="+user;

        window.open(link);
    }


//})

