import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  votersListClicked:boolean = false;
  partyListClicked:boolean = false;
  loginClicked:boolean = false;
  reportClicked:boolean = false;

// פונקציות להצגת מסך שהשתמש בחר
  VotersListOn()
  {
    this.votersListClicked = true;
    this.loginClicked = false;
    this.partyListClicked = false;
    this.reportClicked = false;
  }

  PartysListOn()
  {
    this.partyListClicked = true;
    this.votersListClicked = false;
    this.loginClicked = false;
    this.reportClicked = false;
  }

  LoginOn()
  {
    this.loginClicked = true;
    this.partyListClicked = false;
    this.votersListClicked = false;
    this.reportClicked = false;
    
  }

  ReportsOn()
  {
    this.reportClicked = true;
    this.loginClicked = false;
    this.partyListClicked = false;
    this.votersListClicked = false;
  }



  isAboutOn: boolean = false;
  likudAbout: boolean = false;
  yeshatidAbout: boolean = false;
  zionutdatitAbout: boolean = false;

  // פונקציות להפעלת תקציר מפלגה
  likudAboutClicked()
  {
    this.isAboutOn = true;
    this.likudAbout = true;
    this.yeshatidAbout = false;
    this.zionutdatitAbout = false;
  }
  yeshatidAboutClicked()
  {
    this.isAboutOn = true;
    this.yeshatidAbout = true;
    this.likudAbout = false;
    this.zionutdatitAbout = false;
  }
  zionutdatitAboutClicked()
  {
    this.isAboutOn = true;
    this.zionutdatitAbout = true;
    this.likudAbout = false;
    this.yeshatidAbout = false;
  }

// פונקציית סגירת תקציר
  closeAbout()
  {
    this.isAboutOn = false;
    this.zionutdatitAbout = false;
    this.likudAbout = false;
    this.yeshatidAbout = false;
  }
}
