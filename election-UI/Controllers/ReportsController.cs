using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using election_DLL;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace election_UI.Controllers
{
    [Route("reports")]
    [ApiController]
    public class ReportsController : ControllerBase
    {
        // GET: מחזירה את כל המפלגות
        [HttpGet("parties")]
        public IEnumerable<Party> Get()
        {
            return new dbManager().GetAllParties();
        }

        // GET מחזירה מצביעים מעיר
        [HttpGet("getVoteByCity/{city}")]
        public IActionResult GetCityVote(string city)
        {
            object votes = new dbManager().GetVotesByCity(city);
            if(votes != null)
            {
                return Ok(votes);
            }
            return NotFound();
        }

        // GET מחזירה בוחרים שהצביעו למפלגה
        [HttpGet("getVoteByParty/{party}")]
        public IActionResult GetPartyVote(string party)
        {
            object votes = new dbManager().GetVotesByParty(party);
            if (votes != null)
            {
                return Ok(votes);
            }
            return NotFound();
        }


        //// GET: api/<ReportsController>
        //[HttpGet("voted")]
        //public int Getvoted()
        //{
        //    return new dbManager().voted;
        //}

        //// GET api/<ReportsController>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
        //    return "value";
        //}


        //// POST api/<ReportsController>
        //[HttpPost]
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<ReportsController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<ReportsController>/5
        //[HttpDelete("{id}")]
        //public void Delete(int id)
        //{
        //}
    }
}
