<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Donation.aspx.cs" Inherits="Donation" %>

<%@ Register Src="Controls/HeaderControl.ascx" TagName="HeaderControl" TagPrefix="uc2" %>

<%@ Register Src="Controls/ProjectChooserControl.ascx" TagName="ProjectChooserControl"
    TagPrefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>捐款</title>
</head>
<body class="tundra">
    <form id="form1" runat="server">
    <div>
        <uc2:HeaderControl ID="HeaderControl1" runat="server" />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="DonationID" DataSourceID="DonorDataSource"
            DefaultMode="Insert" Width="432px">
            
            <InsertItemTemplate>
                &nbsp;<asp:TextBox ID="DonationUserIDTextBox" runat="server" Text='<%# Bind("DonationUserID") %>' Visible="false">
                
                
                </asp:TextBox>
                <table>
                    <tr>
                        <td style="width: 100px">
                            银行帐号</td>
                        <td style="width: 100px">
                <asp:TextBox ID="BankAccountTextBox" runat="server" Text='<%# Bind("BankAccount") %>'
                
                dojoType="dijit.form.ValidationTextBox"
                                regExp="\d{16}"
                                required="true"
                                invalidMessage="帐号有误(16位)"
                                
                                >
                </asp:TextBox></td>
                        <td style="width: 100px">
                        <span style="color: #ff0000">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            金额</td>
                        <td style="width: 100px">
                <asp:TextBox ID="MoneyTextBox" runat="server" Text='<%# Bind("Money") %>'
                
                
                dojoType="dijit.form.ValidationTextBox"
                regExp="^[0-9]+(.[0-9]{0,2})?$"
                required="true"
                invalidMessage="金额格式不对"
                
                >
                </asp:TextBox></td>
                        <td style="width: 100px">
                        <span style="color: #ff0000">*</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            项目</td>
                        <td style="width: 100px">
                           <uc1:ProjectChooserControl ID="ProjectChooserControl1" runat="server"  ProjectID='<%# Bind("ProjectID") %>' />
                        </td>
                
                        <td style="width: 100px">
                            <span style="color: #ff0000">*</span>
                            </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                    Text="捐款">
                </asp:LinkButton>
                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="取消">
                </asp:LinkButton>
            </InsertItemTemplate>
            
        </asp:FormView>
        <asp:ObjectDataSource ID="DonorDataSource" runat="server" DeleteMethod="Delete" InsertMethod="Donor"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="BLL.VCFDataSetTableAdapters.DonationTableAdapter"
            UpdateMethod="Update">
            
            <InsertParameters>
                <asp:Parameter Name="DonationUserID" Type="Int32" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Money" Type="Decimal" />
                <asp:Parameter Name="ProjectID" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
