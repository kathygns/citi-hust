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
public partial class Controls_LoginControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {

        App_Code.SessionManager sm=new App_Code.SessionManager(this.Page);
        BLL.VCFDataSet.UserDataTable udt =new BLL.VCFDataSetTableAdapters.UserTableAdapter().Login(UserNameTextBox.Text, PasswordTextBox.Text);
        if (udt.Count == 1)
        {
            sm.User = udt[0];

            if (sm.User.Role == Convert.ToInt16(VCFDataSet.UserDataTable.UserRoles.Admin))
                Response.Redirect("/web/AdminHome.aspx");
            else if (sm.User.Role == Convert.ToInt16(VCFDataSet.UserDataTable.UserRoles.Beneficiary))
                Response.Redirect("/web/BeneficiaryHome.aspx");
            else if (sm.User.Role == Convert.ToInt16(VCFDataSet.UserDataTable.UserRoles.Donor))
                Response.Redirect("/web/DonorHome.aspx");
            else if (sm.User.Role == Convert.ToInt16(VCFDataSet.UserDataTable.UserRoles.Manager))
                Response.Redirect("/web/ManagerHome.aspx");

        }
        else
        {
            sm.Message = "用户名或密码错误";
            Response.Redirect("/web/Login.aspx");
        }

    }
}
