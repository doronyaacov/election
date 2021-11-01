import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'party-list',
  templateUrl: './party-list.component.html',
  styleUrls: ['./party-list.component.css']
})
export class PartyListComponent implements OnInit {

  isAboutOn: boolean = false;
  likudAbout: boolean = false;
  yeshatidAbout: boolean = false;
  zionutdatitAbout: boolean = false;
  // userSelection = "";
  // IsSelected:boolean = false;

  constructor() { }

  // TakeChoise(name:string)
  // {
  //   this.userSelection = name;
  //   this.IsSelected = true;
  // }

  // Abort()
  // {
  //   this.IsSelected = false;
  //   this.userSelection = "";
  // }
  // Confirm()
  // {

  // }

// פונקציות הפעלת תקציר
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

  ngOnInit(): void {
  }

}
