<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataInit.aspx.cs" Inherits="DataInit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="DelAllUser" runat="server" Text="DelAllUser" OnClick="DelAllUser_Click" /><br />
        <br />
        <asp:Button ID="UserButton" runat="server" Text="AddDoner" OnClick="UserButton_Click" /><br />
        
        <asp:Button id="AddManager" runat="server" Text="AddManager" OnClick="AddManager_Click"/><br />
        
        <asp:Button id="AddBeneficiary" runat="server" Text="AddBeneficiary" OnClick="AddBeneficiary_Click" /><br />
        <br />
        <br />
        <br />
        <asp:Button ID="ProjectButton" runat="server" Text="project" OnClick="ProjectButton_Click" /><br />
        <br />
        <br />
        &nbsp;</div>
    </form>
</body>
</html>
