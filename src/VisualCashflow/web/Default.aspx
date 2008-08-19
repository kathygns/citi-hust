<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="Controls/UserChooserControl.ascx" TagName="UserChooserControl"
    TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Default.aspx</title>
    
    <link href="css/ajaxControlToolkit.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:UserChooserControl id="UserChooserControl1" runat="server">
        </uc1:UserChooserControl>&nbsp;</div>
    </form>
</body>
</html>
