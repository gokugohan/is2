using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Administrator_AdminAutor : System.Web.UI.Page
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


    protected void OnDataBound(object sender, EventArgs e)
    {

        GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Footer, DataControlRowState.Normal);

        for (int i = 0; i < GridViewAutor.Columns.Count; i++)
        {
            TableHeaderCell cell = new TableHeaderCell();
            if (i != 0)
            {
                TextBox txtSearch = new TextBox();
                txtSearch.Attributes["placeholder"] = "Pesquisar por " + GridViewAutor.Columns[i].HeaderText;
                txtSearch.CssClass = "search_textbox form-control";
                cell.Controls.Add(txtSearch);
                row.Controls.Add(cell);
            }
            else
            {
                Label lbl = new Label();
                lbl.Text = "Pesquisar autor";
                lbl.CssClass = "control-label pull-left";
                cell.Controls.Add(lbl);
                row.Controls.Add(cell);
            }

        }


        if (GridViewAutor.HeaderRow != null)
        {
            GridViewAutor.HeaderRow.Parent.Controls.AddAt(0, row);

        }

    }
}