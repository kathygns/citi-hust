<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderControl.ascx.cs"
    Inherits="Controls_HeaderControl" %>
<style type="text/css">
    
        /*my css
        
        */
        
    
        /*ajaxControlToolkit*/
        @import "/web/css/ajaxControlToolkit.css";
        
        /*dojo:*/
        @import "/web/js/dojo1.1.1/dijit/themes/tundra/tundra.css";
        @import "/web/js/dojo1.1.1/dojo/resources/dojo.css";
        /*后面的覆盖前面的。*/
        @import "/web/css/g.css";
        
        
    </style>

<script type="text/javascript" src="/web/js/dojo1.1.1/dojo/dojo.js" djconfig="parseOnLoad:true, isDebug:true"></script>

<script type="text/javascript">
        dojo.require("dojo.parser");
        dojo.require("dijit.form.TextBox");
        dojo.require("dijit.Tooltip");
        
</script>

<div id="header" class="header ">
    <div id="title">
        <img src="/web/images/header.jpg" />
        
    </div>
    <div id="navigate" align="left" width="100%" style="padding: 0pt 0pt 4px; font-size: 84%;
        height: 20px; float: left;">
        <a href="/web/捐款.aspx">捐款</a> <a href="/web/查看.aspx">查看</a>
    </div>
    <div id="userInfo" align="right" width="100%" style="padding: 0pt 0pt 4px; font-size: 84%;">
        <nobr>
<b><asp:Label ID="UserNameLabel" runat="server" Text="UserName"></asp:Label></b>
|
<asp:HyperLink ID="EditProfileLink" runat="server" NavigateUrl="/web/UserProfile.aspx">修改用户信息</asp:HyperLink>

|
<a href="http://maps.google.com/support?hl=en">帮助</a>
|
<a href="http://www.google.com/history/?hl=en">关于</a>
|
<asp:HyperLink ID="LogOut" runat="server" NavigateUrl="/web/Logout.aspx">退出</asp:HyperLink>
</nobr>
    </div>
</div>
