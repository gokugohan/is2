using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cache : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (IsPostBack)
        {
            lblInfo.Text += "Page posted back.<br/>";
        }
        else
        {
            lblInfo.Text += "Page created";
        }

        if (Cache["testitem"] == null)
        {
            lblInfo.Text += "Creating test item.<br/>";
            DateTime testItem = DateTime.Now;
            lblInfo.Text += "Storing test item in cache ";
            lblInfo.Text += "for 30 seconds.<br/>";
            Cache.Insert("testitem",testItem,null,DateTime.Now.AddSeconds(30),TimeSpan.Zero);
        }
        else
        {
            lblInfo.Text += "Retrieving test item.<br/>";
            DateTime testItem = (DateTime)Cache["testitem"];
            lblInfo.Text += "Test item is: " + testItem.ToString()+"<br/>";
        }

        lblInfo.Text += "<br/>";

        //lbltime.Text = String.Format("Page posted at: {0}",
         //         DateTime.Now.ToLongTimeString());

    }
}