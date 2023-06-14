using System;
using System.Collections.Generic;
using System.Text;

namespace WebApiBanco.Application.Cartao
{
    public class CartoesListResponse : CartaoRequest
    {
        public int Id { get; set; }

        public string Numero_Car { get; set; }

        public DateTime Data_vali { get; set; }

        public int CVV { get; set; }

        public int contaCorrente { get; set; }
    }
}
