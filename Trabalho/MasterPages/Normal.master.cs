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
            if (Session["session_init"] != null)
            {
                Label2.Text = ((DateTime)Session["session_init"]).ToLongTimeString();
            }
            if (Cache.Get("duracao") == null)
            {
                Cache.Insert("duracao", DateTime.Now);
            }

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

    protected void Timer1_Tick(object sender, EventArgs e)
    {

        if (Cache.Get("duracao") != null)
        {
            DateTime init = (DateTime)Cache.Get("duracao");
            DateTime atual = DateTime.Now;


            TimeSpan mTimeSpan = atual - init;
            int horas = mTimeSpan.Hours;
            int minuto = mTimeSpan.Minutes;
            int segundo = mTimeSpan.Seconds;
            string difTempo = horas.ToString("00") + "h:" +
                minuto.ToString("00") + "m:" + segundo.ToString("00") + "s";

            Label1.Text = difTempo;
        }
    }
}
