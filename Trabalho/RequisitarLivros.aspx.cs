using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequisitarLivros : BasePage
{
    private NameValueCollection mQueryString;
    private const double DURACAO = 5;
    private bool requisitarOk = false;
    public int valor { get; set; }
    public string chave { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        mQueryString = Request.QueryString;
        try
        {
            if (mQueryString.GetKey(0).Equals("codigo"))
            {
                if (Convert.ToInt32(mQueryString.Get(0)) >= 0 && Convert.ToInt32(mQueryString.Get(0)) < 100000)
                {
                    requisitarOk = true;
                    valor = Convert.ToInt32(mQueryString.Get(0));
                    chave = mQueryString.GetKey(0);
                    
                    mostrarInfoDoLivroARequisitar();
                }
                else
                {
                    Response.Redirect("./",true);
                }
            }
            else
            {
                Response.Redirect("./",true);
            }

        }
        catch (Exception fe)
        {
            
            Response.Redirect("./",true);
        }
        
        
        
    }

    private void mostrarInfoDoLivroARequisitar()
    {
        using (var entidade = new BibliotecaEntity())
        {
            var lv = (from l in entidade.View_Livro
                      where l.Código.Equals(valor)
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

            if (idDoLivro != null || idDoUtilizador != null)
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
            requisitarLivro(valor);
            Panel PanelTabelaDetailLivro = (Panel)_("PanelTabelaDetailLivro");
            PanelTabelaDetailLivro.Visible = false;

            Panel PanelMensagem = (Panel)_("PanelMensagem");
            Label lblMensagem = (Label)_("lblMensagem");
            lblMensagem.Text = "<em><h2>Efetuou com sucesso</h3></em>";
        }
    }
}