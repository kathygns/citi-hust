<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminHome" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/UserDetailControl.ascx" TagName="UserDetailControl" TagPrefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员主页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        <br />
        <uc2:UserDetailControl ID="UserDetailControl1" runat="server" UserID="0"/>
        &nbsp;</div>
    </form>
</body>
</html>
