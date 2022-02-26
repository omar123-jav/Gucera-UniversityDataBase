<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GUCera.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - Login</title>
    <style>
        body{
            background-image: url('GUCeraBkgFinal.png');
            background-repeat: no-repeat;
            background-size: cover;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0px;
            margin-top: -10px;
        }
        .headerpanel{
            background: rgba(0, 0, 0, 0.3);
            padding:10px;
        }
    </style>
</head>
    
<body>
    
    <asp:Panel ID="Panel1" class="headerpanel" runat="server" Width="100%" Height="55px">
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Login</asp:Label>
            
    </asp:Panel>
    
    <form id="form1" style="margin:30px" runat="server">
        
        
        <p>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="ID"></asp:Label>
        </p>
        <asp:TextBox ID="username" TextMode="Number" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
        <p>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="Password"></asp:Label>
        </p>
        <asp:TextBox ID="password" TextMode ="Password" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
        <p>
            <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" BackColor="#99FFCC" BorderColor="#66FF99" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#003300" />
        </p>
        <asp:Label ID="MessageLabel" runat="server" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign Up!" BackColor="#0066FF" BorderColor="#000099" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#000066" />
    </form>
</body>
</html>
