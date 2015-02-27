<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userCabinet.aspx.cs" Inherits="Pizza.userCabinet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lblWelcome" runat="server" Text="Welcome, "></asp:Label>
    
    </div>
        <asp:Button ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" />
    </form>
</body>
</html>
