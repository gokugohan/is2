<%@ Application Language="C#" %>

<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">
   
    void Application_OnStart(Object Sender, EventArgs E)
    {
    }
    
    void Application_Start(object sender, EventArgs e) 
    {
        
        // Code that runs on application startup
        ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
            new ScriptResourceDefinition
            {
                Path = "~/Scripts/jquery-2.1.1.min.js",
                DebugPath = "~/Scripts/jquery-2.1.1.min.js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.js"
            });

        ASP.RouteConfig.RegisterRoutes(System.Web.Routing.RouteTable.Routes);
        BibliotecaRoutes(System.Web.Routing.RouteTable.Routes);
    }

    public void BibliotecaRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("Requisitar","Livro/{codigo}","~/RequisitarLivros.aspx");
        routes.MapPageRoute("AdminDefault", "Admin","~/Administrator/Default.aspx");
        routes.MapPageRoute("AdminAutor", "Autor", "~/Administrator/Autor.aspx");
        routes.MapPageRoute("AdminEditora", "Editora", "~/Administrator/Editora.aspx");
        routes.MapPageRoute("AdminCategoria", "Categoria", "~/Administrator/Categoria.aspx");
        routes.MapPageRoute("AdminLivro", "Livro", "~/Administrator/Livro.aspx");
        routes.MapPageRoute("AdminUsers", "Utilizadores", "~/Administrator/Users.aspx");
        
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown   
    }
        
    void Application_Error(object sender, EventArgs e) 
    {
       
    }

    void Session_Start(object sender, EventArgs e) 
    {
        Session["session_init"] = DateTime.Now;
    }

   
    
    void Session_End(object sender, EventArgs e) 
    {
        Session.Remove("session_init");
    }
       
</script>
