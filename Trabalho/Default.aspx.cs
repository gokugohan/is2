using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Caching;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : BasePage
{
    private IQueryable<View_Livro> livros;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            bindLivro("");
        }
    }

    private void bindLivro(string txtSearch)
    {
        try
        {
            using (var entidade = new BibliotecaEntity())
            {

                if (string.IsNullOrEmpty(txtSearch))
                {

                    livros = from l in entidade.View_Livro
                             select l;
                }
                else
                {
                    livros = from l in entidade.View_Livro
                             where l.Titulo.ToLower().Contains(txtSearch.ToLower())
                             select l;

                }

                GridView1.DataSource = livros.ToList();
                GridView1.DataBind();
            }
        }
        catch(Exception e)
        {
            Response.Redirect("./",true);
        }

        
        
    }


    private void showUserInfo()
    {
        StringBuilder sb = new StringBuilder("");

        MembershipUser user = Membership.GetUser();

        if (user != null & User.Identity.IsAuthenticated)
        {

            sb.Append("<h2>Bem vindo ");

            if (User.Identity.Name == user.UserName)
            {
                sb.Append(" ").Append(user.UserName).Append("</h2>");
                ProfileCommon profile = Profile.GetProfile(User.Identity.Name);

                sb.Append("<br/>Nome: ").Append(profile.Nome);
                sb.Append("<br/>Apelido: ").Append(profile.Apelido);
                sb.Append("<br/>Numero contato: ").Append(profile.NumeroContato);
                sb.Append("<br/>Email: ").Append(user.Email);
                sb.Append("<br/>Rua: ").Append(profile.Endereco.Rua);
                sb.Append("<br/>Código postal: ").Append(profile.Endereco.CodigoPostal);
                sb.Append("<br/>Cidade: ").Append(profile.Endereco.Cidade);
                sb.Append("<br/>País: ").Append(profile.Endereco.Pais);

            }
        }
        else
        {
            sb.Append("Utilizador não logado!");
        }


    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bindLivro("");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string txtSearch = tbSearch.Text.Trim();
        bindLivro(txtSearch);
        tbSearch.Text = "";
        if (ViewState["contador"] == null)
        {
            ViewState["contador"] = 1;
            lblSearchCounter.Text = "Pesquisou: "+1+" vez";
        }
        else
        {
            int contador = (int)ViewState["contador"];
            contador += 1;
            ViewState["contador"] = contador;
            lblSearchCounter.Text = "Pesquisou: " + contador+" vezes";
        }
    }
  
}