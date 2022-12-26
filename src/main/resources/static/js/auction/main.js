'use strict';

// 비디오 객체 가져오기
const mediaStreamConstraints = {
  video: true,
};

// video 태그 선택
const localVideo = document.querySelector('video');

// 비디오로 재 생성될 local Stream 객체 선언
let localStream;

// 비디오 태그에 mediastream 객체를 받아서 추가
function gotLocalMediaStream(mediaStream) {
  localStream = mediaStream;
  localVideo.srcObject = mediaStream;
}

// 에러처리
function handleLocalMediaStreamError(error) {
  console.log('navigator.getUserMedia error: ', error);
}

// 미디어 스트림 초기화
navigator.mediaDevices.getUserMedia(mediaStreamConstraints)
  .then(gotLocalMediaStream).catch(handleLocalMediaStreamError);
