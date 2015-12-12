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
            <iframe style="margin: 5% 5% 5% 5%" width="560" height="315" src='<%= takeSRC() %>'>
            </iframe>
            <br />
            <br />
            &nbsp;
            <asp:LinkButton ID="linkbtnLike" runat="server" OnClick="linkbtnLike_Click"> Like </asp:LinkButton>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="linkbtnDislike" runat="server" OnClick="linkbtnDislike_Click"> Dislike </asp:LinkButton>
            <asp:Label ID="lblLikeResult" runat="server" style="float:right; color:green; margin:1% 1% 1% 1%" Text="LikeResult"></asp:Label>
            <asp:Label ID="lblDislikeResult" runat="server" style="float:right; color:red; margin:1% 1% 1% 1%" Text="DislikeResult"></asp:Label>


        </div>
        

        <div id="advertiseDIV">
            &nbsp;ADVERTISE HERE
        </div>
        
        <div id="recommendedVideo">
            RECOMMENDED VIDEO HERE
        </div>
        <div id="videoDetails">  
            <br />
            <asp:Label ID="lblDescrpText" runat="server" Text="Description:"></asp:Label>
            <asp:Label ID="lblDescrp" runat="server" Text="LabelDescript"></asp:Label>
            <br />
            <asp:Label ID="lblCaptionText" runat="server" Text="Caption:"></asp:Label>
            <asp:Label ID="lblCaption" runat="server" Text="LabelCaption"></asp:Label>
        </div>
        <div id="commentsDIV">
            <asp:TextBox ID="txtBoxComment" runat="server"></asp:TextBox>
            <asp:Button ID="btnAddComment" runat="server" Text="Add Comment!" OnClick="btnAddComment_Click" />
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Panel ID="PanelDtLComment" runat="server" Height="237px" ScrollBars="Both">
                <asp:DataList ID="DtLComment" runat="server" Width="352px">
                    <ItemTemplate>
                        <asp:Label ID="lblUsrNick" runat="server" Style="color:brown" Text='<%# Eval("user_nick") %>'></asp:Label>
                        &nbsp;
                        <asp:Label ID="lblCommentTime" runat="server" Style="color:darkgrey;font-size:8px" Text='<%# Eval("comment_time") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblCommentText" runat="server" Text='<%# Eval("comment_text") %>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
                      
          </div>
        <div id="vp-footer">
            <center><h1>FOOTER</h1></center>
        </div>
        </div>
    </form>
</body>
</html>
