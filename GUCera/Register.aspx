<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GUCera.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>Register</h2>
    <form id="form1" runat="server">
        <div>
            First Name</div>
        <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
        <p>
            Last Name</p>
        <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
        <p>
            Email</p>
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
        <p>
            Password</p>
        <p>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </p>
        <p>
            Address</p>
        <p>
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
        </p>
        Gender<asp:RadioButtonList ID="gender" runat="server">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
        </asp:RadioButtonList>
        <asp:Button ID="submitButton" runat="server" OnClick="register" Text="Register" />
        <p>
            <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back To Login" />
        </p>
    </form>
    </body>
</html>
