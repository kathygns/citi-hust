<%@ Page Language="C#" AutoEventWireup="true" CodeFile="City.aspx.cs" Inherits="City" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<asp:ObjectDataSource ID="CityDataSource" runat="server" DeleteMethod="DeleteByCityID"
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
            TypeName="vcfTableAdapters.CityTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_CityID" Type="Int32" />
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
        <asp:ScriptManager id="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>
        <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <contenttemplate>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataKeyNames="CityID" DataSourceID="SqlDataSource1" EmptyDataText="没有可显示的数据记录。"
                    Width="592px">
                    <Columns>
                        <asp:BoundField DataField="CityID" HeaderText="CityID" ReadOnly="True" SortExpression="CityID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Provience" HeaderText="Provience" SortExpression="Provience" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VCFConnectionString %>"
                    DeleteCommand="DELETE FROM [City] WHERE [CityID] = @CityID" InsertCommand="INSERT INTO [City] ([CityID], [Name], [Provience]) VALUES (@CityID, @Name, @Provience)"
                    ProviderName="<%$ ConnectionStrings:VCFConnectionString.ProviderName %>" SelectCommand="SELECT [CityID], [Name], [Provience] FROM [City]"
                    UpdateCommand="UPDATE [City] SET [Name] = @Name, [Provience] = @Provience WHERE [CityID] = @CityID">
                    <InsertParameters>
                        <asp:Parameter Name="CityID" Type="Int32" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Provience" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Provience" Type="String" />
                        <asp:Parameter Name="CityID" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="CityID" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
                &nbsp;
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="CityID"
                    DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="530px">
                    <Fields>
                        <asp:BoundField DataField="CityID" HeaderText="CityID" ReadOnly="True" SortExpression="CityID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Provience" HeaderText="Provience" SortExpression="Provience" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <br />
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="CityID" DataSourceID="SqlDataSource1"
                    DefaultMode="Insert">
                    <EditItemTemplate>
                        CityID:
                        <asp:Label ID="CityIDLabel1" runat="server" Text='<%# Eval("CityID") %>'></asp:Label><br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
                        </asp:TextBox><br />
                        Provience:
                        <asp:TextBox ID="ProvienceTextBox" runat="server" Text='<%# Bind("Provience") %>'>
                        </asp:TextBox><br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新">
                        </asp:LinkButton>
                        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消">
                        </asp:LinkButton>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        CityID:
                        <asp:TextBox ID="CityIDTextBox" runat="server" Text='<%# Bind("CityID") %>'></asp:TextBox><br />
                        Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox><br />
                        Provience:
                        <asp:TextBox ID="ProvienceTextBox" runat="server" Text='<%# Bind("Provience") %>'></asp:TextBox><br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                            Text="插入"></asp:LinkButton>
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        CityID:
                        <asp:Label ID="CityIDLabel" runat="server" Text='<%# Eval("CityID") %>'></asp:Label><br />
                        Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label><br />
                        Provience:
                        <asp:Label ID="ProvienceLabel" runat="server" Text='<%# Bind("Provience") %>'></asp:Label><br />
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
            </contenttemplate>
        </asp:UpdatePanel>
        <br />
       <asp:TextBox runat="server" ID="Text" />
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Text">
        </cc1:CalendarExtender>
    </form>
</body>
</html>
