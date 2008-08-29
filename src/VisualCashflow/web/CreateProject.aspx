<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateProject.aspx.cs" Inherits="CreateProject" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>
<%@ Register Src="Controls/UserChooserControl.ascx" TagName="UserChooserControl"
    TagPrefix="uc1" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>创建项目-管理员</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        
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
        <cc1:toolkitscriptmanager id="ToolkitScriptManager1" runat="server"></cc1:toolkitscriptmanager>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProjectID" DataSourceID="ProjectDataSource"
            DefaultMode="Insert" Width="847px">
           
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
                            <asp:TextBox ID="DiscriptionTextBox" runat="server" Height="92px" Text='<%# Bind("Discription") %>'
                                TextMode="MultiLine" Width="488px"></asp:TextBox></td>
                        <td style="width: 391px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 157px">
                            项目管理员：</td>
                        <td style="width: 217px">
                            <uc1:UserChooserControl ID="UserChooserControl2" runat="server" UserID='<%# Bind("ManagerID") %>'>
                            </uc1:UserChooserControl>
                        </td>
                        <td style="width: 391px">
                        </td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="添加项目"></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                                </asp:LinkButton>
            </InsertItemTemplate>

        </asp:FormView>
        &nbsp;</div>
    </form>
</body>
</html>
