<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFeedback.aspx.cs" Inherits="GUCera.AddFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Size="25pt" Font-Underline="True" Text="Add Feedback"></asp:Label>
        <br />
        <br />
        Select Course:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="name" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="SELECT C.name FROM StudentTakeCourse AS SC INNER JOIN Course AS C ON SC.cid = C.id WHERE (SC.sid = @sid)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="sid" SessionField="User_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        Comments:
        <asp:TextBox ID="CommentText" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Post" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Home" OnClick="Button2_Click" />
    </form>
</body>
</html>
