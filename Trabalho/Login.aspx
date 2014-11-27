<%@ Page Title="Log in" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <div class="row">
            <div class="col-md-12">
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <h3>Está logado como "<asp:LoginName ID="LoginName1" runat="server" /></h3>
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <asp:Login ID="Login1" runat="server"
                            CreateUserText="Sign up for a new account"
                            CreateUserUrl="~/SignUp"
                            DestinationPageUrl="~/"
                            RememberMeSet="True"
                            LoginButtonType="Link"
                            LoginButtonStyle-CssClass="btn btn-success"
                            PasswordRecoveryText="Recover password!"
                            PasswordRecoveryUrl="~/RecoveryPassword.aspx" Font-Names="Verdana" Font-Size="10pt">
                            <LayoutTemplate>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th colspan="3">
                                                <h2 class="pull-left">Log in</h2>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label ID="UserNameLabel" CssClass="control-label" runat="server" AssociatedControlID="UserName">Nome Utilizador:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator CssClass="control-label" ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Campo obrigatório!" ToolTip="Campo obrigatório!" ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="PasswordLabel" CssClass="control-label" runat="server" AssociatedControlID="Password">Palavra passe:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" CssClass="control-label" runat="server" ControlToValidate="Password" ErrorMessage="Campo obrigatório!" ToolTip="Campo obrigatório!" ValidationGroup="ctl00$Login1">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:CheckBox ID="RememberMe" CssClass="control-label pull-right" runat="server" Checked="True" Text="Lembra-me da próxima vez." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="color: Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:LinkButton ID="LoginLinkButton" runat="server" CommandName="Login" CssClass="btn btn-success" ValidationGroup="ctl00$Login1">Log In</asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:HyperLink ID="CreateUserLink" CssClass="pull-left" runat="server" NavigateUrl="~/SignUp.aspx">Registar a nova conta</asp:HyperLink>
                                                <asp:HyperLink ID="PasswordRecoveryLink" runat="server" CssClass="pull-right" NavigateUrl="~/RecoveryPassword.aspx">Recuperar a palavra passe!</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </LayoutTemplate>
                            <LoginButtonStyle CssClass="btn btn-success" />
                            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF"></TitleTextStyle>
                        </asp:Login>
                    </AnonymousTemplate>
                </asp:LoginView>


            </div>
        </div>
    </div>
</asp:Content>


