<%@ Page Title="Home" Theme="Normal" Language="C#" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administrator_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CustomMenuContentPlaceHolder" Runat="Server">
    
    <li>
        <a href="../">Home</a>
    </li>
    <li>
        <a href="Autor">Gerir Autor</a>
    </li>
    <li>
        <a href="Editora">Gerir Editora</a>
    </li>
    <li>
        <a href="Livro">Gerir Livro</a><!-- gerir também a categoria do livro -->
    </li>
    <li>
        <div id="loginStatusName">
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
            <asp:LoginName ID="LoginName1" CssClass="control-label" runat="server" />
        </div>

    </li>
    <li>
        <hr />
    </li>
    <li>
        <asp:AdRotator ID="AdRotator1" AdvertisementFile="~/Advertisement.xml" runat="server" CssClass="img-responsive" />
    </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
</asp:Content>

