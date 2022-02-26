<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCreditCard.aspx.cs" Inherits="GUCera.addCreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - Credit Card</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Add A Credit Card</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
    
        
        Number<p>
            <asp:TextBox ID="number" runat="server" TextMode="Number" min="1"
                max="999999999999999" onKeyDown="if(this.value.length==15 && event.keyCode!=8) return false;" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>        </p>
        Card Holder Name<p>
            <asp:TextBox ID="holder" MaxLength="16" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
        </p>
        Expiry Date<p>
            <asp:TextBox ID="expDate"  TextMode="Date" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
        </p>
        CVV<p>
            <asp:TextBox ID="cvv" runat="server" TextMode="Number" min="1"
    max="999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
            
    </p>

        
        <asp:Button ID="add" runat="server" Text="Add Card" OnClick="add_Click" BackColor="#99FFCC" BorderColor="#66FF99" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#003300" />

        
        <br />
        <br />
        <asp:Label ID="MessageLabel" runat="server" Font-Size="Large"></asp:Label>

        
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00"/>

        </div>
        
    </form>
</body>
</html>
