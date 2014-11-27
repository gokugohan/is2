using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : BasePage
{

    protected void Page_Load(object sender, EventArgs e)
    {
        showUserInfo();
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
                sb.Append(" ").Append(user.UserName).Append("</h2>") ;
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
   
}