<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            width: 150px;
        }
        .auto-style3 {
            height: 23px;
            width: 150px;
        }
        .auto-style4 {
            width: 260px;
        }
        .auto-style5 {
            height: 23px;
            width: 260px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="Label5" runat="server" Text="Upload a Video!"></asp:Label>
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
                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCateogory" ErrorMessage="Category  is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style1">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
                </td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
