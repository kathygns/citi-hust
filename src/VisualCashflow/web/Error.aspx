<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>出错了</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<uc1:HeaderControl ID="HeaderControl1" runat="server" />
        <br />
        <br />
        对不起，出错了，出错信息如下：<br />
        <asp:Label ID="ErrorMsg" runat="server" Text="Label"></asp:Label><br />
        <br />
        <br />
        
        <button onclick="history.back()">返回</button>
    </div>
    </form>
</body>
</html>
