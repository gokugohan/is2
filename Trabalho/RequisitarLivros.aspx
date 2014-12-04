<%@ Page Title="Requisitar livro" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="RequisitarLivros.aspx.cs" Inherits="RequisitarLivros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <div class="jumbotron">
            <h2><asp:Label ID="Label1" Text="Hello world" runat="server"></asp:Label></h2>
            <asp:Panel ID="PanelLivroByCodigo" runat="server">
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:Panel ID="PanelTabelaDetailLivro" runat="server">
                            <table class="table table-bordered">
                                <tr>
                                    <td>
                                        <label>Código</label></td>
                                    <td>
                                        <asp:Label ID="lblCodigo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>ISBN</label></td>
                                    <td>
                                        <asp:Label ID="lblISBN" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Título</label></td>
                                    <td>
                                        <asp:Label ID="lblTitulo" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Data publicação</label></td>
                                    <td>
                                        <asp:Label ID="lblDataPub" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Categoria</label></td>
                                    <td>
                                        <asp:Label ID="lblCategoria" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Editora</label></td>
                                    <td>
                                        <asp:Label ID="lblEditora" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Autor</label></td>
                                    <td>
                                        <asp:Label ID="lblAutor" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="btnConfirmar" OnClientClick="return window.confirm('Atam pah, vais requisitar ou não, andaaa');" OnClick="btnConfirmar_Click" CssClass="btn btn-default" runat="server" Text="confirmar requisição" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
                        <asp:Panel ID="PanelMensagem" runat="server">
                            <div class="panel panel-default">
                                <div class="panel panel-heading">
                                    <h3 class="page-title">
                                        <asp:Label ID="lblTituloPanel" runat="server" 
                                            Text="Livros que já foram requsitados">                                            
                                        </asp:Label>

                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <asp:GridView ID="GridView2"
                                        runat="server"
                                        AutoGenerateColumns="False"
                                        OnRowDataBound="GridView2_RowDataBound">
                                        <Columns>
                                            <asp:BoundField DataField="Nome" HeaderText="Nome" ReadOnly="True" SortExpression="Nome"></asp:BoundField>
                                            <asp:BoundField DataField="IDLogin" HeaderText="IDLogin" SortExpression="IDLogin"></asp:BoundField>
                                            <asp:BoundField DataField="Titulo" HeaderText="Título" SortExpression="Titulo"></asp:BoundField>
                                            <asp:BoundField DataField="Autor" HeaderText="Autor" ReadOnly="True" SortExpression="Autor"></asp:BoundField>
                                            <asp:BoundField DataField="Editora" HeaderText="Editora" SortExpression="Editora"></asp:BoundField>
                                            <asp:BoundField DataField="dataEmprestimo" HeaderText="Data emprestimo" SortExpression="dataEmprestimo"></asp:BoundField>
                                            <asp:BoundField DataField="dateDevolucao" HeaderText="Data devolução" SortExpression="dateDevolucao"></asp:BoundField>

                                            <asp:TemplateField HeaderText="Dias faltas">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFalta" runat="server" Text="Label"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            
                        </asp:Panel>
                    </LoggedInTemplate>
                </asp:LoginView>
                
            </asp:Panel>
           <a href="../" class="btn btn-link">Voltar</a>
        </div>
    </div>
</asp:Content>


