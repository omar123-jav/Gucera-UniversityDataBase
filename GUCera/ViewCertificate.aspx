<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCertificate.aspx.cs" Inherits="GUCera.ViewCertificate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - View Certificates</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Certificates</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        <div>
        <br />
        <br />
        Select Course:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="name" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="SELECT C.name FROM StudentCertifyCourse AS SC INNER JOIN Course AS C ON SC.cid = C.id WHERE (SC.sid = @sid)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="sid" SessionField="User_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
            <br />
            <br />
            Certified on
            <asp:Label ID="issueDate" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00" />
            <br />
        </div>
    </form>
</body>
</html>
