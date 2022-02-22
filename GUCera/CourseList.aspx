<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseList.aspx.cs" Inherits="GUCera.CourseList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>Courses</h2>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="coursesList" runat="server">
            </asp:GridView>
        </div>
                <p></p>
        <h3>Enroll</h3>
        <div>
            <asp:DropDownList ID="enrollList" runat="server" EnableViewState="true">
            </asp:DropDownList>
        </div>
        <asp:Button ID="enrollButton" runat="server" Text="Enroll" OnClick="enrollButton_Click" />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Home" />
    </form>
</body>
</html>
