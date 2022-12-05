import { Component } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { lastValueFrom } from "rxjs";

import { TokenModel } from "openvidu-angular";
import * as $ from "jquery";


// console.log("분기처리 하고 스크립트 : ",script);
//let xhttp = new XMLHttpRequest();
    //xhttp.open("GET","http://localhost:5000/auction/test");
    //xhttp.send();
    //xhttp.onreadystatechange=function(){
      //if(this.readyState==4 && this.status==200){
          //let result = JSON.parse(this.responseText.trim());
          //console.log("가나다라마바사아자차카타파하",result);
          
      //}
    //}

    //<div *ngIf="result == 'good'"><ov-videoconference [tokens]="tokens"></ov-videoconference></div>
@Component({
  selector: 'app-root',
  template: `<ov-videoconference [tokens]="tokens"></ov-videoconference>`,
  styles: ['']
})



export class AppComponent {

  result="";

  getRole():void {
    $.ajax({
      url:this.APPLICATION_SERVER_URL+'auction/test',
      method:"GET",
      success: (response) => {
        console.log("에이쟉스 결과 : ",response);
        this.result = response;
      }
    })
  }


  APPLICATION_SERVER_URL = 'http://192.168.1.6:5000/';
  sessionId = 'openvidu-custom-ui';
  tokens!: TokenModel;

  constructor(private httpClient: HttpClient) { }

  async ngOnInit() {
    this.tokens = {
      webcam: await this.getToken(),
      screen: await this.getToken(),
    };
    this.getRole();
  }

  /**
   * --------------------------------------------
   * GETTING A TOKEN FROM YOUR APPLICATION SERVER
   * --------------------------------------------
   * The methods below request the creation of a Session and a Token to
   * your application server. This keeps your OpenVidu deployment secure.
   * 
   * In this sample code, there is no user control at all. Anybody could
   * access your application server endpoints! In a real production
   * environment, your application server must identify the user to allow
   * access to the endpoints.
   * 
   * Visit https://docs.openvidu.io/en/stable/application-server to learn
   * more about the integration of OpenVidu in your application server.
   */

  async getToken(): Promise<string> {
    const sessionId = await this.createSession(this.sessionId);
    return await this.createToken(sessionId);
  }


  createSession(sessionId: string): Promise<string> {
    return lastValueFrom(this.httpClient.post(
      this.APPLICATION_SERVER_URL + 'api/sessions',
      { customSessionId: sessionId },
      { headers: { 'Content-Type': 'application/json' }, responseType: 'text' }
    ));
  }

  createToken(sessionId: string): Promise<string> {
    return lastValueFrom(this.httpClient.post(
      this.APPLICATION_SERVER_URL + 'api/sessions/' + sessionId + '/connections',
      {},
      { headers: { 'Content-Type': 'application/json' }, responseType: 'text' }
    ));
  }
}