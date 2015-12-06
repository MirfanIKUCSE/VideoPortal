<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 169px;
        }

        .auto-style2 {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style1">
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="#CC3300" Text="Write your credentials in lowercase without spaces, except password field"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="txtName_FilteredTextBoxExtender" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" InvalidChars="Numbers, " TargetControlID="txtName" />
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Only a-z characters allowed, Min 3, Max 20" ValidationExpression="^[a-zA-Z]{3,20}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblSurname" runat="server" Text="Surname"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="txtSurname_FilteredTextBoxExtender" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="txtSurname" ValidChars="Numbers" InvalidChars=" " />
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSurname" ErrorMessage="Only a-z characters allowed, Min 3, Max 20" ValidationExpression="^[a-zA-Z]{3,20}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="txtUsername_FilteredTextBoxExtender" runat="server" BehaviorID="txtUsername_FilteredTextBoxExtender" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="txtUsername" InvalidChars=" ," ValidChars="Numbers">
                </ajaxToolkit:FilteredTextBoxExtender>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtUsername" ErrorMessage="Only a-z, 0-9 characters allowed, Min 5, Max 20" ValidationExpression="^[a-zA-Z0-9\s]{5,20}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="Any characters allowed, Min 8, Max 20" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{8,20}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords did not match"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="btnSignUp" runat="server" Text="Signup" OnClick="btnSignUp_Click" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

