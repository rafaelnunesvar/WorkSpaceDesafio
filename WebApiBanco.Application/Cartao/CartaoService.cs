using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WebApiBanco.Application.Saldo;
using WebApiBanco.Repository;

namespace WebApiBanco.Application.Cartao
{
    public class CartaoService
    {
        private readonly BD_BANCOContext _context;

        public CartaoService(BD_BANCOContext context)
        {
            _context = context;
        }
        public bool AtualizarDadosCartao(int id, CartaoRequest request)
        {
            try 
            {
                var cartaoDb = _context.Cartao.FirstOrDefault(x => x.Id == id);
                if (cartaoDb == null)
                    return false;

                cartaoDb.Numero_Car = request.Numero_Car;
                cartaoDb.Data_vali = request.Data_vali;
                cartaoDb.CVV = request.CVV;

                _context.Cartao.Update(cartaoDb);
                _context.SaveChanges();
                  
                return true;

            } catch (Exception ex) 
            { 
                return false;
            }
        }

        public bool RemoverCartao(int id)
        {
            try 
            {
                var cartaoDb = _context.Cartao.FirstOrDefault(x => x.Id == id);
                if (cartaoDb == null)
                    return false;

                _context.Cartao.Remove(cartaoDb);
                _context.SaveChanges();

                return true;
            } 
            catch (Exception ex) 
            {
                return false;
            }
          

        }

        public List<CartoesListResponse> obterListaCartoes()
        {
            var cartaoDb = _context.Cartao.ToList();
            var listCar = new List<CartoesListResponse>();

            foreach (var item in cartaoDb)
            {
                listCar.Add(new CartoesListResponse()
                {
                    Id = item.Id,
                    Numero_Car = item.Numero_Car,
                    Data_vali = item.Data_vali,
                    CVV = item.CVV,
                    contaCorrente = item.contaCorrente
                });
            }

            return listCar;
        }

    }
}
