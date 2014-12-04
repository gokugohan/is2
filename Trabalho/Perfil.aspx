<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Perfil.aspx.cs" Inherits="MyProfiel" %>

<%@ Register Src="~/Control/MenuUbuntu.ascx" TagPrefix="Adds" TagName="MenuUbuntu" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <div class="row">
            <div class="col-md-6 col-lg-6">
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:Panel ID="PanelFormPerfil" runat="server">
                            <asp:Wizard ID="Wizard1" runat="server" 
                                FinishDestinationPageUrl="~/Perfil.aspx" 
                                CancelDestinationPageUrl="~/Default.aspx" 
                                 FinishCompleteButtonText="Submeter" 
                                FinishPreviousButtonText="Anterior"
                                StartNextButtonText="Próximo" 
                                StepNextButtonText="Próximo" 
                                StepPreviousButtonText="Anterior"
                                CancelButtonText="Cancelar" 
                                DisplayCancelButton="True"
                                DisplaySideBar="False"
                                SkinID="WizardStyle"
                                OnNextButtonClick="Wizard1_NextButtonClick"
                                OnFinishButtonClick="Wizard1_FinishButtonClick"
                                >
                                <WizardSteps>
                                    <asp:WizardStep ID="WizardStep1" Title="Nome e contato" runat="server">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th colspan="3">
                                                        <p>Completa o seu perfil.</p>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <label class="control-label" for="tbNome">Nome:</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="tbNome" 
                                                            
                                                            runat="server"></asp:TextBox></td>
                                                    <td>
                                                        <asp:RegularExpressionValidator 
                                                            ID="RegularExpressionValidator3" runat="server" 
                                                            ControlToValidate="tbNome"
                                                            ValidationExpression="^[a-zA-Z\s]*$"
                                                            ForeColor="Red"
                                                            ErrorMessage="Apenas letras"></asp:RegularExpressionValidator>
                                                         <asp:RequiredFieldValidator 
                                                             ID="RequiredFieldValidator1" 
                                                             runat="server" 
                                                             ForeColor="Red" 
                                                             ControlToValidate="tbNome" 
                                                             Display="Dynamic"
                                                             ErrorMessage="Campo obrigatório!">*</asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="control-label" for="tbApelido">Apelido:</label></td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control" ID="tbApelido" 
                                                            runat="server"></asp:TextBox></td>
                                                    <td>
                                                        <asp:RegularExpressionValidator 
                                                            ID="RegularExpressionValidator4" runat="server" 
                                                            ControlToValidate="tbApelido"
                                                            ValidationExpression="^[a-zA-Z\s]*$"
                                                            ForeColor="Red"
                                                            ErrorMessage="Apenas letras"></asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator 
                                                            ID="RequiredFieldValidator2" 
                                                            runat="server" 
                                                            ForeColor="Red" 
                                                            ControlToValidate="tbApelido" 
                                                            ErrorMessage="Campo obrigatório!!">*</asp:RequiredFieldValidator>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label class="control-label" for="tbNumeroContato">Numero contato:</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox CssClass="form-control"
                                                            placeholder="000-000-000" 
                                                            ID="tbNumeroContato" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                                            runat="server" ErrorMessage="Número contato inválido"
                                                            ControlToValidate="tbNumeroContato"
                                                            ForeColor="Red"
                                                            ValidationExpression="^(9[1236]{1}[0-9]{1})-([0-9]{3})-([0-9]{3})$">
                                                        </asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator3"
                                                            runat="server"
                                                            ForeColor="Red"
                                                            ControlToValidate="tbNumeroContato"
                                                            ErrorMessage="Campo obrigatório!!">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tfoot>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:ValidationSummary 
                                                            ID="ValidationSummary2"
                                                            HeaderText="Erro..."
                                                            ShowMessageBox="false"
                                                            DisplayMode="BulletList"
                                                            Enabled="true"
                                                            ForeColor="Red"
                                                            ShowSummary="true"
                                                             runat="server" />
                                                    </td>
                                                </tr>
                                            </tfoot>
                                            </tbody>
                                        </table>
                                    </asp:WizardStep>
                                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Morada">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th colspan="2">
                                                        <p>Completa o seu perfil.</p>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <label for="tbRua" class="control-label">Rua:</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbRua" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                                            runat="server" 
                                                            ForeColor="Red" ControlToValidate="tbRua" 
                                                            ErrorMessage="Campo obrigatório!!">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="tbCodigoPostal">Código postal</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbCodigoPostal" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                                            runat="server" 
                                                            ControlToValidate="tbCodigoPostal"
                                                            ErrorMessage="Código postal inválido"
                                                            ValidationExpression="^\d{4}-\d{3}$"
                                                            ></asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                                                            runat="server" ForeColor="Red" 
                                                            ControlToValidate="tbCodigoPostal" 
                                                            ErrorMessage="Campo obrigatório!!">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="tbCidade">Cidade</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbCidade" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                     <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                                                            runat="server" ForeColor="Red" 
                                                            ControlToValidate="tbCidade" 
                                                            ErrorMessage="Campo obrigatório!!">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <label for="tbPais">País</label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="tbPais" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" 
                                                             
                                                            runat="server" ForeColor="Red" 
                                                            ControlToValidate="tbPais" 
                                                            ErrorMessage="Campo obrigatório!!">*</asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:ValidationSummary 
                                                            ID="ValidationSummary1"
                                                            HeaderText=""
                                                            ShowMessageBox="false"
                                                            DisplayMode="BulletList"
                                                            Enabled="true"
                                                            ForeColor="Red"
                                                            ShowSummary="true"
                                                             runat="server" />
                                                    </td>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </asp:WizardStep>
                                </WizardSteps>
                            </asp:Wizard>
                        </asp:Panel>
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <p>Tem que fazer <b>log in</b> para visualizar/atualizar o seu perfil, caso contrário, <a href="SignUp">cria novo utilizador</a> ou faz o <a href="Login">login.</a></p>
                    </AnonymousTemplate>
                </asp:LoginView>
            </div>
            
            <div class="col-md-6 col-lg-6">
                <asp:Panel ID="PanelDadosPerfil" runat="server">
                    <table class="table">
                    <thead>
                        <tr>
                            <td colspan="2">
                                <h2>O meu perfil</h2>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <label class="control-label pull-right">Nome utilizador:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblUserName"  runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label pull-right">Nome completo:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblNomeCompleto" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label pull-right">Número contato:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblNumContato" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label pull-right">Email:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label pull-right">Rua:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblRua" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label pull-right">Codigo postal:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblCodigoPostal" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label pull-right">Cidade:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblCidade" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label pull-right">País:</label>
                            </td>
                            <td>
                                <asp:Label ID="lblPais" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="UpdateProfile" class="btn btn-info pull-right">Atualizar o perfil</a>
                            </td>
                            <td>
                                <a href="AlterarSenha" class="btn btn-info">Alterar a senha</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </asp:Panel>
                
            </div>
        </div>
       
    </div>
    <hr />
    <br />
    <div>
        
    </div>
    <script type="text/javascript">

        //http://www.codeproject.com/Questions/670019/Textbox-accept-only-numbers-using-java-script

        function validarTexto(key) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            //comparing pressed keycodes
            
            if ((keycode >= 42 && keycode <= 57) || keycode ==171 || keycode == 92) {
                return false;
            }
            return true;
        }
        
        function validarDigito(key) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            console.log(keycode);
            //comparing pressed keycodes
            if (keycode > 31 && (keycode < 48 || keycode > 57)) {
                return false;
            }
            else return true;
        }

        function _(id) {
            return document.getElementById(id);
        }
    </script>
</asp:Content>
