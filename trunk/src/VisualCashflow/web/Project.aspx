<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="Project"
    ValidateRequest="false" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc4" %>



<%@ Register Src="Controls/UserRealNameControl.ascx" TagName="UserRealNameControl"
    TagPrefix="uc2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="Controls/UserChooserControl.ascx" TagName="UserChooserControl"
    TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>项目管理</title>
</head>
<body class="tundra pageCenter" >
    <form id="form1" runat="server">
        <div >
                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </cc1:ToolkitScriptManager>
                <asp:ObjectDataSource ID="ProjectDataSource" runat="server" DeleteMethod="DeleteByProjectID"
                    InsertMethod="AddProject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllProject"
                    TypeName="BLL.VCFDataSetTableAdapters.ProjectTableAdapter" UpdateMethod="UpdateByProjectID">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ProjectID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Discription" Type="String" />
                        <asp:Parameter Name="ManagerID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Discription" Type="String" />
                        <asp:Parameter Name="ManagerID" Type="Int32" />
                        <asp:Parameter Name="IsActive" Type="Boolean" />
                        <asp:Parameter Name="CreateDate" Type="DateTime" />
                        <asp:Parameter Name="Original_ProjectID" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                
                <uc4:HeaderControl ID="HeaderControl1" runat="server" />
                
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" DataKeyNames="ProjectID" DataSourceID="ProjectDataSource" ForeColor="#333333"
                            GridLines="None" Width="960px" OnRowDataBound="GridView2_RowDataBound" OnRowCommand="GridView2_RowCommand" >
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="项目名" SortExpression="Name" >
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Discription" HeaderText="项目描述" SortExpression="Discription" >
                                    <ItemStyle Width="500px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="项目管理员" SortExpression="ManagerID">
                                    <EditItemTemplate>
                                        <uc1:UserChooserControl ID="UserChooserControl1" runat="server" UserID='<%# Bind("ManagerID") %>' />
                                        <!-- 
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ManagerID") %>'></asp:TextBox>
                                -->
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <uc2:UserRealNameControl ID="UserRealNameControl1" runat="server" UserID='<%# Eval("ManagerID") %>'/>
                                        
                                        
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                
                                
                                
                                <asp:TemplateField HeaderText="项目创建日期" SortExpression="CreateDate">
                                    <EditItemTemplate>
                                    
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CreateDate", "{0:yyyy-M-d}") %>'></asp:TextBox>
                                    
                                        
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CreateDate", "{0:yyyy-M-d}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                
                                
                                
                                <asp:TemplateField  HeaderText="状态">
                                    <ItemTemplate>
                                        <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                
                                
                                             
                                </asp:TemplateField>

                                <asp:ButtonField CommandName="DeActive" Text="停止" />
                                
                            </Columns>
                            
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            
                            
                            <RowStyle BackColor="LightBlue" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                &nbsp;<br />
        
        </div>
    </form>
</body>
</html>
