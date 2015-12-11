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
    <div class="container-fluid">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <h1>Signup for free!</h1>
        <asp:Label ID="lblInfo" runat="server" Font-Italic="True" CssClass="col-sm-offset-2 text-muted" Text="Write your credentials in lowercase without spaces, except password field"></asp:Label>
        <br />
        <br />
        <div class="form-horizontal">
            <div class="form-group">
                <asp:Label ID="lblName" CssClass="control-label col-sm-2" runat="server" Text="Name"></asp:Label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="txtName_FilteredTextBoxExtender" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" InvalidChars="Numbers, " TargetControlID="txtName" />
                </div>
                <div class="col-sm-4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="alert-danger" ControlToValidate="txtName" ErrorMessage="Only a-z, Min 3, Max 20" ValidationExpression="^[a-zA-Z]{3,20}$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSurname" CssClass="control-label col-sm-2" runat="server" Text="Surname"></asp:Label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtSurname" CssClass="form-control" runat="server"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="txtSurname_FilteredTextBoxExtender" runat="server" FilterType="Custom, UppercaseLetters, LowercaseLetters" TargetControlID="txtSurname" ValidChars="Numbers" InvalidChars=" " />
                </div>
                <div class="col-sm-4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="alert-danger" ControlToValidate="txtSurname" ErrorMessage="Only a-z, Min 3, Max 20" ValidationExpression="^[a-zA-Z]{3,20}$"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblUsername" CssClass="control-label col-sm-2" runat="server" Text="Username"></asp:Label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="txtUsername_FilteredTextBoxExtender" runat="server" BehaviorID="txtUsername_FilteredTextBoxExtender" FilterType="Custom, UppercaseLetters, LowercaseLetters, Numbers" TargetControlID="txtUsername" InvalidChars=" ," ValidChars="Numbers"></ajaxToolkit:FilteredTextBoxExtender>
                </div>
                <div class="col-sm-4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="alert-danger" ControlToValidate="txtUsername" ErrorMessage="Only a-z, 0-9 characters allowed, Min 5, Max 20" ValidationExpression="^[a-zA-Z0-9\s]{5,20}$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblEmail" CssClass="control-label col-sm-2" runat="server" Text="Email"></asp:Label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="alert-danger" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Address" ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="control-label col-sm-2"></asp:Label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" CssClass="alert-danger" ControlToValidate="txtPassword" ErrorMessage="Any characters allowed, Min 8, Max 20" ValidationExpression="^[a-zA-Z0-9'@&amp;#.\s]{8,20}$"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="ConfirmPassword" CssClass="control-label col-sm-2"></asp:Label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" CssClass="alert-danger" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords did not match"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-8 col-sm-2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="alert-danger" ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6">
                    <asp:Button ID="btnSignUp" CssClass="btn btn-primary" runat="server" Text="Signup" OnClick="btnSignUp_Click" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-6">
                    <asp:Label ID="lblMessage" runat="server" CssClass="alert-success" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

