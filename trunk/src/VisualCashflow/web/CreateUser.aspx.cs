using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Register : System.Web.UI.Page, ICallbackEventHandler
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //new App_Code.SessionManager(this).
    }



    //定义一个字符串，回调的结果信息将保存在该字符串中
    private string result;

    //引发回调事件处理
    public void RaiseCallbackEvent(string eventArgument)
    {
        //"eventArgument"为从客户端的JavaScript传递过来的参数
        string[] stringSeparators = new string[] { "|gzjoin|" };
        string[] parts = eventArgument.Split(stringSeparators, StringSplitOptions.None);

        //此处将前台传递的参数，分别赋值给资讯类的属性，如何能获取前台页面上图片的Stream？该Stream和其他参数一起保存在数据库的字段中

    }


    //回传回调结果
    public string GetCallbackResult()
    {
        return result;
    }
    
    
    
    /*
    protected void UploadButton_Click(object sender, EventArgs e)
    {


        string SavePath = Server.MapPath("/web/images/uploads/");

        String FileName = HeadFileUpload.FileName;
        SavePath += FileName;
        HeadFileUpload.SaveAs(SavePath);
        HeadImage.ImageUrl = "/web/images/uploads/" + FileName;
       
        if (HeadFileUpload.HasFile)
        {
           
        }
        else
        {
            HeadImage.ImageUrl = "/web/images/uploads/" + "default.gif";
        }
        
    }
 */ 

    /**
     
     <cc1:toolkitscriptmanager id="ToolkitScriptManager1" runat="server"></cc1:toolkitscriptmanager>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Image ID="HeadImage" runat="server" />
                                        <asp:FileUpload ID="HeadFileUpload" runat="server" Width="321px" /><br />
                                        &nbsp;
                                    </ContentTemplate>
                                    <Triggers  >
                                        <asp:PostBackTrigger ControlID="HeadUploadButton"/>
                                        
                                    
                                    </Triggers>
                                </asp:UpdatePanel>
                                        <asp:Button ID="HeadUploadButton" runat="server" OnClick="UploadButton_Click" Text="上传" /><br />
     */
}
