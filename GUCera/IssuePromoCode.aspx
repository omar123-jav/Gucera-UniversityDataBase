<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssuePromoCode.aspx.cs" Inherits="GUCera.IssuePromoCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Issue Promo Code</div>
        <p>
            Student ID</p>
        <asp:TextBox ID="studentid" runat="server"></asp:TextBox>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            Code1</p>
        <asp:DropDownList ID="codr" runat="server" DataSourceID="SqlDataSource1" DataTextField="code" DataValueField="code" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString2 %>" SelectCommand="SELECT [code] FROM [Promocode]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Issue" OnClick="Button1_Click" />
    </form>
</body>
</html>
