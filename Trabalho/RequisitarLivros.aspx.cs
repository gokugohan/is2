using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class RequisitarLivros : BasePage
{
    private const double DURACAO = 5;
    private bool requisitarOk = false;
    private Label lblFalta;
    
    public int Codigo { get; set; }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ProfileCommon profile = Profile.GetProfile(User.Identity.Name);

            if (Page.RouteData.Values["codigo"] != null && isUserPerfilCompleto(profile))
            {
                Codigo = Convert.ToInt32(Page.RouteData.Values["codigo"] as string);
                Label lblMensagem = (Label)_("lblMensagem");
                lblMensagem.Text = "<h1>Código: " + Page.RouteData.Values["codigo"] + "</h1>";
                mostrarInfoDoLivroARequisitar();
            }
            else if(!isUserPerfilCompleto(profile)){
                PanelLivroByCodigo.Visible = false;
                Label1.Text = "Completar o <a href='./Perfil'>perfil</a> para requisitar o livro...";
            }else
            {
                Panel p = _("PanelTabelaDetailLivro") as Panel;
                p.Visible = false;
                
                teste();
                //Response.Redirect("./", true);
            }
            

        }
        catch (Exception fe)
        {
            
            //Response.Redirect("./",true);
            //Response.Write(fe.Message);
        }
    }
    
    public bool isUserPerfilCompleto(ProfileCommon profile)
    {
        bool retorno = profile.Nome != string.Empty && profile.Apelido != string.Empty
            && profile.NumeroContato != string.Empty;
        return retorno;
    }

    private void mostrarInfoDoLivroARequisitar()
    {
        using (var entidade = new BibliotecaEntity())
        {
            var lv = (from l in entidade.View_Livro
                      where l.Código.Equals(Codigo)
                      select l).ToList();
            View_Livro mViewLivro = null;
            foreach (var l in lv)
            {
                mViewLivro = l;
                break;
            }

            Label lblCodigo = (Label)_("lblCodigo");
            Label lblISBN = (Label)_("lblISBN");
            Label lblTitulo = (Label)_("lblTitulo");
            Label lblDataPub = (Label)_("lblDataPub");
            Label lblCategoria = (Label)_("lblCategoria");
            Label lblEditora = (Label)_("lblEditora");
            Label lblAutor = (Label)_("lblAutor");

            if (mViewLivro != null)
            {
                lblCodigo.Text = mViewLivro.Código + "";
                lblISBN.Text = mViewLivro.ISBN;
                lblTitulo.Text = mViewLivro.Titulo;
                lblDataPub.Text = (Convert.ToDateTime(mViewLivro.Data_publicação)).ToShortDateString();
                lblCategoria.Text = mViewLivro.Nome_Categoria;
                lblEditora.Text = mViewLivro.Editora;
                lblAutor.Text = mViewLivro.Autor;
                requisitarOk = true;
            }


        }
    }

    private Control _(string name){
        return this.LoginView1.FindControl(name);
    }

    protected void requisitarLivro(int qualLivro)
    {

        using (var entidade = new BibliotecaEntity())
        {

            Table_UtilizadorLivro ul = new Table_UtilizadorLivro();

            var idDoLivro = (from l in entidade.Livros
                             where l.ID_Livro == qualLivro
                             select l.ID_Livro).Single<Int32>();

            var idDoUtilizador = (from u in entidade.Utilizadores
                                  where u.NomeUtilizador == User.Identity.Name
                                  select u.ID_Utilizador).Single<Int32>();

            if (idDoLivro < 0 || idDoUtilizador < 0)
            {
                ul.ID_Utilizador = idDoUtilizador;
                ul.ID_Livro = idDoLivro;
                ul.dataEmprestimo = DateTime.Now;
                ul.dateDevolucao = DateTime.Now.AddDays(DURACAO);

                entidade.UtilizadoresLivros.Add(ul);
                entidade.SaveChanges();
            }
        }
    }

    protected void btnConfirmar_Click(object sender, EventArgs e)
    {
        if (requisitarOk)
        {
            requisitarLivro(Codigo);
            Panel PanelTabelaDetailLivro = (Panel)_("PanelTabelaDetailLivro");
            PanelTabelaDetailLivro.Visible = false;

            Panel PanelMensagem = (Panel)_("PanelMensagem");
            Label lblMensagem = (Label)_("lblMensagem");
            lblMensagem.Text = "<em><h2>Efetuou com sucesso</h3></em>" + User.Identity.Name;
        }
    }

    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if ((e.Row.RowType == DataControlRowType.DataRow))
        {
            lblFalta = (Label)e.Row.FindControl("lblFalta");
            lblFalta.Text = "Control found!";
            //TimeSpan span = (dataDevolucao - DateTime.Now);
            //string msg = "<br/>" + (span.Days < 0 ? "Penalização na devolução do livro" + span.Days : "<br/>Diff(now-datadev): " + span.Days);
            //lblFalta.Text = (span.Days < 0 ? "Devoluçaõ atrasado" + span.Days : "<br/>Diff(now-datadev): " + span.Days);
            //Label1.Text += msg;
        }
    }
    protected void teste()
    {
        
        using (var entidade = new BibliotecaEntity())
        {
            var livrosRequisitados = from lr in entidade.ViewUtilizadoresReqLivro
                                     where lr.IDLogin.Equals(User.Identity.Name)
                                     select lr;
            if (livrosRequisitados.Count() == 0) {
                redirPagina();
            }
            ((GridView)_("GridView2")).DataSource = livrosRequisitados.ToList();
            ((GridView)_("GridView2")).DataBind();
        }
    }

    private void redirPagina()
    {
        HtmlMeta meta = new HtmlMeta();
        meta.HttpEquiv = "Refresh";
        meta.Content = "5;url=./";
        this.Page.Controls.Add(meta);
        Label lblTituloPanel = _("lblTituloPanel") as Label;
        lblTituloPanel.Text = "Ainda não requisitou nenhum livro. ";
        lblTituloPanel.Text += "Volta para página inicial para requisitar livro";
        lblTituloPanel.CssClass = "alert alert-danger";
    }
}