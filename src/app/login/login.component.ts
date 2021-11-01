import { HttpClient } from '@angular/common/http';
import { Component, Input, OnInit, Output, ɵɵqueryRefresh } from '@angular/core';

@Component({
  selector: 'login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  voterIn: boolean = false;
  votingEnd: boolean = false;

  voter;
  voterName = "";


  constructor(private http:HttpClient) { }


  // פונקציה שמחפשת משתמש שמנסה להתחבר למערכת
  // במידה ומצאה מכניסה את הפרטים שלו למשתנה ובודקת אם רשאי להצביע
  FindVoter(id:string, idDate:string)
  {
    this.http.get("http://localhost:35420/voters/"+id+"/"+idDate).subscribe(x=>
    {
      this.voter = x;
      if(this.voter.isVoted == "no")
      {
      this.voterName = this.voter.fullName;
      alert(this.voterName + ", התחברות אושרה")
      this.voterIn = true;
      }
      else
      {
        alert(this.voterName + ",  אין אפשרות להצביע יותר מפעם אחת")
      }
    }, g => alert("פרטים לא נכונים, נסה שוב"));
  }


  isAboutOn: boolean = false;
  likudAbout: boolean = false;
  yeshatidAbout: boolean = false;
  zionutdatitAbout: boolean = false;
  userSelection = "";
  IsSelected:boolean = false;


// פונקציות בחירת מפלגה
      VoteYeshAtid()
      {
        this.userSelection = "יש עתיד";
        this.voter.votedFor = "yeshAtid";
        this.IsSelected = true;
      }

      VoteLikud()
      {
        this.userSelection = "הליכוד";
        this.voter.votedFor = "Likud";
        this.IsSelected = true;
      }

      VoteZionutDatit()
      {
        this.userSelection = "הציונות הדתית";
        this.voter.votedFor = "ZionutDatit";
        this.IsSelected = true;
      }


// פונקציית ביטול בחירה
  Abort()
  {
    this.IsSelected = false;
    this.userSelection = "";   
  }

  // פונקציית אישור בחירה
  Confirm()
  {
    this.http.get("http://localhost:35420/voters/voteConfirmed/"+this.voter.id+"/"+this.voter.idDate+
    "/"+this.voter.votedFor).subscribe(x => 
      {
        alert("!תודה שבחרת");
        this.voterIn = false;
        this.votingEnd = true;
      }
      ,g => alert("Error")
      );
  }


  // פונקציות פתיחת מידע על מפלגה
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
