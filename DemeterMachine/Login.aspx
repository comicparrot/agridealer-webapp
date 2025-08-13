<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DemeterMachine.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<section class="loginContainer">
    <div class="body-content">
            <h1>Login to Demeter Machine</h1>
            <div class="customContainer">
                <div class="row d-flex justify-content-center align-items-center">
            
                    <div class="form-group mb-4">
                        <asp:Label ID="lblUser" runat="server" Text="UserName: " CssClass="signupLabel"></asp:Label>
                        <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                    </div>
            
            
                    <div class="form-group mb-3">
                        <asp:Label ID="lblPass" runat="server" Text="Password: " CssClass="signupLabel"></asp:Label>
                        <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
                    </div>
            
                    <div class="text-center text-lg-start mt-4 pt-2 login-button-div d-flex align-items-center flex-column">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
                        <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account with us?</p>
                         <a href="Signup.aspx" class="text-center">Click to Register</a>
                        <asp:Label ID=lblMessage runat="server" CssClass="text-danger error-text"></asp:Label>
                    </div>
                </div>
              </div>

    </div>


   <script src="Scripts/scripts.js"></script>

</section>

</asp:Content>
