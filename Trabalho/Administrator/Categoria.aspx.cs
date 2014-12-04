using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Categoria_Default : System.Web.UI.Page
{
    private string mBaseUrl;
    protected void Page_Load(object sender, EventArgs e)
    {
        mBaseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

        if (!string.IsNullOrEmpty(mBaseUrl))
        {
            //this.Master.getHiperLinkControl.NavigateUrl = mBaseUrl;
        }
    }
    protected void ListView1_DataBound(object sender, EventArgs e)
    {
        Label lblSearch = new Label();
        lblSearch.Text = "<br/><br/>Pesquisar categoria";
        lblSearch.CssClass = "control-label";

        TextBox txtSearch = new TextBox();
        txtSearch.Attributes["placeholder"] = "Pesquisar categoria";
        txtSearch.CssClass = "search_textbox form-control";

        ListView1.Controls.AddAt(0, txtSearch);
        ListView1.Controls.AddAt(0, lblSearch);
    }
}