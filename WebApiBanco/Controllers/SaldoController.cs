using Microsoft.AspNetCore.Mvc;
using WebApiBanco.Application.Saldo;
using WebApiBanco.Repository;

namespace WebApiBanco.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SaldoController : ControllerBase
    {
        private readonly BD_BANCOContext _context;

        public SaldoController(BD_BANCOContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("{id}")]
        public SaldoResponse PegarSaldoConta([FromRoute]int id)
        {
            var saldoService = new SaldoService(_context);
            var saldo = saldoService.PegarSaldoConta(id);

            return saldo;
        }

        }
    }
