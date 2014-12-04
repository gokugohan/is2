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
    private TextBox tbNome, tbApelido, tbNumeroContato;
    private TextBox tbRua, tbCodigoPostal, tbCidade, tbPais;
    private MembershipUser user;

    protected void Page_Load(object sender, EventArgs e)
    {
        user = Membership.GetUser();
        this.mPanelFormulario = (Panel)_(this.LoginView1, "PanelFormPerfil");
        
        
        if (user != null & User.Identity.IsAuthenticated)
        {
            if (User.Identity.Name == user.UserName)
            {
                ProfileCommon profile = Profile.GetProfile(User.Identity.Name);

                if (isLoggedInUserPerfilIsEnough(profile))
                {
                    PanelDadosPerfil.Visible = true;
                    showInfo(profile);//show profile info data and hide the form
                    this.mPanelFormulario.Visible = false;
                }
                else
                {
                    mPanelFormulario.Visible = true;
                    showProfileForm();//show form and hide the(empty) table
                    PanelDadosPerfil.Visible = false;
                }

            }
        }
        else
        {
            Label2.Text = "O utilizador não é autenticado!";
        }


    }

    private void showInfo(ProfileCommon profile)
    {
        lblUserName.Text = user.UserName;
        lblNomeCompleto.Text = profile.Nome + " " + profile.Apelido;
        lblNumContato.Text = profile.NumeroContato;
        lblEmail.Text = user.Email;
        lblRua.Text = profile.Endereco.Rua;
        lblCodigoPostal.Text = profile.Endereco.CodigoPostal;
        lblCidade.Text = profile.Endereco.Cidade;
        lblPais.Text = profile.Endereco.Pais;
    }

    private void showProfileForm()
    {
        getAllControlInsideWizard();
    }

    public bool isLoggedInUserPerfilIsEnough(ProfileCommon profile)
    {
        bool retorno = profile.Nome != string.Empty && profile.Apelido != string.Empty
            && profile.NumeroContato != string.Empty;
        return retorno;
    }

    private void getAllControlInsideWizard()
    {
        Wizard wizard = _(this.mPanelFormulario, "Wizard1") as Wizard;
        WizardStep step1 = _(wizard,"WizardStep1") as WizardStep;
        WizardStep step2 = _(wizard,"WizardStep2") as WizardStep;

        this.tbNome = _(step1, "tbNome") as TextBox;
        this.tbApelido = _(step1, "tbApelido") as TextBox;
        this.tbNumeroContato = _(step1, "tbNumeroContato") as TextBox;
        //this.tbEmail = (TextBox)_(this.mMultiView, "tbEmail");
        this.tbRua = _(step2, "tbRua") as TextBox;
        this.tbCodigoPostal = _(step2, "tbCodigoPostal") as TextBox;
        this.tbCidade = _(step2, "tbCidade") as TextBox;
        this.tbPais = _(step2, "tbPais") as TextBox;

        Label2.Text = step1.Title + "<br/>" + step2.Title;
    }

    private Control _(Control control, string id)
    {
        return control.FindControl(id);
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

        using (var entidade = new BibliotecaEntity())
        {
            Table_Utilizador u = new Table_Utilizador
            {
                Nome = get(tbNome),
                Apelido = get(tbApelido),
                NumeroContato = get(tbNumeroContato),
                Email = user.Email,
                EnderecoMorada = "Rua: " + get(tbRua) + " Código Postal: " + get(tbCodigoPostal) + " Cidade: " + get(tbCidade) +
                " País: " + get(tbPais),
                NomeUtilizador = user.UserName

            };

            entidade.Utilizadores.Add(u);
            entidade.SaveChanges();
        }

        Profile.Save();

        Response.Redirect("Perfil.aspx");
        this.mPanelFormulario.Visible = false;
    }


    private string get(TextBox tb)
    {
        return tb.Text.ToString().Trim();
    }

    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Label2.Text += "Next button was clicked";
    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        
        Label2.Visible = true;
        Label2.Text = "The Wizard has been completed";
        Profile.Nome = get(tbNome);
        Profile.Apelido = get(tbApelido);
        Profile.NumeroContato = get(tbNumeroContato);
        Profile.Email = user.Email;
        Profile.Endereco.Rua = get(tbRua);
        Profile.Endereco.CodigoPostal = get(tbCodigoPostal);
        Profile.Endereco.Cidade = get(tbCidade);
        Profile.Endereco.Pais = get(tbPais);

        using (var entidade = new BibliotecaEntity())
        {
            Table_Utilizador u = new Table_Utilizador
            {
                Nome = get(tbNome),
                Apelido = get(tbApelido),
                NumeroContato = get(tbNumeroContato),
                Email = user.Email,
                EnderecoMorada = "Rua: " + get(tbRua) + " Código Postal: " + get(tbCodigoPostal) + " Cidade: " + get(tbCidade) +
                " País: " + get(tbPais),
                NomeUtilizador = user.UserName

            };

            entidade.Utilizadores.Add(u);
            entidade.SaveChanges();
        }

        Profile.Save();

        Response.Redirect("Perfil.aspx");
        this.mPanelFormulario.Visible = false;
    }
}