<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="Upload.aspx.cs" Inherits="Member_Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">

    <div class="container">
        <h1 class="h1">Upload a Video!</h1>
        <br />
        <br />
        <div class="form-horizontal">

            <div class="form-group">
                <asp:Label ID="Label1" CssClass="control-label col-sm-2" runat="server" Text="Video Caption"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtCaption" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvCaption" runat="server" ControlToValidate="txtCaption" ErrorMessage="Caption is required"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" CssClass="control-label col-sm-2" runat="server" Text="Video Description"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description is required"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" CssClass="control-label col-sm-2" runat="server" Text="Video Link"></asp:Label>
                <div class="col-sm-4">
                    <asp:TextBox ID="txtLink" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvLink" runat="server" ControlToValidate="txtLink" ErrorMessage="Video Link is required"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label4" CssClass="control-label col-sm-2" runat="server" Text="Category"></asp:Label>
                <div class="col-sm-4">
                    <asp:DropDownList ID="ddlCateogory" CssClass="col-sm-6" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-sm-4">
                    <asp:RequiredFieldValidator ID="rfvCategory" runat="server" CssClass="alert-danger" ControlToValidate="ddlCateogory" ErrorMessage="Category  is required" InitialValue="-Select Category-"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <asp:Button ID="btnUpload" CssClass=" btn btn-primary" runat="server" OnClick="btnUpload_Click" Text="Upload" />
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-5">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

