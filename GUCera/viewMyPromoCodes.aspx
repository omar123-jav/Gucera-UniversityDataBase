<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewMyPromoCodes.aspx.cs" Inherits="GUCera.viewMyPromoCodes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>My Promo Codes</h2>
    <form id="form1" runat="server">
        <asp:GridView ID="promoTable" runat="server"></asp:GridView>
        <p>
&nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" />
        </p>
    </form>
</body>
</html>
