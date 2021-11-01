import { HttpClient, HttpEvent } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'system-report',
  templateUrl: './system-report.component.html',
  styleUrls: ['./system-report.component.css']
})
export class SystemReportComponent implements OnInit {

  // משתנים שמקבלים מבסיס הנתונים מפלגות ובוחרים
  arrParties;
  arrAllVoters;

  // משתנים שיקבלו ערכים מפונקציות החיפוש
  rsltById;
  rsltByCity;
  rsltByParty;

  constructor(private http:HttpClient)
  {
    this.GetAllParties();
    this.GetAllVoters();
  }

  // פונקציה שמחזירה בוחר לפי מספר תעודת זהות
  GetVoter(id1:string)
  {
    this.http.get("http://localhost:35420/voters/getVoter/"+id1).subscribe(voter =>
    {
      this.rsltById = voter;
      this.rsltByParty = null;
      this.rsltByCity = null;
    }
    ,g => alert("לא קיים/לא הצביע. נסה שוב")
    );
  }

    // פונקציה שמחזירה בוחרים לפי עיר
  GetCityVoters(city1:string)
  {
    this.http.get("http://localhost:35420/reports/getVoteByCity/"+city1).subscribe(voters =>
    {
      this.rsltByCity = voters;
      this.rsltById = null;
      this.rsltByParty = null;
    } 
    );
  }

    // פונקציה שמחזירה בוחרים לפי בחירת מפלגה
  GetPartyVoters(party1:string)
  {
    this.http.get("http://localhost:35420/reports/getVoteByParty/"+party1).subscribe(voters =>
    {
      this.rsltByParty = voters;
      this.rsltById = null;
      this.rsltByCity = null;
    } 
    );
  }

  

    // פונקציה שמחזירה רשימת מפלגות
  GetAllParties()
  {
    this.http.get("http://localhost:35420/reports/parties").subscribe(x => this.arrParties = x);

  }

   // פונקציה שמחזירה רשימת בוחרים
  GetAllVoters()
  {
    this.http.get("http://localhost:35420/voters").subscribe(voters => this.arrAllVoters = voters);
  }


  ngOnInit(): void {
  }

}
