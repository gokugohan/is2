<%@ Page Title="Autor" Language="C#"  AutoEventWireup="true" EnableTheming="true" Theme="Admin" MasterPageFile="~/Administrator/Admin.master" CodeFile="Autor.aspx.cs" Inherits="Administrator_AdminAutor" %>    
<asp:Content runat="server"  ContentPlaceHolderID="ContentPlaceHolder1">    
    <div class="row">
        <div class="col-md-8 col-lg-8">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Lista de autores</h3>
                </div>
                <div class="panel-body">
                   <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                       <ContentTemplate>
                           
                           <asp:GridView ID="GridViewAutor" 
                               CssClass="table table-hover table-bordered table-condensed" 
                               runat="server" 
                               AutoGenerateColumns="False" 
                               DataKeyNames="ID_Autor" 
                               DataSourceID="SqlDataSource1" 
                               AllowSorting="True"
                               OnDataBound="OnDataBound"
                               AllowPaging="True">
                               <Columns>
                                   <asp:TemplateField ShowHeader="true">
                                       <EditItemTemplate>
                                           <asp:LinkButton runat="server" 
                                               CssClass="btn btn-default pull-left" 
                                               Text="Atualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1">

                                           </asp:LinkButton>&nbsp;<asp:LinkButton runat="server" CssClass="btn btn-default pull-right" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                       </EditItemTemplate>
                                       
                                       <ItemTemplate>
                                           <div style="display:inline-flex;">
                                                <asp:LinkButton runat="server" CssClass="btn btn-default" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>
                                           <asp:LinkButton runat="server" 
                                               OnClientClick="return window.confirm('Lol, vais me eliminar... Tchao então?');"  
                                               Text="Eliminar" 
                                               CssClass="btn btn-default " 
                                               CommandName="Delete" 
                                               CausesValidation="False" 
                                               ID="LinkButton2"></asp:LinkButton>
                                           </div>
                                          
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Código" InsertVisible="False" SortExpression="ID_Autor">
                                       <EditItemTemplate>
                                           <asp:Label runat="server" Text='<%# Eval("ID_Autor") %>' ID="Label1"></asp:Label>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label runat="server" Text='<%# Bind("ID_Autor") %>' ID="Label1"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                                   <asp:TemplateField HeaderText="Nome" SortExpression="Nome">
                                       <EditItemTemplate>
                                           <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Nome") %>' ID="TextBox1"></asp:TextBox>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("Nome") %>' ID="Label2"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Apelido" SortExpression="Apelido">
                                       <EditItemTemplate>
                                           <asp:TextBox runat="server" CssClass="form-control" Text='<%# Bind("Apelido") %>' ID="TextBox2"></asp:TextBox>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("Apelido") %>' ID="Label3"></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>

                               </Columns>
                           </asp:GridView>
                           <br />                          
                       </ContentTemplate>
                   </asp:UpdatePanel>
                </div>
            </div>
         
        </div>
        <div class="col-md-4 col-lg-4">
            <div class="panel panel-green">
                <div class="panel panel-heading">
                    <h3 class="panel-title"><i class="fa fa-long-arrow-right"></i>Inserir autor</h3>
                </div>
                <div class="panel-body">
                      <asp:DetailsView 
                          CssClass="table table-hover table-bordered table-condensed" 
                          ID="DetailsView1" runat="server" 
                          DefaultMode="Insert" 
                          AutoGenerateRows="False" 
                          DataKeyNames="ID_Autor" 
                          DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:BoundField DataField="ID_Autor" HeaderText="ID_Autor" ReadOnly="True" SortExpression="ID_Autor" InsertVisible="False"></asp:BoundField>
                    <asp:TemplateField HeaderText="Nome" SortExpression="Nome">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Nome") %>' ID="TextBox1"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Nome") %>' ID="TextBox1"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("Nome") %>' ID="Label1"></asp:Label>
                        </ItemTemplate>

                        <ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apelido" SortExpression="Apelido">
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Apelido") %>' ID="TextBox2"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("Apelido") %>' ID="TextBox2"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" CssClass="control-label" Text='<%# Bind("Apelido") %>' ID="Label2"></asp:Label>
                        </ItemTemplate>

                        <ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" CancelText="Cancelar" InsertText="Inserir">
                        <ControlStyle CssClass="btn btn-default"></ControlStyle>
                    </asp:CommandField>
                </Fields>
            </asp:DetailsView>
                </div>
            </div>
            
          

        </div>
    </div>
    <script>

        //$(function () {
        $('.search_textbox').each(function (i) {
            $(this).quicksearch("[id*=GridViewAutor] tr:not(:has(th))", {
                'testQuery': function (query, txt, row) {
                    var indice = i + 1;
                    var stringQuery = query[0].toLowerCase();

                    // The :eq() selector selects an element with a specific index number.
                    var dadoAComparar = $(row).children(":eq(" + indice + ")").text().toLowerCase();
                    return dadoAComparar.indexOf(stringQuery) != -1;
                }
            });
        });

        //});
    </script>
    <!-- SQL DataSources-->
    <asp:SqlDataSource 
        runat="server" 
        ID="SqlDataSource1" 
        ConnectionString='<%$ ConnectionStrings:OMeuBD %>' 
        DeleteCommand="DELETE FROM [Table_Autor] WHERE [ID_Autor] = @ID_Autor" 
        InsertCommand="INSERT INTO [Table_Autor] ([Nome], [Apelido]) VALUES (@Nome, @Apelido)" 
        SelectCommand="SELECT * FROM [Table_Autor] ORDER BY [ID_Autor]" 
        UpdateCommand="UPDATE [Table_Autor] SET [Nome] = @Nome, [Apelido] = @Apelido WHERE [ID_Autor] = @ID_Autor">
        <DeleteParameters>
            <asp:Parameter Name="ID_Autor" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="Apelido" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="Apelido" Type="String"></asp:Parameter>
            <asp:Parameter Name="ID_Autor" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>