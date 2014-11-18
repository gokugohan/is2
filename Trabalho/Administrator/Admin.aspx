<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    
    <div class="row">
        <div class="col-md-4">
            <!-- 
                - Livros,
                - Editoras,
                - Autores
                - Categoria

                Página admin deve existir links para;
                    - Criar: Autor, Editora, Livro, Categoria
            -->

            <table class="table table-responsive">
                <tr>
                    <td>
                        <asp:Button ID="btnMostrarListaDeEditoras" runat="server" CssClass="btn btn-default" Text="Mostrar editoras" />
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnInserirEditora" runat="server" CssClass="btn btn-default" Text="Inserir editora" />
                    </td>
                </tr>
            </table>

            <table class="table table-responsive">
                <tr>
                    <td>
                        <asp:Button ID="btnMostrarListaDeLivros" runat="server" CssClass="btn btn-default" Text="Mostrar livros" />
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnInserirLivros" runat="server" CssClass="btn btn-default" Text="Inserir livro" />
                    </td>
                </tr>
            </table>

            <ul>
                <li>Utilizador
                </li>
                <li>Autor do livro
                </li>
                <li>Editora do livro
                </li>
                <li>Livro
                </li>
                <li>Categoria do livro
                </li>
            </ul>
        </div>

        <div class="col-md-6">
            <div>
            </div>

        </div>

    </div>
    
</asp:Content>

