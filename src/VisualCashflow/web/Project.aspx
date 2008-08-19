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
        &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    CellPadding="4" DataKeyNames="ProjectID" DataSourceID="ProjectDataSource" ForeColor="#333333"
                    GridLines="None" Width="763px">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" InsertVisible="False"
                            ReadOnly="True" SortExpression="ProjectID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Discription" HeaderText="Discription" SortExpression="Discription" />
                        <asp:BoundField DataField="AdminUserID" HeaderText="AdminUserID" SortExpression="AdminUserID" />
                        <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                        <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
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
        <asp:ObjectDataSource ID="ProjectDataSource" runat="server" DeleteMethod="DeleteProject"
            InsertMethod="AddProject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="BLL.VCFDataSetTableAdapters.ProjectTableAdapter" UpdateMethod="UpdateByID">
            <DeleteParameters>
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Discription" Type="String" />
                <asp:Parameter Name="AdminUserID" Type="Int32" />
                <asp:Parameter Name="CreateDate" Type="DateTime" />
                <asp:Parameter Name="IsActive" Type="Boolean" />
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Discription" Type="String" />
                <asp:Parameter Name="AdminUserID" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProjectID" DataSourceID="ProjectDataSource"
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        ProjectID:
                        <asp:Label ID="ProjectIDLabel1" runat="server" Text='<%# Eval("ProjectID") %>'></asp:Label><br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
                        </asp:TextBox><br />
                        Discription:
                        <asp:TextBox ID="DiscriptionTextBox" runat="server" Text='<%# Bind("Discription") %>'>
                        </asp:TextBox><br />
                        AdminUserID:
                        <asp:TextBox ID="AdminUserIDTextBox" runat="server" Text='<%# Bind("AdminUserID") %>'>
                        </asp:TextBox><br />
                        CreateDate:
                        <asp:TextBox ID="CreateDateTextBox" runat="server" Text='<%# Bind("CreateDate") %>'>
                        </asp:TextBox><br />
                        IsActive:
                        <asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Bind("IsActive") %>' /><br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新">
                        </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox><br />
                        Discription:
                        <asp:TextBox ID="DiscriptionTextBox" runat="server" Text='<%# Bind("Discription") %>'></asp:TextBox><br />
                        AdminUserID:
                        <asp:TextBox ID="AdminUserIDTextBox" runat="server" Text='<%# Bind("AdminUserID") %>'></asp:TextBox><br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ProjectID:
                        <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Eval("ProjectID") %>'></asp:Label><br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label><br />
                        Discription:
                        <asp:Label ID="DiscriptionLabel" runat="server" Text='<%# Bind("Discription") %>'>
                        </asp:Label><br />
                        AdminUserID:
                        <asp:Label ID="AdminUserIDLabel" runat="server" Text='<%# Bind("AdminUserID") %>'>
                        </asp:Label><br />
                        CreateDate:
                        <asp:Label ID="CreateDateLabel" runat="server" Text='<%# Bind("CreateDate") %>'>
                        </asp:Label><br />
                        IsActive:
                        <asp:CheckBox ID="IsActiveCheckBox" runat="server" Checked='<%# Bind("IsActive") %>'
                            Enabled="false" /><br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑">
                        </asp:LinkButton>
                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除">
                        </asp:LinkButton>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="新建">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:FormView>
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
