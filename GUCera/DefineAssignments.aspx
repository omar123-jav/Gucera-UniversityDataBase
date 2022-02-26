<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefineAssignments.aspx.cs" Inherits="GUCera.DefineAssignments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - Define Assignments</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Define Assignments</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        <div>
        </div>
        <asp:Label ID="Label1" runat="server" Text="Define An Assignment" Font-Bold="True"></asp:Label>
     
        <p>
     
        <asp:Label ID="Label3" runat="server" Text="Course   "></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server">
            </asp:DropDownList>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Type "></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" >
                <asp:ListItem>exam</asp:ListItem>
                <asp:ListItem>project</asp:ListItem>
                <asp:ListItem>quiz</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
        <asp:Label ID="Label5" runat="server" Text="Number "></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" style="margin-top: 23px" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
        </p>
        <p>
           <asp:Label ID="Label6" runat="server" Text="Full Grade  "></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
        </p>
        <p>
        <asp:Label ID="Label7" runat="server" Text="Weight  "></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label8" runat="server" Text="Content "></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
        </p>
        <p>
        <asp:Label ID="Label10" runat="server" Text="Deadline"></asp:Label>
        <asp:TextBox ID="TextBox8" runat="server" TextMode="DateTime" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Ridge" BorderWidth="4px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>
        </p>
        <p>
        <asp:Label ID="MessageLabel" runat="server" Font-Size="Large"></asp:Label>

        
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Define" BackColor="Silver" BorderStyle="Solid" style="margin-top: 12px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
        <asp:Button ID="Button3" runat="server" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00" OnClick="Home_Click" Text="Home" CausesValidation="false" />
        </p>
    </form>
</body>
</html>