<%@ Page Title="Log in" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login" %>

<%@ Register Src="~/Control/LoginControl.ascx" TagPrefix="LoginForm" TagName="LoginControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
   
    <div id="animWrapper">

        <div class="row">
            <div class="col-md-12">
                <asp:LoginView ID="LoginView1" runat="server">
                    <LoggedInTemplate>
                        <h3>Está logado como "<asp:LoginName ID="LoginName1" runat="server" /></h3>
                    </LoggedInTemplate>
                    <AnonymousTemplate>
                        <LoginForm:LoginControl runat="server" ID="LoginControl" />
                    </AnonymousTemplate>
                </asp:LoginView>


            </div>
        </div>
    </div>
</asp:Content>


