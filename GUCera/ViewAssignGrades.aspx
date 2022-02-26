<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssignGrades.aspx.cs" Inherits="GUCera.ViewAssignGrades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GUCera - Check Grades</title>
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
            <asp:Label runat="server" style="font-size:45px ;font-weight: bold; color:black; opacity: 1; -webkit-text-stroke: 1px white; margin-top:-10px">Check Assignment Grades</asp:Label>
            <div style="margin-top: -60px; padding-right: 20px">
            <asp:Button ID="Button2" runat="server" Text="Sign Out" style="float:right; margin-top:20px" OnClick="Signout_Click" BackColor="#FF5050" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="Maroon" />
            <asp:Label ID="UserLabel" runat="server" style="font-size:30px ;font-weight: bold; color:black; opacity: 1; margin-top:10px; margin-right: 10px; float:right"></asp:Label>
            </div>
    </asp:Panel>
    
    <div style="margin:30px">
        <br />
        <br />
        Select Course:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextField="name" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="SELECT C.name FROM StudentTakeCourse AS SC INNER JOIN Course AS C ON SC.cid = C.id WHERE (SC.sid = @sid)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="sid" SessionField="User_ID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        Select Assignment:<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="number" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GUCeraConnectionString %>" SelectCommand="viewAssign" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="courseId" SessionField="SelectedCourse" Type="Int32" />
                <asp:SessionParameter DefaultValue="1" Name="Sid" SessionField="User_ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        Grade:
        <asp:Label ID="GradeLabel" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <p>
        <asp:Button ID="HomeButton" runat="server" OnClick="HomeButton_Click" Text="Home" BackColor="#FFFF99" BorderColor="#FFFF66" BorderStyle="Ridge" BorderWidth="4px" Font-Bold="True" Font-Names="Algerian" ForeColor="#CCCC00"/>
        </p>
    </form>
</body>
</html>
