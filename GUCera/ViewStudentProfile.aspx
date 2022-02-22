<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudentProfile.aspx.cs" Inherits="GUCera.VeiwStudentProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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

            <br/>
           
            <asp:Button ID="Button1" runat="server" Text="Add A Credit Card" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="Add Phone Number" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" Text="Enroll In A Course" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" Text="Check Due Assignments" OnClick="Button4_Click" />
            <asp:Button ID="Button5" runat="server" Text="Submit Assignment" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" Text="Check Assignment Grades" OnClick="Button6_Click" />
            <asp:Button ID="Button7" runat="server" Text="View Promocodes" OnClick="Button7_Click" />
            <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Check Certificates" />
        </div>
    </form>
</body>
</html>
