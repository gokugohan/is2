<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Administrator_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <asp:ListView ID="FilmesListView" runat="server"
            InsertItemPosition="LastItem" OnItemInserting="FilmesListView_ItemInserting"
            OnItemDeleting="FilmesListView_ItemDeleting" OnItemEditing="FilmesListView_ItemEditing"
            OnItemCanceling="FilmesListView_ItemCanceling" >
              <LayoutTemplate>
               <table id="tblFilmes" runat="server" width="100%" >
                 <tr id="Tr1" runat="server">
                 <td id="Td1" runat="server">
                 <table id="itemPlaceholderContainer" runat="server" border="0" style="" width="100%">
                  <tr id="Tr2" runat="server" style="">
                  <th id="Th1" runat="server"></th>
                  <th id="Th2" runat="server">Nome</th>
                  <th id="Th3" runat="server">Ano</th>
                  <th id="Th4" runat="server">Genero</th>
                  <th id="Th5" runat="server">Atores</th>
                  </tr>
                  <tr id="itemPlaceholder" runat="server"></tr></table></td></tr>
                  <tr id="Tr3" runat="server">
                  <td id="Td2" runat="server" style=""></td>
                  </tr>
                </table>
               </LayoutTemplate>
            <ItemTemplate>
              <tr style="">
              <td>
              <asp:Button ID="btnDeletar" runat="server" CommandName="Delete" Text="Deletar" />
              <asp:Button ID="btnEditar" runat="server" CommandName="Edit" Text="Editar" />
              </td>
               <td><asp:Label ID="lblNome" runat="server" Text='<%# Bind("Nome") %>' /></td>
               <td><asp:Label ID="lblAno" runat="server" Text='<%# Bind("Ano") %>' /></td>
               <td><asp:Label ID="lblGenero" runat="server" Text='<%# Bind("Genero") %>' /></td>
               <td><asp:Label ID="lblAtores" runat="server" Text='<%# Bind("Atores") %>' /></td>
               </tr>
            </ItemTemplate>
            <InsertItemTemplate>
              <tr style="">
              <td>
              <asp:Button ID="btnInserir" runat="server" CommandName="Insert" Text="Inserir" />
              <asp:Button ID="btnCancelar" runat="server" CommandName="Cancel" Text="Limpar" />
              </td>        
              <td><asp:TextBox ID="txtNome" runat="server" Text='<%# Bind("Nome") %>' /></td>
              <td><asp:TextBox ID="txtAno" runat="server" Text='<%# Bind("Ano") %>' /></td>
              <td><asp:TextBox ID="txtGenero" runat="server" Text='<%# Bind("Genero") %>' /></td>
              <td><asp:TextBox ID="txtAtores" runat="server" Text='<%# Bind("Atores") %>' /></td>
              <td><asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" OnClick="btnAtualizar_Click" /></td>
              </tr>
            </InsertItemTemplate>
       </asp:ListView>       
    </div>
    </form>
</body>
</html>
