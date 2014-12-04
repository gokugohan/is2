<%@ Page Title="Mudar a palavra passe" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="AlterarSenha.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <div class="jumbotron">
            <asp:LoginView ID="LoginView1" runat="server">
                <LoggedInTemplate>
                    <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="~/Perfil.aspx">
                        <ChangePasswordTemplate>
                            <table class="table table-condensed">
                                <thead>
                                    <th>
                                        <td colspan="3">
                                            <label class="control-label">Alterar a senha </label>
                                        </td>
                                    </th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" CssClass="control-label" AssociatedControlID="CurrentPassword" ID="CurrentPasswordLabel">Senha atual:</asp:Label></td>
                                        </td>
                                    <td>
                                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" ID="CurrentPassword"></asp:TextBox>
                                    </td>
                                        <td>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Campo obrigatório." ValidationGroup="ChangePassword1" ForeColor="Red" ToolTip="Campo obrigatório." ID="CurrentPasswordRequired">Campo obrigatório</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <asp:Label runat="server" CssClass="control-label" AssociatedControlID="NewPassword" ID="NewPasswordLabel">Nova senha:</asp:Label></td>
                                        </td>
                                    <td>
                                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" ID="NewPassword"></asp:TextBox>
                                    </td>
                                        <td>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword" ErrorMessage="Campo obrigatório." ValidationGroup="ChangePassword1" ForeColor="Red" ToolTip="Campo obrigatório." ID="NewPasswordRequired">Campo obrigatório</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" CssClass="control-label" AssociatedControlID="ConfirmNewPassword" ID="ConfirmNewPasswordLabel">Confirma a nova senha:</asp:Label></td>
                                        </td>
                                    <td>
                                        <asp:TextBox runat="server" CssClass="form-control" TextMode="Password" ID="ConfirmNewPassword"></asp:TextBox>
                                    </td>
                                        <td>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Campo obrigatório." ValidationGroup="ChangePassword1" ForeColor="Red" ToolTip="Campo obrigatório." ID="ConfirmNewPasswordRequired">Campo obrigatório</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" ErrorMessage="A nova senha diferente da senha comfirmada." Display="Dynamic" ValidationGroup="ChangePassword1" ID="NewPasswordCompare"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="color: Red;">
                                            <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button runat="server" CssClass="btn btn-success pull-right" CommandName="ChangePassword" Text="Alterar senha" ValidationGroup="ChangePassword1" ID="ChangePasswordPushButton"></asp:Button>
                                        </td>
                                        <td>
                                            <asp:Button runat="server" CssClass="btn btn-success pull-right" CausesValidation="False" CommandName="Cancel" Text="Cancelar" ID="CancelPushButton"></asp:Button>
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </ChangePasswordTemplate>
                    </asp:ChangePassword>
                </LoggedInTemplate>
                <AnonymousTemplate>
                    <asp:Login ID="Login1" runat="server">
                        <LayoutTemplate>
                            <table class="table table-condensed">
                                <thead>
                                    <th colspan="2">
                                        <label class="control-label">Log in</label>
                                    </th>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="control-label" ID="UserNameLabel">User Name:</asp:Label></td>
                                        </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="UserName" CssClass="form-control"></asp:TextBox>
                                    </td>
                                        <td>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ValidationGroup="Login1" ToolTip="User Name is required." ID="UserNameRequired">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label runat="server" AssociatedControlID="Password" ID="PasswordLabel" CssClass="control-label">Password:</asp:Label></td>
                                        </td>
                                    <td>
                                        <asp:TextBox runat="server" TextMode="Password" ID="Password" CssClass="form-control"></asp:TextBox>
                                    </td>
                                        <td>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ValidationGroup="Login1" ToolTip="Password is required." ID="PasswordRequired">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color: Red;">
                                            <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button runat="server" CommandName="Login" Text="Log In" CssClass="btn btn-success pull-right" ValidationGroup="Login1" ID="LoginButton"></asp:Button>
                                        </td>
                                    </tr>
                                </tbody>

                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </AnonymousTemplate>
            </asp:LoginView>
        </div>
    </div>
</asp:Content>


