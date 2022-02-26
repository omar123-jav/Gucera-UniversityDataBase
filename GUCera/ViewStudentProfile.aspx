<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudentProfile.aspx.cs" Inherits="GUCera.VeiwStudentProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://kit.fontawesome.com/bdd1aae6ed.js" crossorigin="anonymous"></script>
    <title>GUCera - Student Home</title>
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
            <asp:Button ID="Button9" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        <div style="float:left">
            <h2>My Profile</h2>
            <h4><em>First Name</em></h4>
            <asp:Label runat="server" ID="first_name"><h5></h5></asp:Label>
            <h4><em>Last Name</em></h4>
            <asp:Label runat="server" ID="last_name"><h5></h5></asp:Label>
            <h4><em>Email</em></h4>
            <asp:Label runat="server" ID="email"><h5></h5></asp:Label>
            <h4><em>Password</em></h4>
            <asp:Label runat="server" ID="password"><h5></h5></asp:Label>
            <h4><em>Address</em></h4>
            <asp:Label runat="server" ID="addr"><h5></h5></asp:Label>
            <h4><em>Gender</em></h4>
            <asp:Label runat="server" ID="gender"><h5></h5></asp:Label>
        </div>
        <div style="float:right">
            <br/>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button1_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="far fa-credit-card"></i> Add A Credit Card</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="Button2_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-phone"></i> Add Phone Number</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="Button3_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-chalkboard-teacher"></i> Enroll In A Course</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="Button4_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="far fa-clipboard"></i> View Assignments</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton5" runat="server" OnClick="Button5_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-pencil-alt"></i> Submit Assignment</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton6" runat="server" OnClick="Button6_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="far fa-star"></i> Check Grades</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton7" runat="server" OnClick="Button7_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-dollar-sign"></i> Check Promocodes</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton8" runat="server" OnClick="Button8_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-graduation-cap"></i> View Certificates</asp:LinkButton><br /><br />
            <asp:LinkButton ID="LinkButton9" runat="server" OnClick="Button9_Click" BackColor="Aqua" BorderColor="Blue" BorderStyle="Ridge" BorderWidth="4px" style="text-decoration: none; padding:5px; float:right" Font-Names="Algerian" ForeColor="#000066"><i class="fas fa-comments"></i> Add Feedback</asp:LinkButton><br /><br />

        </div>
    </form>
</body>
</html>
