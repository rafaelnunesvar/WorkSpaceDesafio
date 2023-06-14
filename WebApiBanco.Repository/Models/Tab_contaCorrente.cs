using System;
using System.Collections.Generic;
using System.Text;

namespace WebApiBanco.Repository.Models
{
    public class Tab_contaCorrente
    {
        public int Id { get; set; }

        public int Agencia { get; set; }

        public string Conta { get; set; }
    }
}
