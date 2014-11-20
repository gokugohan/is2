<%@ Page Title="Recuperar a palavra passe" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="RecoveryPassword.aspx.cs" Inherits="RecoveryPassord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="animWrapper">
        <h1>Recuperar a palavra passe</h1>
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" SubmitButtonType="Link" SuccessPageUrl="~/login.aspx" Font-Names="Verdana" Font-Size="10pt">
            <SubmitButtonStyle CssClass="btn btn-success" />
            <TextBoxStyle />
            <MailDefinition Subject="A sua nova password para o site TrabalhoIS2">
            </MailDefinition>
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF"></TitleTextStyle>
            <UserNameTemplate>
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th colspan="3">
                                <h2>Esqueceu-se da palavra passe?</h2>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="3">
                                <label class="control-label">Insira o seu nome utilizador para recuperar a palavra passe.</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="UserNameLabel" CssClass="control-label" runat="server" AssociatedControlID="UserName">Nome utilizador:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="UserNameRequired" CssClass="control-label" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3" style="color: Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:LinkButton ID="SubmitLinkButton" runat="server" CommandName="Submit" CssClass="btn btn-success pull-right" ValidationGroup="PasswordRecovery1">Recuperar</asp:LinkButton>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </UserNameTemplate>
        </asp:PasswordRecovery>
    </div>
</asp:Content>
