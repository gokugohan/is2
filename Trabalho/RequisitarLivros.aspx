<%@ Page Title="Requisitar livro" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="RequisitarLivros.aspx.cs" Inherits="RequisitarLivros" %>

<%@ OutputCache Duration="5" VaryByParam="codigo" VaryByCustom="browser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <div class="jumbotron">
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

                    <asp:Panel ID="PanelMensagem" runat="server">
                        <asp:Label ID="lblMensagem" runat="server">

                        </asp:Label>
                    </asp:Panel>
                </LoggedInTemplate>
            </asp:LoginView>
            <a href="./" class="btn btn-link">Voltar</a>
        </div>
    </div>
</asp:Content>


