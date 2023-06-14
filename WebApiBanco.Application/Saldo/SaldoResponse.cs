using System;
using System.Collections.Generic;
using System.Text;

namespace WebApiBanco.Application.Saldo
{
    public class SaldoResponse
    {
        public int Id { get; set; }
        public decimal Saldo { get; set; }

        public int ContaCorrente { get; set; }

    }
}
