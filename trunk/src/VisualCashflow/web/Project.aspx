<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Project" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class ="talbeHeader">
    
    
    </div>
    <div class ="table">
        <asp:ObjectDataSource ID="ProjectDataSource" runat="server" DeleteMethod="DeleteProjectByID"
            InsertMethod="AddProject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="vcfTableAdapters.ProjectTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Discription" Type="String" />
                <asp:Parameter Name="AdminUserID" Type="Int32" />
                <asp:Parameter Name="CreateDate" Type="DateTime" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
                <asp:Parameter Name="Original_Name" Type="String" />
                <asp:Parameter Name="Original_AdminUserID" Type="Int32" />
                <asp:Parameter Name="Original_CreateDate" Type="DateTime" />
                <asp:Parameter Name="Original_IsActive" Type="Boolean" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Discription" Type="String" />
                <asp:Parameter Name="AdminUserID" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="ProjectID" DataSourceID="ProjectDataSource" ForeColor="#333333"
                    GridLines="None" Width="763px">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProjectID" HeaderText="项目编号" ReadOnly="True" SortExpression="ProjectID" />
                        <asp:BoundField DataField="Name" HeaderText="项目名" SortExpression="Name" />
                        <asp:BoundField DataField="Discription" HeaderText="描述" SortExpression="Discription" />
                        <asp:BoundField DataField="AdminUserID" HeaderText="管理员ID" SortExpression="AdminUserID" />
                        <asp:BoundField DataField="CreateDate" HeaderText="创建日期" SortExpression="CreateDate" />
                        <asp:CheckBoxField DataField="IsActive" HeaderText="激活" SortExpression="IsActive" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <RowStyle BackColor="#EFF3FB" />
                    <EditRowStyle BackColor="#2461BF" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <br />
                <br />
                <br />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <br />
        <br />
    
    </div>
    
    
    
    
    
    
    
    
    
    </div>
    </form>
</body>
</html>
