import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { VotePageComponent } from './vote-page/vote-page.component';
import { LoginComponent } from './login/login.component';
import { VotersComponent } from './voters/voters.component';
import { PartyListComponent } from './party-list/party-list.component';
import { SystemReportComponent } from './system-report/system-report.component';

@NgModule({
  declarations: [
    AppComponent,
    VotePageComponent,
    LoginComponent,
    VotersComponent,
    PartyListComponent,
    SystemReportComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
