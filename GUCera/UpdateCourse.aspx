<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCourse.aspx.cs" Inherits="GUCera.UpdateCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - Update Course</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Update Course</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button4" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        <div>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Update Course Description" OnClick="Button1_Click" BackColor="Silver" BorderStyle="Solid" />
        <p>
            <asp:Button ID="Button2" runat="server" Text="Update Course Content" OnClick="Button2_Click" BackColor="Silver" BorderStyle="Solid" />
        </p>
        <asp:Button ID="Button3" runat="server" Text="Add Another Instructor" OnClick="Button3_Click" BackColor="Silver" BorderStyle="Solid" />
        <p>
        <asp:Label ID="MessageLabel" runat="server" Font-Size="Large"></asp:Label>

        
        </p>
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="Button5" runat="server" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00" OnClick="Home_Click" Text="Home" CausesValidation="false"/>
        </p>
    </form>
</body>

</html>
