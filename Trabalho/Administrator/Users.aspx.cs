using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users : System.Web.UI.Page
{
    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ddlRoles.DataSource = Roles.GetAllRoles();
            ddlRoles.DataBind();
            
            Label2.Text = ddlRoles.SelectedItem.Text;
            ddlUser.DataSource = Membership.GetAllUsers();
            ddlUser.DataBind();
            Label1.Text = "Selecionar um utilizador no menu dropdown <b>Users</b> para adicionar ao role selecionado no menu dropdown <b>Roles</b>";
            bindUserToLBUserInRoles();
        }


    }

    private void bindUserToLBUserInRoles()
    {
        LBUsersInRoles.DataSource = Roles.GetUsersInRole(ddlRoles.SelectedItem.Text.ToString());
        LBUsersInRoles.DataBind();
    }

    

    protected void ddlRoles_SelectedIndexChanged(object sender, System.EventArgs e)
    {
        bindUserToLBUserInRoles();
        Label2.Text = ddlRoles.SelectedItem.Text;
    }

    protected void Button1_Click(object sender, System.EventArgs e)
    {
        try
        {
            Roles.AddUserToRole(ddlUser.SelectedValue.ToString(), ddlRoles.SelectedItem.Text.ToString());
            LBUsersInRoles.DataSource = Roles.GetUsersInRole(ddlRoles.SelectedItem.Text.ToString());
            LBUsersInRoles.DataBind();
            Label1.Text = ddlUser.SelectedItem.Text.ToString() +
                " User Added in " +
                ddlRoles.SelectedItem.Text.ToString() +
                " Role successfully!";
        }
        catch (ProviderException pe)
        {
            lblErrorMsg.Text = pe.Message;
        }
    }

    protected void btnRemoverUtilizador_Click(object sender, EventArgs e)
    {
                
    }
    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        PanelUserRole.Visible = !PanelUserRole.Visible;
        
    }


    protected void btnCriarRole_Click(object sender, EventArgs e)
    {
        if (Roles.RoleExists(tbRoleName.Text) == false)
        {
            Roles.CreateRole(tbRoleName.Text);
            ddlRoles.DataSource = Roles.GetAllRoles();
            ddlRoles.DataBind();
        }
    }
    protected void btnMostrarPanelCriarRole_Click(object sender, EventArgs e)
    {
        PanelCriarRole.Visible = !PanelCriarRole.Visible;
    }
}