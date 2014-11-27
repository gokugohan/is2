<%@ Page Title="Sign up for a new Account" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <asp:SiteMapPath ID="SiteMapPath1" runat="server" DataSourceID="SiteMapDataSource1"></asp:SiteMapPath>
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/Perfil.aspx" ContinueButtonStyle-CssClass="btn btn-success" ContinueButtonType="Link" CancelButtonType="Link" CancelDestinationPageUrl="~/Default.aspx" CreateUserButtonType="Link" DisplayCancelButton="True" Font-Names="Verdana" Font-Size="10pt" CancelButtonText="Cancelar" CreateUserButtonText="Criar utilizador" CompleteSuccessText="&lt;h1&gt;Sua conta foi criada com sucesso.&lt;/h1&gt;" ContinueButtonText="Continuar">
            <ContinueButtonStyle CssClass="btn btn-success" Font-Names="Verdana"></ContinueButtonStyle>
            <CreateUserButtonStyle CssClass="btn btn-success" Font-Names="Verdana" />
            <MailDefinition BodyFileName="~/App_Data/SignUpConfirmation.txt" Subject="Your New Account is created">
            </MailDefinition>
            <TitleTextStyle Font-Bold="True" ForeColor="#FFFFFF"></TitleTextStyle>
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <table class="table table-condensed">
                            <th>
                                <td colspan="3">
                                    <h2 class="control-label text-center">Criar novo utilizador</h2>
                                </td>
                            </th>
                            <tr>
                                <td>
                                    <asp:Label ID="UserNameLabel" CssClass="control-label pull-right" runat="server" AssociatedControlID="UserName">Nome utilizador:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator CssClass="control-label pull-left" ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="PasswordLabel" CssClass="control-label pull-right" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control pull-left" TextMode="Password"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" CssClass="control-label pull-left" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="ConfirmPasswordLabel" CssClass="control-label pull-right" runat="server" AssociatedControlID="ConfirmPassword">Confirme Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="form-control pull-left" TextMode="Password"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" CssClass="control-label pull-left" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="EmailLabel" runat="server" CssClass="control-label pull-right" AssociatedControlID="Email">E-mail:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Email" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="EmailRequired" CssClass="control-label pull-left" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <%--<tr>
                                <td>
                                    <asp:Label ID="QuestionLabel" runat="server" CssClass="control-label pull-right" AssociatedControlID="Question">Security Question:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Question" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" CssClass="control-label pull-left" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="AnswerLabel" runat="server" CssClass="control-label pull-right" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" CssClass="control-label pull-left" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>--%>
                            <tr>
                                <td colspan="3">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="color: Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
            <CancelButtonStyle CssClass="btn btn-success" />
            <HeaderStyle HorizontalAlign="Center" BackColor="Red" Font-Bold="True" ForeColor="#FFFFFF"></HeaderStyle>

            <NavigationButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderWidth="1px" BorderStyle="Solid" Font-Names="Verdana" ForeColor="#284775"></NavigationButtonStyle>

            <SideBarButtonStyle BorderWidth="0px" Font-Names="Verdana" ForeColor="#FFFFFF"></SideBarButtonStyle>

            <SideBarStyle VerticalAlign="Top" BackColor="#7C6F57" BorderWidth="0px" Font-Size="0.9em"></SideBarStyle>

            <StepStyle BorderWidth="0px"></StepStyle>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
