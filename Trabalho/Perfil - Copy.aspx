<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Perfil - Copy.aspx.cs" Inherits="MyProfiel" %>

<%@ Register Src="~/Control/MenuUbuntu.ascx" TagPrefix="Adds" TagName="MenuUbuntu" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    <div id="animWrapper">
        <div class="row">
            
            <div class="col-md-4 col-lg-4">
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <asp:Panel ID="PanelFormPerfil" runat="server">

                            <asp:MultiView ID="MultiView1" runat="server">
                                <asp:View ID="View1" runat="server">
                                    <table class="table">
                                        <thead>
                                            <th>
                                                <td colspan="3">
                                                    <p>Completa o seu perfil.</p>
                                                </td>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <label class="control-label" for="tbNome">Nome:</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="tbNome" onkeypress="return validarTexto(event);" runat="server"></asp:TextBox></td>
                                                <td>
                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="PerfilValidation" runat="server" ControlToValidate="tbNome" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>--%></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="control-label" for="tbApelido">Apelido:</label></td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="tbApelido" onkeypress="return validarTexto(event);" runat="server"></asp:TextBox></td>
                                                <td>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="PerfilValidation" runat="server" ControlToValidate="tbApelido" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>--%>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="control-label" for="tbNumeroContato">Numero contato:</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox CssClass="form-control" ID="tbNumeroContato" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="PerfilValidation" runat="server" ControlToValidate="tbNumeroContato" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>--%>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td colspan="2">
                                                    <asp:Button CssClass="btn btn-default pull-right" ID="btnNomeApelidoNumEmail" runat="server" Text="próximo" OnClick="proximo" ValidationGroup="PerfilValidation" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                </asp:View>

                                <asp:View ID="View2" runat="server">
                                    <table class="table">
                                        <thead>
                                            <th>
                                                <td colspan="2">
                                                    <p>Completa o seu perfil.</p>
                                                </td>
                                            </th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <label for="tbRua" class="control-label">Rua:</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbRua" CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="tbCodigoPostal">Código postal</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbCodigoPostal" CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="tbCidade">Cidade</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbCidade" CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="tbPais">País</label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbPais" CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button CssClass="btn btn-default pull-left" ID="btnAnterior" runat="server" Text="anterior" OnClick="anterior" />
                                                </td>
                                                <td>
                                                    <asp:Button CssClass="btn btn-default pull-right" ID="btnFim" runat="server" Text="Submeter" OnClick="fim" ValidationGroup="PerfilValidation" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </asp:View>

                            </asp:MultiView>
                        </asp:Panel>

                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <p>Tem que fazer <b>log in</b> para visualizar/atualizar o seu perfil, caso contrário, <a href="SignUp">cria novo utilizador</a> ou faz o <a href="Login">login.</a></p>
                    </AnonymousTemplate>
                </asp:LoginView>
            </div>
            
            <div class="col-md-8 col-lg-8">
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
                                <asp:Label ID="lblUserName" runat="server"></asp:Label>
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
            </div>
        </div>
       

       
    </div>
    <hr />
    <br />
    <div>
        <asp:Wizard ID="Wizard1" runat="server">
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server">
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
                                    <asp:TextBox CssClass="form-control"  runat="server"></asp:TextBox></td>
                                <td>
                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="PerfilValidation" runat="server" ControlToValidate="tbNome" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>--%></td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="control-label" for="tbApelido">Apelido:</label></td>
                                <td>
                                    <asp:TextBox CssClass="form-control"  runat="server"></asp:TextBox></td>
                                <td>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="PerfilValidation" runat="server" ControlToValidate="tbApelido" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>--%>

                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label class="control-label" for="tbNumeroContato">Numero contato:</label>
                                </td>
                                <td>
                                    <asp:TextBox CssClass="form-control" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="PerfilValidation" runat="server" ControlToValidate="tbNumeroContato" ErrorMessage="Obrigatório!"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="Morada">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </asp:WizardStep>

            </WizardSteps>
        </asp:Wizard>
    </div>
    <script type="text/javascript">

        //http://www.codeproject.com/Questions/670019/Textbox-accept-only-numbers-using-java-script

        function validarTexto(key) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            //comparing pressed keycodes
            console.log(keycode);
            if ((keycode >= 42 && keycode <= 57) || keycode ==171 || keycode == 92) {
                return false;
            }
            return true;
        }
        
        function validarDigito(key) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
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
