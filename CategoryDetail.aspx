<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CategoryDetail.aspx.cs" Inherits="CategoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="style/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <asp:datalist id="DataList1" runat="server" repeatdirection="Horizontal" repeatlayout="Flow">
        <ItemTemplate>
            <div style="margin-top: 10px; margin-bottom: 40px; margin-left: 30px; width: 190px; height: 150px; text-align: left; float:left; font-size: 13px;">
                <a style="text-decoration: none;" href="VideoDetail.aspx?vid=<%# Eval("post_id")%>">
                    <asp:Image ID="Image1" ImageUrl="~/image/nicon_190x110.png" runat="server" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<% # trunc(Eval("post_caption").ToString(), 50) %>' ToolTip='<%# Eval("post_caption").ToString() %>' ForeColor="#3366CC"></asp:Label>
                    <br />
                </a>
                <em style="text-decoration: none; color: #666666;">Uploaded by: </em>
                <a href="User.aspx?uid=<%# Eval("user_id") %>">
                    <asp:Label ID="Label2" runat="server"  Text='<%# getNick(Eval("user_id").ToString()) %>' ForeColor="#0099FF"></asp:Label>
                    <br />
                </a>
                <em style="text-decoration: none; color: #666666;">On: </em>
                <asp:Label ID="Label3" runat="server"  Text='<%# getDate(Eval("post_date").ToString()) %>' ForeColor="#666666" Font-Bold="True"></asp:Label>
            </div>
        </ItemTemplate>
    </asp:datalist>
</asp:Content>

