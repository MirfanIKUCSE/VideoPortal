<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Member_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table style="width:100%;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server" Text="Upload a Video!" CssClass="text-center"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Video Caption"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtCaption" runat="server" Height="22px" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvCaption" runat="server" ControlToValidate="txtCaption" ErrorMessage="Caption is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Video Description"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtDescription" runat="server" Height="22px" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Video Link"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtLink" runat="server" Height="22px" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvLink" runat="server" ControlToValidate="txtLink" ErrorMessage="Video Link is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="Category"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="ddlCateogory" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCateogory" ErrorMessage="Category  is required" InitialValue="-Select Category-"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" />
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
            </tr>
        </table>
</asp:Content>

