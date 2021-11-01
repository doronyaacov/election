import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'vote-page',
  templateUrl: './vote-page.component.html',
  styleUrls: ['./vote-page.component.css']
})
export class VotePageComponent implements OnInit {
  
  isAboutOn: boolean = false;
  likudAbout: boolean = false;
  yeshatidAbout: boolean = false;
  zionutdatitAbout: boolean = false;
  userSelection = "";
  IsSelected:boolean = false;

  userName = "aaa";

  voter;

  constructor(private http:HttpClient) { }

  TakeChoise(name:string)
  {
    this.userSelection = name;
    this.IsSelected = true;
  }

  Abort()
  {
    this.IsSelected = false;
    this.userSelection = "";
  }
  Confirm()
  {

  }


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
