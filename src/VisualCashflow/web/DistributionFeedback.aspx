<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DistributionFeedback.aspx.cs" Inherits="DistributionFeedback" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>资金反馈表页</title>
</head>
<body class="tundra">
    <form id="form1" runat="server">
    <div>
        
        <asp:ObjectDataSource ID="DistributionFeedbackSource" runat="server" DeleteMethod="Delete" InsertMethod="InsertDistributionFeedback" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="BLL.VCFDataSetTableAdapters.DistributionTableAdapter" UpdateMethod="Update">
            <InsertParameters>
                <asp:Parameter Name="FromUserID" Type="Int32" />
                <asp:Parameter Name="Purpose" Type="String" />
                <asp:Parameter Name="ProjectID" Type="Int32" />
                <asp:Parameter Name="DistributionDate" Type="DateTime" />
                <asp:Parameter Name="Money" Type="Decimal" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <br />
        <uc1:HeaderControl ID="HeaderControl1" runat="server" />

        <script type="text/javascript">
           dojo.require("dijit.form.ValidationTextBox");
        </script>
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="Gv_" >
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="项目名称" SortExpression="Name" >
                    <ControlStyle Width="20px" />
                    <ItemStyle Width="180px" />
                </asp:BoundField>
                <asp:BoundField DataField="Purpose" HeaderText="项目用途" SortExpression="Purpose" >
                    <ItemStyle Width="350px" />
                </asp:BoundField>
                <asp:BoundField DataField="DistributionDate" HeaderText="提交日期" SortExpression="DistributionDate" >
                    <ItemStyle Width="180px" />
                </asp:BoundField>
                <asp:BoundField DataField="Money" HeaderText="金额" SortExpression="Money" >
                    <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="FeedbackStatus" HeaderText="是否已通过" ReadOnly="True"
                    SortExpression="FeedbackStatus" >
                    <ItemStyle Width="50px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        
                       <asp:FormView ID="FormView1" runat="server" DataKeyNames="DistributionID" DataSourceID="DistributionFeedbackSource"
            DefaultMode="Insert"  >
            <InsertItemTemplate>
                <br />
                <table>
                    <tr>
                        <td style="width: 108px">
                            项目名称</td>
                        <td style="width: 98px">
                            <asp:DropDownList ID="DropDownListProjectName" runat="server" SelectedValue = '<%# Bind("ProjectID") %>' OnInit="DropDownListProjectName_Init" >
                            </asp:DropDownList>
                        </td>
                        <td style="width: 98px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 108px">
                            资金数目</td>
                        <td style="width: 98px">
                <asp:TextBox ID="MoneyTextBox" runat="server" Text='<%# Bind("Money") %>'
                
                dojoType="dijit.form.ValidationTextBox"
                regExp="^[0-9]+(.[0-9]{0,2})?$"
                required="true"
                invalidMessage="资金格式不对"
                >
                
                </asp:TextBox></td>
                        <td style="width: 98px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 108px">
                            资金用途</td>
                        <td style="width: 98px">
                        </td>
                        <td style="width: 98px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="height: 204px">
                            <asp:TextBox ID="TextBox1" runat="server" Height="192px" TextMode="MultiLine" Width="370px" Text='<%# Bind("Purpose") %>'></asp:TextBox></td>
                    </tr>
                </table>
                <asp:TextBox ID="FromUserIDTextBox" runat="server" Text='<%# Bind("FromUserID") %>'
                    Visible="False"></asp:TextBox><br />
                <asp:TextBox ID="DistributionDateTextBox" runat="server" Text='<%# Bind("DistributionDate") %>'
                    Visible="False"></asp:TextBox><br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="插入" ></asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消"></asp:LinkButton>
            </InsertItemTemplate>
        </asp:FormView>
        </ContentTemplate>
        <Triggers>
        <asp:AsyncPostBackTrigger  ControlID="FormView1$InsertButton"/>
        </Triggers>
            
            
        </asp:UpdatePanel>
  
        <br />
        <br />
        
 
    
    </div>
    </form>
</body>
</html>
