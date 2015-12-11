<%@ Page Title="" Language="C#" MasterPageFile="~/Home.master" AutoEventWireup="true" CodeFile="CategoryDetail.aspx.cs" Inherits="CategoryDetail" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
    <link href="style/style.css" rel="stylesheet" />
</asp:content>
<asp:content id="Content2" contentplaceholderid="Content" runat="Server">
    <asp:datalist id="DataList1" runat="server" repeatdirection="Horizontal" repeatlayout="Flow">
        <ItemTemplate>
            <div style="margin-top: 3.5%; margin-bottom: 4%; margin-left: 2.8%; width: 190px; height: 150px; text-align: left; float:left; font-size: 13px;">
                <asp:HyperLink runat="server" NavigateUrl='<%#Eval("post_id","~/VideoDetail.aspx?vid={0}") %>'>
                    <asp:Image ID="Image2" ImageUrl="~/image/nicon_190x110.png" runat="server" />
                    <br />
                    <asp:Label ID="Label4" runat="server" Font-Bold="true" Text='<% # trunc(Eval("post_caption").ToString(), 50) %>' ToolTip='<%# Eval("post_caption").ToString() %>' ForeColor="#3366CC"></asp:Label>
                    <br />
                </asp:HyperLink>
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
</asp:content>

