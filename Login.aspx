<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container-fluid">
        <div class="row">
            <h1 class="h1 col-md-5">Login to be Connected!</h1>
        </div>
        <div class="row">
            <div class="col-md-offset-0">
                <asp:Label ID="lblEmail" runat="server" Text="Username / Email" CssClass="text-bold"></asp:Label>
            </div>
            <div class="col-md-4 col-md-offset-2">
                <asp:TextBox ID="txtEmail" runat="server" CssClass=""></asp:TextBox>
            </div>
            <div class="span6 offset3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required: Username or Email " CssClass="alert alert-danger text-bold"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <div class="row">
        <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="text-bold"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Required: Password" CssClass="alert alert-danger text-bold"></asp:RequiredFieldValidator>
    </div>
    <div class="row">
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-success" />
    </div>

    <%--<a href="SignUp.aspx">Not a member? Click to Signup!</a>--%>
    <div class="row">
        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/SignUp.aspx" Text="Not a member? Click to Signup!" runat="server" />
    </div>
    <%--<a href="RecoverPassword.aspx">Forgot your password? Then Click!</a>--%>
    <div class="row">
        <asp:HyperLink ID="HyperLink2" NavigateUrl="~/RecoverPassword.aspx" Text="Forgot your password? Then Click!" runat="server" />
    </div>

    <div class="row">
        <asp:Label ID="lblMessage" runat="server" CssClass="bg-danger" Font-Bold="True"></asp:Label>
    </div>
    </div>
</asp:Content>

