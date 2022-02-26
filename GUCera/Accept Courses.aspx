<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accept Courses.aspx.cs" Inherits="GUCera.Accept_Courses1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - Accept Courses</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Accept Course</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        <p>
            Course Id</p>
        <p>
            <asp:DropDownList ID="courseid" runat="server" DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id" BackColor="#CCCCCC">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="SELECT [id] FROM [Course] WHERE (([accepted] &lt;&gt; 'True') OR ([accepted] IS NULL))"></asp:SqlDataSource>
        </p>
        <asp:Button ID="Accept" runat="server" Text="Accept" OnClick="Accept_Click" BackColor="#99FFCC" BorderColor="#66FF99" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#003300"/>
        <br />
        <br />
        <asp:Label ID="MessageLabel" runat="server" Font-Size="Large"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00" OnClick="Home_Click" Text="Home" />
    </form>
</body>
</html>
