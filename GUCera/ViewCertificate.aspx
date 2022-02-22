<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCertificate.aspx.cs" Inherits="GUCera.ViewCertificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:Label ID="Label1" runat="server" Font-Size="25pt" Font-Underline="True" Text="View Course Certificates"></asp:Label>
        <br />
        <br />
        Select Course:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="name" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="SELECT C.name FROM StudentCertifyCourse AS SC INNER JOIN Course AS C ON SC.cid = C.id WHERE (SC.sid = @sid)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="sid" SessionField="User_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
            <br />
            <br />
            Certified on
            <asp:Label ID="issueDate" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" />
            <br />
        </div>
    </form>
</body>
</html>
