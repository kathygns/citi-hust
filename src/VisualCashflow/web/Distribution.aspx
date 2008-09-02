<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Distribution.aspx.cs" Inherits="Distribution" %>

<%@ Register Src="Controls/InferiorUserChooserControl.ascx" TagName="InferiorUserChooserControl"
    TagPrefix="uc2" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>资金分配</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />
        TODO:用tab
        <br />
        
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ProjectDataSource">
        <ItemTemplate>
            <asp:HyperLink ID="ProjectLink" runat="server" Text='<%#Eval("Name")%>' NavigateUrl='<%#Eval("ProjectID","Distribution.aspx?ProjectID={0}")%>'>  </asp:HyperLink>
        </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="ProjectDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetProjectOfUser" TypeName="BLL.VCFDataSetTableAdapters.V_ProjectNameAndIDTableAdapter">
        </asp:ObjectDataSource>
        
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="DistributionID"
            DataSourceID="DistributionDataSource">
            <Columns>
                <asp:BoundField DataField="DistributionID" HeaderText="DistributionID" InsertVisible="False"
                    ReadOnly="True" SortExpression="DistributionID" />
                <asp:BoundField DataField="FromUserID" HeaderText="FromUserID" SortExpression="FromUserID" />
                <asp:BoundField DataField="ToUserID" HeaderText="ToUserID" SortExpression="ToUserID" />
                <asp:BoundField DataField="DistributionType" HeaderText="DistributionType" SortExpression="DistributionType" />
                <asp:BoundField DataField="Purpose" HeaderText="Purpose" SortExpression="Purpose" />
                <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" SortExpression="ProjectID" />
                <asp:BoundField DataField="DistributionDate" HeaderText="DistributionDate" SortExpression="DistributionDate" />
                <asp:BoundField DataField="Money" HeaderText="Money" SortExpression="Money" />
                <asp:BoundField DataField="FeedbackStatus" HeaderText="FeedbackStatus" SortExpression="FeedbackStatus" />
            </Columns>
        </asp:GridView>
        
        <asp:ObjectDataSource ID="DistributionDataSource" runat="server" DeleteMethod="Delete"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDistributionByToUserID_ProjectID"
            TypeName="BLL.VCFDataSetTableAdapters.DistributionTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_DistributionID" Type="Int32" />
                <asp:Parameter Name="Original_FromUserID" Type="Int32" />
                <asp:Parameter Name="Original_ToUserID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionType" Type="Byte" />
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Original_Money" Type="Decimal" />
                <asp:Parameter Name="Original_FeedbackStatus" Type="Byte" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="FromUserID" Type="Int32" />
                <asp:Parameter Name="ToUserID" Type="Int32" />
                <asp:Parameter Name="DistributionType" Type="Byte" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Money" Type="Decimal" />
                <asp:Parameter Name="FeedbackStatus" Type="Byte" />
                <asp:Parameter Name="Original_DistributionID" Type="Int32" />
                <asp:Parameter Name="Original_FromUserID" Type="Int32" />
                <asp:Parameter Name="Original_ToUserID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionType" Type="Byte" />
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Original_Money" Type="Decimal" />
                <asp:Parameter Name="Original_FeedbackStatus" Type="Byte" />
                <asp:Parameter Name="DistributionID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="FromUserID" Type="Int32" />
                <asp:Parameter Name="ToUserID" Type="Int32" />
                <asp:Parameter Name="DistributionType" Type="Byte" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Money" Type="Decimal" />
                <asp:Parameter Name="FeedbackStatus" Type="Byte" />
            </InsertParameters>
            <SelectParameters>
                
                <asp:QueryStringParameter DefaultValue="0" Name="ProjectID" QueryStringField="ProjectID"
                    Type="Int32" />
                    
                    
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        &nbsp;<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="DistributionID"
            DataSourceID="DistributionDataSourceForOutput">
            <Columns>
                <asp:BoundField DataField="DistributionID" HeaderText="DistributionID" InsertVisible="False"
                    ReadOnly="True" SortExpression="DistributionID" />
                <asp:BoundField DataField="FromUserID" HeaderText="FromUserID" SortExpression="FromUserID" />
                <asp:BoundField DataField="ToUserID" HeaderText="ToUserID" SortExpression="ToUserID" />
                <asp:BoundField DataField="DistributionType" HeaderText="DistributionType" SortExpression="DistributionType" />
                <asp:BoundField DataField="Purpose" HeaderText="Purpose" SortExpression="Purpose" />
                <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" SortExpression="ProjectID" />
                <asp:BoundField DataField="DistributionDate" HeaderText="DistributionDate" SortExpression="DistributionDate" />
                <asp:BoundField DataField="Money" HeaderText="Money" SortExpression="Money" />
                <asp:BoundField DataField="FeedbackStatus" HeaderText="FeedbackStatus" SortExpression="FeedbackStatus" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="DistributionDataSourceForOutput" runat="server" DeleteMethod="Delete"
            InsertMethod="MangerDistribe" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDistrubutionByFromUserID_ProjectID"
            TypeName="BLL.VCFDataSetTableAdapters.DistributionTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_DistributionID" Type="Int32" />
                <asp:Parameter Name="Original_FromUserID" Type="Int32" />
                <asp:Parameter Name="Original_ToUserID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionType" Type="Byte" />
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Original_Money" Type="Decimal" />
                <asp:Parameter Name="Original_FeedbackStatus" Type="Byte" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="FromUserID" Type="Int32" />
                <asp:Parameter Name="ToUserID" Type="Int32" />
                <asp:Parameter Name="DistributionType" Type="Byte" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Money" Type="Decimal" />
                <asp:Parameter Name="FeedbackStatus" Type="Byte" />
                <asp:Parameter Name="Original_DistributionID" Type="Int32" />
                <asp:Parameter Name="Original_FromUserID" Type="Int32" />
                <asp:Parameter Name="Original_ToUserID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionType" Type="Byte" />
                <asp:Parameter Name="Original_ProjectID" Type="Int32" />
                <asp:Parameter Name="Original_DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Original_Money" Type="Decimal" />
                <asp:Parameter Name="Original_FeedbackStatus" Type="Byte" />
                <asp:Parameter Name="DistributionID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                
                <asp:QueryStringParameter DefaultValue="0" Name="ProjectID" QueryStringField="ProjectID"
                    Type="Int32" />
                    
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="FromUserID" Type="Int32" />
                <asp:Parameter Name="ToUserID" Type="Int32" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="Money" Type="Decimal" />
            </InsertParameters>
        </asp:ObjectDataSource>
        
       
    </div>
        
          <table>
                    <tr>
                        <td style="width: 221px">
                            选择下级管理员</td>
                        <td style="width: 100px">
                            <uc2:InferiorUserChooserControl ID="ToUserChooserControl"  runat="server" />
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 221px">
                            金额</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="MoneyTextBox" runat="server" ></asp:TextBox></td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 221px">
                            资金用途</td>
                        <td style="width: 100px">
                            <asp:TextBox ID="PurposeTextBox" runat="server" ></asp:TextBox></td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                </table>
                <asp:TextBox ID="FromUserIDTextBox" runat="server" ></asp:TextBox>
                
                
                <asp:TextBox      ID="ProjectIDTextBox" runat="server" ></asp:TextBox><br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    Text="分配" OnClick="InsertButton_Click"></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消"></asp:LinkButton>
                    
                    
    </form>
</body>
</html>
