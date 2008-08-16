<%@ Page Language="C#" AutoEventWireup="true" CodeFile="City.aspx.cs" Inherits="Citi" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="CityID" DataSourceID="CityDataSource1">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="CityID" HeaderText="CityID" ReadOnly="True" SortExpression="CityID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Provience" HeaderText="Provience" SortExpression="Provience" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="CityDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="vcfTableAdapters.CityTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_CityID" Type="Int32" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Provience" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CityID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Provience" Type="String" />
                    <asp:Parameter Name="Original_CityID" Type="Int32" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Provience" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="CityID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Provience" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <br />
            
            
            
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            
            <ContentTemplate>
                 <asp:FormView ID="FormView1" runat="server" DataKeyNames="CityID" DataSourceID="CityDataSource1"
                DefaultMode="Insert">
                <InsertItemTemplate>
                    CityID:
                    <asp:TextBox ID="CityIDTextBox" runat="server" Text='<%# Bind("CityID") %>'>
                    </asp:TextBox><br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
                    </asp:TextBox><br />
                    Provience:
                    <asp:TextBox ID="ProvienceTextBox" runat="server" Text='<%# Bind("Provience") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="插入">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="取消">
                    </asp:LinkButton>
                </InsertItemTemplate>
            </asp:FormView>
            </ContentTemplate>
            </asp:UpdatePanel>
       
        </div>
    </form>
</body>
</html>
