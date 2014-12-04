<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuUbuntu.ascx.cs" Inherits="Control_MenuUbuntu" %>
<nav id="myNavbar" runat="server" class="navbar navbar-default navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../">Trabalho I - IS2</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="nav navbar-nav">
                <li><a href="./">Home</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Biblioteca <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="./RequisitarLivros">Requisitar livros</a></li>
                        <li><a href="./Contato">Contato</a></li>
                        <li><a href="./Perfil">Perfil</a></li>
                    </ul>
                </li>
                            
                <li>
                    <div id="LoginStatus-name">
                            <asp:LoginStatus ID="LoginStatus2" runat="server"
                                LogoutAction="RedirectToLoginPage" /> &nbsp;
                        <asp:LoginName ID="LoginName1" runat="server" />
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>