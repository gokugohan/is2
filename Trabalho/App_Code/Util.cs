using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LivroEmprestado
/// </summary>
public class Util
{

    public static List<view_utilizador_req_livro> getLivrosEmprestadosPelosUtilizadores()
    {
        using (var entidade = new BibliotecaEntity())
        {
            var livroReqUtil = from lr in entidade.ViewUtilizadoresReqLivro
                               select lr;

            return livroReqUtil.ToList();
        }
    }
    
}