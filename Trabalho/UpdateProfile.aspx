<%@ Page Title="Atualizar perfil" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateProfile.aspx.cs" Inherits="UpdateProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div class="jumbotron">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
         <table class="table table-hover table-bordered">
            <thead>
                <tr>
                    <td colspan="2">
                        <h2>Atualizar o perfil</h2>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <label class="control-label pull-right">Nome:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbNome" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbNome" ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label pull-right">Apelido:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbApelido" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbApelido" ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label pull-right">Número contato:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbNumeroContato" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbNumeroContato" ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label pull-right">Email:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbEmail" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbEmail" ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label pull-right">Rua:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbRua" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbRua" ID="RequiredFieldValidator5" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label pull-right">Codigo postal:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbCodigoPostal" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbCodigoPostal" ID="RequiredFieldValidator6" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label pull-right">Cidade:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbCidade" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbCidade" ID="RequiredFieldValidator7" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="control-label pull-right">País:</label>
                    </td>
                    <td>
                        <asp:TextBox ID="tbPais" CssClass="form-control" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbPais" ID="RequiredFieldValidator8" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    
                    <td></td>
                    <td>
                        <asp:Button ID="btnUpdate" runat="server" Text="Atualizar" OnClick="updateData" CssClass="btn btn-success pull-right" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancelar" OnClick="cancelUpdateData" CssClass="btn btn-success pull-left" />
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
