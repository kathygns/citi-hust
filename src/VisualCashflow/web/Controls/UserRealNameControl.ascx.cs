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

public partial class Controls_UserRealNameControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Attributes
    public int UserID
    {
        set
        {
            BLL.VCFDataSet.UserDataTable udt = new BLL.VCFDataSetTableAdapters.UserTableAdapter().GetUserByUserID(value);
            if (udt.Count == 1)
            {
                this.NameLabel.Text = udt[0].RealName + "<" + udt[0].UserName + ">";
            }
        }
    }
    #endregion
}
