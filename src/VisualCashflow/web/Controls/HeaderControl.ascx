<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderControl.ascx.cs" Inherits="Controls_HeaderControl" %>
<div id="header" class="header">


<div id="navigate" align="left" width="100%" style="padding: 0pt 0pt 4px; font-size: 84%; height:20px; float:left; ">

    <a href="/web/捐款.aspx">捐款</a>
    <a href="/web/查看.aspx">查看</a>
    
    
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
<asp:HyperLink ID="LogOut" runat="server">退出</asp:HyperLink>
</nobr>
</div>

</div>
