<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <div class="container-fluid">
        <h1 class="h1">Login to be Connected!</h1>
        <br />
        <br />
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="lblEmail" CssClass="control-label col-sm-2" runat="server" Text="Email"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Error!" CssClass="alert-danger control-label col-sm-2"></asp:RequiredFieldValidator>
                </div>
            </div>


            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="control-label col-sm-2"></asp:Label>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Error!" CssClass="alert-danger control-label col-sm-2"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
        <div class="row col-sm-offset-2 col-sm-6">
            <asp:Label ID="lblMessage" runat="server" CssClass="alert-danger" Font-Bold="True"></asp:Label>
        </div>
        <div class="row col-sm-offset-2 col-sm-6">
            <asp:HyperLink ID="HyperLink1" CssClass="text-muted" NavigateUrl="~/SignUp.aspx" Text="Not a member? Click to Signup!" runat="server" />
            <br />
            <asp:HyperLink ID="HyperLink2" CssClass="text-muted" NavigateUrl="~/RecoverPassword.aspx" Text="Forgot your password? Then Click!" runat="server" />
        </div>
    </div>
</asp:Content>

