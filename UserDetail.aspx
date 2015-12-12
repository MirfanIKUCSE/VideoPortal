<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="UserDetail.aspx.cs" Inherits="UserDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="style/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <div id="userDetail">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                    <asp:Label ID="lblFName" runat="server" Text="lblFName"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Surname:"></asp:Label>
                    <asp:Label ID="lblLName" runat="server" Text="lblLName"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="SignUp Date:"></asp:Label>
                    <asp:Label ID="lblBirthDate" runat="server" Text="lblBirthDate"></asp:Label>
                </td>
            </tr>
        </table>
        <div id="vp-content">
            CONTENTS HERE
        </div>
    </div>
</asp:Content>

