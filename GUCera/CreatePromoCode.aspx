<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatePromoCode.aspx.cs" Inherits="GUCera.CreatePromoCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Create promo Code</div>
        <p>
            Code</p>
        <asp:TextBox ID="code" runat="server"></asp:TextBox>
    <p>
        Issue Date</p>
        <asp:TextBox ID="issuedate" TextMode="Date" runat="server"></asp:TextBox>
        <p>
            Expiry date</p>
        <asp:TextBox ID="expirydate" TextMode="Date"  runat="server"></asp:TextBox>
        <p>
            Discount&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="discount" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="create" runat="server" Text="Create" OnClick="create_Click" />
    </form>
    </body>
</html>
