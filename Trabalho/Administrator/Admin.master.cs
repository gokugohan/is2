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
        //if (Session["session_init"] != null)
        //{
        //    Label2.Text = ((DateTime)Session["session_init"]).ToLongTimeString();
        //}
        //if (Cache.Get("duracao") == null)
        //{
        //    Cache.Insert("duracao", DateTime.Now);
        //}
    }

    //public HyperLink getHiperLinkControl 
    //{
    //    get
    //    {
    //        HyperLink mHyperLink = (HyperLink)LoginView1.FindControl("HyperLink1");
    //        return mHyperLink;
    //    }
    //}

    //public ScriptManager getScriptManager
    //{
    //    get
    //    {
    //        return ScriptManager1;
    //    }
    //}


    //protected void Timer1_Tick(object sender, EventArgs e)
    //{

    //    if (Cache.Get("duracao") != null)
    //    {
    //        DateTime init = (DateTime)Cache.Get("duracao");
    //        DateTime atual = DateTime.Now;

    //        TimeSpan mTimeSpan = atual - init;
    //        int horas = mTimeSpan.Hours;
    //        int minuto = mTimeSpan.Minutes;
    //        int segundo = mTimeSpan.Seconds;
    //        string difTempo = horas.ToString("00") + "h:" +
    //            minuto.ToString("00") + "m:" + segundo.ToString("00") + "s";

    //        Label1.Text = difTempo;
    //    }
    //}
}
