using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateProfile : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MembershipUser user = Membership.GetUser();
            if (user != null & User.Identity.IsAuthenticated)
            {
                if (User.Identity.Name == user.UserName)
                {
                    ProfileCommon profile = Profile.GetProfile(User.Identity.Name);
                    setProfileDataToTable(profile);

                }
            }
        }
        
    }

    protected void updateData(object sender, EventArgs e)
    {
        ProfileCommon profile = Profile.GetProfile(User.Identity.Name);
        MembershipUser user = Membership.GetUser();
        if (profile != null && user !=null && User.Identity.IsAuthenticated)
        {
            UpdateProfileData(profile,user);
        }
        else
        {
            Label1.Text = "Não atualizou";
        }
       
    }

    private void UpdateProfileData(ProfileCommon profile, MembershipUser user)
    {

        Label1.Text = "Atualizou...";
        try
        {
            // update profile data
            profile.Nome = getText(tbNome);
            profile.Apelido = getText(tbApelido);
            profile.NumeroContato = getText(tbNumeroContato);
            profile.Email = getText(tbEmail);
            profile.Endereco.Rua = getText(tbRua);
            profile.Endereco.CodigoPostal = getText(tbCodigoPostal);
            profile.Endereco.Cidade = getText(tbCidade);
            profile.Endereco.Pais = getText(tbPais);


            //save profile
            profile.Save();

            //update user email
            user.Email = getText(tbEmail);
            Membership.UpdateUser(user);
        }
        catch (System.Configuration.Provider.ProviderException e)
        {
            Label1.Text = e.Message;
        }

    }

    private string getText(TextBox tb)
    {
        return tb.Text.Trim();
    }

    private void setProfileDataToTable(ProfileCommon profile)
    {
        tbNome.Text = profile.Nome;
        tbApelido.Text = profile.Apelido;
        tbNumeroContato.Text = profile.NumeroContato;
        tbEmail.Text = profile.Email;
        tbRua.Text = profile.Endereco.Rua;
        tbCodigoPostal.Text = profile.Endereco.CodigoPostal;
        tbCidade.Text = profile.Endereco.Cidade;
        tbPais.Text = profile.Endereco.Pais;
    }



    protected void cancelUpdateData(object sender, EventArgs e)
    {
        Response.Redirect("Perfil.aspx");
    }
}