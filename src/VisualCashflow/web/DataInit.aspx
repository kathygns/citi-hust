<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataInit.aspx.cs" Inherits="DataInit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <asp:Button ID="Init" runat="server" Text="Init" OnClick="Init_Click" /><br />
        <br />
        <br />
        <br />
        <br />
        <br />
        &nbsp;<asp:Button ID="DistributionButton" runat="server" OnClick="DistributionButton_Click"
            Text="DistributionButton" /></div>
    </form>
</body>
</html>
