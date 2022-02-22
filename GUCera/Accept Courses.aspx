<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accept Courses.aspx.cs" Inherits="GUCera.Accept_Courses1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Accept Course</div>
        <p>
            Course Id</p>
        <p>
            <asp:DropDownList ID="courseid" runat="server" DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString2 %>" SelectCommand="SELECT [id] FROM [Course]"></asp:SqlDataSource>
        </p>
        <asp:Button ID="Accept" runat="server" Text="Accept" OnClick="Accept_Click" />
    </form>
</body>
</html>
