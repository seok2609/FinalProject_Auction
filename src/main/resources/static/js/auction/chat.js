//경매 시작 버튼 클릭 시 실행
$("#startauction").click(function(){
        
    //입찰 disabled 풀기
    $("#inputfree").removeAttr('disabled');
    $("#free-bidding").removeAttr('disabled');
    $("#unit-bidding").removeAttr('disabled');

})
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
      var str = "[퇴장]:"+ username + ": 님이 방을 퇴장하셨습니다.";
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
      }else if(sessionId == '강퇴'){
        if(message == username){
            alert("관리자에 의해 강제 퇴장 당하셨습니다.");
            location.replace("/");
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


    // =============================================================== UI 버튼 태그 함수 ===========================================================



    //경매 참여자 불러오기
    function getParticipants(){
        $("#chat-write").attr("style","display : none;");
        $("#chat-box").attr("style","display : none;");
        $("#bid-box").attr("style","display : none;");
        $("#participants-box").removeAttr("style");
        $("#participants").empty();
        let roleNum = $("#participants").attr("data-role");

        for(let i=0; i<participants.length; i++){
            
            if(roleNum == 0){
                if(participants[i] == username){
                    let code = '<li class="list-group-item d-flex justify-content-between align-items-center">'
                    +participants[i]+" 님 (관리자)"+'</li>';
                    $("#participants").prepend(code);
                }else{
                    let code = '<li class="list-group-item d-flex justify-content-between align-items-center">'
                    +participants[i]+
                    '<span class="badge bg-success rounded-pill" onclick="setBan(event)" style="cursor: pointer;" data-id='+""+participants[i]+""+'>강퇴</span></li>';
                    $("#participants").prepend(code);
                }
            }else{
                if(participants[i] == username){
                    let code = '<li class="list-group-item d-flex justify-content-between align-items-center">'
                    +participants[i]+" 님 (나)"+'</li>';
                    $("#participants").prepend(code);
                }else{
                    let code = '<li class="list-group-item d-flex justify-content-between align-items-center">'
                    +participants[i]+
                    '<span class="badge bg-success rounded-pill" onclick="setReport(event)" style="cursor: pointer;" data-id='+""+participants[i]+""+'>신고</span></li>';
                    $("#participants").prepend(code);
                }
            }
        

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


    //================================================================= 동작 함수 ===============================================================

    //입찰 시 포인트 차감 함수
    function minusPoint(currentprice){
        //숫자타입으로 변환
        let mypoint = $("#mypoint").html();
        mypoint = mypoint.replace(/,/g, "");
        mypoint *= 1;

        mypoint = mypoint - currentprice;

        //스트링 타입으로 변환
        mypoint += "";

        //차감한 포인트 천단위 변환 후 표출
        mypoint = mypoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        $("#mypoint").empty();
        $("#mypoint").text(mypoint);
        
    }

    //현재가 변경 함수(자유입찰)
    function changeCurPriceFree(finalinput){

        //포인트 차감
        minusPoint(finalinput);

        //스트링 타입으로 변환
        finalinput += "";
        //현재가 천단위 변환 후 return
        finalinput = finalinput.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");

        return finalinput;
    }


    //현재가 변경 함수(단위입찰)
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


    // 입찰하려는 가격과 내 보유 포인트 비교
    function getCompare(inputprice){
        //내 보유 포인트 넘버타입으로 변경
        let mypoint = $("#mypoint").html();
            mypoint = mypoint.replace(/,/g, "");
            mypoint *= 1;

        if(mypoint < inputprice){
            return false;
        }else{
            return true;
        }

    }



    // 자유입찰 input 태그 천단위 콤마 찍기, 천단위 절사 (keyup) 
    function getCalculate(obj) {
        obj.value = comma(uncomma(obj.value));
    }
   
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }
   
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }

    function getCalculate2(obj){
        let cal = uncomma(obj.value);
        if(cal*1 > 1000){
            cal = Math.floor(cal/1000) * 1000;
            obj.value = comma(cal);
        }
    }



    //1. 자유 가격 입찰 버튼 클릭 시 실행
    function setFreeBidding(){
        
        //현재가
        let curprice = $("#currentprice").html();
        curprice = curprice.replace(/,/g, "");
        curprice *=1;

        //검증 1 : 보유포인트와 입찰하려는 가격 비교
        //보유포인트와 가격 비교
        //inputfree 계산
        let inputfree = $("#inputfree").val();
        inputfree = inputfree.replace(/,/g, "");
        inputfree *= 1;
        
        let compare = getCompare(inputfree);

        if(!compare){
            alert("보유 포인트가 부족합니다.");
            return;
        }

        //검증 2 : 현재가와 입찰하려는 가격 비교
        if(inputfree < curprice){
            alert("입찰가격은 현재가 보다 높아야 합니다.");
            return;
        }


        //검증 3 : 현재 내가 입찰 중인 가격이 최고가 인지 확인
        if(checkmybidding){
            alert("현재 "+username+"님이 최고가로 입찰 중입니다.");
            return;
        }

        //검증 4 : 자유 입찰 여부 확인
        let result = window.confirm("입찰가 "+$("#inputfree").val()+"으로 입찰 하시겠습니까?");
        if(!result){
            return;
        }


        // ==== 검증 끝 =====

        let finalinput = $("#inputfree").val();
        finalinput = finalinput.replace(/,/g, "");
        finalinput *= 1;

         //현재가 변경 및 포인트 차감(천단위 변경 후 리턴)
         finalinput = changeCurPriceFree(finalinput);


         //내 입찰상태 변경 => true
         checkmybidding = true;
 
         websocket.send("현재가:"+finalinput+":"+username);


    }


    //2.단위 가격 입찰 버튼 클릭 시 실행
    function setUnitBidding(){
        

        //검증 1 : 보유포인트와 입찰하려는 가격 비교
        //보유포인트와 가격 비교
        //inputprice 계산 
        let inputprice = $("#currentprice").html();
        inputprice = inputprice.replace(/,/g, "");
        inputprice *=1;
        inputprice = inputprice + unitprice;

        let compare = getCompare(inputprice);

        if(!compare){
            alert("보유 포인트가 부족합니다.");
            return;
        }

        //검증 2 : 현재 내가 입찰 중인 가격이 최고가 인지 확인
        if(checkmybidding){
            alert("현재 "+username+"님이 최고가로 입찰 중입니다.");
            return;
        }

        // 검증 3 : 단위가격으로 입찰 여부 확인
        let result = window.confirm("단위가격으로 입찰 하시겠습니까?");
        if(!result){
            return;
        }


        // 검증 완료 시 진행

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


    // 강퇴하기 버튼 클릭 이벤트
    function setBan(event){
        let user = event.target.getAttribute('data-id');

        websocket.send("강퇴:"+user);

    }

//})

