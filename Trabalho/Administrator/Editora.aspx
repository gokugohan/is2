<%@ Page Title="Gerir Editora" Theme="Admin" Language="C#" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Editora.aspx.cs" Inherits="Administrator_Editora_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-8 col-lg-8">
            <div class="panel panel-green">
                <div class="panel panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Lista de editoras</h3>
                </div>
                <div class="panel-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
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
                                            <asp:TextBox Text='<%# Bind("Nome") %>' CssClass="form-control" placeholder="Nome da editora" runat="server" ID="NomeTextBox" /></td>
                                        <td>
                                            <asp:TextBox Text='<%# Bind("Descricao") %>' CssClass="form-control" placeholder="Descrição" runat="server" ID="DescricaoTextBox" /></td>
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
            </div>
        </div>
        <div class="col-md-4 col-lg-4">
            <div class="panel panel-green">
                <div class="panel panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Importar dados do autor</h3>
                </div>
                <div class="panel-body">
                    <asp:FileUpload ID="FileUpload1" CssClass="btn btn-default" runat="server" />
                    <asp:Button ID="btnUpload" CssClass="btn btn-default" runat="server" Text="Upload" OnClick="btnUpload_Click" />
                    <br />
                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>

                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource runat="server" 
        ID="SqlDataSource1" 
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>' 
        DeleteCommand="DELETE FROM [Table_Editora] WHERE [ID_Editora] = @ID_Editora" 
        InsertCommand="INSERT INTO [Table_Editora] ([Nome], [Descricao]) VALUES (@Nome, @Descricao)" 
        SelectCommand="SELECT * FROM [Table_Editora] ORDER BY [ID_Editora]" 
        UpdateCommand="UPDATE [Table_Editora] SET [Nome] = @Nome, [Descricao] = @Descricao WHERE [ID_Editora] = @ID_Editora">
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
    <script src="../Scripts/jquery.quicksearch.js"></script>
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
                        var dadoAComparar = $(row).children(":eq(" + (indice + 1) + ")").text().toLowerCase();
                        return dadoAComparar.indexOf(stringQuery) != -1;
                    }
                });
            });


        });
    </script>
</asp:Content>

