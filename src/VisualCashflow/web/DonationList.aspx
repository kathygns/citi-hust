<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DonationList.aspx.cs" Inherits="DonationList" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/ProjectNameControl.ascx" TagName="ProjectNameControl"
    TagPrefix="uc2" %>
<%@ Register Src="Controls/UserRealNameControl.ascx" TagName="UserRealNameControl"
    TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>捐款记录</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" CellPadding="4" DataKeyNames="DonationID" DataSourceID="DonationDataSource"
            ForeColor="#333333" GridLines="None" Width="794px">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="捐款人" SortExpression="DonationUserID">
                    <ItemTemplate>
                        <uc3:UserRealNameControl ID="UserRealNameControl1" runat="server" UserID='<%# Eval("DonationUserID") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="项目" SortExpression="ProjectID">
                    <ItemTemplate>
                        <uc2:ProjectNameControl ID="ProjectNameControl1" runat="server" ProjectID='<%# Eval("ProjectID") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="金额" SortExpression="Money">
                    
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Money","{0}元") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="日期" SortExpression="DonationDate">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DonationDate", "{0:yyyy-M-d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="DonationDataSource" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="BLL.VCFDataSetTableAdapters.DonationTableAdapter" UpdateMethod="Update">
            
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
