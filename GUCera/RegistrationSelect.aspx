<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationSelect.aspx.cs" Inherits="GUCera.RegistrationSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://kit.fontawesome.com/bdd1aae6ed.js" crossorigin="anonymous"></script>
    <title>GUCera - Registration</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Register As</asp:Label>
            
    </asp:Panel>
    
    <form id="form1" style="margin:30px" runat="server">
        <div>
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="studentButton" BackColor="#66FF99" BorderColor="#003300" BorderStyle="Ridge" BorderWidth="10px" style="text-decoration: none; padding:30px; float:right" Font-Names="Algerian" ForeColor="#003300" Height="30px" Width="100px"><i class="fas fa-user-graduate"></i> Student</asp:LinkButton>
             <asp:LinkButton ID="LinkButton1" runat="server" OnClick ="instructorButton" BackColor="#FFCC66" BorderColor="#CC6600" BorderStyle="Ridge" BorderWidth="10px" style="text-decoration: none; float:left; padding:30px" Font-Names="Algerian" ForeColor="#CC6600" Height="30px" Width="120px"><i class="fas fa-chalkboard-teacher"></i> Instructor</asp:LinkButton>
        </div>
            
        
    </form>
</body>
</html>
