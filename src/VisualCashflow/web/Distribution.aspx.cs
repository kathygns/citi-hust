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

public partial class Distribution : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int uid=new App_Code.SessionManager(this).Manager.UserID;


        int pid=Convert.ToInt32( Request.QueryString["ProjectID"]);
        ProjectDataSource.SelectParameters.Add("UserID",uid.ToString());
        DistributionDataSource.SelectParameters.Add("ToUserID", uid.ToString());

        DistributionDataSourceForOutput.SelectParameters.Add("FromUserID", uid.ToString());

        (FormView1.FindControl("FromUserIDTextBox") as TextBox).Text = uid.ToString();
        (FormView1.FindControl("ProjectIDTextBox") as TextBox).Text = pid.ToString();

        (FormView1.FindControl("InferiorUserChooserControl1") as Controls_InferiorUserChooserControl).ProjectID = pid;
        (FormView1.FindControl("InferiorUserChooserControl1") as Controls_InferiorUserChooserControl).SuperiorUserID = uid;

    }
}
