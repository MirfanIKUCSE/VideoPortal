<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style3 {
            color: inherit;
            width: 502px;
            margin-bottom: 30px;
            padding-top: 48px;
            padding-bottom: 48px;
            background-color: #eee;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td><h1 class="h1">Login to be Connected!</h1></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="lblEmail" runat="server" Text="Username / Email" CssClass="bg-info text-bold"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required: Username or Email " CssClass="alert-danger bg-danger text-bold"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="bg-info text-bold"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Required: Password" CssClass="alert-danger bg-danger text-bold"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-success" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style1"><%--<a href="SignUp.aspx">Not a member? Click to Signup!</a>--%>
                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/SignUp.aspx" Text="Not a member? Click to Signup!" runat="server"/></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><%--<a href="RecoverPassword.aspx">Forgot your password? Then Click!</a>--%>
                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/RecoverPassword.aspx" Text="Forgot your password? Then Click!" runat="server"/>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lblMessage" runat="server" CssClass="bg-danger" Font-Bold="True"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

