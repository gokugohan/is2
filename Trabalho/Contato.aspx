<%@ Page Title="Contato" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Contato.aspx.cs" Inherits="Contato" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div class="jumbotron">
        <table class="table table-responsive">
            <thead>
                <tr >
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
                        <asp:TextBox ID="tbNomeCompleto" runat="server" CssClass="form-control pull-left"></asp:TextBox>
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
                        <asp:TextBox ID="tbEmail" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbEmail" ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ErrorMessage="CampoObrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td><label class="control-label pull-right">Assunto:</label></td>
                    <td>
                        <asp:TextBox ID="tbAssunto" CssClass="form-control pull-left" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbAssunto" ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><label for="tbMensagem" class="control-label pull-right">Mensagem</label></td>
                    <td>
                        <asp:TextBox ID="tbMensagem" style="resize:none;" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="10" Columns="50" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ControlToValidate="tbMensagem" ID="RequiredFieldValidator4" runat="server" ForeColor="Red" ErrorMessage="Campo obrigatório">Campo obrigatório</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    
                    <td>
                        <asp:Button ID="btnEnviar" runat="server" CssClass="btn btn-success pull-right" Text="Enviar" />
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <script>
        window.onload = function () {
            //document.getElementById("tbMensagem").style.res
        };
    </script>
</asp:Content>


