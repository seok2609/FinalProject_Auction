// live.js

const roomSelectionContainer = document.getElementById('room-selection-container');
const roomInput = document.getElementById('room-input');
const connectButton = document.getElementById('connect-button');

const videoChatContainer = document.getElementById('video-chat-container');
const localVideoComponent = document.getElementById('local-video');
const remoteVideoComponent = document.getElementById('remote-video');


// 매수금액 입력
// $("#addPrice").click(function(){

//   $.ajax({
//     type:"POST",
//     url:"./asking",
//     data:{
//       auction_num:1,S
//       price: 
//     }
//   })


// })




//Signaling server (채팅 정보교환)
//html 문서의 로딩이 다 끝날 때 실행
$(document).ready(function() {
    let socket = io("http://192.168.1.28:3000");
    
    //msg에서 키를 누를떄
    $("#msg").keydown(function(key){
        console.log("socketid : ", socket.id);
        //해당하는 키가 엔터키(13) 일떄
        if(key.keyCode == 13){
            //msg_process를 클릭해준다.
            msg_process.click();
        }
    });
    
    //msg_process를 클릭할 때
    $("#msg_process").click(function(){
        //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
         socket.emit("send_msg", $("#msg").val());
        //#msg에 벨류값을 비워준다.
        $("#msg").val("");
    });
    
    //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
    socket.on('send_msg', function(msg) {
        //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
        $('<div></div>').text(msg).appendTo("#chat_box");
    });
    
    
   
//===============================================================

    const videoGrid = document.getElementById('video-grid');
    const myPeer = new Peer(socket.id, {
      host: '192.168.1.28',
      port: 3000,
      path : '/'
    });
    const myVideo = document.createElement('video');
    myVideo.muted = true;

    ROOM_ID = '777';
    id = socket.id;
    userId = socket.id;

    const peers = {};


    navigator.mediaDevices.getUserMedia({
      video: true,
      audio: false
    }).then((stream) => {
      addVideoStream(myVideo,stream);
      socket.on('user-connected',(userId) => {
        connectToNewUser(userId,stream);
      })
    });


    socket.on('user-disconnected', (userId) => {
      if(peers[userId]){
        peers[userId].close;
      }
    })


    myPeer.on('open',(id)=>{
      socket.emit('join-room',ROOM_ID,id);
    });

    function connectToNewUser(userId, stream){
      const call = myPeer.call(userId, stream);
      const video = document.createElement('video');
      call.on('stream', (userVideoStream)=>{
        addVideoStream(video,userVideoStream);
      })
      call.on('close',() => {
        video.remove();
      })

      peers[userId] = call;

    }





    function addVideoStream(video, stream){
      video.srcObject = stream;
      video.addEventListener('loadedmetadata',() => {
        video.play();
      })
      videoGrid.append(video);
    }


});




