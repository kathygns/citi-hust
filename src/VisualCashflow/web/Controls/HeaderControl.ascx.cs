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

public partial class Controls_HeaderControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BLL.VCFDataSet.UserRow u=new App_Code.SessionManager(this.Page).User;
        UserNameLabel.Text = BLL.VCFDataSet.UserDataTable.FormatUserName_RealName(u);
    }
}
