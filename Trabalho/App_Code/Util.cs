using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Xml.Linq;

/// <summary>
/// Summary description for LivroEmprestado
/// </summary>
public class Util
{
    private HttpResponse response;
    private HttpServerUtility server;
    private static DateTime init;
    private string csv = string.Empty;

    public Util(HttpResponse response,HttpServerUtility server)
    {
        this.response = response;
        this.server = server;
    }

    public static string getDuracao(DateTime init, DateTime atual)
    {
        return "";
    }

    public void RegistoTempoInit(DateTime i)
    {
        init = i;
    }

    public void criarXMLLivrosEmprestados(Control control)
    {
        int contador = 1;
        XDeclaration xDeclaration = new XDeclaration("1.0", "utf-8", "yes");
        XDocument xmlDocument = new XDocument(xDeclaration,
            new XComment("Dados do utilizadores que requisitaram o livro"),
            new XElement("requisições",

                from l in Util.getLivrosEmprestadosPelosUtilizadores()
                select new XElement("requisão", new XAttribute("contador", contador++),
                    new XElement("Utilizador", new XAttribute("IDLogin", l.IDLogin), l.Nome),
                    new XElement("Título_do_livro", l.Titulo),
                    new XElement("Autor_do_Livro", l.Autor),
                    new XElement("Editora_do_livro", l.Editora),
                    new XElement("Data_de_empréstimo", l.dataEmprestimo.ToShortDateString()),
                    new XElement("Data_de_devolução", l.dateDevolucao.ToShortDateString()))
                ));
        xmlDocument.Save(@server.MapPath("~/Administrator/empr.xml"));
        control.Visible = true;
    }

    public static List<view_utilizador_req_livro> getLivrosEmprestadosPelosUtilizadores()
    {
        using (var entidade = new BibliotecaEntity())
        {
            var livroReqUtil = from lr in entidade.ViewUtilizadoresReqLivro
                               select lr;

            return livroReqUtil.ToList();
        }
    }

    public void CriarCSVCategorias()
    {
        
        using (var entidade = new BibliotecaEntity())
        {
            csv = string.Empty;
            var categorias = from c in entidade.Categorias select c;
            csv = "Código,categoria\r\n";
            foreach (var categoria in categorias)
            {
                csv += categoria.ID_Categoria + "," + categoria.Nome_Categoria + "\r\n";
            }
           CriarFicheiroCSV(csv, "Categoria");
            
        }
    }

    public void CriarCSVAutor()
    {
        using (var entidade = new BibliotecaEntity())
        {
            csv = string.Empty;
            var autores = from autor in entidade.Autores
                          select autor;

            csv += "Código" + "," + "Nome," + "Apelido" + "\r\n";

            foreach (var autor in autores)
            {
                csv += autor.ID_Autor + "," + autor.Nome + "," + autor.Apelido + "\r\n";
            }

            CriarFicheiroCSV(csv, "Autor");
        }
    }

    public void CriarCSVLivro()
    {
        using (var entidade = new BibliotecaEntity())
        {
            csv = string.Empty;
            var livros = from l in entidade.View_Livro
                         select l;
            csv += "Código,ISBN,Título,Data publicação,Categoria,Editora,Autor\r\n";
            foreach (var livro in livros)
            {
                csv += livro.Código + "," + livro.ISBN + "," + livro.Titulo + "," + livro.Data_publicação + ","
                    + livro.Nome_Categoria + "," + livro.Editora + "," + livro.Autor + "\r\n";
            }
            CriarFicheiroCSV(csv, "Livro");
        }
    }

    public void CriarCSVEditora()
    {
        using (var entidade = new BibliotecaEntity())
        {
            csv = string.Empty;
            var editoras = from e in entidade.Editoras
                           select e;
            csv = "Código,Nome,Descrição\r\n";
            foreach (var editora in editoras)
            {
                csv += editora.ID_Editora + "," + editora.Nome + "," + editora.Descricao + "\r\n";
            }
            CriarFicheiroCSV(csv, "Editora");
        }
    }

    public void CriarCSVUtilizador()
    {
        using (var entidade = new BibliotecaEntity())
        {
            var utilizadores = from u in entidade.Utilizadores
                               select u;

            csv = "Código,Nome,Apelido,Número contato, E-mail,Endereço\r\n";
            foreach (var utilizador in utilizadores)
            {
                csv += utilizador.ID_Utilizador + "," + utilizador.Nome + "," + utilizador.Apelido + ","
                    + utilizador.NumeroContato + "," + utilizador.Email + "," + utilizador.EnderecoMorada + "\r\n";
            }
            CriarFicheiroCSV(csv, "Utilizador");
        }
    }

    /// <summary>
    /// Gerar o ficheiro CSV 
    /// </summary>
    /// <param name="conteudo">O conteudo do ficheiro CSV</param>
    /// <param name="nomeDoFicheiro">O nome do ficheiro</param>
    /// <param name="page"></param>
    private void CriarFicheiroCSV(string conteudo, string nomeDoficheiro)
    {
        response.Clear();
        response.Buffer = true;
        response.Charset = "";
        response.ContentType = "text/csv; charset-UTF-8";
        response.AddHeader("content-disposition", "attachment;filename=" + nomeDoficheiro + ".csv");
        response.Output.Write(conteudo);
        response.Flush();
        response.End();
    }
}