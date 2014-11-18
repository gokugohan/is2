using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyProfiel : BasePage
{    
    private Panel mPanelFormulario;
    private MultiView mMultiView;
    private TextBox tbNome, tbApelido, tbNumeroContato;
    private TextBox tbRua, tbCodigoPostal, tbCidade, tbPais;
    private MembershipUser user;
    protected void Page_Load(object sender, EventArgs e)
    {

         user = Membership.GetUser();
        if (user != null & User.Identity.IsAuthenticated)
        {
            if (User.Identity.Name == user.UserName)
            {
                ProfileCommon profile = Profile.GetProfile(User.Identity.Name);
         
                if (isLoggedInUserPerfilIsEnough(profile))
                {
                    lblUserName.Text = user.UserName;
                    lblNomeCompleto.Text = profile.Nome +" " + profile.Apelido;
                    lblNumContato.Text = profile.NumeroContato;
                    lblEmail.Text = user.Email;
                    lblRua.Text = profile.Endereco.Rua;
                    lblCodigoPostal.Text = profile.Endereco.CodigoPostal;
                    lblCidade.Text = profile.Endereco.Cidade;
                    lblPais.Text = profile.Endereco.Pais;
                }
                else
                {
                    showProfileForm();
                    return;
                }
                

            }
        }
        else if (user == null & User.Identity.IsAuthenticated)
        {
            showProfileForm();
        }
        else
        {
            Label2.Text = "O utilizador não é autenticado!";
            
        }

        
    }

    private void showProfileForm()
    {
        this.mPanelFormulario = (Panel)_(this.LoginView1, "PanelFormPerfil");

        this.mMultiView = (MultiView)_(this.mPanelFormulario, "MultiView1");

        this.mMultiView.ActiveViewIndex = 0;

        getAllControlFromMultiView();
    }

    public bool isLoggedInUserPerfilIsEnough(ProfileCommon profile)
    {
        bool retorno = profile.Nome != string.Empty && profile.Apelido != string.Empty 
            && profile.NumeroContato != string.Empty;
        return retorno;
    }

    private void getAllControlFromMultiView()
    {
        if (this.mMultiView != null)
        {
            this.tbNome = (TextBox)_(this.mMultiView, "tbNome");
            this.tbApelido = (TextBox)_(this.mMultiView, "tbApelido");
            this.tbNumeroContato = (TextBox)_(this.mMultiView, "tbNumeroContato");
            //this.tbEmail = (TextBox)_(this.mMultiView, "tbEmail");
            this.tbRua = (TextBox)_(this.mMultiView, "tbRua");
            this.tbCodigoPostal = (TextBox)_(this.mMultiView, "tbCodigoPostal");
            this.tbCidade = (TextBox)_(this.mMultiView, "tbCidade");
            this.tbPais = (TextBox)_(this.mMultiView, "tbPais");


        }
    }

    private Control _(Control control,string id)
    {
        return control.FindControl(id);
    }


    protected void proximo(object sender, EventArgs e)
    {
        this.mMultiView.ActiveViewIndex = 1;
    }

    protected void anterior(object sender, EventArgs e)
    {
        this.mMultiView.ActiveViewIndex = 0;
    }

    protected void fim(object sender, EventArgs e)
    {
        Profile.Nome = get(tbNome);
        Profile.Apelido = get(tbApelido);
        Profile.NumeroContato = get(tbNumeroContato);
        Profile.Email = user.Email;
        Profile.Endereco.Rua = get(tbRua);
        Profile.Endereco.CodigoPostal = get(tbCodigoPostal);
        Profile.Endereco.Cidade = get(tbCidade);
        Profile.Endereco.Pais = get(tbPais);


        Profile.Save();

        Response.Redirect("Perfil.aspx");
        this.mPanelFormulario.Visible = false;
    }


    private string get(TextBox tb)
    {
        return tb.Text.ToString().Trim();
    }
}