using CsvHelper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Administrator_Editora_Default : System.Web.UI.Page
{
    private string mFileName;
    private string mExtension;
    private string mDestinationFolder;
    private string mStatus;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void OnDataBound(object sender, EventArgs e)
    {

        Label lblSearch = new Label();
        lblSearch.Text = "<br/><br/>Pesquisar editora";
        lblSearch.CssClass = "control-label";

        TextBox txtSearch = new TextBox();
        txtSearch.Attributes["placeholder"] = "Pesquisa por nome";
        txtSearch.CssClass = "search_textbox form-control";

        ListView1.Controls.AddAt(0,txtSearch);
        ListView1.Controls.AddAt(0, lblSearch);
    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            this.mExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
            
            if (this.mExtension.ToLower() != ".csv")
            {
                this.mStatus = "Aceita apenas o ficheiro com a extenção .csv";
            }
            else
            {
                this.mFileName = FileUpload1.FileName;
                this.mDestinationFolder = Server.MapPath("~/Uploads/"+this.mFileName);
                FileUpload1.SaveAs(this.mDestinationFolder);

                processingCSVFile(mDestinationFolder);
            }

        }
    }

    private void processingCSVFile(string file)
    {
        string ret = "";
        DataTable mDataTable = new DataTable();
        mDataTable.Columns.AddRange(new DataColumn[2]{
            new DataColumn("Nome",typeof(string)),
                new DataColumn("Descricao",typeof(string))
        });

        string csvData = File.ReadAllText(file);
        foreach (string row in csvData.Split('\n'))
        {
            if (!string.IsNullOrEmpty(row))
            {
                mDataTable.Rows.Add();
                int i = 0;
                foreach (string cell in row.Split(','))
                {
                    mDataTable.Rows[mDataTable.Rows.Count - 1][i] = cell;
                    i++;
                }
            }
        }



        lblStatus.Text = ret;

        string strConnection = ConfigurationManager.ConnectionStrings["OMeuBD"].ConnectionString;
        using (SqlConnection con = new SqlConnection(strConnection))
        {
            using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
            {
                //Set the database table name
                sqlBulkCopy.DestinationTableName = "dbo.Table_Editora";
                con.Open();
                sqlBulkCopy.WriteToServer(mDataTable);
                con.Close();
            }
        }

        //fetchData(mDataTable);
        
    }

    private void fetchData(DataTable mDataTable)
    {
        ListView ListView1 = (ListView)UpdatePanel1.FindControl("ListView1");
        ListView1.DataSource = mDataTable;
        ListView1.DataBind();
    }

  
}