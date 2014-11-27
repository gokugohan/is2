using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Core.Objects;

public partial class Administrator_Livro_Default : System.Web.UI.Page
{
    private string mBaseUrl;
    private string[] meses = {"Janeiro","Fevereiro",
                                 "Março","Abril","Maio",
                                 "Junho","Julho","Agosto",
                                 "Setembro","Outubro",
                                 "Novembro","Dezembro"};

    

    protected void Page_Load(object sender, EventArgs e)
    {
        mBaseUrl = Request.Url.GetLeftPart(UriPartial.Authority);

        if (!string.IsNullOrEmpty(mBaseUrl))
        {
            this.Master.getHiperLinkControl.NavigateUrl = mBaseUrl;
        }

    }

    protected string getFormat(object data)
    {
        string tmp = data.ToString();
        List<char> t = tmp.ToList();
        string m = "";
        foreach (var s in t)
        {
            if (s == ' ')
            {
                break;
            }

            m += (s == '-' ? "/" : s+"");
               
        }
        
        
        char[] delimitador = { '/' };

        string[] ttt = m.Split(delimitador);

        m += "<br/>" + ttt[0] + "-"+ttt[1]+"-"+ttt[2];

        Label8.Text = m;
        return ttt[0] + "-" + ttt[1] + "-" + ttt[2];
    }



    protected string getAutor(object idCategoria)
    {
        int id = Convert.ToInt32(idCategoria);
        using (var entidade = new BibliotecaEntity())
        {
            var categorias = from c in entidade.Categorias select c;
            

            foreach (var categoria in categorias)
            {
              
                if (categoria.ID_Categoria == id)
                {
                    return string.Format("{0}", categoria.Nome_Categoria);

                }
            }
        }
        return string.Empty;
    }

    protected string getCategoria(object idAutor)
    {
        int id = Convert.ToInt32(idAutor);
        using (var entidade = new BibliotecaEntity())
        {
            var autores = from a in entidade.Autores select a;
            
            foreach (var autor in autores)
            {
                
                if (autor.ID_Autor == id)
                {
                    return string.Format("{0} {1}",autor.Nome,autor.Apelido);
                    
                }
            }
            
        }
        return string.Empty;
    }

    protected string getEditora(object idEditora)
    {
        int id = Convert.ToInt32(idEditora);
        using (var entidade = new BibliotecaEntity())
        {
            var editoras = from e in entidade.Editoras select e;
            
            foreach (var editora in editoras)
            {
                if (editora.ID_Editora == id)
                {
                    if (editora.ID_Editora == id)
                    {
                        return editora.Nome;
                    }
                    //return autor.Nome;
                }
            }
        }
        
        return "Lol " + id;
    }

    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        Response.Redirect("./Livro");
    }
}