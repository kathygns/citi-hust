<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript">
        dojo.require("dijit.form.ValidationTextBox");
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <uc1:HeaderControl ID="HeaderControl1" runat="server" />
            <br />
            捐款者注册<br />
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="UserDataSource"
                DefaultMode="Insert">
                <InsertItemTemplate>
                    <br />
                    <table>
                        <tr>
                            <td style="width: 100px">
                                用户名</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' 
                                dojoType="dijit.form.ValidationTextBox"
                                regExp="[\w]+"
                                required="true"
                                invalidMessage="Invalid Non-Space Text."
                
                                ></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                密码</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                重复密码</td>
                            <td style="width: 100px">
                            </td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                安全密码问题</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="SecureQuestionTextBox" runat="server" Text='<%# Bind("SecureQuestion") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                安全密码答案</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="SecureAnswerTextBox" runat="server" Text='<%# Bind("SecureAnswer") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                头像</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="PhotoTextBox" runat="server" Text='<%# Bind("Photo") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                姓名</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="RealNameTextBox" runat="server" Text='<%# Bind("RealName") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                性别</td>
                            <td style="width: 100px">
                                <asp:DropDownList ID="SexDropDownList" runat="server" SelectedValue='<%# Bind("Sex") %>' >
                                    <asp:ListItem Text="男" Value="True" Selected="true"> </asp:ListItem>
                                    <asp:ListItem Text="女" Value="False"> </asp:ListItem>
                                </asp:DropDownList>
                                </td>
                                
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                年龄</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="AgeTextBox" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                电话</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="TelTextBox" runat="server" Text='<%# Bind("Tel") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                Email</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                地址</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                Comment</td>
                            <td style="width: 100px">
                                <asp:TextBox ID="CommentTextBox" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox></td>
                            <td style="width: 100px">
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="注册"></asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="取消"></asp:LinkButton>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="UserDataSource" runat="server" InsertMethod="AddDonor"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="BLL.VCFDataSetTableAdapters.UserTableAdapter">
                <InsertParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="SecureQuestion" Type="String" />
                    <asp:Parameter Name="SecureAnswer" Type="String" />
                    <asp:Parameter Name="Photo" Type="String" />
                    <asp:Parameter Name="RealName" Type="String" />
                    <asp:Parameter Name="Sex" Type="Boolean" />
                    <asp:Parameter Name="Age" Type="Int32" />
                    <asp:Parameter Name="Tel" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Comment" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
