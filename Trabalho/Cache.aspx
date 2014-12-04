<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cache.aspx.cs" Inherits="Cache" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <%--<asp:GridView
            ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="id"
            DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            </Columns>
        </asp:GridView>
        <asp:DetailsView ID="DetailsView1" DefaultMode="Insert" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
                <asp:CommandField ShowInsertButton="True"></asp:CommandField>
            </Fields>
        </asp:DetailsView>--%>
        <%-- 
            DATA CACHING:
            EnableCaching -> enable cache do datasource
            CacheDuration -> 60 segundos
            Durante 60 se houver a modificação do datasource na base de dados, a datasource não será atualizada,
            só será atualizada depois de 60 segundos
            NB: No entanto a modificação dos dados na interface controlo de servidor ( Ex: DetailsView/GridView e etc) têm efeito
                imediato
             --%>
        <%--<asp:SqlDataSource
            ID="SqlDataSource1"
            runat="server"
            EnableCaching="true"
            CacheDuration="60"
            ConnectionString="<%$ ConnectionStrings:OMeuBD %>"
            SelectCommand="SELECT * FROM [table_teste_caching]" DeleteCommand="DELETE FROM [table_teste_caching] WHERE [id] = @id" InsertCommand="INSERT INTO [table_teste_caching] ([nome]) VALUES (@nome)" UpdateCommand="UPDATE [table_teste_caching] SET [nome] = @nome WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nome" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nome" Type="String"></asp:Parameter>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>--%>
        <br />
        <br />
        <asp:Label ID="lbltime" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblInfo" runat="server" Text="Label"></asp:Label>
        <br />

        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />

    </div>
    </form>
</body>
</html>
