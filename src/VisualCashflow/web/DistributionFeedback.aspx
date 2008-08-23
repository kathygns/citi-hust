<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DistributionFeedback.aspx.cs" Inherits="DistributionFeedback" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="DistributionFeedbackSource">
        </asp:FormView>
        <asp:ObjectDataSource ID="DistributionFeedbackSource" runat="server"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
