<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addTelephoneNumber.aspx.cs" Inherits="GUCera.addTelephoneNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add Your Mobile Number</h2></div>
        Phone number<p>
            <asp:TextBox ID="number"  TextMode ="number" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="addNumberButton" runat="server" Text="Add" OnClick="addNumberButton_Click" />
        <br />
        <br />
        <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <p>
            <asp:Button ID="homeButton" runat="server" Text="Home" Height="24px" OnClick="homeButton_Click" />
        </p>
    </form>
</body>
</html>
