using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Reflection.Emit;
using System.Text;
using WebApiBanco.Repository.Models;

namespace WebApiBanco.Repository
{
    public class BD_BANCOContext : DbContext
    {
        public BD_BANCOContext(DbContextOptions<BD_BANCOContext> options) : base(options) { }

        public DbSet<Tab_saldo> Saldos { get; set; }

        public DbSet<Tab_contaCorrente> ContaCorrente { get; set; }

        public DbSet<Tab_pessoa> Pessoa { get; set; }
        public DbSet<Tab_cartao> Cartao { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Tab_saldo>().ToTable("Tab_saldo");
            modelBuilder.Entity<Tab_contaCorrente>().ToTable("Tab_contaCorrente");
            modelBuilder.Entity<Tab_pessoa>().ToTable("Tab_pessoa");
            modelBuilder.Entity<Tab_cartao>().ToTable("Tab_cartao");
        }
    }
}
