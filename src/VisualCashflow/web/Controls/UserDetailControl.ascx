<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserDetailControl.ascx.cs" Inherits="Controls_UserDetailControl" %>



<asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID"  >
    
    <ItemTemplate>
        <div style="text-align: left">
            <table>
            
                <tr>
                    <td style="width: 100px" colspan="2">
                    
                        <asp:Image ID="PhotoImage" runat="server" ImageUrl='<%# Eval("Photo") %>' /></td>
                </tr>
                
                <tr>
                    <td style="width: 100px">
                        用户名</td>
                    <td style="width: 203px">
                        <asp:Label ID="UserNameLabel" runat="server" Text='<%# Eval("UserName") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        用户角色</td>
                    <td style="width: 203px">
                        <asp:Label ID="RoleLabel" runat="server" Text='<%# Eval("Role") %>'></asp:Label></td>
                </tr>
                
                <tr>
                    <td style="width: 100px">
                        注册日期</td>
                    <td style="width: 203px">
                        <asp:Label ID="RegDateLabel" runat="server" Text='<%# Eval("RegDate") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        姓名：</td>
                    <td style="width: 203px">
                        <asp:Label ID="RealNameLabel" runat="server" Text='<%# Eval("RealName") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        性别</td>
                    <td style="width: 203px">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sex") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        年龄</td>
                    <td style="width: 203px">
                        <asp:Label ID="AgeLabel" runat="server" Text='<%# Eval("Age") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        电话</td>
                    <td style="width: 203px">
                        <asp:Label ID="TelLabel" runat="server" Text='<%# Eval("Tel") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        Email</td>
                    <td style="width: 203px">
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        地址</td>
                    <td style="width: 203px">
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        备注</td>
                    <td style="width: 203px">
                        <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 203px">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        银行帐号</td>
                    <td style="width: 203px">
                        <asp:Label ID="BankAccountLabel" runat="server" Text='<%# Eval("BankAccount") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        身份证</td>
                    <td style="width: 203px">
                        <asp:Label ID="IdentityCardLabel" runat="server" Text='<%# Eval("IdentityCard") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        职位</td>
                    <td style="width: 203px">
                        <asp:Label ID="PositionLabel" runat="server" Text='<%# Eval("Position") %>'></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        创建者</td>
                    <td style="width: 203px">
                    
                    
                    TODO:循环引用
                    
                        
                    
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </ItemTemplate>
</asp:FormView>
&nbsp; &nbsp;
