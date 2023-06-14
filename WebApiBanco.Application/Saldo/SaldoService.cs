using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebApiBanco.Repository;

namespace WebApiBanco.Application.Saldo
{
    public class SaldoService
    {
        private readonly BD_BANCOContext _context;

        public SaldoService(BD_BANCOContext context)
        {
            _context = context;
        }
        public SaldoResponse PegarSaldoConta(int id)
        {

            var saldoDb = _context.Saldos.FirstOrDefault(x => x.Id == id);

            var saldo = new SaldoResponse()
            {
                Id = saldoDb.Id,
                Saldo = saldoDb.saldo,
                ContaCorrente = saldoDb.contaCorrente,
            };

            return saldo;
        }
    }
}
