<%@ Page Title="Home" Theme="Admin" Language="C#" MasterPageFile="~/Administrator/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Administrator_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 
    <!-- Page Heading -->
    <div class="row">
        <div class="col-md-6 col-lg-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Exportar dados (.csv)</h3>
                </div>
                <div class="panel-body">
                    <asp:Button ID="btnExport"
                CssClass="btn btn-default"
                runat="server"
                Text="Exportar tabela"
                OnClick="btnExportCSV_Click" />

            <asp:Panel ID="PanelExport" Visible="false" runat="server">

                <asp:DropDownList
                    AutoPostBack="false"
                    CssClass="form-control"
                    ID="ddlCSV"
                    runat="server"
                    AppendDataBoundItems="true">
                    <asp:ListItem Value="-1">Seleciona uma</asp:ListItem>
                    <asp:ListItem Value="0">Tabela autor</asp:ListItem>
                    <asp:ListItem Value="1">Tabela livro</asp:ListItem>
                    <asp:ListItem Value="2">Tabela editora</asp:ListItem>
                    <asp:ListItem Value="3">Tabela categoria</asp:ListItem>
                    <asp:ListItem Value="4">Tabela utilizador</asp:ListItem>
                </asp:DropDownList>


                <asp:Button
                    ID="btnDownloadCSV"
                    CommandName="csv"
                    CssClass="btn btn-default pull-right"
                    runat="server"
                    Text="download"
                    OnClick="btnDownload_Click" />

            </asp:Panel>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-6">

        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-lg-12">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Dados dos utilizadores que requisitaram os livros</h3>
                </div>
                <div class="panel-body">
                    <asp:GridView
                    CssClass="table table-bordered table-hover"
                    AutoGenerateColumns="false"
                    ID="GridView1"
                    runat="server"
                    AllowPaging="false">
                    <Columns>
                        <asp:BoundField DataField="Nome" HeaderText="Nome do utilizador" ReadOnly="True" SortExpression="Nome do utilizador"></asp:BoundField>
                        <asp:BoundField DataField="IDLogin" HeaderText="ID utilizador" SortExpression="Nome utilizador"></asp:BoundField>
                        <asp:BoundField DataField="Titulo" HeaderText="Título do livro" SortExpression="Título do livro"></asp:BoundField>
                        <asp:BoundField DataField="Autor" HeaderText="Autor do livro" ReadOnly="True" SortExpression="Autor do livro"></asp:BoundField>
                        <asp:BoundField DataField="Editora" HeaderText="Editora do livro" SortExpression="Editora do livro"></asp:BoundField>
                        <asp:TemplateField HeaderText="Data empréstimo" SortExpression="Data empréstimo">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("dataEmprestimo") %>' ID="TextBox1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# getFormat(Eval("dataEmprestimo")) %>' ID="Label1"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Data devolução" SortExpression="Data devolução">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("dateDevolucao") %>' ID="TextBox2"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# getFormat(Eval("dateDevolucao")) %>' ID="Label2"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                   
                </div>
                <div class="panel-footer">
                    <i class="fa fa-long-arrow-right"></i>
                     <asp:Button ID="btnGenerateXML" 
                        OnClick="btnGenerateXML_Click" 
                        CssClass="btn btn-link" 
                        runat="server" 
                        Text="Gerar o XML dos livros emprestados" />
                    <i class="fa fa-long-arrow-left"></i>
                    <br />
                    <asp:HyperLink ID="downloadLink" 
                        CssClass="btn btn-link" 
                        NavigateUrl="~/Administrator/empr.xml" 
                        Visible="false" 
                        runat="server">Mostrar resultado</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
</asp:Content>

