<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Video.aspx.cs" Inherits="Video" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="vp-body">
        <div id="vp-header">
            <center><h1>HEADER</h1></center>
        </div>
        <div id="vp-top-menu">
            <center>TOP-MENU<br />
                </center>
            <ul class="top-menu-ul">
                <li><a href="Login.aspx">Login</a></li>
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="SignUp.aspx">SignUp</a></li>
                <li><a href="Upload.aspx">Upload!</a></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>

        <div id="videoDIV">
            VIDEO HERE
        </div>
        

        <div id="advertiseDIV">
            ADVERTISE HERE
        </div>
        
        <div id="recommendedVideo">
            RECOMMENDED VIDEO HERE
        </div>
        <div id="videoDetails">
            VIDEO DETAILS       
            <br />
            <asp:Label ID="lblDescrp" runat="server" Text="LabelDescript"></asp:Label>
            <br />
            <asp:Label ID="lblCaption" runat="server" Text="LabelCaption"></asp:Label>
        </div>
        <div id="commentsDIV">
            COMMENTS            
        </div>
        <div id="vp-footer">
            <center><h1>FOOTER</h1></center>
        </div>
        </div>
    </form>
</body>
</html>
