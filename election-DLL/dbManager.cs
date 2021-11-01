using System;
using System.Collections.Generic;
using System.Linq;

namespace election_DLL
{
    public class dbManager
    {
        public int voted = 0;
        public int unVoted = 0;

        public dbManager()
        {
            GetVotedNum();
        }

       // פונקציית רשימת בוחרים
        public List<Voter> GetAllVoters()
        {
            using(ElectionsContext db = new ElectionsContext())
            {
                return db.Voters.ToList();
            }
        }

        // פונקציית חיפוש בוחר לפי תז ותאריך הנפקה
        public Voter FindVoter(string id1, string idDate1)
        {
            using(ElectionsContext db = new ElectionsContext())
            {
                Voter v1 = db.Voters.FirstOrDefault(x => x.Id == id1 && x.IdDate == idDate1);
                if(v1 != null)
                {
                    return v1;
                }
                return null;
            }
        }

        // פונקציית ביצוע הבחירה
        public Voter PlaceVote(string id1, string value, string vote)
        {
            using(ElectionsContext db = new ElectionsContext())
            {
                Voter v1 = db.Voters.FirstOrDefault(x => x.Id == id1);
                if(v1 != null && v1.IsVoted == "no")
                {
                    v1.VotedFor = vote;
                    v1.IsVoted = "yes";
                    Party p1 = db.Partys.FirstOrDefault(x => x.PartyName == vote);
                    if(p1 != null)
                    {
                        p1.Voters++;
                    }
                    db.SaveChanges();
                    return v1;
                }
                return null;
            }
        }


        // פונקציית רשימת המפלגות
        public List<Party> GetAllParties()
        {
            using (ElectionsContext db = new ElectionsContext())
            {
                return db.Partys.ToList();
            }
        }

            
        public void GetVotedNum()
        {
            using(ElectionsContext db = new ElectionsContext())
            {
                foreach (var i in db.Voters)
                {
                    if(i.IsVoted == "yes")
                    {
                        voted++;
                    }
                    unVoted++;
                }
            }
        }


        // פונקציה חיפוש משתמש ומחזירה רק אם הוא הצביע
        public Voter GetVoter(string id1)
        {
            using (ElectionsContext db = new ElectionsContext())
            {
                Voter v1 = db.Voters.FirstOrDefault(x => x.Id == id1 && x.IsVoted == "yes");
                if (v1 != null)
                {
                    return v1;
                }
                return null;
            }
        }

        // מחזירה מצביעים מעיר מסויימת
        public List<object> GetVotesByCity(string city1)
        {
            List<object> cityVotes = new List<object>();
            using (ElectionsContext db = new ElectionsContext())
            {
                foreach (var i in db.Voters)
                {
                    if(i.City == city1)
                    {
                        cityVotes.Add(i);
                    }
                }
                return cityVotes;
            }
        }

        // פונקציה שמחזירה בוחרים שבחרו במפלגה מסויימת
        public List<object> GetVotesByParty(string party1)
        {
            List<object> partyVotes = new List<object>();
            using (ElectionsContext db = new ElectionsContext())
            {
                foreach (var i in db.Voters)
                {
                    if (i.VotedFor == party1)
                    {
                        partyVotes.Add(i);
                    }
                }
                return partyVotes;
            }
        }


    }
}
