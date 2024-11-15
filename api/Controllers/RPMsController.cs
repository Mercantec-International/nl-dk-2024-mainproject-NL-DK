using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using api.Models;

namespace api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RPMsController : ControllerBase
    {
        private readonly AppDBContext _context;

        public RPMsController(AppDBContext context)
        {
            _context = context;
        }

        // GET: api/RPMs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RPM>>> GetRPMs()
        {
            return await _context.RPMs.ToListAsync();
        }

        // GET: api/RPMs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RPM>> GetRPM(string id)
        {
            var rPM = await _context.RPMs.FindAsync(id);

            if (rPM == null)
            {
                return NotFound();
            }

            return rPM;
        }

        // PUT: api/RPMs/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRPM(string id, RPM rPM)
        {
            if (id != rPM.Id)
            {
                return BadRequest();
            }

            _context.Entry(rPM).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RPMExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/RPMs
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<RPM>> PostRPM(RPM rPM)
        {
            _context.RPMs.Add(rPM);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (RPMExists(rPM.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetRPM", new { id = rPM.Id }, rPM);
        }

        // DELETE: api/RPMs/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRPM(string id)
        {
            var rPM = await _context.RPMs.FindAsync(id);
            if (rPM == null)
            {
                return NotFound();
            }

            _context.RPMs.Remove(rPM);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool RPMExists(string id)
        {
            return _context.RPMs.Any(e => e.Id == id);
        }
    }
}
