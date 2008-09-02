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
                    //TODO:出错处理（如果request没有projectID）
        int pid=Convert.ToInt32(Request.QueryString["ProjectID"]);
        
        
        ProjectDataSource.SelectParameters.Add("UserID", uid.ToString());


        if(null==Request.QueryString["Role"])
        {

            //BLL.VCFDataSet.UserDataTable udt=new BLL.VCFDataSetTableAdapters.UserTableAdapter().GetInferiorBySuperiorUserAndProject(uid,pid);



            BLL.VCFDataSet.V_FormatedUserDataTable vfudt = new BLL.VCFDataSetTableAdapters.V_FormatedUserTableAdapter().GetInferiorBySuperiorUserAndProject(uid, pid);
            /*
            Response.Write("uid:" + uid);//TO DO:DEBUG
            Response.Write("pid:" + pid+" ");//TO DO:DEBUG

            Response.Write(vfudt.Count);//TO DO:DEBUG
             */ 
            GridView1.DataSource=vfudt;

            GridView1.DataBind();
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
