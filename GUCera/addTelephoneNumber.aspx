<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addTelephoneNumber.aspx.cs" Inherits="GUCera.addTelephoneNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - Add Phone</title>
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
    <form id="form1" runat="server">
    <asp:Panel ID="Panel1" class="headerpanel" runat="server" Width="100%" Height="55px">
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Add Phone Number</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        
        Phone number<p>
            <asp:TextBox ID="number"  TextMode ="number" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
        </p>
        <asp:Button ID="addNumberButton" runat="server" Text="Add" OnClick="addNumberButton_Click" BackColor="#99FFCC" BorderColor="#66FF99" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#003300" />
        <br />
        <br />
        <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <p>
            <asp:Button ID="homeButton" runat="server" Text="Home" Height="24px" OnClick="homeButton_Click" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00"/>
        </p>
        </div>
    </form>
</body>
</html>
