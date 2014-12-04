<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">

    <style>
        .gridpager td>table>tbody>tr>td
            {    
                font-size: 18px;
                padding-left: 4px;
                padding-right: 10px;
            }
    </style>
    <div id="animWrapper">
        
            <%--"{0:d MMMM yyyy}"--%>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblSearchCounter" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox 
                            ID="tbSearch" 
                            placeholder="Pesquisar livro por título" 
                            CssClass="form-control search_textbox" 
                            runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button 
                            ID="btnSearch" 
                            CssClass="btn btn-default" 
                            runat="server" 
                            OnClick="btnSearch_Click"
                            Text="Submit" />
                    </td>
                </tr>
            </table>

            <asp:GridView ID="GridView1" 
                runat="server" 
                AutoGenerateColumns="false"  
                OnPageIndexChanging="GridView1_PageIndexChanging"
                PageSize="10"
                AllowPaging="True">

                <%--<PagerSettings 
                    Mode="NextPreviousFirstLast" 
                    FirstPageText="primeiro"
                    PreviousPageText="anterior"
                    NextPageText="próximo"
                    LastPageText="último"
                    Position="Bottom"
                    
                     />
                <PagerStyle CssClass="gridpager" />--%>

                <Columns>
                    <asp:TemplateField HeaderText="Código" SortExpression="Código">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("Código") %>' ID="Label1"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("ISBN") %>' ID="Label2"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Título" SortExpression="Titulo">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Titulo") %>' ID="Label3"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Data publicação" SortExpression="Data_publicação">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Data_publicação","{0:d MMMM yyyy}") %>' ID="Label4"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Categoria" SortExpression="Nome_Categoria">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Nome_Categoria") %>' ID="Label5"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editora" SortExpression="Editora">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Editora") %>' ID="Label6"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Autor" SortExpression="Autor">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Bind("Autor") %>' ID="Label7"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Requisitar">
                         <ItemTemplate>
                            <%--<asp:HyperLink ID="HyperLink1" 
                                NavigateUrl='<%# string.Format("~/RequisitarLivros.aspx?codigo={0}",
                            HttpUtility.UrlEncode(Eval("Código").ToString())) %>' 
                                runat="server" Text="Requisitar"/>--%>

                             <asp:HyperLink ID="HyperLink1" 
                                 NavigateUrl='<%# string.Format("~/Livro/{0}",
                            HttpUtility.UrlEncode(Eval("Código").ToString())) %>' 
                                 runat="server">Requisitar</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    
    <script>
        $(function () {
            //$(".search_textbox").keypress(function (event) {
            //    //if digits or not a space then don't let keypress work.
            //    if ((inputValue > 47 && inputValue < 58) && (inputValue != 32)) {
            //        event.preventDefault();
            //    }
            //});
            
<%--            $('.search_textbox').each(function () {
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
            });--%>
            
        });
    </script>
    
</asp:Content>

