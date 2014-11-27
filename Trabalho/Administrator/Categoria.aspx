<%@ Page Title="Categoria" Language="C#" Theme="Normal" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Categoria.aspx.cs" Inherits="Administrator_Categoria_Default" %>
<%@ MasterType VirtualPath="~/Administrator/Admin.master" %>

<asp:Content runat ="server" ContentPlaceHolderID="MenuMain">
    <li>
        <a href="./">Home</a>
    </li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div class="jumbotron" id="jumbotronContent">
    <div class="row">
        <div class="col-md-8">
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ID_Categoria" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Delete" CssClass="btn btn-default" Text="Eliminar" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" CssClass="btn btn-default" Text="Editar" ID="EditButton" />
                </td>
                
                <td>
                    <asp:Label CssClass="control-label" Text='<%# Eval("Nome_Categoria") %>' runat="server" ID="Nome_CategoriaLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CssClass="btn btn-default" CommandName="Update" Text="Atualizar" ID="UpdateButton" />
                    <asp:Button runat="server" CssClass="btn btn-default" CommandName="Cancel" Text="Cancelar" ID="CancelButton" />
                </td>
                
                <td>
                    <asp:TextBox CssClass="control-label" Text='<%# Bind("Nome_Categoria") %>' runat="server" ID="Nome_CategoriaTextBox" /></td>
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
                    <asp:Button runat="server" CssClass="btn btn-default" CommandName="Insert" Text="Inserir" ID="InsertButton" />
                    <asp:Button runat="server" CssClass="btn btn-default" CommandName="Cancel" Text="Limpar" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox CssClass="form-control" Text='<%# Bind("Nome_Categoria") %>' runat="server" ID="Nome_CategoriaTextBox" /></td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button CssClass="btn btn-default" runat="server" CommandName="Delete" Text="Eliminar" ID="DeleteButton" />
                    <asp:Button CssClass="btn btn-default" runat="server" CommandName="Edit" Text="Editar" ID="EditButton" />
                </td>
                
                <td>
                    <asp:Label CssClass="control-label" Text='<%# Eval("Nome_Categoria") %>' runat="server" ID="Nome_CategoriaLabel" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table class="table" runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table class="table" runat="server" id="itemPlaceholderContainer" style="" border="0">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                               
                                <th runat="server">Categoria</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                <asp:NumericPagerField></asp:NumericPagerField>
                                <asp:NextPreviousPagerField ButtonType="Button" ButtonCssClass="btn btn-default" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button CssClass="btn btn-default" runat="server" CommandName="Delete" Text="Eliminar" ID="DeleteButton" />
                    <asp:Button CssClass="btn btn-default" runat="server" CommandName="Edit" Text="Editar" ID="EditButton" />
                </td>
                <td>
                    <asp:Label CssClass="control-label" Text='<%# Eval("ID_Categoria") %>' runat="server" ID="ID_CategoriaLabel" /></td>
                <td>
                    <asp:Label CssClass="control-label" Text='<%# Eval("Nome_Categoria") %>' runat="server" ID="Nome_CategoriaLabel" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
        </div>
    </div>
    
  </div>
   
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:OMeuBD %>' DeleteCommand="DELETE FROM [Table_Categoria] WHERE [ID_Categoria] = @ID_Categoria" InsertCommand="INSERT INTO [Table_Categoria] ([Nome_Categoria]) VALUES (@Nome_Categoria)" SelectCommand="SELECT * FROM [Table_Categoria] ORDER BY [Nome_Categoria]" UpdateCommand="UPDATE [Table_Categoria] SET [Nome_Categoria] = @Nome_Categoria WHERE [ID_Categoria] = @ID_Categoria">
        <DeleteParameters>
            <asp:Parameter Name="ID_Categoria" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nome_Categoria" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome_Categoria" Type="String"></asp:Parameter>
            <asp:Parameter Name="ID_Categoria" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

