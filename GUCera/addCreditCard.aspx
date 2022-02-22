<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCreditCard.aspx.cs" Inherits="GUCera.addCreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add a Credit Card</h2>
        </div>
        Number<p>
            <asp:TextBox ID="number" runat="server" TextMode="Number" min="1"
                max="999999999999999" onKeyDown="if(this.value.length==15 && event.keyCode!=8) return false;"></asp:TextBox>        </p>
        Card Holder Name<p>
            <asp:TextBox ID="holder" MaxLength="16" runat="server"></asp:TextBox>
        </p>
        Expiry Date<p>
            <asp:TextBox ID="expDate"  TextMode="Date" runat="server"></asp:TextBox>
        </p>
        CVV<p>
            <asp:TextBox ID="cvv" runat="server" TextMode="Number" min="1"
    max="999" onKeyDown="if(this.value.length==3 && event.keyCode!=8) return false;"></asp:TextBox>
            
    </p>

        
        <asp:Button ID="add" runat="server" Text="Add Card" OnClick="add_Click" />

        
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" />

        
    </form>
</body>
</html>
