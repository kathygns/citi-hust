<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="UserManagement" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>用户管理</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:HeaderControl id="HeaderControl1" runat="server">
        </uc1:HeaderControl>
        <br />

<div id="userInfo" align="right" width="100%" style="padding: 0pt 0pt 4px; font-size: 84%;">
        <nobr>

<a href="/web/UserManagement.aspx?Role=1">管理员</a>
|
<a href="/web/UserManagement.aspx?Role=2">接收者</a>
|
<a href="/web/UserManagement.aspx?Role=3">捐款人</a>

</nobr>
    </div>
    
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="UserDataSource" ForeColor="#333333" GridLines="None">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                <asp:BoundField DataField="Photo" HeaderText="Photo" SortExpression="Photo" />
                <asp:BoundField DataField="RegDate" HeaderText="RegDate" SortExpression="RegDate" />
                <asp:BoundField DataField="RealName" HeaderText="RealName" SortExpression="RealName" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Comment" HeaderText="Comment" SortExpression="Comment" />
                <asp:BoundField DataField="BankAccount" HeaderText="BankAccount" SortExpression="BankAccount" />
                <asp:BoundField DataField="IdentityCard" HeaderText="IdentityCard" SortExpression="IdentityCard" />
                <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                <asp:BoundField DataField="FatherUserID" HeaderText="FatherUserID" SortExpression="FatherUserID" />
                <asp:BoundField DataField="Sex" HeaderText="Sex" ReadOnly="True" SortExpression="Sex" />
                <asp:BoundField DataField="RoleString" HeaderText="RoleString" ReadOnly="True" SortExpression="RoleString" />
                <asp:BoundField DataField="FatherUserName" HeaderText="FatherUserName" SortExpression="FatherUserName" />
                <asp:BoundField DataField="FatherRealName" HeaderText="FatherRealName" SortExpression="FatherRealName" />
                <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="UserDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetUserByRole" TypeName="BLL.VCFDataSetTableAdapters.V_FormatedUserTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="Role" QueryStringField="Role" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
