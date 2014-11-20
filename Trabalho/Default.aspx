<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <div id="animWrapper">
        <div class="jumbotron">
            <h1>Lorem Ipsum</h1>
            <br />
            <asp:LoginView ID="LoginView1" runat="server">

                <RoleGroups>
                    <asp:RoleGroup Roles="Admin">
                        <ContentTemplate>
                            <a href="Administrator/">Manage library</a>
                        </ContentTemplate>
                    </asp:RoleGroup>
                    <asp:RoleGroup Roles="Membros">
                        <ContentTemplate>
                        </ContentTemplate>
                    </asp:RoleGroup>
                </RoleGroups>
            </asp:LoginView>
        </div>
    </div>
</asp:Content>

