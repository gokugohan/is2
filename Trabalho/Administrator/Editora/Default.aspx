<%@ Page Title="Gerir Editora" Theme="Normal" Language="C#" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administrator_Editora_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomMenuContentPlaceHolder" Runat="Server">
    <li>
        <a href="../">Home</a>
    </li>
    <li>
        <a href="../Autor">Gerir Autor</a>
    </li>
    <li>
        <a href="./">Gerir Editora</a>
    </li>
    <li>
        <a href="../Livro">Gerir Livro</a><!-- gerir também a categoria do livro -->
    </li>
    <li>
        <div id="loginStatusName">
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
            <asp:LoginName ID="LoginName1" CssClass="control-label" runat="server" />
        </div>

    </li>
    <li>
        <hr />
    </li>
    <li>
        <asp:AdRotator ID="AdRotator1" AdvertisementFile="~/Advertisement.xml" runat="server" CssClass="img-responsive" />
    </li>
    <script src="../../Scripts/jquery-2.1.1.min.js"></script>
    <script src="../../Scripts/jquery.quicksearch.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div class="jumbotron" id="jumbotronContent">
        <div class="row">
            <div class="col-md-8">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                    <ContentTemplate>
                        <asp:ListView ID="ListView1"
                            runat="server"
                            DataSourceID="SqlDataSource1"
                            DataKeyNames="ID_Editora"
                            OnDataBound="OnDataBound"
                            InsertItemPosition="LastItem">
                            <AlternatingItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button runat="server" CssClass="btn btn-default" CommandName="Delete" Text="Eliminar" ID="DeleteButton" />
                                        <asp:Button runat="server" CssClass="btn btn-default" CommandName="Edit" Text="Editar" ID="EditButton" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("ID_Editora") %>' CssClass="control-label" runat="server" ID="ID_EditoraLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Nome") %>' CssClass="control-label" runat="server" ID="NomeLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Descricao") %>' runat="server" ID="DescricaoLabel" /></td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button runat="server" CssClass="btn btn-default" CommandName="Update" Text="Atualizar" ID="UpdateButton" />
                                        <asp:Button runat="server" CssClass="btn btn-default" CommandName="Cancel" Text="Cancelar" ID="CancelButton" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("ID_Editora") %>' runat="server" ID="ID_EditoraLabel1" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("Nome") %>' CssClass="form-control" runat="server" ID="NomeTextBox" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("Descricao") %>' CssClass="form-control" runat="server" ID="DescricaoTextBox" /></td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button runat="server" CssClass="btn btn-default pull-left" CommandName="Insert" Text="Inserir" ID="InsertButton" />
                                        <asp:Button runat="server" CssClass="btn btn-default pull-right" CommandName="Cancel" Text="Limpar" ID="CancelButton" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("Nome") %>' CssClass="form-control" runat="server" ID="NomeTextBox" /></td>
                                    <td>
                                        <asp:TextBox Text='<%# Bind("Descricao") %>' CssClass="form-control" runat="server" ID="DescricaoTextBox" /></td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button runat="server" CssClass="btn btn-default pull-left" CommandName="Delete" Text="Eliminar" ID="DeleteButton" />
                                        <asp:Button runat="server" CssClass="btn btn-default pull-right" CommandName="Edit" Text="Editar" ID="EditButton" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("ID_Editora") %>' runat="server" ID="ID_EditoraLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Descricao") %>' runat="server" ID="DescricaoLabel" /></td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table runat="server" class="table table-hover" id="itemPlaceholderContainer" style="" border="0">
                                                <tr runat="server" style="">
                                                    <th runat="server"></th>
                                                    <th runat="server">Código</th>
                                                    <th runat="server">Nome</th>
                                                    <th runat="server">Descrição</th>
                                                </tr>
                                                <tr></tr>
                                                <tr runat="server" id="itemPlaceholder">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="">
                                            <asp:DataPager runat="server" ID="DataPager1">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                 
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button runat="server" CommandName="Delete" Text="Eliminar" ID="DeleteButton" />
                                        <asp:Button runat="server" CommandName="Edit" Text="Editar" ID="EditButton" />
                                    </td>
                                    <td>
                                        <asp:Label Text='<%# Eval("ID_Editora") %>' runat="server" ID="ID_EditoraLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" /></td>
                                    <td>
                                        <asp:Label Text='<%# Eval("Descricao") %>' runat="server" ID="DescricaoLabel" /></td>
                                </tr>
                            </SelectedItemTemplate>


                        </asp:ListView>
                    </ContentTemplate>

                </asp:UpdatePanel>
                
            </div>
            <div class="col-md-4">
                <h3>Importar dados do autor(csv)</h3>
                <asp:FileUpload ID="FileUpload1" CssClass="btn btn-default" runat="server" />
                <asp:Button ID="btnUpload" CssClass="btn btn-default" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                <br />
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>

                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            </div>
        </div>
    </div>
     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' DeleteCommand="DELETE FROM [Table_Editora] WHERE [ID_Editora] = @ID_Editora" InsertCommand="INSERT INTO [Table_Editora] ([Nome], [Descricao]) VALUES (@Nome, @Descricao)" SelectCommand="SELECT * FROM [Table_Editora] ORDER BY [ID_Editora]" UpdateCommand="UPDATE [Table_Editora] SET [Nome] = @Nome, [Descricao] = @Descricao WHERE [ID_Editora] = @ID_Editora">
            <DeleteParameters>
                <asp:Parameter Name="ID_Editora" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
                <asp:Parameter Name="Descricao" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
                <asp:Parameter Name="Descricao" Type="String"></asp:Parameter>
                <asp:Parameter Name="ID_Editora" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>

     <script>
         $(document).ready(function () {
             $(".search_textbox").keypress(function (event) {
                 var inputValue = event.which;
                 //if digits or not a space then don't let keypress work.
                 if ((inputValue > 47 && inputValue < 58) && (inputValue != 32)) {
                     event.preventDefault();
                 }
             });
         });
         $(function () {
             $('.search_textbox').each(function (i) {

                 $(this).quicksearch("[id*=ListView1] tr:not(:has(th))", {
                     'testQuery': function (query, txt, row) {
                         var indice = i + 1;
                         var stringQuery = query[0].toLowerCase();

                         // The :eq() selector selects an element with a specific index number.
                         var dadoAComparar = $(row).children(":eq(" + (indice+1) + ")").text().toLowerCase();

                         return dadoAComparar.indexOf(stringQuery) != -1;
                     }
                 });
             });


         });
    </script>
</asp:Content>

