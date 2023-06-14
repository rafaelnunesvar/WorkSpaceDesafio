using System;
using System.Collections.Generic;
using System.Text;

namespace WebApiBanco.Repository.Models
{
    public class Tab_pessoa
    {
        public int Id { get; set; }

        public string Nome { get; set; }

        public string Sobrenome { get; set; }

        public int contaCorrente { get; set; }
    }
}
