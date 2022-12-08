import { Component, OnInit } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { trigger, transition, style, animate } from "@angular/animations";
import { lastValueFrom } from "rxjs";



import { TokenModel, Signal, PanelService, PanelType, ParticipantService, OpenViduService, ParticipantProperties, ParticipantAbstractModel, ParticipantModel } from "openvidu-angular";
import { Session, SignalOptions } from "openvidu-browser";
import * as $ from "jquery";
import {MatIconModule} from '@angular/material/icon';




enum SignalApp {
   HAND_TOGGLE = 'handToggle'
}
// console.log("분기처리 하고 스크립트 : ",script);


//<div *ngIf="result == 'good'"><ov-videoconference [tokens]="tokens"></ov-videoconference></div>
@Component({
  selector: 'app-root',
  template: `<ov-videoconference [tokens]="tokens" [toolbarDisplaySessionName]="false" [participantName]="b">
    
  <div *ovToolbarAdditionalPanelButtons style="text-align: center;">
  <button mat-icon-button (click)="toggleMyPanel('my-panel')">
    <mat-icon>360</mat-icon>
  </button>
  <button mat-icon-button (click)="toggleMyPanel('my-panel2')">
    <mat-icon>star</mat-icon>
  </button>
</div>
<div *ovAdditionalPanels id="my-panels">
  <div id="my-panel1" *ngIf="showExternalPanel">
    <h2>NEW PANEL</h2>
    <p>This is my new additional panel</p>
  </div>
  <div id="my-panel2" *ngIf="showExternalPanel2">
    <h2>NEW PANEL 2</h2>
    <button onclick="test()">입찰</button>
  </div>
</div>
            </ov-videoconference>`,
  styles: [`#my-panels {
    height: 100%;
    overflow: hidden;
  }
  #my-panel1,
  #my-panel2 {
    text-align: center;
    height: calc(100% - 40px);
    margin: 20px;
  }
  #my-panel1 {
    background: #c9ffb2;
  }
  #my-panel2 {
    background: #ddf2ff;
  }`],
  animations: [
      trigger('inOutHandAnimation', [
         transition(':enter', [
            style({ opacity: 0, transform: 'translateY(-100%)' }),
            animate('300ms ease-in-out', style({ opacity: 1, transform: 'translateY(0)' }))
         ]),
         transition(':leave', [
            style({ opacity: 1, transform: 'translateY(0)' }),
            animate('300ms ease-in-out', style({ opacity: 0, transform: 'translateY(-100%)' }))
         ])
      ])
   ]
})



export class AppComponent implements OnInit {

  
  b = "최근호";
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

  APPLICATION_SERVER_URL = 'http://localhost:5000/';
  sessionId = 'openvidu-custom-ui';
  tokens!: TokenModel;
  test!: ParticipantProperties;
  test2!: ParticipantModel;
  session!: Session;
  messages: string[] = [];
  showExternalPanel: boolean = false;
   showExternalPanel2: boolean = false;
  
  constructor(private httpClient: HttpClient, private panelService: PanelService, private openviduService: OpenViduService, private participantService: ParticipantService) { 
  

  }
  async ngOnInit() {
    
    this.subscribeToPanelToggling();
    this.tokens = {
      webcam: await this.getToken(),
      screen: await this.getToken(),
    };
    this.getUserName();
    this.getRole();
    this.test = {
      nickname: "최근호",
      local: true
    };
    
    console.log(this.test.nickname);
    
    
  }

 

  getUserName(){
    $("#mat-input-0").attr("ng-reflect-model", "abcdd");
    let a = document.getElementById("mat-input-0");
    
    console.log();
    console.log("abc");
    
  }

  onButtonClicked() {
    alert('button clicked');
    let panel = document.getElementById("my-panels");
    let btn_1=document.createElement("button");
    btn_1.innerHTML="테스트";
    panel?.appendChild(btn_1);
    this.panelService.togglePanel("my-panels");
    console.log(this.participantService.getMyNickname());
  }

  onSessionCreated(session: Session) {
      this.session = session;
      this.session.on(`signal:${Signal.CHAT}`, (event: any) => {
         const msg = JSON.parse(event.data).message;
         this.messages.push(msg);
      });
   }

   send(message: string): void {
      const signalOptions: SignalOptions = {
         data: JSON.stringify({ message }),
         type: Signal.CHAT,
         to: undefined,
      };
      this.session.signal(signalOptions);
      
   }

  subscribeToPanelToggling() {
      this.panelService.panelOpenedObs.subscribe(
         (ev: { opened: boolean; type?: PanelType | string }) => {
            this.showExternalPanel = ev.opened && ev.type === "my-panel";
            this.showExternalPanel2 = ev.opened && ev.type === "my-panel2";
         }
      );
   }

   toggleMyPanel(type: string) {
      this.panelService.togglePanel(type);
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


  toggleAudio(){
    let a = window.confirm();
    if(a){
      console.log("sdfffffffffffffffffffffffff");
    }
  }

  toggleVideo(){
    alert("abc");
    
  }

}