<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="LinqToXML.aspx.cs" Inherits="LinqToXML" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" Runat="Server">
    

    <div class="row">
        <div class="col-md-3">
            <asp:Button ID="Button1" runat="server" Text="Read XML" OnClick="Button1_Click" /><br />
            <asp:Button ID="Button2" runat="server" Text="Read XML - Female Sex" OnClick="Button2_Click" /><br />
            <asp:Button ID="Button3" runat="server" Text="Read XML - Atributes" OnClick="Button3_Click" /><br />
            <asp:Button ID="Button4" runat="server" Text="Read XML - Find an Element" OnClick="Button4_Click" /><br />
            <asp:Button ID="Button5" runat="server" Text="Read XML - Add new Element" OnClick="Button5_Click" /><br />
        </div>
        <div class="col-md-9">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
    </div>

</asp:Content>

