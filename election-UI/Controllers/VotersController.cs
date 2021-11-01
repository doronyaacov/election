using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using election_DLL;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace election_UI.Controllers
{
    [Route("voters")]
    [ApiController]
    public class VotersController : ControllerBase
    {
        // GET: מחזירה את כל הרשאים לבחירה
        [HttpGet]
        public IEnumerable<Voter> Get()
        {
            return new dbManager().GetAllVoters();
        }

        // GET מחזירב בוחר לפי תעודת זהות ותאריך הנפקה
        [HttpGet("{id}/{idDate}")]
        public IActionResult Get(string id, string idDate)
        {
            Voter v = new dbManager().FindVoter(id, idDate);
            if(v != null)
            {
                return Ok(v);
            }
            return NotFound();
        }


        // GET מחזירה בוחר לפי תעודת זהות
        [HttpGet("getVoter/{id}")]
        public IActionResult GetVoter(string id)
        {
            Voter v = new dbManager().GetVoter(id);
            if (v != null)
            {
                return Ok(v);
            }
            return NotFound();
        }



        // GET מכניסה את הבחירה של הבוחר 
        [HttpGet("voteConfirmed/{id}/{idDate}/{voteFor}")]
        public IActionResult Get1(string id, string idDate, string voteFor)
        {
            Voter v = new dbManager().PlaceVote(id, idDate, voteFor);
            if (v != null)
            {
                return Ok(v);
            }
            return NotFound();
        }


        //// POST api/<VotersController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<VotersController>/5
        //[HttpPut]
        //public void Put(string id)
        //{
            
        //}

        //// DELETE api/<VotersController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
