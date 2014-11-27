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
            this.Master.getHiperLinkControl.NavigateUrl = mBaseUrl;
        }
    }
}