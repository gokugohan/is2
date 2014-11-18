<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Administrator.master" AutoEventWireup="true" CodeFile="AdminAutor.aspx.cs" Inherits="Administrator_AdminAutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div class="row">
        <div class="col-md-6">
            <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_Autor" DataSourceID="SqlDataSourceAutores" AllowSorting="True" AllowPaging="True">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;
                                            <asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                        </EditItemTemplate>

                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1">
                            </asp:LinkButton>&nbsp;|&nbsp;<asp:LinkButton runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID_Autor" HeaderText="C&#243;digo" ReadOnly="True" SortExpression="ID_Autor"></asp:BoundField>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
                    <asp:BoundField DataField="Apelido" HeaderText="Apelido" SortExpression="Apelido"></asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource runat="server" ID="SqlDataSourceAutores" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' SelectCommand="SELECT * FROM [Table_Autor]" DeleteCommand="DELETE FROM [Table_Autor] WHERE [ID_Autor] = @ID_Autor" InsertCommand="INSERT INTO [Table_Autor] ([ID_Autor], [Nome], [Apelido]) VALUES (@ID_Autor, @Nome, @Apelido)" UpdateCommand="UPDATE [Table_Autor] SET [Nome] = @Nome, [Apelido] = @Apelido WHERE [ID_Autor] = @ID_Autor">
                <DeleteParameters>
                    <asp:Parameter Name="ID_Autor" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID_Autor" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Apelido" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
                    <asp:Parameter Name="Apelido" Type="String"></asp:Parameter>
                    <asp:Parameter Name="ID_Autor" Type="Int32"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <div class="col-md-6">
            
            <asp:Panel ID="PanelAdicionarAutorDetailsView" runat="server">
                <asp:DetailsView ID="DetailsView1" CssClass="table table-hover table-bordered" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ID_Autor" DataSourceID="SqlDataSourceAutores" DefaultMode="Insert">
                    <Fields>
                        <asp:BoundField DataField="ID_Autor" HeaderText="Codigo" ReadOnly="True" SortExpression="ID_Autor"></asp:BoundField>
                        <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
                        <asp:BoundField DataField="Apelido" HeaderText="Apelido" SortExpression="Apelido"></asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CssClass="btn btn-default" CommandName="Insert" Text="Inserir"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CssClass="btn btn-default" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

