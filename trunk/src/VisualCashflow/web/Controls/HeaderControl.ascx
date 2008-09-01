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

<script type="text/javascript" src="/web/js/dojo1.1.1/dojo/dojo.js" djconfig="parseOnLoad:true, isDebug:false"></script>

<script type="text/javascript">
        dojo.require("dojo.parser");
        dojo.require("dijit.form.TextBox");
        dojo.require("dijit.Tooltip");
        dojo.require("dijit.form.ValidationTextBox");
        
</script>

<div id="header" class="header ">
    <div id="title">
        <img src="/web/images/header.jpg" />
        
    </div>
    <div id="navigate" align="left" width="100%" style="padding: 0pt 0pt 4px; font-size: 84%;
        height: 20px; float: left;">
        
        
        
        <asp:HyperLink ID="DonationListLink" runat="server" NavigateUrl="/web/DonationList.aspx" Visible="false">捐款列表</asp:HyperLink>
        <asp:HyperLink ID="DonationLink" runat="server" NavigateUrl="/web/Donation.aspx" Visible="false">捐款</asp:HyperLink>
        
        <asp:HyperLink ID="DistributionLink" runat="server" NavigateUrl="/web/Distribution.aspx" Visible="false">分配资金</asp:HyperLink>
        
        
        
        
        
        
        
        <asp:HyperLink ID="ProjectLink" runat="server" NavigateUrl="/web/Project.aspx" Visible="false">项目管理</asp:HyperLink>
        
        <asp:HyperLink ID="AddProjectLink" runat="server" NavigateUrl="/web/CreateProject.aspx" Visible="false">创建项目</asp:HyperLink>
        
        <asp:HyperLink ID="UserManagementLink" runat="server" NavigateUrl="/web/UserManagement.aspx" Visible="false">用户管理</asp:HyperLink>
        
        <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="/web/CreateUser.aspx" Visible="false">创建用户</asp:HyperLink>
        
    </div>
    
    
    <div id="userInfo" align="right" width="100%" style="padding: 0pt 0pt 4px; font-size: 84%;">
        <nobr>
<b><asp:Label ID="UserNameLabel" runat="server" Text="UserName" Visible="false"></asp:Label></b>

|
<asp:HyperLink ID="EditProfileLink" runat="server" NavigateUrl="/web/UserProfile.aspx" Visible="false">修改个人信息</asp:HyperLink>
<asp:HyperLink ID="LoginLink" runat="server" NavigateUrl="/web/Login.aspx" Visible="false">登陆</asp:HyperLink>
<asp:HyperLink ID="RegisterLink" runat="server" NavigateUrl="/web/Register.aspx" Visible="false">注册</asp:HyperLink>


|
<a href="/web/Help.aspx">帮助</a>
|
<a href="/web/About.aspx">关于</a>
|
<asp:HyperLink ID="LogOutLink" runat="server" NavigateUrl="/web/Logout.aspx" Visible="false">退出</asp:HyperLink>
</nobr>
    </div>
</div>
