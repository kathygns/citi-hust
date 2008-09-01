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

using BLL;
public partial class UserManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int uid=new App_Code.SessionManager(this).User.UserID;
        if(null==Request.QueryString["Role"])
        {
            UserDataSource.SelectMethod = "GetInferiorBySuperiorUserAndProject";
            UserDataSource.SelectParameters.Clear();
            UserDataSource.SelectParameters.Add("SuperiorUserID", uid.ToString());

            //TODO:出错处理（如果request没有projectID）
            UserDataSource.SelectParameters.Add("ProjectID", Request.QueryString["ProjectID"]);
        }

    }
    protected void AddInferiorButton_Click(object sender, EventArgs e)
    {
        //TODO:复杂逻辑-出错判断

        int uid=new App_Code.SessionManager(this).User.UserID;
        int pid=Convert.ToInt32 (Request.QueryString["ProjectID"]);
        new BLL.VCFDataSetTableAdapters.UserRelationShipTableAdapter().AddRelationship(uid, UserChooserControl1.UserID, pid);
    }
}
