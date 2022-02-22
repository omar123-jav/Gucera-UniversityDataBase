<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationSelect.aspx.cs" Inherits="GUCera.RegistrationSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Register As</h1>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Button ID="student" runat="server" Height="156px" Text="Student" Width="352px" OnClick="studentButton" />
        <asp:Button ID="instructor" runat="server" Height="156px" Text="Instructor" Width="352px" OnClick ="instructorButton"/>
    </form>
</body>
</html>
