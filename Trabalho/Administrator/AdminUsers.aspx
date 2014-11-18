<%@ Page Language="C#" AutoEventWireup="true" EnableTheming="true" MasterPageFile="~/Administrator/Administrator.master" CodeFile="AdminUsers.aspx.cs" Inherits="Administrator_Default" %>

<asp:Content ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="row" style="background-color:green; border-radius:10px;margin-right:10px;">
        <div class="col-md-8">
            <h1 class="text-center">Gestão de roles</h1>
            <div class="col-md-4">
                <h1 class="text-center">Adicionar role</h1>
                <label class="control-label">Role:</label> <br />
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                <br />
                <p>
                    <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="Adicionar"
                        OnClick="Button1_Click" />
                </p>

            </div>
            <div class="col-md-4">
                <h1>Lista de roles</h1>
                <asp:ListBox ID="ListBox1" CssClass="form-control" runat="server"></asp:ListBox>
            </div>
        </div>
       
        <div class="col-md-4"></div>
    </div>
    <div class="row" style="background-color:green; border-radius:10px;margin-right:10px; margin-top:10px;">
            <h1 class="text-center">Gestão de utilizadores</h1>
            <div class="col-md-4">
                <h1>Lista de utilizadores</h1>
                <asp:ListBox ID="ListBox2" CssClass="form-control" runat="server"></asp:ListBox>
            </div>
       
        <div class="col-md-8"></div>
     </div>
</asp:Content>
       
