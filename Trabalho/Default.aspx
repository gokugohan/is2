<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="animWrapper">
        <div class="jumbotron">
            <%--"{0:d MMMM yyyy}"--%>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox6" placeholder="Pesquisar livro por" CssClass="form-control search_textbox" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:DropDownList 
                            CssClass="form-control" 
                            ID="ddlSelectSearch" 
                            runat="server">
                            <asp:ListItem Value="0">Código</asp:ListItem>
                            <asp:ListItem Value="1">ISBN</asp:ListItem>
                            <asp:ListItem Value="2">Título</asp:ListItem>
                            <asp:ListItem Value="3">Data publicação</asp:ListItem>
                            <asp:ListItem Value="4">Categoria</asp:ListItem>
                            <asp:ListItem Value="5">Editora</asp:ListItem>
                            <asp:ListItem Value="6">Autor</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            
            <asp:GridView ID="GridView1" 
                runat="server" 
                CssClass="table table-bordered"
                AutoGenerateColumns="False" 
                DataKeyNames="Código" 
                DataSourceID="SqlDataSource1" 
                PageSize="4"
                AllowSorting="True" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="C&#243;digo" SortExpression="C&#243;digo">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Código") %>' ID="Label1"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Código") %>' ID="Label1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("ISBN") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ISBN") %>' ID="Label2"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Titulo" SortExpression="Titulo">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Titulo") %>' ID="TextBox2"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Titulo") %>' ID="Label3"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Data publica&#231;&#227;o" SortExpression="Data publica&#231;&#227;o">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("[Data publicação]") %>' ID="TextBox3"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("[Data publicação]","{0:d MMMM yyyy}") %>' ID="Label4"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria" SortExpression="Nome_Categoria">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Nome_Categoria") %>' ID="TextBox4"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Nome_Categoria") %>' ID="Label5"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editora" SortExpression="Editora">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Editora") %>' ID="TextBox5"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Editora") %>' ID="Label6"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Autor" SortExpression="Autor">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Autor") %>' ID="Label2"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Autor") %>' ID="Label7"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Requisitar">
                        <EditItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Autor") %>' ID="Label7"></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" 
                                NavigateUrl='<%# string.Format("~/RequisitarLivros.aspx?codigo={0}",
                            HttpUtility.UrlEncode(Eval("Código").ToString())) %>' 
                                runat="server" Text="Requisitar"/>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1"  CacheDuration="5" 
                ConnectionString='<%$ ConnectionStrings:OMeuBD %>' 
                SelectCommand="SELECT * FROM [View_Livro] ORDER BY [Titulo]"></asp:SqlDataSource>
        </div>
    </div>
    <script>
        $(function () {
            //$(".search_textbox").keypress(function (event) {
            //    //if digits or not a space then don't let keypress work.
            //    if ((inputValue > 47 && inputValue < 58) && (inputValue != 32)) {
            //        event.preventDefault();
            //    }
            //});

            $('.search_textbox').each(function () {
                $(this).quicksearch("[id*=GridView1] tr:not(:has(th))", {
                    'testQuery': function (query, txt, row) {
                        var criterio = document.getElementById("<%=ddlSelectSearch.ClientID%>");
                        var indice = (criterio.options[criterio.selectedIndex].value);
                        var tamanho = row.children.length - 1;
                        var stringQuery = query[0].toLowerCase();
                        var dadoAComparar = $(row).children(":eq(" + (indice) + ")").text().toLowerCase();
                        console.log(dadoAComparar);
                        return dadoAComparar.indexOf(stringQuery) != -1;
                    }
                });
            });
        });
    </script>
    
</asp:Content>

