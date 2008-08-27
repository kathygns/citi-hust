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
            <div class="talbeHeader">
            </div>
            <div class="table">
                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                </cc1:ToolkitScriptManager>
                <asp:ObjectDataSource ID="ProjectDataSource" runat="server" DeleteMethod="DeleteByProjectID"
                    InsertMethod="AddProject" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
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
                
                &nbsp;
                &nbsp;&nbsp;
                <uc4:HeaderControl ID="HeaderControl1" runat="server" />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectID"
                    DataSourceID="ProjectDataSource" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" InsertVisible="False"
                            ReadOnly="True" SortExpression="ProjectID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Discription" HeaderText="Discription" SortExpression="Discription" />
                        <asp:BoundField DataField="ManagerID" HeaderText="ManagerID" SortExpression="ManagerID" />
                        <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                        <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" SortExpression="IsActive" />
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("IsActive") %> '></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            CellPadding="4" DataKeyNames="ProjectID" DataSourceID="ProjectDataSource" ForeColor="#333333"
                            GridLines="None" Width="960px" >
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ProjectID" HeaderText="项目编号" InsertVisible="False" ReadOnly="True"
                                    SortExpression="ProjectID" />
                                <asp:BoundField DataField="Name" HeaderText="项目名" SortExpression="Name" />
                                <asp:BoundField DataField="Discription" HeaderText="项目描述" SortExpression="Discription" />
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
                                </asp:TemplateField>
                                
                                
                                
                                <asp:TemplateField HeaderText="项目创建日期" SortExpression="CreateDate">
                                    <EditItemTemplate>
                                    
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CreateDate", "{0:yyyy-M-d}") %>'></asp:TextBox>
                                    
                                        
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CreateDate", "{0:yyyy-M-d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                
                                
                                
                                <asp:CheckBoxField DataField="IsActive" HeaderText="状态" SortExpression="IsActive" />
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                            Text="">
                                            <asp:Image ID="Image2" ImageUrl="images/icons/accept.png" runat="server" />
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            Text="">
                                            <asp:Image ID="Image3" ImageUrl="images/icons/undo.png" runat="server" />
                                        </asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                            Text="">
                                            <asp:Image ID="Image1" ImageUrl="images/icons/edit.png" runat="server" />
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                            Text="">
                                            <asp:Image ID="imgDelete" ImageUrl="images/icons/cross.png" runat="server" />
                                        </asp:LinkButton>
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
                <br />
                
                
                
                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <br />
                        <br />
                        <br />
                        &nbsp;&nbsp;<br />
                        <br />
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProjectID" DataSourceID="ProjectDataSource"
                            DefaultMode="Insert" Width="847px">
                            <EditItemTemplate>
                                ProjectID:
                                <asp:Label ID="ProjectIDLabel1" runat="server" Text='<%# Eval("ProjectID") %>'></asp:Label><br />
                                Name:
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
                                </asp:TextBox><br />
                                Discription:
                                <asp:TextBox ID="DiscriptionTextBox" runat="server" Text='<%# Bind("Discription") %>'>
                                </asp:TextBox><br />
                                ManagerID:
                                <asp:TextBox ID="ManagerIDTextBox" runat="server" Text='<%# Bind("ManagerID") %>'>
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
                                <table>
                                    <tr>
                                        <td style="width: 157px">
                                            项目名：</td>
                                        <td style="width: 217px">
                                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
                                </asp:TextBox></td>
                                        <td style="width: 391px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 157px">
                                            描 &nbsp; 述：</td>
                                        <td style="width: 217px">
                                <asp:TextBox ID="DiscriptionTextBox" runat="server" Text='<%# Bind("Discription") %>' Height="92px" TextMode="MultiLine" Width="488px"></asp:TextBox></td>
                                        <td style="width: 391px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 157px">
                                            项目管理员：</td>
                                        <td style="width: 217px">
                                            <uc1:UserChooserControl ID="UserChooserControl2" runat="server" UserID='<%# Bind("ManagerID") %>'/>
                                        </td>
                                        <td style="width: 391px">
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                                &nbsp;<br />
                                <br />
                                &nbsp;<br />
                                &nbsp;<br />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="插入">
                                </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="取消">
                                </asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                ProjectID:
                                <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Eval("ProjectID") %>'></asp:Label><br />
                                Name:
                                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label><br />
                                Discription:
                                <asp:Label ID="DiscriptionLabel" runat="server" Text='<%# Bind("Discription") %>'>
                                </asp:Label><br />
                                ManagerID:
                                <asp:Label ID="ManagerIDLabel" runat="server" Text='<%# Bind("ManagerID") %>'></asp:Label><br />
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
