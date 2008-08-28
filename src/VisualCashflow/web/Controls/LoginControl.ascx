<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginControl.ascx.cs"
    Inherits="Controls_LoginControl" %>
    
    
    
    
    
    <style type="text/css">
    .left{
        float: left;
    }
    
    </style>
<form id="LoginForm" method="post">
    <div id="userName"  class="left">
        用户名</div>
    <div id="userNameInput">
        <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' dojoType="dijit.form.ValidationTextBox"
            regExp="^[a-zA-Z][a-zA-Z0-9_]{3,15}$" required="true" invalidMessage="用户名不规范，请使用4-16个字符，允许英文、数字、下划线"></asp:TextBox>
    </div>
    <div id="password"  class="left">
        密码
    </div>
    <div id="passwordInput"  >
        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' dojoType="dijit.form.ValidationTextBox"
            required="true" invalidMessage="密码必填" TextMode="Password"></asp:TextBox>
    </div>
    <div id="loginButton" class="left">
        <asp:Button ID="LoginButton" runat="server" Text="登陆" OnClick="LoginButton_Click" />
    </div>
    <div id="Div1" >
       <a href="/web/Register.aspx">注册</a>
    </div>
    
</form>
