<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeAssignments.aspx.cs" Inherits="GUCera.GradeAssignments" %>

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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Grade Assignments</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button5" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        <div>
        </div>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Course"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:Button ID="Button2" runat="server" Text="select this course" OnClick="Button2_Click" />
        <p>
            <asp:Label ID="Label5" runat="server" Text="Type"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <asp:Button ID="Button3" runat="server" Text="select this type" OnClick="Button3_Click" />
        </p>
        <p>
        <asp:Label ID="Label6" runat="server" Text="Number"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server">
            </asp:DropDownList>
            <asp:Button ID="Button4" runat="server" Text="select this number" OnClick="Button4_Click" />
            
        </p>
            <asp:Label ID="Label4" runat="server" Text="Student "></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server">
        </asp:DropDownList>
        
        <p>
            <asp:Label ID="Label7" runat="server" Text="Grade"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
        </p>
        <asp:Button ID="Button1" runat="server" BackColor="Silver" BorderStyle="Solid" OnClick="Button1_Click" Text="Grade" />
        <p>
        <asp:Label ID="MessageLabel" runat="server" Font-Size="Large"></asp:Label>

        
        </p>
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="Button6" runat="server" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00" OnClick="Home_Click" Text="Home" CausesValidation="false" />
        </p>
    </form>
</body>

</html>
