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
    private Util util;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Redirect("Autor.aspx");
        mBaseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

        if (!string.IsNullOrEmpty(mBaseUrl))
        {
            //this.Master.getHiperLinkControl.NavigateUrl = mBaseUrl;
        }

        using (var entidade = new BibliotecaEntity())
        {
            var emprestados = from l in entidade.ViewUtilizadoresReqLivro
                              select l;
            GridView1.DataSource = emprestados.ToList();

            GridView1.DataBind();
        }

        this.util = new Util(Response, Server);
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
                util.CriarCSVAutor();
                break;
            case "livro":
                util.CriarCSVLivro();
                break;
            case "editora":
                util.CriarCSVEditora();
                break;
            case "categoria":
                this.util.CriarCSVCategorias();
                break;
            case "utilizador":
                util.CriarCSVUtilizador();
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
        string[] resultado = m.Split(delimitador);
        return resultado[0] + "-" + resultado[1] + "-" + resultado[2];
    }

    protected void btnGenerateXML_Click(object sender, EventArgs e)
    {

        util.criarXMLLivrosEmprestados(downloadLink);
    }
}
