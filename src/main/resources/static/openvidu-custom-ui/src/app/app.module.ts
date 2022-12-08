import { NgModule, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import {MatIconModule} from '@angular/material/icon';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppComponent } from './app.component';

import { OpenViduAngularConfig, OpenViduAngularModule, ParticipantAbstractModel, ParticipantModel, ParticipantNameDirective } from 'openvidu-angular';
import { environment } from 'src/environments/environment';

const config: OpenViduAngularConfig = {
    production: environment.production
};

@NgModule({
  declarations: [
    AppComponent
  ],
  schemas: [
    CUSTOM_ELEMENTS_SCHEMA
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    OpenViduAngularModule.forRoot(config),
    MatIconModule
  ],
  providers: [ParticipantModel], //변경
  bootstrap: [AppComponent]
})
export class AppModule { }