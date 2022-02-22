<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewAssignmentContent.aspx.cs" Inherits="GUCera.ViewAssignmentContent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Font-Size="25pt" Font-Underline="True" Text="View Assignments Content"></asp:Label>
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
        Type:
        <asp:Label ID="TypeLabel" runat="server" Text="TypeLabel"></asp:Label>
        <br />
        <br />
        Due Date:
        <asp:Label ID="DueLabel" runat="server" Text="DueLabel"></asp:Label>
        <br />
        <br />
        Content: <asp:HyperLink ID="ContentLink" runat="server">HyperLink</asp:HyperLink>
        <br />
        <br />
        <br />
        <br />
        <br />
        <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" />
        </p>
    </form>
</body>
</html>
