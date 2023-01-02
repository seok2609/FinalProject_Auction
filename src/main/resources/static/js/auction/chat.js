//$(document).ready(function(){

  const participants = [];

  //본인 id
  const username = $("#username").val();

  $("#disconn").on("click", (e) => {
      disconnect();
  })
  
  $("#send-msg").on("click", (e) => {
      send();
  });

  const websocket = new WebSocket("wss://localhost:80/chat");

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
  
  //채팅창에서 나갔을 때
  function onClose(evt) {
      var str = username + ": 님이 방을 나가셨습니다.";
      participants = participants.filter((element)=> element !== username);
      websocket.send(str);
  }
  
  //채팅창에 들어왔을 때
  function onOpen(evt) {
      var str = username + ": 님이 입장하셨습니다.";
      participants.push(username);
      websocket.send(str);
  }

  function onMessage(msg) {
      var data = msg.data;
      var sessionId = null;
      //데이터를 보낸 사람
      var message = null;
      var arr = data.split(":");

      for(var i=0; i<arr.length; i++){
          console.log('arr[' + i + ']: ' + arr[i]);
      }

      var cur_session = username;

      //현재 세션에 로그인 한 사람
      console.log("cur_session : " + cur_session);
      sessionId = arr[0];
      message = arr[1];

      console.log("sessionID : " + sessionId);
      console.log("cur_session : " + cur_session);

      //로그인 한 클라이언트와 타 클라이언트를 분류하기 위함
      if(sessionId == cur_session){
          var str = "<div class='col-6'>";
          str += "<div class='alert alert-secondary'>";
          str += "<b>" + sessionId + " : " + message + "</b>";
          str += "</div></div>";
          $("#chat-box").append(str);
      }
      else{
          var str = "<div class='col-6'>";
          str += "<div class='alert alert-warning'>";
          str += "<b>" + sessionId + " : " + message + "</b>";
          str += "</div></div>";
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
            let code = '<li class="list-group-item d-flex justify-content-between align-items-center">'
            +participants[i]+
            '<span class="badge bg-primary rounded-pill">신고</span>'
        
            $("#participants").prepend(code);

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

    


//})

