using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Data.OleDb;


public partial class Administrator_Default : System.Web.UI.Page
{

    private string mBaseUrl;


    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Redirect("Autor.aspx");
        mBaseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

        if (!string.IsNullOrEmpty(mBaseUrl))
        {
            this.Master.getHiperLinkControl.NavigateUrl = mBaseUrl;
        }

        using (var entidade = new BibliotecaEntity())
        {
            var emprestados = from l in entidade.ViewUtilizadoresReqLivro
                              select l;
            GridView1.DataSource = emprestados.ToList();

            GridView1.DataBind();
        }
    }


    protected void btnExportCSV_Click(object sender, EventArgs e)
    {
        PanelExport.Visible = !PanelExport.Visible;
        btnExport.Visible = false;
    }


    private void GenerateCSVFile(string qualTabela)
    {

        string csv = string.Empty;
        switch (qualTabela)
        {
            case "autor":
                using (var entidade = new BibliotecaEntity())
                {
                    var autores = from autor in entidade.Autores
                                  select autor;

                    csv += "Código" + "," + "Nome," + "Apelido" + "\r\n";

                    foreach (var autor in autores)
                    {
                        csv += autor.ID_Autor + "," + autor.Nome + "," + autor.Apelido + "\r\n";
                    }

                    CriarFicheiroCSV(csv, "Autor");
                }

                break;
            case "livro":
                using (var entidade = new BibliotecaEntity())
                {
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
                break;
            case "editora":
                using (var entidade = new BibliotecaEntity())
                {
                    var editoras = from e in entidade.Editoras
                                   select e;
                    csv = "Código,Nome,Descrição\r\n";
                    foreach (var editora in editoras)
                    {
                        csv += editora.ID_Editora + "," + editora.Nome + "," + editora.Descricao + "\r\n";
                    }
                    CriarFicheiroCSV(csv, "Editora");
                }
                break;
            case "categoria":
                using (var entidade = new BibliotecaEntity())
                {
                    var categorias = from c in entidade.Categorias
                                     select c;
                    csv = "Código,categoria\r\n";
                    foreach (var categoria in categorias)
                    {
                        csv += categoria.ID_Categoria + "," + categoria.Nome_Categoria + "\r\n";
                    }
                    CriarFicheiroCSV(csv, "Categoria");
                }
                break;
            case "utilizador":
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
                break;
        }
    }

    protected void btnDownload_Click(object sender, EventArgs e)
    {

        int qualTabela = Convert.ToInt32(ddlCSV.SelectedValue);
        ProcessarCSVData(qualTabela);
    }

    private void ProcessarCSVData(int qualTabela)
    {
        switch (qualTabela)
        {
            case 0:
                GenerateCSVFile("autor");
                break;
            case 1: GenerateCSVFile("livro"); break;
            case 2: GenerateCSVFile("autor"); break;
            case 3: GenerateCSVFile("categoria"); break;
            case 4: GenerateCSVFile("utilizador"); break;
            default: break;
        }
    }

    /// <summary>
    /// Gerar o ficheiro CSV 
    /// </summary>
    /// <param name="conteudo">O conteudo do ficheiro CSV</param>
    /// <param name="nomeDoFicheiro">O nome do ficheiro</param>
    /// <param name="page"></param>
    protected void CriarFicheiroCSV(string conteudo, string nomeDoficheiro)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        Response.ContentType = "text/csv; charset-UTF-8";
        Response.AddHeader("content-disposition", "attachment;filename=" + nomeDoficheiro + ".csv");
        Response.Output.Write(conteudo);
        Response.Flush();
        Response.End();
    }

    protected string getFormat(object data)
    {
        string tmp = data.ToString();
        List<char> t = tmp.ToList();
        string m = "";
        foreach (var s in t)
        {
            if (s == ' ')
            {
                break;
            }

            m += (s == '-' ? "/" : s + "");

        }
        char[] delimitador = { '/' };
        string[] ttt = m.Split(delimitador);
        return ttt[0] + "-" + ttt[1] + "-" + ttt[2];
    }


    protected void btnGenerateXML_Click(object sender, EventArgs e)
    {

        gerarXML();
    }

    private void gerarXML()
    {
        int contador = 1;
        XDeclaration xDeclaration = new XDeclaration("1.0", "utf-8", "yes");
        XDocument xmlDocument = new XDocument(xDeclaration,
            new XComment("Dados do utilizadores que requisitaram o livro"),
            new XElement("requisições",
                
                from l in Util.getLivrosEmprestadosPelosUtilizadores()
                select new XElement("requisão",new XAttribute("contador",contador++),
                    new XElement("Utilizador", new XAttribute("IDLogin", l.IDLogin), l.Nome),
                    new XElement("TituloLivro", l.Titulo),
                    new XElement("AutorDoLivro", l.Autor),
                    new XElement("Editoradolivro", l.Editora),
                    new XElement("DataEmpretimo", l.dataEmprestimo.ToShortDateString()),
                    new XElement("DataDevolucao", l.dateDevolucao.ToShortDateString()))
                ));
        xmlDocument.Save(@Server.MapPath("~/Administrator/empr.xml"));
    }
}
