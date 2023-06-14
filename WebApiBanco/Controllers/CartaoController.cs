using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using WebApiBanco.Application.Cartao;
using WebApiBanco.Repository;

namespace WebApiBanco.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CartaoController : ControllerBase
    {
        private readonly BD_BANCOContext _context;

        public CartaoController(BD_BANCOContext context)
        {
            _context = context;
        }

        [HttpPut]
        [Route("{id}")]
        public IActionResult AtualizarDadosCartao([FromRoute] int id, CartaoRequest request )
        {
            var cartaoService = new CartaoService(_context);
            var sucesso = cartaoService.AtualizarDadosCartao(id, request);

            if(sucesso == true)
            {
               return NoContent();
            } else
            {
                return BadRequest();
            }
        }

        [HttpDelete]
        [Route("{id}")]
        public IActionResult RemoverCartao([FromRoute]int id)
        {
            var cartaoService = new CartaoService(_context);
            var sucesso = cartaoService.RemoverCartao(id);

            if(sucesso == true)
            {
                return NoContent();
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpGet]
        public List<CartoesListResponse> obterListaCartoes()
        {
            var cartaoService = new CartaoService(_context);
            var cartoes = cartaoService.obterListaCartoes();

            return cartoes;
        }
    }
}
