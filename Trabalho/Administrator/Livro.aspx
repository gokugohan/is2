<%@ Page Title="Gerir livro" Theme="Normal" Language="C#" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Livro.aspx.cs" Inherits="Administrator_Livro_Default" %>
<%@ MasterType VirtualPath="~/Administrator/Admin.master" %>
<asp:Content runat ="server" ContentPlaceHolderID="MenuMain">
    <li>
        <a href="./">Home</a>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    
    <div class="jumbotron" id="jumbotronContent">
        <div class="row">
           
                    <div class="col-md-6">
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                        <asp:DetailsView
                            ID="DetailsView1" runat="server"
                            CssClass="table table-bordered"
                            AutoGenerateRows="False" 
                            DataKeyNames="ID_Livro" 
                            OnItemInserted="DetailsView1_ItemInserted"
                            DataSourceID="SqlDataSource1" 
                            DefaultMode="Insert">
                            <Fields>
                                <asp:BoundField DataField="ID_Livro" HeaderText="ID_Livro" ReadOnly="True" InsertVisible="False" SortExpression="ID_Livro"></asp:BoundField>
                                <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("ISBN") %>' ID="TextBox6"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("ISBN") %>' ID="TextBox5"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("ISBN") %>' ID="Label6"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Titulo" SortExpression="Titulo">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("Titulo") %>' ID="TextBox1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Titulo") %>' ID="TextBox1"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("Titulo") %>' ID="Label1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Data_Publicacao" SortExpression="Data_Publicacao">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("Data_Publicacao") %>' ID="TextBox2"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="dd-mm-yyyy" Text='<%# Bind("Data_Publicacao") %>' ID="TextBox2"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("Data_Publicacao") %>' ID="Label2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("Categoria") %>' ID="TextBox3"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <%--<asp:TextBox runat="server" Text='<%# Bind("Categoria") %>' ID="TextBox3"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList1"
                                            runat="server" DataSourceID="Categoria"
                                            CssClass="form-control"
                                            SelectedValue='<%# Bind("Categoria") %>'
                                            AppendDataBoundItems="true"
                                            DataTextField="Nome_Categoria" DataValueField="ID_Categoria">
                                            <asp:ListItem Value="-1">Selecionar categoria</asp:ListItem>
                                        </asp:DropDownList>

                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("Categoria") %>' ID="Label3"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Editora" SortExpression="Editora">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("Editora") %>' ID="TextBox4"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <%--<asp:TextBox runat="server" Text='<%# Bind("Editora") %>' ID="TextBox4"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList3" runat="server"
                                            DataSourceID="Editora"
                                            DataTextField="Nome"
                                            CssClass="form-control"
                                            AppendDataBoundItems="true"
                                            SelectedValue='<%# Bind("Editora") %>'
                                            DataValueField="ID_Editora">
                                            <asp:ListItem Value="-1">Selecionar editora</asp:ListItem>
                                        </asp:DropDownList>


                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("Editora") %>' ID="Label4"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Autor" SortExpression="Autor">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("Autor") %>' ID="TextBox5"></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList
                                            ID="DropDownList2"
                                            runat="server"
                                            DataSourceID="Autor"
                                            CssClass="form-control"
                                            SelectedValue='<%# Bind("Autor") %>'
                                            AppendDataBoundItems="true"
                                            DataTextField="Nome" DataValueField="ID_Autor">
                                            <asp:ListItem Value="-1">Selecionar autor</asp:ListItem>
                                        </asp:DropDownList>

                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("Autor") %>' ID="Label5"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <InsertItemTemplate>

                                        <asp:LinkButton
                                            runat="server"
                                            CssClass="btn btn-default" Text="Inserir"
                                            CommandName="Insert"
                                            CausesValidation="True" ID="LinkButton1"> </asp:LinkButton>
                                        <asp:LinkButton
                                            CssClass="btn btn-default"
                                            runat="server" Text="Cancelar"
                                            CommandName="Cancel"
                                            CausesValidation="False" ID="LinkButton2"></asp:LinkButton>

                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" CssClass="btn btn-default" Text="Novo" CommandName="New" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                    </ContentTemplate>
            </asp:UpdatePanel>
                    </div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                      <div class="col-md-12">
                        <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                        <asp:GridView ID="GridView2"
                            runat="server"
                            CssClass="table table-bordered"
                            AutoGenerateColumns="False"
                            DataKeyNames="ID_Livro"
                            DataSourceID="SqlDataSource2"
                            AllowPaging="True"
                            PageSize="5"
                            AllowSorting="True">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1">

                                        </asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="ID_Livro" HeaderText="Código" ReadOnly="True" InsertVisible="False" SortExpression="ID_Livro"></asp:BoundField>
                                <asp:TemplateField HeaderText="ISBN" SortExpression="ISBN">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("ISBN") %>' ID="TextBox1"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("ISBN") %>' ID="Label1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Título" SortExpression="Titulo">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" Text='<%# Bind("Titulo") %>' ID="TextBox2"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("Titulo") %>' ID="Label2"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Data publicação" SortExpression="Data_Publicacao">
                                    <EditItemTemplate>
                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="dd-mm-yyyy" Text='<%# Bind("Data_Publicacao") %>' ID="TextBox3"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%--<asp:Label runat="server" Text='<%# Bind("Data_Publicacao") %>' ID="Label3"></asp:Label>--%>
                                        <asp:Label runat="server" Text='<%# getFormat(Eval("Data_Publicacao")) %>' ID="Label3"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Categoria" SortExpression="Categoria">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox runat="server" Text='<%# Bind("Categoria") %>' ID="TextBox4"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList1"
                                            runat="server" DataSourceID="Categoria"
                                            CssClass="form-control"
                                            SelectedValue='<%# Bind("Categoria") %>'
                                            DataTextField="Nome_Categoria" DataValueField="ID_Categoria">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%--<asp:Label runat="server" Text='<%# Bind("Categoria") %>' ID="Label4"></asp:Label>--%>
                                        <asp:Label runat="server" Text='<%# getAutor(Eval("Categoria")) %>' ID="Label4"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Editora" SortExpression="Editora">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox runat="server" Text='<%# Bind("Editora") %>' ID="TextBox5"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList3" runat="server"
                                            DataSourceID="Editora"
                                            DataTextField="Nome"
                                            CssClass="form-control"
                                            SelectedValue='<%# Bind("Editora") %>'
                                            DataValueField="ID_Editora">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%--<asp:Label runat="server" Text='<%# Bind("Editora") %>' ID="Label5"></asp:Label>--%>
                                        <asp:Label ID="Label7" runat="server" Text='<%# getEditora(Eval("Editora")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Autor" SortExpression="Autor">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox runat="server" Text='<%# Bind("Autor") %>' ID="TextBox6"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList4"
                                            DataTextField="Nome"
                                            DataValueField="ID_Autor"
                                            CssClass="form-control"
                                            SelectedValue='<%# Bind("Autor") %>' runat="server" DataSourceID="Autor"></asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <%--<asp:Label runat="server" Text='<%# Bind("Autor") %>' ID="Label6"></asp:Label>--%>
                                        <asp:Label runat="server" Text='<%# getCategoria(Eval("Autor")) %>' ID="Label5"></asp:Label>                                        
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource runat="server" ID="Categoria" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' SelectCommand="SELECT * FROM [Table_Categoria] ORDER BY [Nome_Categoria]"></asp:SqlDataSource>

                        <asp:SqlDataSource runat="server"
                            ID="Editora"
                            ConnectionString='<%$ ConnectionStrings:OMeuBD %>'
                            SelectCommand="SELECT ID_Editora,Nome FROM [Table_Editora] ORDER BY [Nome]"></asp:SqlDataSource>

                        <asp:SqlDataSource runat="server" ID="Autor"
                            ConnectionString='<%$ ConnectionStrings:OMeuBD %>'
                            SelectCommand="select ID_Autor, Nome+' '+Apelido as 'Nome' from Table_Autor"></asp:SqlDataSource>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' DeleteCommand="DELETE FROM [Table_Livro] WHERE [ID_Livro] = @ID_Livro" InsertCommand="INSERT INTO [Table_Livro] ([ISBN], [Titulo], [Data_Publicacao], [Categoria], [Editora], [Autor]) VALUES (@ISBN, @Titulo, @Data_Publicacao, @Categoria, @Editora, @Autor)" SelectCommand="SELECT * FROM [Table_Livro] ORDER BY [Titulo]" UpdateCommand="UPDATE [Table_Livro] SET [ISBN] = @ISBN, [Titulo] = @Titulo, [Data_Publicacao] = @Data_Publicacao, [Categoria] = @Categoria, [Editora] = @Editora, [Autor] = @Autor WHERE [ID_Livro] = @ID_Livro">
                            <DeleteParameters>
                                <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
                                <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
                                <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
                                <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
                                <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
                  
                
        </div>
    </div>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' DeleteCommand="DELETE FROM [Table_Livro] WHERE [ID_Livro] = @ID_Livro" InsertCommand="INSERT INTO [Table_Livro] ([ISBN], [Titulo], [Data_Publicacao], [Categoria], [Editora], [Autor]) VALUES (@ISBN, @Titulo, @Data_Publicacao, @Categoria, @Editora, @Autor)" SelectCommand="SELECT * FROM [Table_Livro]" UpdateCommand="UPDATE [Table_Livro] SET [ISBN] = @ISBN, [Titulo] = @Titulo, [Data_Publicacao] = @Data_Publicacao, [Categoria] = @Categoria, [Editora] = @Editora, [Autor] = @Autor WHERE [ID_Livro] = @ID_Livro">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
                        <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ISBN" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter DbType="Date" Name="Data_Publicacao"></asp:Parameter>
                        <asp:Parameter Name="Categoria" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Editora" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Autor" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="ID_Livro" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" 
        ID="ViewLivro" 
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>' 
        SelectCommand="SELECT * FROM [View_Livro] ORDER BY [Titulo]"></asp:SqlDataSource>
</asp:Content>

