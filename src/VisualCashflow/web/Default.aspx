<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default"  ValidateRequest="false"%>



<%@ Register Src="Controls/UserDetailControl.ascx" TagName="UserDetailControl" TagPrefix="uc3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Controls/UserRealNameControl.ascx" TagName="UserRealNameControl"
    TagPrefix="uc2" %>

<%@ Register Src="Controls/UserChooserControl.ascx" TagName="UserChooserControl"
    TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Default.aspx</title>
    <style type="text/css">
         
       </style>
    <link href="css/ajaxControlToolkit.css" rel="stylesheet" type="text/css" />
    

</head>
<body class="tundra">

    TODO:body class=tundra
    <br />
    <br />
    
    <br />
    <br />


    <form id="form1" runat="server">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>


<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

    <div>
        <uc1:UserChooserControl id="UserChooserControl1" runat="server">
        </uc1:UserChooserControl>&nbsp;</div>
        
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <asp:TextBox ID="TextBox1" runat="server" dojoType="dijit.form.TextBox"></asp:TextBox>
        <br />
        <br />
        UserRealNameControl :
        <uc2:UserRealNameControl ID="UserRealNameControl1" runat="server"  UserID="0"/>
        <br />
        UserDetailControl :
        <uc3:UserDetailControl id="UserDetailControl1" runat="server">
        </uc3:UserDetailControl>
        <br />
        <br />
        <span style="border:none; position:absolute; overflow:hidden">
    
        <asp:DropDownList ID="DropDownList1" runat="server" 
              CssClass="noArrow"
               Enabled="false"
            
            >
            <asp:ListItem Text="男" Value="1"> </asp:ListItem>
            <asp:ListItem Text="女" Value="2"> </asp:ListItem>
            
        </asp:DropDownList>
        </span>    
        <br/>
        
        
    </form>
    
    
</body>
</html>
