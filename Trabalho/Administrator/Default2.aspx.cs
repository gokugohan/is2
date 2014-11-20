using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class Administrator_Default2 : System.Web.UI.Page
{
    string arquivoXML = "";
    static int i = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            arquivoXML = Server.MapPath("~/Administrator/Filmes.xml");
            carregaDados();
        }
    }

    protected void carregaDados()
    {
        DataSet ds = new DataSet();

        ds.ReadXml(arquivoXML);
        FilmesListView.DataSource = ds;
        FilmesListView.DataBind();
    }
    protected void FilmesListView_ItemCanceling(object sender, ListViewCancelEventArgs e)
    {
        TextBox txtNomeTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtNome");
        TextBox txtAnoTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAno");
        TextBox txtGeneroTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtGenero");
        TextBox txtAtoresTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAtores");

        txtNomeTextBox.Text = string.Empty;
        txtAnoTextBox.Text = string.Empty;
        txtGeneroTextBox.Text = string.Empty;
        txtAtoresTextBox.Text = string.Empty;
    }
    protected void FilmesListView_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        arquivoXML = Server.MapPath("~/Filmes.xml");
        Label lblNome = (FilmesListView.Items[e.ItemIndex].FindControl("lblNome")) as Label;
        Label lblAno = (FilmesListView.Items[e.ItemIndex].FindControl("lblAno")) as Label;
        Label lblGenero = (FilmesListView.Items[e.ItemIndex].FindControl("lblGenero")) as Label;
        Label lblAtores = (FilmesListView.Items[e.ItemIndex].FindControl("lblAtores")) as Label;

        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.Load(arquivoXML);
        XmlNodeList newXMLNodes = xmlDoc.SelectNodes("/Filmes/Filme");

        string nomedoFilme = lblNome.Text;

        foreach (XmlNode newXMLNode in newXMLNodes)
        {
            if (newXMLNode.InnerText.Contains(nomedoFilme))
            {
                newXMLNode.ParentNode.RemoveChild(newXMLNode);
            }
        }
        xmlDoc.Save(arquivoXML);
        xmlDoc = null;
        carregaDados();
    }

    protected void FilmesListView_ItemEditing(object sender, ListViewEditEventArgs e)
    {
        arquivoXML = Server.MapPath("~/Filmes.xml");
        FilmesListView.EditIndex = e.NewEditIndex;
        i = Convert.ToInt16(FilmesListView.EditIndex);

        Label lblNome = (Label)FilmesListView.EditItem.FindControl("lblNome");
        Label lblAno = (Label)FilmesListView.EditItem.FindControl("lblAno");
        Label lblGenero = (Label)FilmesListView.EditItem.FindControl("lblGenero");
        Label lblAtores = (Label)FilmesListView.EditItem.FindControl("lblAtores");

        TextBox txtNomeTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtNome");
        TextBox txtAnoTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAno");
        TextBox txtGeneroTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtGenero");
        TextBox txtAtoresTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAtores");

        txtNomeTextBox.Text = lblNome.Text;
        txtAnoTextBox.Text = lblAno.Text;
        txtGeneroTextBox.Text = lblGenero.Text;
        txtAtoresTextBox.Text = lblAtores.Text;
    }

    protected void FilmesListView_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        arquivoXML = Server.MapPath("~/Filmes.xml");
        TextBox txtNomeTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtNome");
        TextBox txtAnoTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAno");
        TextBox txtGeneroTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtGenero");
        TextBox txtAtoresTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAtores");

        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.Load(arquivoXML);
        XmlElement xelement = xmlDoc.CreateElement("Filme");

        XmlElement xName = xmlDoc.CreateElement("Nome");
        xName.InnerText = txtNomeTextBox.Text;
        xelement.AppendChild(xName);

        XmlElement xYear = xmlDoc.CreateElement("Ano");
        xYear.InnerText = txtAnoTextBox.Text;
        xelement.AppendChild(xYear);

        XmlElement xGenre = xmlDoc.CreateElement("Genero");
        xGenre.InnerText = txtGeneroTextBox.Text;
        xelement.AppendChild(xGenre);

        XmlElement xCast = xmlDoc.CreateElement("Atores");
        xCast.InnerText = txtAtoresTextBox.Text;
        xelement.AppendChild(xCast);

        xmlDoc.DocumentElement.AppendChild(xelement);
        xmlDoc.Save(arquivoXML);
        carregaDados();
    }

    protected void btnAtualizar_Click(object sender, EventArgs e)
    {
        arquivoXML = Server.MapPath("~/Filmes.xml");

        TextBox txtNomeTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtNome");
        TextBox txtAnoTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAno");
        TextBox txtGeneroTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtGenero");
        TextBox txtAtoresTextBox = (TextBox)FilmesListView.InsertItem.FindControl("txtAtores");

        XmlDocument xmldoc = new XmlDocument();
        xmldoc.Load(arquivoXML);

        XmlNode xmlnode = xmldoc.DocumentElement.ChildNodes.Item(i);
        xmlnode["Nome"].InnerText = txtNomeTextBox.Text;
        xmlnode["Ano"].InnerText = txtAnoTextBox.Text;
        xmlnode["Genero"].InnerText = txtGeneroTextBox.Text;
        xmlnode["Atores"].InnerText = txtAtoresTextBox.Text;

        xmldoc.Save(arquivoXML);
        carregaDados();
    }
}