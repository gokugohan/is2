using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_Normal : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string selectedTheme = Page.Theme;
            HttpCookie PreferredTheme = Request.Cookies.Get("PreferredTheme");

            if (PreferredTheme != null)
            {
                selectedTheme = PreferredTheme.Value;
                
            }

            if (!string.IsNullOrEmpty(selectedTheme))
            {
                ListItem item = ThemeList.Items.FindByValue(selectedTheme);
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }
    }

    protected void ThemeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie PreferredTheme = new HttpCookie("PreferredTheme");
        PreferredTheme.Expires = DateTime.Now.AddMonths(3);
        PreferredTheme.Value = ThemeList.SelectedValue;
        Response.Cookies.Add(PreferredTheme);

        Response.Redirect(Request.Url.ToString());
    }
}
