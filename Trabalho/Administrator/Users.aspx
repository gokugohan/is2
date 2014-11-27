<%@ Page Language="C#" AutoEventWireup="true" Theme="Normal" EnableTheming="true" MasterPageFile="~/Administrator/Admin.master" CodeFile="Users.aspx.cs" Inherits="Users" %>
<%@ MasterType VirtualPath="~/Administrator/Admin.master" %>
<asp:Content runat="server" ContentPlaceHolderID="MenuMain">
    <li>
        <a href="./">Home</a>
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div class="jumbotron" id="jumbotron">
        <div class="row">
            <div class="col-md-4">

                <asp:Button ID="btnMostrarPanelCriarRole" 
                    CssClass="btn btn-default" runat="server" 
                    Text="Criar role" OnClick="btnMostrarPanelCriarRole_Click" 
                     />
                <br />

                <asp:Panel ID="PanelCriarRole" Visible="false" runat="server">
                    <label class="control-label">Nome do role:</label>
                    <asp:TextBox ID="tbRoleName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:Button ID="btnCriarRole" runat="server" Text="Create role" OnClick="btnCriarRole_Click" />
                </asp:Panel>

                <br />

                
                <br />
                <asp:Button ID="btnAddUser" 
                    CssClass="btn btn-default" runat="server" 
                    Text="Adicionar user >>> role" 
                    OnClick="btnAddUser_Click" />

                <asp:Panel ID="PanelUserRole" Visible="false" runat="server">
                    <br />
                    <b>Utilizadores</b>
                    <br />
                    <asp:DropDownList
                        ID="ddlUser"
                        CssClass="form-control" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2"
                        runat="server"
                        ControlToValidate="ddlUser" Text="*"></asp:RequiredFieldValidator>
                    <hr />
                    <b>Roles</b>
                    <br />
                    <asp:DropDownList
                        ID="ddlRoles"
                        CssClass="form-control"
                        runat="server"
                        OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="ddlRoles" Text="*"></asp:RequiredFieldValidator>
                    <br />

                    <asp:Label ID="Label1" CssClass="text-center" runat="server" Font-Size="Larger"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Adicionar" OnClick="Button1_Click" />
                    <hr />
                    <b>Utilizadores pertecentes ao </b>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                    <asp:ListBox ID="LBUsersInRoles" CssClass="form-control" runat="server"></asp:ListBox>
                    <br />

                    <asp:LinkButton ID="btnRemoverUtilizador" 
                        CssClass="btn btn-danger" 
                        runat="server" 
                        OnClick="btnRemoverUtilizador_Click">Remover</asp:LinkButton>
                    <br />
                    <br />
                    
                    <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
                </asp:Panel>

                

            </div>


            <div class="col-md-4">
              
            </div>
        </div>
    </div>
</asp:Content>

