<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Homepage.aspx.cs" Inherits="GUCera.Admin_Homepage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://kit.fontawesome.com/bdd1aae6ed.js" crossorigin="anonymous"></script>
    <title>GUCera - Admin Home</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Home</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px; float:right">
        <div>
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="Button3_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-chalkboard-teacher"></i> All Courses</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="Button4_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-chalkboard-teacher"></i> Pending Courses</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="Button5_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-chalkboard-teacher"></i> Accept Courses</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="Button6_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-dollar-sign"></i> Create Promocode</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton7" runat="server" OnClick="Button7_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-dollar-sign"></i> Issue Promocode</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton8" runat="server" OnClick="Button8_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-phone"></i> Add Phone Number</asp:LinkButton><br /><br />
            
        </div>
    </div>
    </form>
</body>
</html>
