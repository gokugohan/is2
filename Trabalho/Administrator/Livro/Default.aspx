<%@ Page Title="Gerir livro" Theme="Normal" Language="C#" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administrator_Livro_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomMenuContentPlaceHolder" Runat="Server">
    <li>
        <a href="../">Home</a>
    </li>
    <li>
        <a href="../Autor">Gerir Autor</a>
    </li>
    <li>
        <a href="../Editora">Gerir Editora</a>
    </li>
    <li>
        <a href="./">Gerir Livro</a><!-- gerir também a categoria do livro -->
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
<script src="../../Scripts/bootstrap.min.js"></script><script src="../../Scripts/jquery-2.1.1.js"></script>
    <div class="jumbotron" id="jumbotronContent">
        <div class="row">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="col-md-4">

                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID_Livro" 
                            DataSourceID="SqlDataSource1" AllowPaging="True">
                            <EditItemTemplate>
                                <table class="table table-bordered">
                                    <tr>
                                        <td><label class="control-label pull-right">ID_Livro</label></td>
                                        <td><asp:Label CssClass="form-control" Text='<%# Eval("ID_Livro") %>' runat="server" ID="ID_LivroLabel1" /></td>
                                    </tr>
                                    <tr>
                                        <td><label class="control-label pull-right">ISBN</label></td>
                                        <td><asp:Label CssClass="form-control" Text='<%# Eval("ISBN") %>' runat="server" ID="ISBNTextBox" /></td>
                                    </tr>
                                    <tr>
                                        <td><label class="control-label pull-right">Titulo</label></td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Titulo") %>' runat="server" ID="TituloTextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Data publicação</label></td>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Data_Publicacao") %>' runat="server" ID="Data_PublicacaoTextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Editora</label></td>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" 
                                                CssClass="form-control"
                                                runat="server" 
                                                DataSourceID="EditoraDataSource"
                                                 DataTextField="Nome" 
                                                DataValueField="ID_Editora"
                                                SelectedValue='<%# Bind("Editora") %>'
                                                AppendDataBoundItems="True">
                                                <asp:ListItem Value="-1">Seleciona editora</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Autor</label></td>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                                DataSourceID="AutorDataSource" 
                                                DataTextField="Nome completo" 
                                                SelectedValue='<%# Bind("Autor") %>'
                                                DataValueField="ID_Autor"
                                                CssClass="form-control"
                                                AppendDataBoundItems="true"
                                                >
                                                <asp:ListItem Value="-1">Seleciona autor</asp:ListItem>

                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                             <label class="control-label pull-right">Imagem</label></td>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Imagem") %>' runat="server" ID="ImagemTextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                                        </td>
                                    </tr>
                                </table>
                       
                                
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                Não tem nada lol...
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <table class="table table-bordered">
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">ISBN</label>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Text='<%# Bind("ISBN") %>' runat="server" ID="ISBNTextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Titulo</label>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Titulo") %>' runat="server" ID="TituloTextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Data publicação</label>
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Data_Publicacao") %>' runat="server" ID="Data_PublicacaoTextBox" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Editora</label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" 
                                                CssClass="form-control"
                                                runat="server" 
                                                DataSourceID="EditoraDataSource"
                                                 DataTextField="Nome" 
                                                DataValueField="ID_Editora"
                                                SelectedValue='<%# Bind("Editora") %>'
                                                AppendDataBoundItems="True">
                                                <asp:ListItem Value="-1">Seleciona editora</asp:ListItem>
                                            </asp:DropDownList>
                                            
                                            <%--<asp:TextBox CssClass="form-control" Text='<%# Bind("Editora") %>' runat="server" ID="EditoraTextBox" />--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Autor</label>
                                        </td>
                                        <td>
                                            <%--<asp:TextBox CssClass="form-control" Text='<%# Bind("Autor") %>' runat="server" ID="AutorTextBox" />--%>
                                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                                DataSourceID="AutorDataSource" 
                                                DataTextField="Nome completo" 
                                                SelectedValue='<%# Bind("Autor") %>'
                                                DataValueField="ID_Autor"
                                                CssClass="form-control"
                                                AppendDataBoundItems="true"
                                                >
                                                <asp:ListItem Value="-1">Seleciona autor</asp:ListItem>

                                            </asp:DropDownList>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Imagem</label>
                                        </td>
                                        <td>
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                            <asp:TextBox CssClass="form-control" Text='<%# Bind("Imagem") %>' runat="server" ID="ImagemTextBox" /><br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <asp:LinkButton CssClass="btn btn-default pull-left" runat="server" Text="Inserir"
                                                CommandName="Insert" ID="InsertButton"
                                                CausesValidation="True" />
                                            <asp:LinkButton CssClass="btn btn-default pull-right" runat="server" Text="Cancelar"
                                                CommandName="Cancel" ID="InsertCancelButton"
                                                CausesValidation="False" />
                                        </td>
                                    </tr>
                                </table>

                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">ID_Livro</label>
                                        </td>
                                        <td>
                                            <asp:Label CssClass="control-label" Text='<%# Eval("ID_Livro") %>' runat="server" ID="ID_LivroLabel" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">ISBN</label>
                                        </td>
                                        <td>
                                            <asp:Label CssClass="control-label" Text='<%# Eval("ISBN") %>' runat="server" ID="ISBNLabel" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Titulo</label>
                                        </td>
                                        <td>
                                            <asp:Label CssClass="control-label" Text='<%# Eval("Titulo") %>' runat="server" ID="TituloLabel" />
                                        </td>
                                    </tr>

                                     <tr>
                                        <td>
                                            <label class="control-label pull-right">Data publicação</label>
                                        </td>
                                        <td>
                                            <asp:Label CssClass="control-label" Text='<%# Eval("Data_Publicacao") %>' runat="server" ID="Data_PublicacaoLabel" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Editora</label>
                                        </td>
                                        <td>
                                            <asp:Label CssClass="control-label" Text='<%# Eval("Editora") %>' runat="server" ID="EditoraLabel" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Autor</label>
                                        </td>
                                        <td>
                                            <asp:Label CssClass="control-label" Text='<%# Eval("Autor") %>' runat="server" ID="AutorLabel" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label class="control-label pull-right">Imagem</label>
                                        </td>
                                        <td>
                                            <asp:Label CssClass="control-label" Text='<%# Eval("Imagem") %>' runat="server" ID="ImagemLabel" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
                                            &nbsp;
                                            <asp:LinkButton runat="server" Text="Delete" CommandName="Delete" ID="DeleteButton" CausesValidation="False" />
                                            &nbsp;<asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                    </div>
                
                    <div class="col-md-8">
                        <h2>Mostrar dados livros</h2>
                        <ul>
                            <li>ISBN do livro</li>
                            <li>Título do livro</li>
                            <li>Data publicação do livro</li>
                            <li>Imagem do livro</li>
                            <li>Categoria do livro</li>
                            <li>Autor do livro</li>
                            <li>Editora do livro</li>
                        </ul>
                        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
        <asp:SqlDataSource runat="server" ID="EditoraDataSource" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' SelectCommand="SELECT [ID_Editora], [Nome] FROM [Table_Editora]"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="AutorDataSource" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' SelectCommand="SELECT ID_Autor, Nome + '  ' + Apelido AS 'Nome completo' FROM Table_Autor"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConflictDetection="CompareAllValues" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' DeleteCommand="DELETE FROM [Table_Livro] WHERE [ID_Livro] = @original_ID_Livro AND [ISBN] = @original_ISBN AND [Titulo] = @original_Titulo AND (([Data_Publicacao] = @original_Data_Publicacao) OR ([Data_Publicacao] IS NULL AND @original_Data_Publicacao IS NULL)) AND [Editora] = @original_Editora AND [Autor] = @original_Autor AND (([Imagem] = @original_Imagem) OR ([Imagem] IS NULL AND @original_Imagem IS NULL))" InsertCommand="INSERT INTO [Table_Livro] ([ISBN], [Titulo], [Data_Publicacao], [Editora], [Autor], [Imagem]) VALUES (@ISBN, @Titulo, @Data_Publicacao, @Editora, @Autor, @Imagem)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Table_Livro]" UpdateCommand="UPDATE [Table_Livro] SET [ISBN] = @ISBN, [Titulo] = @Titulo, [Data_Publicacao] = @Data_Publicacao, [Editora] = @Editora, [Autor] = @Autor, [Imagem] = @Imagem WHERE [ID_Livro] = @original_ID_Livro AND [ISBN] = @original_ISBN AND [Titulo] = @original_Titulo AND (([Data_Publicacao] = @original_Data_Publicacao) OR ([Data_Publicacao] IS NULL AND @original_Data_Publicacao IS NULL)) AND [Editora] = @original_Editora AND [Autor] = @original_Autor AND (([Imagem] = @original_Imagem) OR ([Imagem] IS NULL AND @original_Imagem IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ID_Livro" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_ISBN" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_Data_Publicacao"></asp:Parameter>
                        <asp:Parameter Name="original_Editora" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Autor" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Imagem" Type="String"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
                        <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Imagem" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
                        <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Imagem" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_ID_Livro" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_ISBN" Type="String"></asp:Parameter>
                        <asp:Parameter Name="original_Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="original_Data_Publicacao"></asp:Parameter>
                        <asp:Parameter Name="original_Editora" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Autor" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="original_Imagem" Type="String"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
    </div>
        
   
</asp:Content>

