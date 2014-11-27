<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FormContato.ascx.cs" Inherits="Control_FormContato" %>
<div id="animWrapper">
        <div class="jumbotron">
            <table class="table table-responsive">
                <thead>
                    <tr>
                        <td colspan="3">
                            <h3>Forneça informação para enviar.</h3>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <label for="tbNomeCompleto" class="control-label pull-right">Nome completo</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbNomeCompleto" EnableViewState="false" runat="server" CssClass="form-control pull-left"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbNomeCompleto" ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label pull-right" for="tbEmail">Email:</label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbEmail" EnableViewState="false" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbEmail" ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="CampoObrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label class="control-label pull-right">Assunto:</label></td>
                        <td>
                            <asp:TextBox ID="tbAssunto" EnableViewState="false" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbAssunto" ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="tbMensagem" class="control-label pull-right">Mensagem</label></td>
                        <td>
                            <asp:TextBox ID="tbMensagem" EnableViewState="false" Style="resize: none;" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10" Columns="50"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ControlToValidate="tbMensagem" ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <asp:Label ID="lblInfo" SkinID="labelInfo" runat="server"></asp:Label>
                            <asp:Button ID="btnEnviar" EnableViewState="false" runat="server" SkinID="ButtonEnviar" Text="Enviar" OnClick="btnEnviar_Click" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>