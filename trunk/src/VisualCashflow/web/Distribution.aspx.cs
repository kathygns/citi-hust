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
        if (IsPostBack)
            return;
        int uid=new App_Code.SessionManager(this).Manager.UserID;
        int pid=Convert.ToInt32( Request.QueryString["ProjectID"]);
        ProjectDataSource.SelectParameters.Add("UserID",uid.ToString());
        DistributionDataSource.SelectParameters.Add("ToUserID", uid.ToString());

        DistributionDataSourceForOutput.SelectParameters.Add("FromUserID", uid.ToString());





        Response.Write("uid:" + uid);
        Response.Write("uid:" + pid);

        
        /*
        TextBox tb = (FormView1.FindControl("FromUserIDTextBox") as TextBox);
        tb.Text = uid.ToString();
        tb.Text = "3333";//TODO:DEBUG
        tb=(FormView1.FindControl("ProjectIDTextBox") as TextBox);
        tb.Text = pid.ToString();
         * */

        FromUserIDTextBox.Text = uid.ToString();
        ProjectIDTextBox.Text = pid.ToString();


        /*
        (FormView1.FindControl("InferiorUserChooserControl1") as Controls_InferiorUserChooserControl).ProjectID = pid;
        (FormView1.FindControl("InferiorUserChooserControl1") as Controls_InferiorUserChooserControl).SuperiorUserID = uid;
        */


    }
    protected void InsertButton_Click(object sender, EventArgs e)
    {
        new BLL.VCFDataSetTableAdapters.DistributionTableAdapter().MangerDistribe(
            Convert.ToInt32 (FromUserIDTextBox.Text.Trim()),
            Convert.ToInt32(ToUserChooserControl.InferiorUserID),
            PurposeTextBox.Text.Trim(),
            Convert.ToInt32( Request.QueryString["ProjectID"]),
            Convert.ToInt32(MoneyTextBox.Text)
            );
       
        GridView2.DataBind();
    }
}
