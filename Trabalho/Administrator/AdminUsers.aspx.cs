using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ListBoxDataBind();
            ListboxUserDataBind();
        }
    }

    private void ListboxUserDataBind()
    {
        MembershipUserCollection mUserCollection =  Membership.GetAllUsers();
        

        List<string> listOfUser = new List<string>();

        foreach (var user in mUserCollection)
        {
            listOfUser.Add(user.ToString());
        }

        ListBox2.DataSource = listOfUser;
        ListBox2.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Roles.CreateRole(TextBox1.Text);
        ListBoxDataBind();
    }
    protected void ListBoxDataBind()
    {
        ListBox1.DataSource = Roles.GetAllRoles();
        ListBox1.DataBind();
    }
}